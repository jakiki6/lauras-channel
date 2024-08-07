(define-module (laura packages games)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix transformations)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages image)
  #:use-module (gnu packages serialization)
  #:use-module (laura packages rust-common)
)

(define-public fceux 
  (package
    (name "fceux")
    (version "2.6.6")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/TASEmulators/fceux")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "02s5qmxdxpsa71977z9bs5vfhnszn5nr5hk05wns8cm9nshbg7as"))))
    (build-system cmake-build-system)
    (arguments `(#:tests? #f))
    (inputs (list qtbase-5 zlib minizip sdl2))
    (native-inputs (list pkg-config))
    (synopsis "FCEUX, a NES Emulator")
    (description
      "An open source NES Emulator for Windows and Unix that features solid emulation accuracy and state of the art tools for power users. For some reason casual gamers use it too.")
    (home-page "https://fceux.com")
    (license license:gpl2)))

(define-public uesave
  (package
    (name "uesave")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uesave" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14rh7c62cmxb5fqd0mss69hih9k7xw8jmbqc04bmni929av3729s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-clap" ,rust-clap-4.5.6)
                       ("rust-edit" ,rust-edit-0.1)
                       ("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-shell-words" ,rust-shell-words-1)
                       ("rust-tempfile" ,rust-tempfile-3.10.1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-uuid" ,rust-uuid-1))
       #:cargo-development-inputs (("rust-pretty-assertions" ,rust-pretty-assertions-1))))
    (home-page "https://github.com/trumank/uesave-rs")
    (synopsis "Unreal Engine save file (GVAS) reading/writing")
    (description
     "This package provides Unreal Engine save file (GVAS) reading/writing.")
    (license license:expat)))

(define-public tpt
  (package
    (name "tpt")
    (version "98.2.365")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/The-Powder-Toy/The-Powder-Toy")
              (commit "v98.2.365")))
        (file-name (git-file-name name version))
        (sha256 (base32 "06l39w3ggrzn8799dqll606by4f88kjr60r879w8j26csx1py76g"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config cmake))
    (inputs (list luajit curl fftwf zlib libpng sdl2 ((options->transformation `((with-patch . ,(string-append "bzip2=" (search-patch "laura/packages/patches/bzip2-pkg-config.patch"))))) bzip2) jsoncpp))
    (arguments (list #:tests? #f #:configure-flags #~(list "-Dworkaround_elusive_bzip2=false")))
    (home-page "https://powdertoy.co.uk")
    (synopsis "The Powder Toy")
    (description "Written in C++ and using SDL, The Powder Toy is a desktop version of the classic 'falling sand' physics sandbox, it simulates air pressure and velocity as well as heat. ")
    (license license:gpl3)))
