(define-module (laura packages dee)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages crates-apple)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-windows)
  #:use-module (gnu packages crates-crypto)
  #:use-module (gnu packages crates-tls)
  #:use-module (gnu packages crypto)
  #:use-module (laura packages gpu)
)

(define-public rust-tlock-0.0.3
  (package
    (name "rust-tlock")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tlock" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ska13bl8ywy0v3h9m7m49qb3523x8iks6jzhmfgj2w9xycs82ng"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-ark-bls12-381" ,rust-ark-bls12-381-0.4)
                       ("rust-ark-ec" ,rust-ark-ec-0.4)
                       ("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-with" ,rust-serde-with-2)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/thibmeu/tlock-rs")
    (synopsis "Rust encryption library for practical time-lock encryption")
    (description
     "This package provides Rust encryption library for practical time-lock encryption.")
    (license license:expat)))

(define-public rust-tlock-age-0.0.3
  (package
    (name "rust-tlock-age")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tlock_age" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wp0ca1wyzn6178l5kffb3z9583db0dclh42xl5f78py9cnfjkm8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-age" ,rust-age-0.9)
                       ("rust-age-core" ,rust-age-core-0.9)
                       ("rust-anyhow" ,rust-anyhow-1)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tlock" ,rust-tlock-0.0.3))))
    (home-page "https://github.com/thibmeu/tlock-rs")
    (synopsis "Rust encryption library for hybrid time-lock encryption")
    (description
     "This package provides Rust encryption library for hybrid time-lock encryption.")
    (license license:expat)))

