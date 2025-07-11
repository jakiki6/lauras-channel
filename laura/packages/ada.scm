(define-module (laura packages ada)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages cmake)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages libbsd)
  #:use-module (gnu packages libunwind)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages python)
  #:use-module (gnu packages java)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages video)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages gcc)
  #:use-module (guix-science packages electronics))

(define gnat-patched
  (package
    (inherit gnat)
    (source
     #f)
    (build-system trivial-build-system)
    (native-inputs (list sed))
    (inputs (list gnat))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (copy-recursively #$gnat
                            (assoc-ref %outputs "out")
                            #:keep-permissions? #t)
          (chdir (assoc-ref %outputs "out"))
          (make-file-writable "bin")
          (make-file-writable
           "lib/gcc/x86_64-pc-linux-gnu/14.2.0/plugin/include/config/i386")
          (map (lambda (x)
                 (begin
                   (format #t "Patching ~a\n" x)
                   (make-file-writable x)
                   (system (string-append #$sed
                            "/bin/sed -i -e 's|/lib64/ld-linux-x86-64.so.2|/tmp/64ld-linux-x86-64.so.2|g' "
                            x))))
               (list "bin/c++"
                "bin/cpp"
                "bin/gcc"
                "bin/g++"
                "bin/gp-display-html"
                "bin/x86_64-pc-linux-gnu-c++"
                "bin/x86_64-pc-linux-gnu-g++"
                "bin/x86_64-pc-linux-gnu-gcc"
                "bin/x86_64-pc-linux-gnu-gcc-14.2.0"
                "lib/gcc/x86_64-pc-linux-gnu/14.2.0/plugin/include/config/i386/linux64.h")))))))

(define gcc-toolchain-patched
  (package
    (inherit gcc-toolchain)
    (source
     #f)
    (build-system trivial-build-system)
    (inputs (list gcc-toolchain))
    (outputs '("out"))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (copy-recursively #$gcc-toolchain
                            (assoc-ref %outputs "out")
                            #:keep-permissions? #t)
          (chdir (assoc-ref %outputs "out"))
          (make-file-writable "include")
          (delete-file-recursively "include/c++")
          (copy-recursively (string-append #$gcc-toolchain "/include/c++")
                            "include/c++"
                            #:keep-permissions? #t
                            #:follow-symlinks? #t)
          (make-file-writable "include/c++/bits")
          (copy-recursively "include/c++/x86_64-unknown-linux-gnu/bits"
                            "include/c++/bits"
                            #:keep-permissions? #t))))))

(define binutils-patched
  (package
    (inherit binutils)
    (arguments
     (list
      #:out-of-source? #t
      #:configure-flags
      #~'("--target=i386-elf" "LDFLAGS=-static-libgcc"

          "--enable-new-dtags"

          "--with-lib-path=/no-ld-lib-path"

          "--enable-install-libbfd"

          "--enable-deterministic-archives"

          "--enable-64-bit-bfd"
          "--enable-compressed-debug-sections=all"
          "--enable-lto"
          "--enable-separate-code"
          "--enable-threads")
      #:make-flags
      #~'("MAKEINFO=true")))))

(define-public coreboot-toolchain
  (package
    (name "coreboot-toolchain")
    (version "14.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://ftp.gnu.org/gnu/gcc/gcc-14.2.0/gcc-14.2.0.tar.xz")
       (sha256
        (base32 "1j9wdznsp772q15w1kl5ip0gf0bh8wkanq2sdj12b7mzkk39pcx7"))))
    (build-system gnu-build-system)
    (native-inputs (list gnat-patched gcc-toolchain-patched patchelf))
    (inputs (list gmp mpfr mpc isl))
    (propagated-inputs (list binutils-patched))
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:out-of-source? #t
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'install-ld
            (lambda _
              (begin
                (symlink (string-append #$glibc "/lib/ld-linux-x86-64.so.2")
                         "/tmp/64ld-linux-x86-64.so.2")
                (mkdir-p "/tmp/include/gnu")
                (symlink (string-append #$glibc "/include/gnu/stubs-64.h")
                         "/tmp/include/gnu/stubs-32.h")
                (setenv "C_INCLUDE_PATH"
                        (string-append (getenv "C_INCLUDE_PATH")
                                       ":/tmp/include"))
                (setenv "LD_LIBRARY_PATH"
                        (string-append #$isl
                                       "/lib:"
                                       #$mpc
                                       "/lib:"
                                       #$mpfr
                                       "/lib:"
                                       #$gmp
                                       "/lib")))))
          (replace 'build
            (lambda _
              (begin
                (system (string-append "make all-gcc -j"
                                       (number->string (parallel-job-count))))
                (system (string-append "make all-target-libgcc -j"
                                       (number->string (parallel-job-count)))))))
          (replace 'install
            (lambda _
              (begin
                (system "make install-gcc")
                (system "make install-target-libgcc"))))
          (add-after 'install 'fix-interpreter
            (lambda* (#:key outputs #:allow-other-keys)
              (begin
                (chdir (assoc-ref outputs "out"))
                (map (lambda (x)
                       (invoke (string-append #$patchelf "/bin/patchelf")
                               "--set-interpreter"
                               (string-append #$glibc
                                              "/lib/ld-linux-x86-64.so.2") x))
                     (list "bin/i386-elf-cpp"
                      "bin/i386-elf-gcc"
                      "bin/i386-elf-gcc-ar"
                      "bin/i386-elf-gcc-nm"
                      "bin/i386-elf-gcc-ranlib"
                      "bin/i386-elf-gnatbind"
                      "bin/i386-elf-lto-dump"
                      "bin/i386-elf-gcc-14.2.0"
                      "bin/i386-elf-gcov"
                      "bin/i386-elf-gcov-dump"
                      "bin/i386-elf-gcov-tool"
                      "libexec/gcc/i386-elf/14.2.0/cc1"
                      "libexec/gcc/i386-elf/14.2.0/gnat1"
                      "libexec/gcc/i386-elf/14.2.0/install-tools/fixincl"
                      "libexec/gcc/i386-elf/14.2.0/lto1"
                      "libexec/gcc/i386-elf/14.2.0/plugin/gengtype"
                      "libexec/gcc/i386-elf/14.2.0/collect2"
                      "libexec/gcc/i386-elf/14.2.0/lto-wrapper")))))
          (delete 'validate-runpath))
      #:configure-flags
      #~(list "--enable-languages=c,ada,lto"
              "--enable-libada"
              "--disable-nls"
              "--without-libiconv-prefix"
              "--disable-multilib"
              "--enable-threads=posix"
              "--target=i386-elf"
              (string-append "--with-ld="
                             #$binutils-patched "/bin/i386-elf-ld")
              (string-append "--with-as="
                             #$binutils-patched "/bin/i386-elf-as"))))
    (home-page "https://www.gnu.org/software/gnat/")
    (synopsis "GNU GNAT for i386 for coreboot")
    (description "GNU GNAT for i386 for coreboot")
    (license license:gpl3+)))
