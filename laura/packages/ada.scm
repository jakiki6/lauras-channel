(define-module (laura packages ada)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages bootstrap))

;; This is taken from https://git.sr.ht/~csantosb/ip.channel/tree/master/item/ip_test.scm#L16, licensed under the GPL 3
(define-public bootstrap-gnat
  (package
    (name "bootstrap-gnat")
    (version "14.2.0-1")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://github.com/alire-project/GNAT-FSF-builds/releases/download/gnat-14.2.0-1/gnat-x86_64-linux-"
         version ".tar.gz") )
       (sha256
        (base32
         "08kpd3d7si73gsm2dfp5lmrhii9k96y972sw39h1sdvhgzpkvfq6"))))
    (build-system gnu-build-system)
    (arguments
      (list
       #:substitutable? #f
       #:strip-binaries? #f              ;no need
       ;; XXX: This would check DT_RUNPATH, but patchelf populate DT_RPATH,
       ;; not DT_RUNPATH.
       #:validate-runpath? #f
       #:phases
       #~(modify-phases %standard-phases
           (replace 'unpack
             (lambda* (#:key inputs #:allow-other-keys)
               (let ((source (assoc-ref inputs "source")))
                 (invoke "tar" "xvzf" source)
                 (chdir "gnat-x86_64-linux-14.2.0-1"))))
           (delete 'configure)
           (delete 'check)
           (replace 'build
             (lambda* (#:key inputs #:allow-other-keys)
               (define libc
                 (assoc-ref inputs "libc"))
               (define gcc-lib
                 (assoc-ref inputs "gcc:lib"))
               (define ld.so
                 (search-input-file inputs #$(glibc-dynamic-linker)))
               (define rpath
                 (string-join (list "$ORIGIN"
                                    (string-append #$output "/lib")
                                    (string-append #$output "/lib64")
                                    (string-append libc "/lib")
                                    (string-append gcc-lib "/lib"))
                              ":"))

               (define (patch-elf file)
                 (make-file-writable file)

                 (unless (string-contains file ".so")
                   (unless (string-contains file ".o")
                     (format #t "Setting RPATH on '~a'...~%" file)
                     (invoke "patchelf" "--set-rpath" rpath "--force-rpath" file)))

                 (unless (string-contains file ".so")
                   (unless (string-contains file ".o")
                     (format #t "Setting interpreter on '~a'...~%" file)
                     (invoke "patchelf" "--set-interpreter" ld.so file))))

               (for-each (lambda (file)
                           (when (elf-file? file)
                             (patch-elf file)))
                         (find-files "."
                                     (lambda (file stat)
                                       (eq? 'regular
                                            (stat:type stat)))))))

           (replace 'install
             (lambda* (#:key outputs
                       #:allow-other-keys)
               (let ((bin (string-append #$output "/bin"))
                     (lib (string-append #$output "/lib"))
                     (lib64 (string-append #$output "/lib64"))
                     (libexec (string-append #$output "/libexec"))
                     (x86_64-pc-linux-gnu
                      (string-append #$output "/x86_64-pc-linux-gnu")))
                 (mkdir-p #$output)
                 (copy-recursively "bin" bin)
                 (copy-recursively "lib" lib)
                 (copy-recursively "lib64" lib64)
                 (copy-recursively "libexec" libexec)
                 (copy-recursively "x86_64-pc-linux-gnu" x86_64-pc-linux-gnu)))))))
    (native-inputs (list patchelf))
    (inputs `(("gcc:lib" ,gcc-14 "lib")))
    (home-page "https:/#$output#$output/github.com/alire-project/GNAT-FSF-builds")
    (synopsis "Bootstrap GNAT toolchain from FSF")
    (description "")
    (license license:expat)))
