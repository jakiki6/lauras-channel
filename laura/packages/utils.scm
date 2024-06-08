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
)

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
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fcspz7dw1vwin7vqizjszwc8qyzpdpz6hvvnrvnrp3gqmbm1ny3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-calloop" ,rust-calloop-0.9)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-smithay-client-toolkit" ,rust-smithay-client-toolkit-0.15)
                       ("rust-wayland-client" ,rust-wayland-client-0.29)
                       ("rust-wayland-protocols" ,rust-wayland-protocols-0.29))))
    (home-page "https://sr.ht/~whynothugo/clipmon/")
    (synopsis
     "clipmon, or clipboard monitor is a wayland helper that keeps the selection when the application that copied exits")
    (description
     "This package provides clipmon, or clipboard monitor is a wayland helper that keeps the selection when
the application that copied exits.")
    (license license:isc)))
