(define-module (laura packages utils)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (guix download)
  #:use-module (guix build-system cargo)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages python)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages llvm)
  #:use-module (guix build utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system go)
  #:use-module (guix build-system python)
  #:use-module (guix gexp)
  #:use-module (laura packages rust-common))

(define-public libgfshare
  (package
    (name "libgfshare")
    (version "1.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/jcushman/libgfshare")
               (commit
                 "beeebe381a3953a3535295b0121e13c0aae1112e")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "053gzsy5sv7yjzbnnql2a89f5y0bab173m057z7xxwrpkvqkvcq5"))))
    (build-system gnu-build-system)
    (inputs '())
    (native-inputs (list autoconf automake libtool))
    (synopsis
      "Library for Shamir Secret Sharing in the Galois Field 2**8")
    (description
      "This library implements what is known as Shamir Secret Sharing.")
    (home-page
      "https://github.com/jcushman/libgfshare")
    (license license:expat)))

(define-public bsdiff
  (package
    (name "bsdiff")
    (version "4.3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mendsley/bsdiff")
               (commit
                 "b817e9491cf7b8699c8462ef9e2657ca4ccd7667")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1f72rpivnvkim2xr4j7p2inm8a84g2kbzbs0shfcbi2qpgxmm8m1"))))
    (build-system gnu-build-system)
    (inputs '())
    (native-inputs (list autoconf automake libtool))
    (synopsis
      "Libraries for building and applying patches to binary files.")
    (description
      "bsdiff and bspatch are libraries for building and applying patches to binary files.")
    (home-page "https://github.com/mendsley/bsdiff")
    (license license:bsd-3)))

(define-public libsixel
  (package
    (name "libsixel")
    (version "1.8.6")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/saitoha/libsixel")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1saxdj6sldv01g6w6yk8vr7px4bl31xca3a82j6v1j3fw5rbfphy"))))
    (build-system gnu-build-system)
    (inputs '())
    (synopsis
      "A SIXEL encoder/decoder implementation.")
    (description
      "This package provides encoder/decoder implementation for DEC SIXEL graphics, and some converter programs.")
    (home-page "https://github.com/saitoha/libsixel")
    (license license:expat)))

(define-public clipmon
  (package
    (name "clipmon")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clipmon" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0fcspz7dw1vwin7vqizjszwc8qyzpdpz6hvvnrvnrp3gqmbm1ny3"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-calloop" ,rust-calloop-0.9)
         ("rust-libc" ,rust-libc-0.2.155)
         ("rust-mime" ,rust-mime-0.3)
         ("rust-smithay-client-toolkit"
          ,rust-smithay-client-toolkit-0.15)
         ("rust-wayland-client" ,rust-wayland-client-0.29)
         ("rust-wayland-protocols"
          ,rust-wayland-protocols-0.29))))
    (home-page "https://sr.ht/~whynothugo/clipmon/")
    (synopsis
      "clipmon, or clipboard monitor is a wayland helper that keeps the selection when the application that copied exits")
    (description
      "This package provides clipmon, or clipboard monitor is a wayland helper that keeps the selection when\nthe application that copied exits.")
    (license license:isc)))

