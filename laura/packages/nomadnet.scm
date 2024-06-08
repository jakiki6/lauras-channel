(define-module (laura packages nomadnet)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-crypto)
)

(define-public python-rns
  (package
    (name "python-rns")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "rns" version))
       (sha256
        (base32 "175xwc4camk738803k10848s658sznxly6a778lii4iinziaxd94"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cryptography python-pyserial))
    (arguments `(#:tests? #f #:phases (modify-phases %standard-phases (delete 'sanity-check))))
    (home-page "https://reticulum.network/")
    (synopsis
     "Self-configuring, encrypted and resilient mesh networking stack for LoRa, packet radio, WiFi and everything in between")
    (description
     "Self-configuring, encrypted and resilient mesh networking stack for @code{LoRa},
packet radio, @code{WiFi} and everything in between.")
    (license license:expat)))

(define-public python-lxmf
  (package
    (name "python-lxmf")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "lxmf" version))
       (sha256
        (base32 "0nm3j96qjxa6px2qh53mr571azsc8pn9k3z55mv3ybznz8pcz3gq"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-rns))
    (arguments `(#:tests? #f))
    (home-page "https://github.com/markqvist/lxmf")
    (synopsis "Lightweight Extensible Message Format for Reticulum")
    (description "Lightweight Extensible Message Format for Reticulum.")
    (license license:expat)))

(define-public nomadnet
  (package
    (name "nomadnet")
    (version "0.4.9")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "nomadnet" version))
       (sha256
        (base32 "00rycinwm7nlw0nzdnwk843r9ydic8hl3zr75bwffldarsh24ibs"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-lxmf python-qrcode python-rns python-urwid))
    (arguments `(#:tests? #f #:phases (modify-phases %standard-phases (delete 'sanity-check))))
    (home-page "https://github.com/markqvist/nomadnet")
    (synopsis "Communicate Freely")
    (description "Communicate Freely.")
    (license license:gpl3)))
