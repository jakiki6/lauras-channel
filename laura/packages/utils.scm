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
  #:use-module (guix build utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system go)
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