(define-public yara
  (package
    (name "yara")
    (version "4.5.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/VirusTotal/yara")
               (commit "v4.5.1")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1b8fj83lr5m0pma3rj1l5rkjkn69hrfd1hnl5zrjdsik4nq532i4"))))
    (build-system gnu-build-system)
    (native-inputs
      (list autoconf automake libtool pkg-config))
    (inputs (list protobuf-c openssl))
    (arguments (list #:tests? #f))
    (home-page "https://virustotal.github.io/yara/")
    (synopsis "The pattern matching swiss knife")
    (description
      "YARA is a tool aimed at (but not limited to) helping malware researchers to identify and classify malware samples.")
    (license license:bsd-3)))

(define-public cado-nfs
  (package
    (name "cado-nfs")
    (version "2.3.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://gitlab.inria.fr/cado-nfs/cado-nfs.git")
               (commit
                 "2551f43ca06cb31d86fe39847033ac8dedca1938")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1qd75c6qa38xnm2b3h1k7n8g5vf746bkz68ljbpds9ma6rzlwyiw"))))
    (inputs (list gmp python-3 perl))
    (build-system cmake-build-system)
    (arguments
      `(#:tests?
        #f
        #:build-type
        "Release"
        #:phases
        (modify-phases
          %standard-phases
          (add-before
            'patch-generated-file-shebangs
            'patch-files
            (lambda* (#:key inputs #:allow-other-keys)
              (begin
                (use-modules (guix build utils))
                (map (lambda (x)
                       (with-exception-handler (lambda (e) #f) (lambda () (substitute* x (("#! /bin/sh") "#!/bin/sh")))))
                     (find-files "."))))))))
    (home-page
      "https://gitlab.inria.fr/cado-nfs/cado-nfs")
    (synopsis
      "An Implementation of the Number Field Sieve Algorithm")
    (description
      "Cado-NFS, An Implementation of the Number Field Sieve Algorithm")
    (license license:lgpl2.1)))

(define-public go-github-com-iglou-eu-go-wildcard
  (package
    (name "go-github-com-iglou-eu-go-wildcard")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/IGLOU-EU/go-wildcard")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1navfgv8k4lk0ajd8xib75qzjiingbh9xfhrh1qdxin5cycrn1al"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/IGLOU-EU/go-wildcard"))
    (home-page "https://github.com/IGLOU-EU/go-wildcard")
    (synopsis "Go-wildcard")
    (description
     "This part of Minio project is a very cool, fast and light wildcard pattern
matching.")
    (license license:asl2.0)))

(define-public go-github-com-jedib0t-go-pretty-v6
  (package
    (name "go-github-com-jedib0t-go-pretty-v6")
    (version "6.5.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jedib0t/go-pretty")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xb6sskfmbycfd0373cvq0849k0mq7b8xah9ai099m519iqawkx9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/jedib0t/go-pretty/v6"
      #:phases #~(modify-phases %standard-phases (delete 'build) (delete 'check))))
    (propagated-inputs `(("go-golang-org-x-term" ,go-golang-org-x-term)
                         ("go-golang-org-x-sys" ,go-golang-org-x-sys)
                         ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                         ("go-github-com-pkg-profile" ,go-github-com-pkg-profile)
                         ("go-github-com-mattn-go-runewidth" ,go-github-com-mattn-go-runewidth)))
    (home-page "https://github.com/jedib0t/go-pretty")
    (synopsis "go-pretty")
    (description
     "Utilities to prettify console output of tables, lists, progress-bars, text, etc.
 with a heavy emphasis on customization.")
    (license license:expat)))

(define-public go-github-com-muesli-mango
  (package
    (name "go-github-com-muesli-mango")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/muesli/mango")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16d0sga6cbdxzlqkibcgw0civkw11fpkcjpgv21i0q5j9mjbsjw4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/muesli/mango"))
    (propagated-inputs `(("go-github-com-muesli-roff" ,go-github-com-muesli-roff)))
    (home-page "https://github.com/muesli/mango")
    (synopsis "mango")
    (description
     "mango is a man-page generator for the Go flag, pflag, cobra, coral, and kong
packages.  It extracts commands, flags, and arguments from your program and
enables it to self-document.")
    (license license:expat)))

(define-public go-github-com-muesli-roff
  (package
    (name "go-github-com-muesli-roff")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/muesli/roff")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l263rqwq2ccr1lpamsvs48dddsr70xim8mv6rsj2x9y3prcq3yh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/muesli/roff" #:tests? #f))
    (home-page "https://github.com/muesli/roff")
    (synopsis "roff")
    (description "roff lets you write roff documents in Go.")
    (license license:expat)))

(define-public duf
  (package
    (name "duf")
    (version "0.8.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/muesli/duf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08hzmj3phli4yzj10z9q0y6zrzjq8r7iaxgpz4rfjqqarxgslnvd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/muesli/duf"))
    (propagated-inputs `(("go-golang-org-x-term" ,go-golang-org-x-term)
                         ("go-golang-org-x-sys" ,go-golang-org-x-sys)
                         ("go-github-com-muesli-termenv" ,go-github-com-muesli-termenv)
                         ("go-github-com-muesli-roff" ,go-github-com-muesli-roff)
                         ("go-github-com-muesli-mango" ,go-github-com-muesli-mango)
                         ("go-github-com-mattn-go-runewidth" ,go-github-com-mattn-go-runewidth)
                         ("go-github-com-jedib0t-go-pretty-v6" ,go-github-com-jedib0t-go-pretty-v6)
                         ("go-github-com-iglou-eu-go-wildcard" ,go-github-com-iglou-eu-go-wildcard)))
    (home-page "https://github.com/muesli/duf")
    (synopsis "Disk Usage/Free Utility - a better 'df' alternative")
    (description
     "Disk Usage/Free Utility (Linux, BSD, @code{macOS} & Windows).")
    (license license:expat)))

(define-public paper-age
  (package
    (name "paper-age")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "paper-age" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14n6qv6f39qy8wvw71vfm8y0yfggp975yibqdqdzz61iis46mykv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-age" ,rust-age-0.10)
                       ("rust-clap" ,rust-clap-4.5.6)
                       ("rust-clap-verbosity-flag" ,rust-clap-verbosity-flag-2.2)
                       ("rust-clap-complete" ,rust-clap-complete-4.5.5)
                       ("rust-clap-mangen" ,rust-clap-mangen-0.2)
                       ("rust-env-logger" ,rust-env-logger-0.11)
                       ("rust-exitcode" ,rust-exitcode-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-path-absolutize" ,rust-path-absolutize-3)
                       ("rust-printpdf" ,rust-printpdf-0.7)
                       ("rust-printpdf" ,rust-printpdf-0.7)
                       ("rust-qrcode" ,rust-qrcode-0.14)
                       ("rust-rpassword" ,rust-rpassword-7))
       #:cargo-development-inputs (("rust-assert-cmd" ,rust-assert-cmd-2)
                                   ("rust-assert-fs" ,rust-assert-fs-1.1.1)
                                   ("rust-predicates" ,rust-predicates-3.1.0))))
    (home-page "https://github.com/matiaskorhonen/paper-age")
    (synopsis "Easy and secure paper backups of secrets")
    (description
     "This package provides Easy and secure paper backups of secrets.")
    (license license:expat)))