(define-public rust-serde-with-macros-2
  (package
    (name "rust-serde-with-macros")
    (version "2.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_with_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pv9wy1aihsaklg83qac4q0ksimbxcwwk56lwla35l8p3f46y6w8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling" ,rust-darling-0.20)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/jonasbb/serde_with/")
    (synopsis "proc-macro library for serde_with")
    (description "This package provides proc-macro library for serde_with.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-with-2
  (package
    (name "rust-serde-with")
    (version "2.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_with" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gmgl2raxxnpvjgcvkrimgv55kbjywi5xbffc9rvb9s7q7973zq7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.13)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-doc-comment" ,rust-doc-comment-0.3)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-with-macros" ,rust-serde-with-macros-2)
                       ("rust-time" ,rust-time-0.3))))
    (home-page "https://github.com/jonasbb/serde_with/")
    (synopsis "Custom de/serialization functions for Rust's serde")
    (description
     "This package provides Custom de/serialization functions for Rust's serde.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tlock-0.0.5
  (package
    (name "rust-tlock")
    (version "0.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tlock" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0j6w4gwm3r2qxhvnn1li6mbgc0zv0ayfhd258h25gjfvb85rhdv3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-ark-bls12-381" ,rust-ark-bls12-381-0.4)
                       ("rust-ark-ec" ,rust-ark-ec-0.4)
                       ("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-with" ,rust-serde-with-2)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/thibmeu/tlock-rs")
    (synopsis "Rust encryption library for practical time-lock encryption")
    (description
     "This package provides Rust encryption library for practical time-lock encryption.")
    (license license:expat)))

(define-public rust-wsl-0.1
  (package
    (name "rust-wsl")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wsl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1m2hg4sfnrwm67fb1vsgycy36l2hbgmcpgllcpmbs427hsnbgnpq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/Dentosal/wsl-rs")
    (synopsis
     "Detect if the program is running under Windows Subsystem for Linux")
    (description
     "This package provides Detect if the program is running under Windows Subsystem for Linux.")
    (license license:expat)))

(define-public rust-pkcs1-0.4
  (package
    (name "rust-pkcs1")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pkcs1" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06gpasl1v2d2r74xa8vm72vqy6ryxjynwxna5s5cjk65vzdkpwzg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-der" ,rust-der-0.6)
                       ("rust-pkcs8" ,rust-pkcs8-0.9)
                       ("rust-spki" ,rust-spki-0.6)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/RustCrypto/formats/tree/master/pkcs1")
    (synopsis
     "Pure Rust implementation of Public-Key Cryptography Standards (PKCS) #1:
RSA Cryptography Specifications Version 2.2 (RFC 8017)")
    (description
     "This package provides Pure Rust implementation of Public-Key Cryptography Standards (PKCS) #1: RSA
Cryptography Specifications Version 2.2 (RFC 8017).")
    (license (list license:asl2.0 license:expat))))

(define-public rust-rsa-0.7
  (package
    (name "rust-rsa")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rsa" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1709a7gcb2h4r95qyrkdz8nz3jb8k4hafj5q3ibfzg0c8zam4h09"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-num-bigint-dig" ,rust-num-bigint-dig-0.8)
                       ("rust-num-integer" ,rust-num-integer-0.1)
                       ("rust-num-iter" ,rust-num-iter-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-pkcs1" ,rust-pkcs1-0.4)
                       ("rust-pkcs8" ,rust-pkcs8-0.9)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-signature" ,rust-signature-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/RustCrypto/RSA")
    (synopsis "Pure Rust RSA implementation")
    (description "This package provides Pure Rust RSA implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pinentry-0.5
  (package
    (name "rust-pinentry")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pinentry" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1j4grhhn4q3f4dycnkxr0lcvlv417ysnvs2fm0mmwsmyd2ybi9dz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-nom" ,rust-nom-7)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-secrecy" ,rust-secrecy-0.8)
                       ("rust-which" ,rust-which-4)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/str4d/pinentry-rs")
    (synopsis "API for interacting with pinentry binaries")
    (description
     "This package provides API for interacting with pinentry binaries.")
    (license (list license:expat license:asl2.0))))

(define-public rust-i18n-embed-fl-0.6
  (package
    (name "rust-i18n-embed-fl")
    (version "0.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "i18n-embed-fl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15akd3sdbkc3rl5mg3hb0v1p2x7hda70gi61gynglzbkd4skssnj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-dashmap" ,rust-dashmap-5)
                       ("rust-find-crate" ,rust-find-crate-0.6)
                       ("rust-fluent" ,rust-fluent-0.16)
                       ("rust-fluent-syntax" ,rust-fluent-syntax-0.11)
                       ("rust-i18n-config" ,rust-i18n-config-0.4)
                       ("rust-i18n-embed" ,rust-i18n-embed-0.13)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-proc-macro-error" ,rust-proc-macro-error-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-strsim" ,rust-strsim-0.10)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-unic-langid" ,rust-unic-langid-0.9))))
    (home-page "")
    (synopsis
     "Macro to perform compile time checks when using the i18n-embed crate and the fluent localization system")
    (description
     "This package provides Macro to perform compile time checks when using the i18n-embed crate and the
fluent localization system.")
    (license license:expat)))

(define-public rust-rust-embed-utils-7
  (package
    (name "rust-rust-embed-utils")
    (version "7.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-embed-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0x7dvlmzzx0db3ra73g8h0fsfgy3c1xrzkhg22vkpp3hymmzyf4x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-globset" ,rust-globset-0.4)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/pyros2097/rust-embed")
    (synopsis "Utilities for rust-embed")
    (description "This package provides Utilities for rust-embed.")
    (license license:expat)))

(define-public rust-rust-embed-impl-6
  (package
    (name "rust-rust-embed-impl")
    (version "6.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-embed-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b71mwb08nmwmzwhn15giiir1gii5aggp8j185l89hmjwn0lpfa9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-rust-embed-utils" ,rust-rust-embed-utils-7)
                       ("rust-shellexpand" ,rust-shellexpand-2)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/pyros2097/rust-embed")
    (synopsis
     "Rust Custom Derive Macro which loads files into the rust binary at compile time during release and loads the file from the fs during dev")
    (description
     "This package provides Rust Custom Derive Macro which loads files into the rust binary at compile time
during release and loads the file from the fs during dev.")
    (license license:expat)))

(define-public rust-rust-embed-6
  (package
    (name "rust-rust-embed")
    (version "6.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-embed" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0q96f3valahk4m4ir6c9vg45jhyalzn5iw90ijy4x33g4z1j8qm3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-actix-web" ,rust-actix-web-4)
                       ("rust-axum" ,rust-axum-0.6)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-include-flate" ,rust-include-flate-0.2)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-poem" ,rust-poem-1)
                       ("rust-rocket" ,rust-rocket-0.5)
                       ("rust-rust-embed-impl" ,rust-rust-embed-impl-6)
                       ("rust-rust-embed-utils" ,rust-rust-embed-utils-7)
                       ("rust-salvo" ,rust-salvo-0.16)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-walkdir" ,rust-walkdir-2)
                       ("rust-warp" ,rust-warp-0.3))))
    (home-page "https://github.com/pyros2097/rust-embed")
    (synopsis
     "Rust Custom Derive Macro which loads files into the rust binary at compile time during release and loads the file from the fs during dev")
    (description
     "This package provides Rust Custom Derive Macro which loads files into the rust binary at compile time
during release and loads the file from the fs during dev.")
    (license license:expat)))

(define-public rust-i18n-embed-0.13
  (package
    (name "rust-i18n-embed")
    (version "0.13.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "i18n-embed" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ym19zhzdw52kkp45ilbf6pwbfkhzvjrwi13czg34rm1lwk65a4j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arc-swap" ,rust-arc-swap-1)
                       ("rust-fluent" ,rust-fluent-0.16)
                       ("rust-fluent-langneg" ,rust-fluent-langneg-0.13)
                       ("rust-fluent-syntax" ,rust-fluent-syntax-0.11)
                       ("rust-gettext" ,rust-gettext-0.4)
                       ("rust-i18n-embed-impl" ,rust-i18n-embed-impl-0.8)
                       ("rust-intl-memoizer" ,rust-intl-memoizer-0.5)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-locale-config" ,rust-locale-config-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rust-embed" ,rust-rust-embed-6)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tr" ,rust-tr-0.1)
                       ("rust-unic-langid" ,rust-unic-langid-0.9)
                       ("rust-walkdir" ,rust-walkdir-2)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page
     "https://github.com/kellpossible/cargo-i18n/tree/master/i18n-embed")
    (synopsis
     "Traits and macros to conveniently embed localization assets into your application binary or library in order to localize it at runtime")
    (description
     "This package provides Traits and macros to conveniently embed localization assets into your
application binary or library in order to localize it at runtime.")
    (license license:expat)))

(define-public rust-bech32-0.9
  (package
    (name "rust-bech32")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bech32" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0igl565rfpxwbh0g36cb7469sjkiap8yd21kcr0ppi2jfbwr6syq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rust-bitcoin/rust-bech32")
    (synopsis
     "Encodes and decodes the Bech32 format and implements the bech32 and bech32m checksums")
    (description
     "This package provides Encodes and decodes the Bech32 format and implements the bech32 and bech32m
checksums.")
    (license license:expat)))

(define-public rust-bcrypt-pbkdf-0.9
  (package
    (name "rust-bcrypt-pbkdf")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bcrypt-pbkdf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ixjh641hjpsn1hxibd2dm6i36mad95a65hnagpfymngc3dsh1iq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-blowfish" ,rust-blowfish-0.9)
                       ("rust-pbkdf2" ,rust-pbkdf2-0.11)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page
     "https://github.com/RustCrypto/password-hashes/tree/master/bcrypt-pbkdf")
    (synopsis "bcrypt-pbkdf password-based key derivation function")
    (description
     "This package provides bcrypt-pbkdf password-based key derivation function.")
    (license (list license:expat license:asl2.0))))

(define-public rust-secrecy-0.8
  (package
    (name "rust-secrecy")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "secrecy" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07p9h2bpkkg61f1fzzdqqbf74kwv1gg095r1cdmjzzbcl17cblcv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/iqlusioninc/crates/")
    (synopsis
     "Wrapper types and traits for secret management which help ensure
they aren't accidentally copied, logged, or otherwise exposed
(as much as possible), and also ensure secrets are securely wiped
from memory when dropped.")
    (description
     "This package provides Wrapper types and traits for secret management which help ensure they aren't
accidentally copied, logged, or otherwise exposed (as much as possible), and
also ensure secrets are securely wiped from memory when dropped.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-io-tee-0.1
  (package
    (name "rust-io-tee")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "io_tee" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "013ka85akdcsj9rr92jrkm4jia9s8ihirpqi0ncqc6156kppqgsb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/TheOnlyMrCat/io_tee")
    (synopsis "Tee Read, BufRead, and Seek instances to a writer")
    (description
     "This package provides Tee Read, @code{BufRead}, and Seek instances to a writer.")
    (license (list license:expat license:asl2.0))))

(define-public rust-chacha20poly1305-0.10
  (package
    (name "rust-chacha20poly1305")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chacha20poly1305" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dfwq9ag7x7lnd0znafpcn8h7k4nfr9gkzm0w7sc1lcj451pkk8h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aead" ,rust-aead-0.5)
                       ("rust-chacha20" ,rust-chacha20-0.9)
                       ("rust-cipher" ,rust-cipher-0.4)
                       ("rust-poly1305" ,rust-poly1305-0.8)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page
     "https://github.com/RustCrypto/AEADs/tree/master/chacha20poly1305")
    (synopsis
     "Pure Rust implementation of the ChaCha20Poly1305 Authenticated Encryption
with Additional Data Cipher (RFC 8439) with optional architecture-specific
hardware acceleration. Also contains implementations of the XChaCha20Poly1305
extended nonce variant of ChaCha20Poly1305, and the reduced-round
ChaCha8Poly1305 and ChaCha12Poly1305 lightweight variants.")
    (description
     "This package provides Pure Rust implementation of the @code{ChaCha20Poly1305} Authenticated Encryption
with Additional Data Cipher (RFC 8439) with optional architecture-specific
hardware acceleration.  Also contains implementations of the
X@code{ChaCha20Poly1305} extended nonce variant of @code{ChaCha20Poly1305}, and
the reduced-round @code{ChaCha8Poly1305} and @code{ChaCha12Poly1305} lightweight
variants.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-age-core-0.9
  (package
    (name "rust-age-core")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "age-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0clgkfk6bnc5f9c75is5cckx3m3c3k921rrr24yc57c7mhayilp3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.13)
                       ("rust-chacha20poly1305" ,rust-chacha20poly1305-0.10)
                       ("rust-cookie-factory" ,rust-cookie-factory-0.3)
                       ("rust-hkdf" ,rust-hkdf-0.12)
                       ("rust-io-tee" ,rust-io-tee-0.1)
                       ("rust-nom" ,rust-nom-7)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-secrecy" ,rust-secrecy-0.8)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/str4d/rage")
    (synopsis "[BETA] Common functions used across the age crates")
    (description
     "This package provides [BETA] Common functions used across the age crates.")
    (license (list license:expat license:asl2.0))))

(define-public rust-age-0.9
  (package
    (name "rust-age")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "age" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wplvvvhyjl21qwrab6jcxj69ygkcm08h77x5xv942n82bcs8mbd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aes" ,rust-aes-0.8)
                       ("rust-aes-gcm" ,rust-aes-gcm-0.10)
                       ("rust-age-core" ,rust-age-core-0.9)
                       ("rust-atty" ,rust-atty-0.2)
                       ("rust-base64" ,rust-base64-0.13)
                       ("rust-bcrypt-pbkdf" ,rust-bcrypt-pbkdf-0.9)
                       ("rust-bech32" ,rust-bech32-0.9)
                       ("rust-cbc" ,rust-cbc-0.1)
                       ("rust-chacha20poly1305" ,rust-chacha20poly1305-0.10)
                       ("rust-cipher" ,rust-cipher-0.4)
                       ("rust-console" ,rust-console-0.15)
                       ("rust-cookie-factory" ,rust-cookie-factory-0.3)
                       ("rust-ctr" ,rust-ctr-0.9)
                       ("rust-curve25519-dalek" ,rust-curve25519-dalek-3)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-hkdf" ,rust-hkdf-0.12)
                       ("rust-hmac" ,rust-hmac-0.12)
                       ("rust-i18n-embed" ,rust-i18n-embed-0.13)
                       ("rust-i18n-embed-fl" ,rust-i18n-embed-fl-0.6)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-nom" ,rust-nom-7)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-pinentry" ,rust-pinentry-0.5)
                       ("rust-rand" ,rust-rand-0.7)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rpassword" ,rust-rpassword-6)
                       ("rust-rsa" ,rust-rsa-0.7)
                       ("rust-rust-embed" ,rust-rust-embed-6)
                       ("rust-scrypt" ,rust-scrypt-0.10)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-which" ,rust-which-4)
                       ("rust-wsl" ,rust-wsl-0.1)
                       ("rust-x25519-dalek" ,rust-x25519-dalek-1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/str4d/rage")
    (synopsis "[BETA] A simple, secure, and modern encryption library")
    (description
     "This package provides [BETA] A simple, secure, and modern encryption library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tlock-age-0.0.5
  (package
    (name "rust-tlock-age")
    (version "0.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tlock_age" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jfvz2y8a58pqpmxpdzp4fjamq6lxlsszkja7fs3rgf4q91xhbyk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-age" ,rust-age-0.9)
                       ("rust-age-core" ,rust-age-core-0.9)
                       ("rust-anyhow" ,rust-anyhow-1)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tlock" ,rust-tlock-0.0.5))))
    (home-page "https://github.com/thibmeu/tlock-rs")
    (synopsis "Rust encryption library for hybrid time-lock encryption")
    (description
     "This package provides Rust encryption library for hybrid time-lock encryption.")
    (license license:expat)))

(define-public rust-env-logger-0.10
  (package
    (name "rust-env-logger")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "env_logger" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1005v71kay9kbz1d5907l0y7vh9qn2fqsp2yfgb8bjvin6m0bm2c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-humantime" ,rust-humantime-2)
                       ("rust-is-terminal" ,rust-is-terminal-0.4)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-termcolor" ,rust-termcolor-1))))
    (home-page "https://github.com/rust-cli/env_logger")
    (synopsis
     "logging implementation for `log` which is configured via an environment
variable.")
    (description
     "This package provides a logging implementation for `log` which is configured via
an environment variable.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustls-0.22
  (package
    (name "rust-rustls")
    (version "0.22.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cl4q6w0x1cl5ldjsgbbiiqhkz6qg5vxl5dkn9wwsyxc44vzfkmz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aws-lc-rs" ,rust-aws-lc-rs-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-ring" ,rust-ring-0.17)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-rustls-webpki" ,rust-rustls-webpki-0.102)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/rustls/rustls")
    (synopsis "Rustls is a modern TLS library written in Rust")
    (description
     "This package provides Rustls is a modern TLS library written in Rust.")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-hoot-0.1
  (package
    (name "rust-hoot")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hoot" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mjfrn3yxhd2ll8kk5jhgasn8m2rbhb7va7s6dihin15afvf7spw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-httparse" ,rust-httparse-1)
                       ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/algesten/hoot")
    (synopsis "no_std, allocation free http 1.1 library")
    (description
     "This package provides no_std, allocation free http 1.1 library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-hootbin-0.1
  (package
    (name "rust-hootbin")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hootbin" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f616q6z7z97p1ylns8hdbikcpbazyad0370mfihkq8sj4brxkzb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fastrand" ,rust-fastrand-2)
                       ("rust-hoot" ,rust-hoot-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/algesten/hoot")
    (synopsis "hoot based library to emulate httpbin")
    (description
     "This package provides hoot based library to emulate httpbin.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cookie-store-0.21
  (package
    (name "rust-cookie-store")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cookie_store" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1akbrsgvb66zmbi5kzbanmh10mpqg8khv5anxyv4i4a1x2vycd29"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cookie" ,rust-cookie-0.18)
                       ("rust-idna" ,rust-idna-0.5)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-publicsuffix" ,rust-publicsuffix-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/pfernie/cookie_store")
    (synopsis "Implementation of Cookie storage and retrieval")
    (description
     "This package provides Implementation of Cookie storage and retrieval.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ureq-2
  (package
    (name "rust-ureq")
    (version "2.9.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ureq" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kcmac881h6f1v9l5wqphh8kr7kr234ff243l8wf8mhb7hg866ni"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.22)
                       ("rust-brotli-decompressor" ,rust-brotli-decompressor-2)
                       ("rust-cookie" ,rust-cookie-0.18)
                       ("rust-cookie-store" ,rust-cookie-store-0.21)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hootbin" ,rust-hootbin-0.1)
                       ("rust-http" ,rust-http-1)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustls" ,rust-rustls-0.22)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-rustls-webpki" ,rust-rustls-webpki-0.102)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-socks" ,rust-socks-0.3)
                       ("rust-url" ,rust-url-2)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26))))
    (home-page "https://github.com/algesten/ureq")
    (synopsis "Simple, safe HTTP client")
    (description "This package provides Simple, safe HTTP client.")
    (license (list license:expat license:asl2.0))))

(define-public rust-time-macros-0.2
  (package
    (name "rust-time-macros")
    (version "0.2.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "time-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kqwxvfh2jkpg38fy673d6danh1bhcmmbsmffww3mphgail2l99z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-num-conv" ,rust-num-conv-0.1)
                       ("rust-time-core" ,rust-time-core-0.1))))
    (home-page "https://github.com/time-rs/time")
    (synopsis
     "Procedural macros for the time crate.
    This crate is an implementation detail and should not be relied upon directly.")
    (description
     "This package provides Procedural macros for the time crate.  This crate is an implementation detail
and should not be relied upon directly.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-conv-0.1
  (package
    (name "rust-num-conv")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-conv" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ndiyg82q73783jq18isi71a7mjh56wxrk52rlvyx0mi5z9ibmai"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/jhpratt/num-conv")
    (synopsis
     "`num_conv` is a crate to convert between integer types without using `as` casts. This provides
better certainty when refactoring, makes the exact behavior of code more explicit, and allows using
turbofish syntax.")
    (description
     "This package provides `num_conv` is a crate to convert between integer types without using `as` casts.
 This provides better certainty when refactoring, makes the exact behavior of
code more explicit, and allows using turbofish syntax.")
    (license (list license:expat license:asl2.0))))

(define-public rust-time-0.3
  (package
    (name "rust-time")
    (version "0.3.36")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "time" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11g8hdpahgrf1wwl2rpsg5nxq3aj7ri6xr672v4qcij6cgjqizax"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-deranged" ,rust-deranged-0.3)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-num-conv" ,rust-num-conv-0.1)
                       ("rust-num-threads" ,rust-num-threads-0.1)
                       ("rust-powerfmt" ,rust-powerfmt-0.2)
                       ("rust-quickcheck" ,rust-quickcheck-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-time-core" ,rust-time-core-0.1)
                       ("rust-time-macros" ,rust-time-macros-0.2))))
    (home-page "https://time-rs.github.io")
    (synopsis
     "Date and time library. Fully interoperable with the standard library. Mostly compatible with #![no_std]")
    (description
     "This package provides Date and time library.  Fully interoperable with the standard library.  Mostly
compatible with #![no_std].")
    (license (list license:expat license:asl2.0))))

(define-public rust-thiserror-impl-1
  (package
    (name "rust-thiserror-impl")
    (version "1.0.61")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cvm37hp0kbcyk1xac1z0chpbd9pbn2g456iyid6sah0a113ihs6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/dtolnay/thiserror")
    (synopsis "Implementation detail of the `thiserror` crate")
    (description
     "This package provides Implementation detail of the `thiserror` crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-thiserror-1
  (package
    (name "rust-thiserror")
    (version "1.0.61")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "028prh962l16cmjivwb1g9xalbpqip0305zhq006mg74dc6whin5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-thiserror-impl" ,rust-thiserror-impl-1))))
    (home-page "https://github.com/dtolnay/thiserror")
    (synopsis "derive(Error)")
    (description "This package provides derive(Error).")
    (license (list license:expat license:asl2.0))))

(define-public rust-indexmap-2
  (package
    (name "rust-indexmap")
    (version "2.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "indexmap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09hgwi2ig0wyj5rjziia76zmhgfj95k0jb4ic3iiawm4vlavg3qn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-borsh" ,rust-borsh-1)
                       ("rust-equivalent" ,rust-equivalent-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-quickcheck" ,rust-quickcheck-1)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-rustc-rayon" ,rust-rustc-rayon-0.5)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/indexmap-rs/indexmap")
    (synopsis "hash table with consistent order and fast iteration.")
    (description
     "This package provides a hash table with consistent order and fast iteration.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-serde-json-1
  (package
    (name "rust-serde-json")
    (version "1.0.117")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_json" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hxziifjlc0kn1cci9d4crmjc7qwnfi20lxwyj9lzca2c7m84la5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-indexmap" ,rust-indexmap-2)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-ryu" ,rust-ryu-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/serde-rs/json")
    (synopsis "JSON serialization file format")
    (description "This package provides a JSON serialization file format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ring-0.17
  (package
    (name "rust-ring")
    (version "0.17.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ring" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03fwlb1ssrmfxdckvqv033pfmk01rhx9ynwi7r186dcfcp5s8zy1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-spin" ,rust-spin-0.9)
                       ("rust-untrusted" ,rust-untrusted-0.9)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/briansmith/ring")
    (synopsis "Safe, fast, small crypto using Rust")
    (description "This package provides Safe, fast, small crypto using Rust.")
    (license license:isc)))

(define-public rust-libc-0.2
  (package
    (name "rust-libc")
    (version "0.2.155")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z44c53z54znna8n322k5iwg80arxxpdzjj5260pxxzc9a58icwp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/rust-lang/libc")
    (synopsis "Raw FFI bindings to platform libraries like libc.")
    (description
     "This package provides Raw FFI bindings to platform libraries like libc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-getrandom-0.2
  (package
    (name "rust-getrandom")
    (version "0.2.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "getrandom" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mzlnrb3dgyd1fb84gvw10pyr8wdqdl4ry4sr64i1s8an66pqmn4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-wasi" ,rust-wasi-0.11)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://github.com/rust-random/getrandom")
    (synopsis
     "small cross-platform library for retrieving random data from system source")
    (description
     "This package provides a small cross-platform library for retrieving random data
from system source.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-poly-0.4
  (package
    (name "rust-ark-poly")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-poly" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gw6zrbl1rx1jwcnwwaq2p727fda66yaipxsrjcxi1g19v2by86k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-rayon" ,rust-rayon-1))))
    (home-page "https://arkworks.rs")
    (synopsis
     "library for efficient polynomial arithmetic via FFTs over finite fields")
    (description
     "This package provides a library for efficient polynomial arithmetic via FFTs
over finite fields.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-std-0.4
  (package
    (name "rust-ark-std")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-std" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11aigd20y0x9l3mw1bxsrgklzbscn86lrp78mmjbgskf1hg3z2cl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-colored" ,rust-colored-2)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rayon" ,rust-rayon-1))))
    (home-page "https://arkworks.rs")
    (synopsis "library for no_std compatibility")
    (description "This package provides a library for no_std compatibility.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-serialize-derive-0.4
  (package
    (name "rust-ark-serialize-derive")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-serialize-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sl2yrpk88v4lfgkblwgd2yqa89hw48jbd9jmx4ybmqgdny82cmf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://arkworks.rs")
    (synopsis
     "library for deriving serialization traits for the arkworks ecosystem")
    (description
     "This package provides a library for deriving serialization traits for the
arkworks ecosystem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-serialize-0.4
  (package
    (name "rust-ark-serialize")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-serialize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1992x2cd05pw3v5hfqnb8114g2cwdk3cmmcvz0i2ygdq09dbidxd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-serialize-derive" ,rust-ark-serialize-derive-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-num-bigint" ,rust-num-bigint-0.4))))
    (home-page "https://arkworks.rs")
    (synopsis "library for serializing types in the arkworks ecosystem")
    (description
     "This package provides a library for serializing types in the arkworks ecosystem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-ff-macros-0.4
  (package
    (name "rust-ark-ff-macros")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-ff-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ra5a4paqbqqlc9a3cnwkwxh7l1411wsnna1az28k218wjq7kgks"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://arkworks.rs")
    (synopsis
     "library for generating x86-64 assembly for finite field multiplication")
    (description
     "This package provides a library for generating x86-64 assembly for finite field
multiplication.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-ff-asm-0.4
  (package
    (name "rust-ark-ff-asm")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-ff-asm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0j13p6ymma3ypbjipfkc937pn57as8qpwgrpg5nvrl2mw97smm1y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://arkworks.rs")
    (synopsis
     "library for generating x86-64 assembly for finite field multiplication")
    (description
     "This package provides a library for generating x86-64 assembly for finite field
multiplication.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-ff-0.4
  (package
    (name "rust-ark-ff")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-ff" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fk6546nddgs3lsnv1s06fh8mnik5h1ijmck928d4jpla3w7m17c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-ff-asm" ,rust-ark-ff-asm-0.4)
                       ("rust-ark-ff-macros" ,rust-ark-ff-macros-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://arkworks.rs")
    (synopsis "library for finite fields")
    (description "This package provides a library for finite fields.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-ec-0.4
  (package
    (name "rust-ark-ec")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-ec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fkh0rswp4d5rn4hmmbibz2wh6x6k3sp21faijb29b2nkm1rmzfy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-poly" ,rust-ark-poly-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://arkworks.rs")
    (synopsis "library for elliptic curves and pairings")
    (description
     "This package provides a library for elliptic curves and pairings.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-bls12-381-0.4
  (package
    (name "rust-ark-bls12-381")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-bls12-381" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "127lmg29wz42jcvsb2ls8k3q21x5nrxm9syawjmagjv9478z0xf7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-ec" ,rust-ark-ec-0.4)
                       ("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4))))
    (home-page "https://arkworks.rs")
    (synopsis "The BLS12-381 pairing-friendly elliptic curve")
    (description
     "This package provides The BLS12-381 pairing-friendly elliptic curve.")
    (license (list license:expat license:asl2.0))))

(define-public rust-drand-core-0.0.16
  (package
    (name "rust-drand-core")
    (version "0.0.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "drand_core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v2r0av695a5vgysb3iwa712di9ymqhg57j58xs5zk9ivmsc8cxw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-bls12-381" ,rust-ark-bls12-381-0.4)
                       ("rust-ark-ec" ,rust-ark-ec-0.4)
                       ("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-ring" ,rust-ring-0.17)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-ureq" ,rust-ureq-2)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/thibmeu/drand-rs/tree/main/drand_core")
    (synopsis "drand client library.")
    (description "This package provides a drand client library.")
    (license license:expat)))

(define-public rust-confy-0.6
  (package
    (name "rust-confy")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "confy" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18795hfza7g0jwbvldl5rammmk3jdaxq5b6w9b1pvw3h130g9ca5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-directories" ,rust-directories-5)
                       ("rust-ron" ,rust-ron-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-yaml" ,rust-serde-yaml-0.9)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-toml" ,rust-toml-0.8))))
    (home-page "https://github.com/rust-cli/confy")
    (synopsis "Boilerplate-free configuration management")
    (description
     "This package provides Boilerplate-free configuration management.")
    (license (list license:expat license:x11 license:asl2.0))))

(define-public rust-clap-mangen-0.2
  (package
    (name "rust-clap-mangen")
    (version "0.2.21")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_mangen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dy95g3b1dyry4yph0zgyj0nvgj9lxrynl6wj3af3h307v0hzdvl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-4)
                       ("rust-roff" ,rust-roff-0.2))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis "manpage generator for clap")
    (description "This package provides a manpage generator for clap.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-complete-4
  (package
    (name "rust-clap-complete")
    (version "4.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_complete" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1i1rxp3picwmzz3h7kals6rrlc28lsykawx8m5jzr2pl7ahhy0nj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-4)
                       ("rust-clap-lex" ,rust-clap-lex-0.7)
                       ("rust-is-executable" ,rust-is-executable-1)
                       ("rust-pathdiff" ,rust-pathdiff-0.2)
                       ("rust-shlex" ,rust-shlex-1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis "Generate shell completion scripts for your clap::Command")
    (description
     "This package provides Generate shell completion scripts for your clap::Command.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-verbosity-flag-2
  (package
    (name "rust-clap-verbosity-flag")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap-verbosity-flag" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y54kb14nr2vddl5j5h1s4217hbnxfxh7ln8j7lw5r2qvp0216xv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-4)
                       ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/clap-rs/clap-verbosity-flag")
    (synopsis "Easily add a `--verbose` flag to CLIs using Clap")
    (description
     "This package provides Easily add a `--verbose` flag to CLIs using Clap.")
    (license (list license:expat license:asl2.0))))

(define-public rust-heck-0.5
  (package
    (name "rust-heck")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "heck" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/withoutboats/heck")
    (synopsis "heck is a case conversion library")
    (description "This package provides heck is a case conversion library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-derive-4
  (package
    (name "rust-clap-derive")
    (version "4.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ih6pwg3h74gjjjjyc7csgqi7lffd0g0i8d7p8lndcjgrw62k067"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.5)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis "Parse command line argument by defining a struct, derive crate")
    (description
     "This package provides Parse command line argument by defining a struct, derive crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-strsim-0.11
  (package
    (name "rust-strsim")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strsim" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rapidfuzz/strsim-rs")
    (synopsis
     "Implementations of string similarity metrics. Includes Hamming, Levenshtein,
OSA, Damerau-Levenshtein, Jaro, Jaro-Winkler, and SÃ¸rensen-Dice.")
    (description
     "This package provides Implementations of string similarity metrics.  Includes Hamming, Levenshtein,
OSA, Damerau-Levenshtein, Jaro, Jaro-Winkler, and SÃ¸rensen-Dice.")
    (license license:expat)))

(define-public rust-clap-lex-0.7
  (package
    (name "rust-clap-lex")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_lex" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w0fci2zp1bi2kqjnp14vdxsa0r34yjd35i845c8bmfvmc5wz0jb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis "Minimal, flexible command line parser")
    (description
     "This package provides Minimal, flexible command line parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-builder-4
  (package
    (name "rust-clap-builder")
    (version "4.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_builder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pr40iidin6hpikh8f2d7n3zi299m7qgkswhd2igmxl4ihvqflrf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anstream" ,rust-anstream-0.6)
                       ("rust-anstyle" ,rust-anstyle-1)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-clap-lex" ,rust-clap-lex-0.7)
                       ("rust-strsim" ,rust-strsim-0.11)
                       ("rust-terminal-size" ,rust-terminal-size-0.3)
                       ("rust-unicase" ,rust-unicase-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-4
  (package
    (name "rust-clap")
    (version "4.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1iwli4v6m3hpdii240g73lim5yslbmxspb2apkjhs5lknllrls59"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap-builder" ,rust-clap-builder-4)
                       ("rust-clap-derive" ,rust-clap-derive-4))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-anyhow-1
  (package
    (name "rust-anyhow")
    (version "1.0.86")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anyhow" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nk301x8qhpdaks6a9zvcp7yakjqnczjmqndbg7vk4494d3d1ldk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3))))
    (home-page "https://github.com/dtolnay/anyhow")
    (synopsis "Flexible concrete Error type built on std::error::Error")
    (description
     "This package provides Flexible concrete Error type built on std::error::Error.")
    (license (list license:expat license:asl2.0))))

(define-public drand-rs
  (package
    (name "drand-rs")
    (version "0.0.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dee" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05bar6jgic8idsf6rs6w0fxx0c8dzll7nbz99nj4921d4psf579r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-clap-verbosity-flag" ,rust-clap-verbosity-flag-2)
                       ("rust-clap-verbosity-flag" ,rust-clap-verbosity-flag-2)
                       ("rust-clap-complete" ,rust-clap-complete-4)
                       ("rust-clap-mangen" ,rust-clap-mangen-0.2)
                       ("rust-colored" ,rust-colored-2)
                       ("rust-confy" ,rust-confy-0.6)
                       ("rust-drand-core" ,rust-drand-core-0.0.16)
                       ("rust-env-logger" ,rust-env-logger-0.10)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-tlock-age" ,rust-tlock-age-0.0.5)
                       ("rust-tlock-age" ,rust-tlock-age-0.0.3))))
    (home-page "https://github.com/thibmeu/drand-rs")
    (synopsis "An cli for drand, with support for timelock encryption")
    (description
     "This package provides An cli for drand, with support for timelock encryption.")
    (license license:expat)))
