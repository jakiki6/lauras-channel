(define-module (laura packages utils)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (guix download)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages crates-windows)
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
  #:use-module (gnu packages golang-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages popt)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages man)
  #:use-module (gnu packages golang-web)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cross-base)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages freedesktop)
  #:use-module (guix build utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system go)
  #:use-module (guix build-system python)
  #:use-module (guix build-system meson)
  #:use-module (guix gexp)
  #:use-module (laura packages go-common)
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

(define-public ent
  (package
    (name "ent")
    (version "1.2")
    (source
      (origin
        (method url-fetch)
        (uri "http://deb.debian.org/debian/pool/main/e/ent/ent_1.2debian.orig.tar.gz")
        (sha256 (base32 "0jfhqzf5iwn5c7bb0kr9h9x5znxammlwxgqn6hvryc0dnci3gxid"))))
    (build-system gnu-build-system)
    (arguments `(#:tests? #f #:phases (modify-phases %standard-phases
      (delete 'configure)
      (replace 'install (lambda* (#:key outputs #:allow-other-keys)
        (begin
          (install-file "ent" (string-append (assoc-ref outputs "out") "/bin"))))))))
    (home-page "https://www.fourmilab.ch/random/")
    (synopsis "Pseudorandom number sequence test program")
    (description "This program applies various tests to sequences of bytes stored in files and reports the results of those tests. The program is useful for those evaluating pseudorandom number generators for encryption and statistical sampling applications, compression algorithms, and other applications where the information density of a file is of interest.")
    (license license:public-domain)))

(define-public pesign
  (package
    (name "pesign")
    (version "116")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/rhboot/pesign")
              (commit "116")))
        (file-name (git-file-name name version))
        (sha256 (base32 "0fnqfiivj46bha4hsnwiqy8vq8b4i3w2dig0h9h2k4j7yq7r5qvj"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config mandoc))
    (inputs (list popt efivar nspr nss openssl `(,util-linux "lib")))
    (arguments `(#:tests? #f #:phases (modify-phases %standard-phases
      (delete 'configure)
      (add-before 'build 'fix-env (lambda* (#:key inputs outputs #:allow-other-keys)
        (setenv "LIBRARY_PATH" (string-append
          (getenv "LIBRARY_PATH") ":"
          (assoc-ref inputs "nss") "/lib/nss"))
        (substitute* "Make.defaults"
          (("DESTDIR.*\\?.*$") (string-append "DESTDIR = " (assoc-ref outputs "out") "\n"))
          (("/usr/") "/")))))))
    (home-page "https://github.com/rhboot/pesign")
    (synopsis "Linux tools for signed PE-COFF binaries")
    (description "Signing tools for PE-COFF binaries. Compliant with the PE and Authenticode specifications.")
    (license license:gpl2)))

(define-public cerca
  (package
    (name "cerca")
    (version "0.0.0-20240906135835-1f4d8ff974ed")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cblgh/cerca")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17wsk87p1v5wsxdfypc293nrsdx4nna2q9ldwf89r6bia3978gsi"))))
    (build-system go-build-system)
    (arguments
      `(#:import-path "cerca"
        #:go ,go-1.23
        #:build-flags (list "-ldflags=-s -w --buildid=none")
        #:phases (modify-phases %standard-phases
         (add-before 'build 'deref-symlinks
           (lambda* (#:key inputs #:allow-other-keys)
             (begin
               (delete-file-recursively "src/golang.org/x/net/publicsuffix/data")
               (copy-recursively (string-append (assoc-ref inputs "go-golang-org-x-net") "/src/golang.org/x/net/publicsuffix/data") "src/golang.org/x/net/publicsuffix/data")))))))
    (propagated-inputs (list go-golang-org-x-time
                             go-golang-org-x-exp
                             go-github-com-microcosm-cc-bluemonday
                             go-github-com-mattn-go-sqlite3
                             go-github-com-matthewhartstonge-argon2
                             go-github-com-komkom-toml
                             go-github-com-gorilla-sessions
                             go-github-com-gomarkdown-markdown
                             go-github-com-cblgh-plain
                             go-github-com-carlmjohnson-requests))
    (home-page "https://github.com/cblgh/cerca")
    (synopsis "Cerca")
    (description "a forum software")
    (license license:agpl3+)))