(define-public csvlens
  (package
    (name "csvlens")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "csvlens" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gvw0lz8jsk88vpnfb6zv0rnm9pshj4rjbifx5cxkq9biin9qnvj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-arboard" ,rust-arboard-3.4)
                       ("rust-arrow" ,rust-arrow-50)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-crossterm" ,rust-crossterm-0.27)
                       ("rust-csv" ,rust-csv-1)
                       ("rust-csv-sniffer" ,rust-csv-sniffer-0.3)
                       ("rust-ratatui" ,rust-ratatui-0.25)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-sorted-vec" ,rust-sorted-vec-0.8)
                       ("rust-tempfile" ,rust-tempfile-3)
                       ("rust-tui-input" ,rust-tui-input-0.8))))
    (home-page "https://github.com/YS-L/csvlens")
    (synopsis "Command line csv viewer")
    (description "This package provides Command line csv viewer.")
    (license license:expat)))

(define-public libglibutil
  (package
    (name "libglibutil")
    (version "1.0.79")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/sailfishos/libglibutil")
              (commit "1.0.79")))
        (file-name (git-file-name name version))
        (sha256 (base32 "1zn0h9f8bd4kwqz33b8719r1wwbx790qvwl05w1yqrm0z270m6sh"))))
    (build-system gnu-build-system)
    (arguments `(#:tests? #f #:phases (modify-phases %standard-phases (delete 'configure) (add-before 'build 'fix-makefile (lambda* (#:key outputs #:allow-other-keys)
      (begin
        (substitute* "Makefile" (("CC \\?\\= \\$\\(CROSS_COMPILE\\)gcc") (string-append "CC := gcc\nDESTDIR := " (assoc-ref outputs "out"))) (("install:") "pre-install:") (("install-dev: install") "install: pre-install") (("usr\\/") "") (("\\$\\(ABS_LIBDIR\\)\\|") "$(DESTDIR)/$(LIBDIR)|")))
        (substitute* "libglibutil.pc.in" (("\\/usr\\/include") "@libdir@/../include")))))))
    (inputs (list glib))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/sailfishos/libglibutil")
    (synopsis "Library of glib utilities.")
    (description "Library of glib utilities.")
    (license license:bsd-3)))

(define-public libgbinder
  (package
    (name "libgbinder")
    (version "1.1.40")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/mer-hybris/libgbinder")
              (commit "1.1.40")))
        (file-name (git-file-name name version))
        (sha256 (base32 "0z293a1cr3hxkxlyi0cd6syd5dj9jhbx91plzl6nziviprwd9zbf"))))
    (build-system gnu-build-system)
    (arguments `(#:tests? #f #:phases (modify-phases %standard-phases (delete 'configure) (add-before 'build 'fix-makefile (lambda* (#:key outputs #:allow-other-keys)
      (begin
        (substitute* "Makefile" (("CC \\?\\= \\$\\(CROSS_COMPILE\\)gcc") (string-append "CC := gcc\nDESTDIR := " (assoc-ref outputs "out"))) (("install:") "pre-install:") (("install-dev: install") "install: pre-install") (("usr\\/") "") (("\\$\\(ABS_LIBDIR\\)\\|") "$(DESTDIR)/$(LIBDIR)|")))
        (substitute* "libgbinder.pc.in" (("\\/usr\\/include") "@libdir@/../include"))
        (substitute* "include/gbinder_types.h" (("gutil_types.h") "gutil/gutil_types.h")))))))
    (inputs (list glib))
    (native-inputs (list pkg-config))
    (propagated-inputs (list libglibutil))
    (home-page "https://github.com/mer-hybris/libgbinder")
    (synopsis "GLib-style interface to binder")
    (description "GLib-style interface to binder (Android IPC mechanism)")
    (license license:bsd-3)))

