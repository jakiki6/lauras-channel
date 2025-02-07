(define-module (laura packages ada)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system meson)
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

(define-public gnat-i686
  (package
    (name "gnat-i686")
    (version "14.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://ftp.gnu.org/gnu/gcc/gcc-14.2.0/gcc-14.2.0.tar.xz")
       (sha256
        (base32 "1j9wdznsp772q15w1kl5ip0gf0bh8wkanq2sdj12b7mzkk39pcx7"))))
    (build-system gnu-build-system)
    (native-inputs (list gnat))
    (inputs (list gcc-14 gmp mpfr mpc isl glibc))
    (arguments
     (list
      #:parallel-build? #false
      #:phases #~(modify-phases %standard-phases
                   (add-before 'configure 'install-ld
                     (lambda* (#:key inputs #:allow-other-keys)
                       (begin
                         (use-modules (ice-9 string-fun))
                         (system (string-append
                                  "gcc -dumpspecs | sed -e 's/\\/lib64\\/ld-linux-x86-64.so.2/"
                                  (string-replace-substring #$glibc "/" "\\/")
                                  "\\/lib\\/ld-linux-x86-64.so.2/g' > /tmp/specs"))
                         (mkdir "/tmp/bin")
                         (system (string-append "printf \"#!"
                                  #$bash
                                  "/bin/sh\\nexport PATH=\\$_PATH\\ngcc -specs /tmp/specs \\\"\\$@\\\"\\n\" > /tmp/bin/gcc"))
                         (chmod "/tmp/bin/gcc" #o755)
                         (system (string-append "printf \"#!"
                                  #$bash
                                  "/bin/sh\\nexport PATH=\\$_PATH\\ng++ -specs /tmp/specs \\\"\\$@\\\"\\n\" > /tmp/bin/g++"))
                         (chmod "/tmp/bin/g++" #o755)
                         (system (string-append "ln -s " #$gnat "/bin/ar /tmp/bin/x86_64-linux-gnu-ar"))
                         (setenv "_PATH"
                                 (getenv "PATH"))
                         (setenv "PATH"
                                 (string-append "/tmp/bin:"
                                                (getenv "PATH")))
                         (setenv "CPLUS_INCLUDE_PATH" (string-append #$gcc "/include/c++/x86_64-unknown-linux-gnu:" (getenv "CPLUS_INCLUDE_PATH")))
))))
      #:configure-flags #~(list "--enable-languages=c,ada,c++"
                                "--enable-libstdcxx"
                                "--enable-libstdcxx-threads"
                                "--enable-libada"
                                "--disable-nls"
                                "--without-libiconv-prefix"
                                "--disable-libstdcxx-pch"
                                "--enable-lto"
                                "--disable-multilib"
                                "--enable-threads=posix"
                                "--with-gnu-ld"
                                "--with-gnu-as"
                                "--host=x86_64-linux-gnu"
                                "--target=i686-linux-gnu")))
    (home-page "https://www.gnu.org/software/gnat/")
    (synopsis "GNU GNAT for i686")
    (description "GNU GNAT for i686")
    (license license:gpl3+)))
