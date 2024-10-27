(define-module (laura packages nomadnet)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-crypto))

(define-public nomadnet
  (package
    (name "nomadnet")
    (version "0.5.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/markqvist/NomadNet")
             (commit version)))
       (sha256
        (base32 "0nzjflxqv1vy16gsbj79pj6ab81iw8x8qmnjc3cjdf327mwx3g7c"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-lxmf python-qrcode python-rns python-urwid))
    (arguments
     `(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'sanity-check))))
    (home-page "https://github.com/markqvist/nomadnet")
    (synopsis "Communicate Freely")
    (description "Communicate Freely.")
    (license license:gpl3)))

(define-public python-lxmf
  (package
    (name "python-lxmf")
    (version "0.5.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/markqvist/LXMF")
             (commit version)))
       (sha256
        (base32 "1bsk2c73lz9vf5q36mmkzdwjcmgl6igd97n8scign6ri70gddhki"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-rns))
    (arguments
     `(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'sanity-check))))
    (home-page "https://github.com/markqvist/lxmf")
    (synopsis "Lightweight Extensible Message Format for Reticulum")
    (description "Lightweight Extensible Message Format for Reticulum.")
    (license license:expat)))

(define-public python-rns
  (package
    (name "python-rns")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/markqvist/Reticulum")
             (commit version)))
       (sha256
        (base32 "19szbapwic1qxms1aw0ynak72fx7xj35jfwgszrhwqviixzzd093"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cryptography python-pyserial))
    (arguments
     `(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'sanity-check))))
    (home-page "https://reticulum.network/")
    (synopsis
     "Self-configuring, encrypted and resilient mesh networking stack for LoRa, packet radio, WiFi and everything in between")
    (description
     "Self-configuring, encrypted and resilient mesh networking stack for @code{LoRa},
packet radio, @code{WiFi} and everything in between.")
    (license license:expat)))