(define-public python-gbinder
  (package
    (name "python-gbinder")
    (version "2.10")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/erfanoabdi/gbinder-python")
              (commit "1.1.2")))
        (file-name (git-file-name name version))
        (sha256 (base32 "1qxadb1ccmdwnwj4p15sm2i3b7cjaxh7far1jk9sxrblwh7497ds"))))
    (build-system python-build-system)
    (arguments `(#:phases (modify-phases %standard-phases (add-before 'build 'cythonize (lambda* (#:key outputs #:allow-other-keys) (substitute* "setup.py" (("USE_CYTHON = False") "USE_CYTHON = True")(("extension_kwargs = pkgconfig\\('libgbinder', extension_kwargs\\)") "extension_kwargs = pkgconfig('libgbinder', extension_kwargs)\nextension_kwargs = pkgconfig('libglibutil', extension_kwargs)")))))))
    (inputs (list python-cython libgbinder libglibutil glib))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/erfanoabdi/gbinder-python")
    (synopsis "Python bindings for libgbinder")
    (description "Cython extension module for gbinder")
    (license license:gpl3)))

(define-public waydroid
  (package
    (name "waydroid")
    (version "1.4.2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/waydroid/waydroid")
              (commit "1.4.2")))
        (file-name (git-file-name name version))
        (sha256 (base32 "1cp528ybksgf1ifawygm2zqrxh870i264sqbk272775p4a36zlgx"))))
    (build-system gnu-build-system)
    (arguments `(#:tests? #f #:phases (modify-phases %standard-phases (delete 'configure) (delete 'build)
        (add-before 'install 'patch-environment (lambda* (#:key outputs #:allow-other-keys)
          (substitute* "Makefile" (("PREFIX := /usr") (string-append "PREFIX := " (assoc-ref outputs "out") "\nUSE_SYSTEMD := 0")) (("\\/etc") "$(PREFIX)/etc"))))
        (add-after 'install 'wrap-script (lambda* (#:key inputs outputs #:allow-other-keys)
          (wrap-program (string-append (assoc-ref outputs "out") "/bin/waydroid") `("PYTHONPATH" suffix (,(string-append (assoc-ref inputs "python-gbinder") "/lib/python3.10/site-packages") ,(string-append (assoc-ref inputs "python-dbus") "/lib/python3.10/site-packages") ,(string-append (assoc-ref inputs "python-pygobject") "/lib/python3.10/site-packages")))))))))
    (inputs (list python-3.10))
    (propagated-inputs (list python-gbinder python-dbus python-pygobject lxc dnsmasq))
    (home-page "https://waydro.id")
    (synopsis "Waydroid uses a container-based approach to boot a full Android system on a regular GNU/Linux system like Ubuntu.")
    (description "Waydroid uses Linux namespaces (user, pid, uts, net, mount, ipc) to run a full Android system in a container and provide Android applications on any GNU/Linux-based platform.")
    (license license:gpl3)))

(define-public Amogus-File-Encoder
  (package
    (name "Amogus-File-Encoder")
    (version "sus")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/RegularRabbit05/Amogus-File-Encoder")
              (commit "sus")))
        (modules '((guix build utils)))
        (snippet #~(begin
                      (substitute* "main.cpp" (("getpid\\(\\)") "1"))
                      (make-file-writable "CMakeLists.txt")
                      (let ((output-port (open-file "CMakeLists.txt" "a")))
                        (display "\ninstall(TARGETS AmogusCoder)\n" output-port)
                        (close output-port))))
        (file-name (git-file-name name version))
        (sha256 (base32 "04z1i34y2y3g7d8qvdfjwxk98qybbc49qzzpplvpgmn4iwhikm4s"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f #:build-type "Release"))
    (home-page "https://github.com/RegularRabbit05/Amogus-File-Encoder")
    (synopsis "Encode and decode your files and strings in a sussy way!")
    (description "Because Base64 is overrated. Now with -600% compression rates!")
    (license (license:non-copyleft "file://LICENSE.md"))))

(define-public encpipe
  (package
    (name "encpipe")
    (version "0.5")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/jedisct1/encpipe")
              (recursive? #t)
              (commit "0.5")))
        (file-name (git-file-name name version))
        (sha256 (base32 "1mk178kf7vbk92hshylfm20giy8dgncc16s9if1hrffrdi4hllb2"))
        (snippet `(begin
          (use-modules (guix build utils))
          (substitute* "Makefile" (("-march=native ") ""))))))
    (build-system gnu-build-system)
    (arguments `(#:tests? #f #:phases (modify-phases %standard-phases
      (delete 'configure)
      (add-before 'build 'env (lambda* (#:key outputs #:allow-other-keys)
        (setenv "CC" "gcc")))
      (replace 'install (lambda* (#:key outputs #:allow-other-keys)
        (begin
          (install-file "encpipe" (string-append (assoc-ref outputs "out") "/bin"))))))))
    (home-page "https://github.com/jedisct1/encpipe")
    (synopsis "The dum^H^H^Hsimplest encryption tool in the world.")
    (description "It was faster to write than remember how to use GnuPG and OpenSSL.")
    (license license:isc)))

(define-public coremark
  (package
    (name "coremark")
    (version "1.01")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/eembc/coremark")
              (commit "v1.01")))
        (file-name (git-file-name name version))
        (sha256 (base32 "17sdf01715w0fwhlgl21w5hc9d97ixkrgx20vyglz2w418cwk1b7"))
        (snippet `(begin
          (use-modules (guix build utils))
          (substitute* "Makefile" (("rerun score") "compile"))))))
    (build-system gnu-build-system)
    (arguments `(#:tests? #f #:phases (modify-phases %standard-phases
      (delete 'configure)
      (replace 'install (lambda* (#:key outputs #:allow-other-keys)
        (begin
          (rename-file "coremark.exe" "coremark")
          (install-file "coremark" (string-append (assoc-ref outputs "out") "/bin"))))))))
    (home-page "https://github.com/eembc/coremark")
    (synopsis "CoreMark® is an industry-standard benchmark that measures the performance of central processing units (CPU) and embedded microcrontrollers (MCU).")
    (description "CoreMark's primary goals are simplicity and providing a method for testing only a processor's core features. For more information about EEMBC's comprehensive embedded benchmark suites, please see www.eembc.org.")
    (license license:asl2.0)))