(define-public wasmtime
  (package
    (name "wasmtime")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (modules '((guix build utils)))
       (snippet #~(begin (substitute* "Cargo.toml" (("1.78.0") "1.77.0"))))
       (sha256
        (base32 "1q0m6wycrdw7vv9b73ckqmcx5fh7xim1m5dh0f4xrihdff1ys5j2"))))
    (build-system cargo-build-system)
    (native-inputs (list pkg-config))
    (inputs (list (list zstd "lib")))
    (arguments
     `(#:tests? #f
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                             ("rust-anyhow" ,rust-anyhow-1)
                             ("rust-async-trait" ,rust-async-trait-0.1)
                             ("rust-bytes" ,rust-bytes-1)
                             ("rust-cfg-if" ,rust-cfg-if-1)
                             ("rust-clap" ,rust-clap-4)
                             ("rust-http" ,rust-http-1)
                             ("rust-http-body-util" ,rust-http-body-util-0.1.1)
                             ("rust-humantime" ,rust-humantime-2)
                             ("rust-hyper" ,rust-hyper-1.3)
                             ("rust-listenfd" ,rust-listenfd-1)
                             ("rust-log" ,rust-log-0.4)
                             ("rust-once-cell" ,rust-once-cell-1)
                             ("rust-rustix" ,rust-rustix-0.38.34)
                             ("rust-serde" ,rust-serde-1)
                             ("rust-serde-derive" ,rust-serde-derive-1.203)
                             ("rust-serde-json" ,rust-serde-json-1)
                             ("rust-target-lexicon" ,rust-target-lexicon-0.12.16)
                             ("rust-tempfile" ,rust-tempfile-3)
                             ("rust-tokio" ,rust-tokio-1)
                             ("rust-tracing" ,rust-tracing-0.1)
                             ("rust-wasi-common" ,rust-wasi-common-24)
                             ("rust-wasmparser" ,rust-wasmparser-0.215)
                             ("rust-wasmtime" ,rust-wasmtime-24)
                             ("rust-wasmtime-cache" ,rust-wasmtime-cache-24)
                             ("rust-wasmtime-cli-flags" ,rust-wasmtime-cli-flags-24)
                             ("rust-wasmtime-cranelift" ,rust-wasmtime-cranelift-24)
                             ("rust-wasmtime-environ" ,rust-wasmtime-environ-24)
                             ("rust-wasmtime-explorer" ,rust-wasmtime-explorer-24)
                             ("rust-wasmtime-wasi" ,rust-wasmtime-wasi-24)
                             ("rust-wasmtime-wasi-http" ,rust-wasmtime-wasi-http-24)
                             ("rust-wasmtime-wasi-keyvalue" ,rust-wasmtime-wasi-keyvalue-24)
                             ("rust-wasmtime-wasi-nn" ,rust-wasmtime-wasi-nn-24)
                             ("rust-wasmtime-wasi-runtime-config" ,rust-wasmtime-wasi-runtime-config-24)
                             ("rust-wasmtime-wasi-threads" ,rust-wasmtime-wasi-threads-24)
                             ("rust-wasmtime-wast" ,rust-wasmtime-wast-24)
                             ("rust-wat" ,rust-wat-1))
       #:cargo-development-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                                         ("rust-bstr" ,rust-bstr-1)
                                         ("rust-bytesize" ,rust-bytesize-1)
                                         ("rust-capstone" ,rust-capstone-0.12)
                                         ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.111)
                                         ("rust-cranelift-reader" ,rust-cranelift-reader-0.111)
                                         ("rust-criterion" ,rust-criterion-0.5)
                                         ("rust-env-logger" ,rust-env-logger-0.10)
                                         ("rust-filecheck" ,rust-filecheck-0.5)
                                         ("rust-libc" ,rust-libc-0.2)
                                         ("rust-libtest-mimic" ,rust-libtest-mimic-0.7)
                                         ("rust-log" ,rust-log-0.4)
                                         ("rust-memchr" ,rust-memchr-2)
                                         ("rust-num-cpus" ,rust-num-cpus-1)
                                         ("rust-object" ,rust-object-0.36)
                                         ("rust-rayon" ,rust-rayon-1)
                                         ("rust-serde" ,rust-serde-1)
                                         ("rust-serde-json" ,rust-serde-json-1)
                                         ("rust-similar" ,rust-similar-2)
                                         ("rust-tempfile" ,rust-tempfile-3)
                                         ("rust-tokio" ,rust-tokio-1)
                                         ("rust-toml" ,rust-toml-0.8)
                                         ("rust-walkdir" ,rust-walkdir-2)
                                         ("rust-wasmtime" ,rust-wasmtime-24)
                                         ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-24)
                                         ("rust-wasmtime-wast" ,rust-wasmtime-wast-24)
                                         ("rust-wast" ,rust-wast-215)
                                         ("rust-wat" ,rust-wat-1)
                                         ("rust-windows-sys" ,rust-windows-sys-0.52)
                                         ("rust-wit-component" ,rust-wit-component-0.215))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Command-line interface for Wasmtime")
    (description "This package provides Command-line interface for Wasmtime.")
    (license license:asl2.0)))

(define-public gcc-cross-riscv64-linux-gnu-toolchain
  (cross-gcc-toolchain "riscv64-linux-gnu"))

(define-public leopard
  (package
    (name "leopard")
    (version "2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/catid/leopard")
              (commit "6e5725ebdf9da4370b0bcc4f70fa8eb66f4e6198")))
        (file-name (git-file-name name version))
        (sha256 (base32 "0hbcd97q972ifp88ypd9y1w5nm5x08xbbzc35fwj35kvlpsnz4vi"))
        (snippet
          '(begin
             (chmod "CMakeLists.txt" #o644)
             (let ((out (open-file "CMakeLists.txt" "a")))
               (display "add_library(leopard SHARED ${LIB_SOURCE_FILES})\ninstall(TARGETS bench_leopard DESTINATION bin)\ninstall(TARGETS leopard DESTINATION lib)\ninstall(FILES leopard.h DESTINATION include)\n" out)
               (close-port out))
             (use-modules (guix build utils))
             (substitute* "CMakeLists.txt" (("-march=native") "-march=haswell"))))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f #:build-type "Release"))
    (home-page "https://github.com/catid/leopard")
    (synopsis "Leopard-RS : O(N Log N) MDS Reed-Solomon Block Erasure Code for Large Data")
    (description "Leopard-RS is a fast library for Erasure Correction Coding. From a block of equally sized original data pieces, it generates recovery symbols that can be used to recover lost original data.")
    (license license:bsd-3)))

(define-public sbctl
  (package
    (name "sbctl")
    (version "0.15.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/sbctl")
             (commit "a53a6ba59ccf")))
       (file-name (git-file-name name version))
       (modules '((guix build utils)))
       (snippet #~(begin (invoke (string-append #$git "/bin/git") "apply" #$(local-file (search-patch "laura/packages/patches/sbctl-remove-tpm-and-landlock-support.patch"))) (delete-file-recursively "tests")))
       (sha256
        (base32 "0qgf3ywpv1rxplhk2jj7zzvyyagk90lxqs7brn4ai7i4pp6v9bq8"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/foxboron/sbctl"
      #:import-path "github.com/foxboron/sbctl/cmd/sbctl"))
    (propagated-inputs (list go-golang-org-x-sys
                             go-golang-org-x-exp
                             go-github-com-spf13-cobra
                             go-github-com-spf13-afero
                             go-github-com-onsi-gomega
                             go-github-com-google-uuid
                             go-github-com-goccy-go-yaml
                             go-github-com-foxboron-go-uefi-authenticode
                             go-github-com-foxboron-go-uefi-efi
                             go-github-com-foxboron-go-uefi-efivar
                             go-github-com-foxboron-go-uefi-efivarfs
                             go-github-com-foxboron-go-uefi-pkcs7
                             go-github-com-fatih-color))
    (home-page "https://github.com/foxboron/sbctl")
    (synopsis "sbctl - Secure Boot Manager")
    (description
     "sbctl intends to be a user-friendly secure boot key manager capable of setting
up secure boot, offer key management capabilities, and keep track of files that
needs to be signed in the boot chain.")
    (license license:expat)))

(define-public ricochet-refresh
  (package
    (name "ricochet-refresh")
    (version "3.0.27")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/blueprint-freespeech/ricochet-refresh")
              (recursive? #t)
              (commit "v3.0.27-release")))
        (file-name (git-file-name name version))
        (sha256 (base32 "06clv5cbmwf6j3lby5fqbxvyadsy7cffy72257mhcn07dqwk2jz9"))))
    (build-system cmake-build-system)
    (arguments
      `(#:tests? #f
        #:build-type "Release"
        #:phases (modify-phases %standard-phases
          (add-before 'configure 'chdir (lambda _ (chdir "src")))
          (add-after 'install 'wrap
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (wrap-program (string-append (assoc-ref outputs "out") "/bin/ricochet-refresh")
                `(QML2_IMPORT_PATH suffix (,(string-append (assoc-ref inputs "qtdeclarative") "/lib/qt5/qml") ,(string-append (assoc-ref inputs "qtquickcontrols") "/lib/qt5/qml")))))))))
    (inputs (list openssl qtbase-5 qtdeclarative-5 qttools-5 qtmultimedia-5 qtquickcontrols-5 qtquickcontrols2-5 protobuf libxkbcommon))
    (home-page "https://www.ricochetrefresh.net/")
    (synopsis "Anonymous peer-to-peer instant messaging")
    (description "Ricochet Refresh is an instant messenger where no one knows your identity, who you're talking to, or what you're talking about.")
    (license license:bsd-3)))

(define-public activate-linux
  (package
    (name "activate-linux")
    (version "1.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/Kljunas2/activate-linux")
              (commit "8521a85e8b30229635dea58ab053f2b7d674d242")))
        (file-name (git-file-name name version))
        (sha256 (base32 "0g4w73jhinw9kx9kixsyjy29q0p1jqhgw4yycmfghc0shyiv7vyh"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtk-layer-shell gtk+))
    (arguments
      `(#:tests? #f
        #:phases (modify-phases %standard-phases
          (delete 'configure)
          (replace 'install (lambda* (#:key outputs #:allow-other-keys)
            (install-file "bin/activate-linux" (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/Kljunas2/activate-linux")
    (synopsis "Activate Linux watermark for Wayland")
    (description "The \"Activate Windows\" watermark ported to Linux with Gtk Layer Shell")
    (license license:expat)))

(define-public wshowkeys
  (package
    (name "wshowkeys")
    (version "1.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://git.sr.ht/~sircmpwn/wshowkeys")
              (commit "6388a49e0f431d6d5fcbd152b8ae4fa8e87884ee")))
        (file-name (git-file-name name version))
        (sha256 (base32 "10kafdja5cwbypspwhvaxjz3hvf51vqjzbgdasl977193cvxgmbs"))))
    (build-system meson-build-system)
    (native-inputs (list cmake pkg-config))
    (inputs (list cairo libinput pango wayland wayland-protocols libxkbcommon))
    (arguments `(#:tests? #f))
    (home-page "https://git.sr.ht/~sircmpwn/wshowkeys")
    (synopsis "Displays keys being pressed on a Wayland session")
    (description "Displays keypresses on screen on supported Wayland compositors (requires wlr_layer_shell_v1 support).")
    (license license:gpl3)))

(define-public liboqs
  (package
    (name "liboqs")
    (version "0.11.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/open-quantum-safe/liboqs")
              (commit "0.11.0")))
        (file-name (git-file-name name version))
        (sha256 (base32 "0cv7v2cxdjavc24a10b5vp2ayf21r551gj6hqwif78f9z8j7av7q"))))
    (build-system cmake-build-system)
    (inputs (list openssl))
    (arguments `(#:tests? #f #:build-type "Release"))
    (home-page "https://openquantumsafe.org/")
    (synopsis "liboqs is an open source C library for quantum-safe cryptographic algorithms.")
    (description "C library for prototyping and experimenting with quantum-resistant cryptography")
    (license license:expat)))
