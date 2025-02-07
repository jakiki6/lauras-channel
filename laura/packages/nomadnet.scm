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
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/markqvist/NomadNet")
             (commit version)))
       (sha256
        (base32 "1nasv8ji628ppd8d5hk9jbkqa37sglbsixi7kbljhb8j3yh84zyy"))))
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
    (version "0.6.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/markqvist/LXMF")
             (commit version)))
       (sha256
        (base32 "1ii4b10srla62wpm49ani6a7rjn7zdrhv3l3bm5d1mlj9nar0ia1"))))
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
    (version "0.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/markqvist/Reticulum")
             (commit version)))
       (sha256
        (base32 "0zsddxyx70cnpsmn6w62vzjqg8lniknv8s68nk2n7abrzhrcj7h1"))))
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
