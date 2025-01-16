(define-module (laura packages nomadnet)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-build))

(define-public nomadnet
  (package
    (name "nomadnet")
    (version "0.5.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/markqvist/NomadNet")
             (commit version)))
       (sha256
        (base32 "0as00kl4zcf3czqhjxq4gdzmkyahl28f71dp3dnfa38cicjac33p"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-lxmf python-qrcode python-rns python-urwid))
    (native-inputs (list python-setuptools python-wheel))
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
    (version "0.5.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/markqvist/LXMF")
             (commit version)))
       (sha256
        (base32 "1zhxb3qcrgk78fah4ppcz1pg0mfzb9mg7dk8c0x3nxpfnlm3iizb"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-rns))
    (native-inputs (list python-setuptools python-wheel))
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
    (version "0.8.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/markqvist/Reticulum")
             (commit version)))
       (sha256
        (base32 "17mkdslz6lfc7g72xmv9gh46yf8jlz27c34h2ick5q1f62sgnjf9"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cryptography python-pyserial))
    (native-inputs (list python-setuptools python-wheel))
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
