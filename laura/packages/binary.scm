(define-module (laura packages binary)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages))

(define-public radicle-heartwood
  (package
    (name "radicle-heartwood")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.radicle.xyz/releases/latest/radicle-" version "-x86_64-unknown-linux-musl.tar.xz"))
       (sha256
        (base32 "0c7rmjq2xy9fz50lhnavc62ycmyg94msz501jz9y1cjhghzbi8xw"))))
    (build-system copy-build-system)
    (supported-systems (list "x86_64-linux"))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle Heartwood Protocol & Stack")
    (description
     "Heartwood is the third iteration of the Radicle Protocol, a powerful peer-to-peer code collaboration and publishing stack. The repository contains a full implementation of Heartwood, complete with a user-friendly command-line interface (rad) and network daemon (radicle-node).")
    (license (list license:expat license:asl2.0))))
