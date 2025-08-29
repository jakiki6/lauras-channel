(define-module (laura packages rust-common)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (past-crates packages crates-io)
  #:use-module (gnu packages crypto))

(define-public rust-accesskit-0.12
  (package
    (name "rust-accesskit")
    (version "0.12.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "accesskit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0szw1d6ml049779m55h0l107abhsmchmdx58rdfjbhcr7m7v393l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-enumn" ,rust-enumn-0.1)
                       ("rust-pyo3" ,rust-pyo3-0.20)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/AccessKit/accesskit")
    (synopsis "UI accessibility infrastructure across platforms")
    (description
     "This package provides UI accessibility infrastructure across platforms.")
    (license (list license:expat license:asl2.0))))

(define-public rust-accesskit-consumer-0.16
  (package
    (name "rust-accesskit-consumer")
    (version "0.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "accesskit_consumer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rj5vsaxn9m5aazr22vzlb5bxfbl28h2mck7hqldgyq97jjwq5wc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-accesskit" ,rust-accesskit-0.12))))
    (home-page "https://github.com/AccessKit/accesskit")
    (synopsis "AccessKit consumer library (internal)")
    (description
     "This package provides @code{AccessKit} consumer library (internal).")
    (license (list license:expat license:asl2.0))))

(define-public rust-accesskit-macos-0.10
  (package
    (name "rust-accesskit-macos")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "accesskit_macos" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19vpwi1cnyxbjal4ngjb2x7yhfm9x3yd63w41v8wxyxvxbhnlfyd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-accesskit" ,rust-accesskit-0.12)
                       ("rust-accesskit-consumer" ,rust-accesskit-consumer-0.16)
                       ("rust-objc2" ,rust-objc2-0.3)
                       ("rust-once-cell" ,rust-once-cell-1))))
    (home-page "https://github.com/AccessKit/accesskit")
    (synopsis "AccessKit UI accessibility infrastructure: macOS adapter")
    (description
     "This package provides @code{AccessKit} UI accessibility infrastructure: @code{macOS} adapter.")
    (license (list license:expat license:asl2.0))))

(define-public rust-accesskit-unix-0.6
  (package
    (name "rust-accesskit-unix")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "accesskit_unix" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "022a77nm8461v0f6mpzidamkci0h1kmkxl9x2bbim9lvv4c6rx09"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-accesskit" ,rust-accesskit-0.12)
                       ("rust-accesskit-consumer" ,rust-accesskit-consumer-0.16)
                       ("rust-async-channel" ,rust-async-channel-2)
                       ("rust-async-once-cell" ,rust-async-once-cell-0.5)
                       ("rust-atspi" ,rust-atspi-0.19)
                       ("rust-futures-lite" ,rust-futures-lite-1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-zbus" ,rust-zbus-3))))
    (home-page "https://github.com/AccessKit/accesskit")
    (synopsis "AccessKit UI accessibility infrastructure: Linux adapter")
    (description
     "This package provides @code{AccessKit} UI accessibility infrastructure: Linux adapter.")
    (license (list license:expat license:asl2.0))))

(define-public rust-accesskit-windows-0.15
  (package
    (name "rust-accesskit-windows")
    (version "0.15.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "accesskit_windows" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02sazww6l5h0wsgif0npdpkb5lczx0xph65kn31wfkwpq1zf5jmg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-accesskit" ,rust-accesskit-0.12)
                       ("rust-accesskit-consumer" ,rust-accesskit-consumer-0.16)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-static-assertions" ,rust-static-assertions-1)
                       ("rust-windows" ,rust-windows-0.48))))
    (home-page "https://github.com/AccessKit/accesskit")
    (synopsis "AccessKit UI accessibility infrastructure: Windows adapter")
    (description
     "This package provides @code{AccessKit} UI accessibility infrastructure: Windows adapter.")
    (license (list license:expat license:asl2.0))))

(define-public rust-accesskit-winit-0.16
  (package
    (name "rust-accesskit-winit")
    (version "0.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "accesskit_winit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rwaz6mkllcl131b8y4s787gfmdrqzms0a242r8f3n8pra52312j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-accesskit" ,rust-accesskit-0.12)
                       ("rust-accesskit-macos" ,rust-accesskit-macos-0.10)
                       ("rust-accesskit-unix" ,rust-accesskit-unix-0.6)
                       ("rust-accesskit-windows" ,rust-accesskit-windows-0.15)
                       ("rust-winit" ,rust-winit-0.29))))
    (home-page "https://github.com/AccessKit/accesskit")
    (synopsis "AccessKit UI accessibility infrastructure: winit adapter")
    (description
     "This package provides @code{AccessKit} UI accessibility infrastructure: winit adapter.")
    (license license:asl2.0)))

(define-public rust-actix-codec-0.5
  (package
    (name "rust-actix-codec")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "actix-codec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12m2jxysk2xpxi193340zv4w215cv9fyyna7rxvzh6wck0hhlysz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-sink" ,rust-futures-sink-0.3)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/actix/actix-net")
    (synopsis "Codec utilities for working with framed protocols")
    (description
     "This package provides Codec utilities for working with framed protocols.")
    (license (list license:expat license:asl2.0))))

(define-public rust-actix-http-3
  (package
    (name "rust-actix-http")
    (version "3.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "actix-http" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vakwaakzsqk1wn74w0qs0ljd4qvn2xii96r6xn6jxf7hhyq9faf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-actix-codec" ,rust-actix-codec-0.5)
                       ("rust-actix-rt" ,rust-actix-rt-2)
                       ("rust-actix-service" ,rust-actix-service-2)
                       ("rust-actix-tls" ,rust-actix-tls-3)
                       ("rust-actix-utils" ,rust-actix-utils-3)
                       ("rust-ahash" ,rust-ahash-0.8)
                       ("rust-base64" ,rust-base64-0.22.1)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-brotli" ,rust-brotli-6)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-bytestring" ,rust-bytestring-1)
                       ("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-h2" ,rust-h2-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-httparse" ,rust-httparse-1)
                       ("rust-httpdate" ,rust-httpdate-1)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-language-tags" ,rust-language-tags-0.3)
                       ("rust-local-channel" ,rust-local-channel-0.1)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-zstd" ,rust-zstd-0.13))))
    (home-page "https://actix.rs")
    (synopsis "HTTP types and services for the Actix ecosystem")
    (description
     "This package provides HTTP types and services for the Actix ecosystem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-actix-router-0.5
  (package
    (name "rust-actix-router")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "actix-router" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1y1n086zgfgf6483vlm18651n5ga6rcvlwvynmkkixji9hb29lqk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytestring" ,rust-bytestring-0.1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-regex-lite" ,rust-regex-lite-0.1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/actix/actix-web")
    (synopsis "Resource path matching and router")
    (description "This package provides Resource path matching and router.")
    (license (list license:expat license:asl2.0))))

(define-public rust-actix-server-2
  (package
    (name "rust-actix-server")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "actix-server" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1m62qbg7vl1wddr6mm8sd4rnvd3w5v3zcn8fmdpfl8q4xxz3xc9y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-actix-rt" ,rust-actix-rt-2)
                       ("rust-actix-service" ,rust-actix-service-2)
                       ("rust-actix-utils" ,rust-actix-utils-3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-mio" ,rust-mio-0.8)
                       ("rust-socket2" ,rust-socket2-0.5)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-uring" ,rust-tokio-uring-0.4)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://actix.rs")
    (synopsis "General purpose TCP server built for the Actix ecosystem")
    (description
     "This package provides General purpose TCP server built for the Actix ecosystem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-actix-service-2
  (package
    (name "rust-actix-service")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "actix-service" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fipjcc5kma7j47jfrw55qm09dakgvx617jbriydrkqqz10lk29v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2))))
    (home-page "https://github.com/actix/actix-net")
    (synopsis
     "Service trait and combinators for representing asynchronous request/response operations")
    (description
     "This package provides Service trait and combinators for representing asynchronous request/response
operations.")
    (license (list license:expat license:asl2.0))))

(define-public rust-actix-tls-3
  (package
    (name "rust-actix-tls")
    (version "3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "actix-tls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12ck682vls5py9hp4rsal7mv8iy770bzwd13pk6vxkb6v2c3hidc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-actix-rt" ,rust-actix-rt-2)
                       ("rust-actix-service" ,rust-actix-service-2)
                       ("rust-actix-utils" ,rust-actix-utils-3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-impl-more" ,rust-impl-more-0.1)
                       ("rust-openssl" ,rust-openssl-0.10)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-rustls" ,rust-rustls-0.21)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.6)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-rustls-webpki" ,rust-rustls-webpki-0.101)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
                       ("rust-tokio-openssl" ,rust-tokio-openssl-0.6)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.25)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.26)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.24)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.23)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.25)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.22))))
    (home-page "https://github.com/actix/actix-net.git")
    (synopsis "TLS acceptor and connector services for Actix ecosystem")
    (description
     "This package provides TLS acceptor and connector services for Actix ecosystem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-actix-utils-3
  (package
    (name "rust-actix-utils")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "actix-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n05nzwdkx6jhmzr6f9qsh57a8hqlwv5rjz1i0j3qvj6y7gxr8c8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-local-waker" ,rust-local-waker-0.1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2))))
    (home-page "https://github.com/actix/actix-net")
    (synopsis "Various utilities used in the Actix ecosystem")
    (description
     "This package provides Various utilities used in the Actix ecosystem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-actix-web-4
  (package
    (name "rust-actix-web")
    (version "4.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "actix-web" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cma36gdx3l802c3nfpkskaqjfqr4kd2v7i9b9gckmqrvgd6gkxi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-actix-codec" ,rust-actix-codec-0.5)
                       ("rust-actix-http" ,rust-actix-http-3)
                       ("rust-actix-macros" ,rust-actix-macros-0.2)
                       ("rust-actix-router" ,rust-actix-router-0.5)
                       ("rust-actix-rt" ,rust-actix-rt-2)
                       ("rust-actix-server" ,rust-actix-server-2)
                       ("rust-actix-service" ,rust-actix-service-2)
                       ("rust-actix-tls" ,rust-actix-tls-3)
                       ("rust-actix-utils" ,rust-actix-utils-3)
                       ("rust-actix-web-codegen" ,rust-actix-web-codegen-4)
                       ("rust-ahash" ,rust-ahash-0.8)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-bytestring" ,rust-bytestring-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cookie" ,rust-cookie-0.16)
                       ("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-language-tags" ,rust-language-tags-0.3)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-regex-lite" ,rust-regex-lite-0.1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-socket2" ,rust-socket2-0.5)
                       ("rust-time" ,rust-time-0.3.36)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://actix.rs")
    (synopsis
     "Actix Web is a powerful, pragmatic, and extremely fast web framework for Rust")
    (description
     "This package provides Actix Web is a powerful, pragmatic, and extremely fast web framework for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-actix-web-codegen-4
  (package
    (name "rust-actix-web-codegen")
    (version "4.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "actix-web-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xalrv1s7imzfgxyql6zii5bpxxkk11rlcc8n4ia3v1hpgmm07zb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-actix-router" ,rust-actix-router-0.5)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://actix.rs")
    (synopsis "Routing and runtime macros for Actix Web")
    (description
     "This package provides Routing and runtime macros for Actix Web.")
    (license (list license:expat license:asl2.0))))

(define-public rust-addr2line-0.24
  (package
    (name "rust-addr2line")
    (version "0.24.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "addr2line" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hd1i57zxgz08j6h5qrhsnm2fi0bcqvsh389fw400xm3arz2ggnz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-4.5.20)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
                       ("rust-gimli" ,rust-gimli-0.31)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-object" ,rust-object-0.36)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-typed-arena" ,rust-typed-arena-2))))
    (home-page "https://github.com/gimli-rs/addr2line")
    (synopsis
     "cross-platform symbolication library written in Rust, using `gimli`")
    (description
     "This package provides a cross-platform symbolication library written in Rust,
using `gimli`.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-addr2line-0.22
  (package
    (name "rust-addr2line")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "addr2line" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y66f1sa27i9kvmlh76ynk60rxfrmkba9ja8x527h32wdb206ibf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
                       ("rust-gimli" ,rust-gimli-0.29)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-object" ,rust-object-0.35)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/gimli-rs/addr2line")
    (synopsis
     "cross-platform symbolication library written in Rust, using `gimli`")
    (description
     "This package provides a cross-platform symbolication library written in Rust,
using `gimli`.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-adler2-2
  (package
    (name "rust-adler2")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "adler2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09r6drylvgy8vv8k20lnbvwq8gp09h7smfn6h1rxsy15pgh629si"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/oyvindln/adler2")
    (synopsis "simple clean-room implementation of the Adler-32 checksum")
    (description
     "This package provides a simple clean-room implementation of the Adler-32
checksum.")
    (license (list license:bsd-0 license:expat license:asl2.0))))

(define-public rust-aes-gcm-0.9
  (package
    (name "rust-aes-gcm")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aes-gcm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xndncn1phjb7pjam63vl0yp7h8jh95m0yxanr1092vx7al8apyz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aead" ,rust-aead-0.4)
                       ("rust-aes" ,rust-aes-0.7)
                       ("rust-cipher" ,rust-cipher-0.3)
                       ("rust-ctr" ,rust-ctr-0.8)
                       ("rust-ghash" ,rust-ghash-0.4)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/RustCrypto/AEADs")
    (synopsis "Pure Rust implementation of the AES-GCM (Galois/Counter Mode)
Authenticated Encryption with Associated Data (AEAD) Cipher
with optional architecture-specific hardware acceleration")
    (description
     "This package provides Pure Rust implementation of the AES-GCM (Galois/Counter Mode) Authenticated
Encryption with Associated Data (AEAD) Cipher with optional
architecture-specific hardware acceleration.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-afl-0.15
  (package
    (name "rust-afl")
    (version "0.15.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "afl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xpcyykmz7mllv89rdj7pli1f75dx5a56frlc7zwb2bijjv107n2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-home" ,rust-home-0.5)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-xdg" ,rust-xdg-2))))
    (home-page "https://github.com/rust-fuzz/afl.rs")
    (synopsis "Fuzzing Rust code with american-fuzzy-lop")
    (description
     "This package provides Fuzzing Rust code with american-fuzzy-lop.")
    (license license:asl2.0)))

(define-public rust-age-0.10
  (package
    (name "rust-age")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "age" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zc1m1lm64bx17bvviy5c1p77vjas395b0bsglnml6crn7bzgvpd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aes" ,rust-aes-0.8)
                       ("rust-aes-gcm" ,rust-aes-gcm-0.10)
                       ("rust-age-core" ,rust-age-core-0.10)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bcrypt-pbkdf" ,rust-bcrypt-pbkdf-0.10)
                       ("rust-bech32" ,rust-bech32-0.9)
                       ("rust-cbc" ,rust-cbc-0.1)
                       ("rust-chacha20poly1305" ,rust-chacha20poly1305-0.10)
                       ("rust-cipher" ,rust-cipher-0.4)
                       ("rust-console" ,rust-console-0.15)
                       ("rust-cookie-factory" ,rust-cookie-factory-0.3)
                       ("rust-ctr" ,rust-ctr-0.9)
                       ("rust-curve25519-dalek" ,rust-curve25519-dalek-4)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-hmac" ,rust-hmac-0.12)
                       ("rust-i18n-embed" ,rust-i18n-embed-0.14)
                       ("rust-i18n-embed-fl" ,rust-i18n-embed-fl-0.7)
                       ("rust-is-terminal" ,rust-is-terminal-0.4)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-nom" ,rust-nom-7)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-pinentry" ,rust-pinentry-0.5)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rpassword" ,rust-rpassword-7)
                       ("rust-rsa" ,rust-rsa-0.9)
                       ("rust-rust-embed" ,rust-rust-embed-8)
                       ("rust-scrypt" ,rust-scrypt-0.11)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-which" ,rust-which-4)
                       ("rust-wsl" ,rust-wsl-0.1)
                       ("rust-x25519-dalek" ,rust-x25519-dalek-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/str4d/rage")
    (synopsis "[BETA] A simple, secure, and modern encryption library")
    (description
     "This package provides [BETA] A simple, secure, and modern encryption library.")
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

(define-public rust-age-core-0.10
  (package
    (name "rust-age-core")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "age-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16shzvisygwknnz4bfs60yfsakwjn4v0rhyvbq9xvg9bpjciiwd5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.21)
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
                       ("rust-tempfile" ,rust-tempfile-3.10.1))))
    (home-page "https://github.com/str4d/rage")
    (synopsis "[BETA] Common functions used across the age crates")
    (description
     "This package provides [BETA] Common functions used across the age crates.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ahash-0.8
  (package
    (name "rust-ahash")
    (version "0.8.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ahash" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04chdfkls5xmhp1d48gnjsmglbqibizs3bpbj6rsj604m10si7g8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atomic-polyfill" ,rust-atomic-polyfill-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-const-random" ,rust-const-random-0.1)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-version-check" ,rust-version-check-0.9)
                       ("rust-zerocopy" ,rust-zerocopy-0.7))))
    (home-page "https://github.com/tkaitchuck/ahash")
    (synopsis
     "non-cryptographic hash function using AES-NI for high performance")
    (description
     "This package provides a non-cryptographic hash function using AES-NI for high
performance.")
    (license (list license:expat license:asl2.0))))

(define-public rust-allsorts-0.14
  (package
    (name "rust-allsorts")
    (version "0.14.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "allsorts" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0syijn4wasmib28rcy5ln08jikgngwjcw43vdrqv1s67vgmpvdmg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-bitreader" ,rust-bitreader-0.3)
                       ("rust-brotli-decompressor" ,rust-brotli-decompressor-2)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-glyph-names" ,rust-glyph-names-0.2)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-ouroboros" ,rust-ouroboros-0.17)
                       ("rust-pathfinder-geometry" ,rust-pathfinder-geometry-0.5)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-tinyvec" ,rust-tinyvec-1)
                       ("rust-ucd-trie" ,rust-ucd-trie-0.1)
                       ("rust-unicode-canonical-combining-class" ,rust-unicode-canonical-combining-class-0.5)
                       ("rust-unicode-general-category" ,rust-unicode-general-category-0.6)
                       ("rust-unicode-joining-type" ,rust-unicode-joining-type-0.7))))
    (home-page "https://github.com/yeslogic/allsorts")
    (synopsis
     "Font parser, shaping engine, and subsetter for OpenType, WOFF, and WOFF2")
    (description
     "This package provides Font parser, shaping engine, and subsetter for @code{OpenType}, WOFF, and WOFF2.")
    (license license:asl2.0)))

(define-public rust-ambient-authority-0.0.2
  (package
    (name "rust-ambient-authority")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ambient-authority" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fxsfyhy64jx7zrkb85h1vhr5nfqncja3pwpikid471d8w6yxm79"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/sunfishcode/ambient-authority")
    (synopsis "Ambient Authority")
    (description "This package provides Ambient Authority.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-amdgpu-top-gui-0.8
  (package
    (name "rust-amdgpu-top-gui")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "amdgpu_top_gui" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13y84557k2fddbvc0x6j8rxzcr2d5l1sgjr2md3srxk3kpx1fy1n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-eframe" ,rust-eframe-0.27)
                       ("rust-egui-plot" ,rust-egui-plot-0.27)
                       ("rust-i18n-embed" ,rust-i18n-embed-0.14)
                       ("rust-i18n-embed-fl" ,rust-i18n-embed-fl-0.7)
                       ("rust-libamdgpu-top" ,rust-libamdgpu-top-0.8)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rust-embed" ,rust-rust-embed-8))))
    (home-page "https://github.com/Umio-Yasuno/amdgpu_top")
    (synopsis "GUI Library for amdgpu_top")
    (description "This package provides GUI Library for amdgpu_top.")
    (license (list license:expat license:silofl1.1))))

(define-public rust-amdgpu-top-json-0.8
  (package
    (name "rust-amdgpu-top-json")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "amdgpu_top_json" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0264hwp19h224ph7kwg2nljmyl2bblrvxm7c0bpf4zd9lpqkmkrq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libamdgpu-top" ,rust-libamdgpu-top-0.8)
                       ("rust-serde-json" ,rust-serde-json-1.0.117))))
    (home-page "https://github.com/Umio-Yasuno/amdgpu_top")
    (synopsis "Library for JSON output function of amdgpu_top")
    (description
     "This package provides Library for JSON output function of amdgpu_top.")
    (license license:expat)))

(define-public rust-amdgpu-top-tui-0.8
  (package
    (name "rust-amdgpu-top-tui")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "amdgpu_top_tui" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jh11d2b93qg2s4kbrc1b0hmf5pj3xd0f08inbz38wj2hknpndc3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cursive" ,rust-cursive-0.20)
                       ("rust-libamdgpu-top" ,rust-libamdgpu-top-0.8))))
    (home-page "https://github.com/Umio-Yasuno/amdgpu_top")
    (synopsis "TUI library for amdgpu_top")
    (description "This package provides TUI library for amdgpu_top.")
    (license license:expat)))

(define-public rust-anstyle-1
  (package
    (name "rust-anstyle")
    (version "1.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anstyle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mlc5jmbrgikk700m1sjwgil019rm4mhkq5gzks5y0vcn59dwrc3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rust-cli/anstyle")
    (synopsis "ANSI text styling")
    (description "This package provides ANSI text styling.")
    (license (list license:expat license:asl2.0))))

(define-public rust-anyhow-1.0.86
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

(define-public rust-arboard-3.4
  (package
    (name "rust-arboard")
    (version "3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arboard" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12bzkkfgb8dy2hizf8928hs1sai4yhqbrg55a0a8zzz86fah1d4z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clipboard-win" ,rust-clipboard-win-5)
                       ("rust-core-graphics" ,rust-core-graphics-0.23)
                       ("rust-image" ,rust-image-0.25)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-objc2" ,rust-objc2-0.5)
                       ("rust-objc2-app-kit" ,rust-objc2-app-kit-0.2)
                       ("rust-objc2-foundation" ,rust-objc2-foundation-0.2)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-windows-sys" ,rust-windows-sys-0.48)
                       ("rust-wl-clipboard-rs" ,rust-wl-clipboard-rs-0.8)
                       ("rust-x11rb" ,rust-x11rb-0.13))))
    (home-page "https://github.com/1Password/arboard")
    (synopsis "Image and text handling for the OS clipboard")
    (description
     "This package provides Image and text handling for the OS clipboard.")
    (license (list license:expat license:asl2.0))))

(define-public rust-arf-strings-0.7
  (package
    (name "rust-arf-strings")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arf-strings" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ncy11j7bk0ji94yb8nafyr5wvfg90q6vcbzcanpdbgyk4cy9szx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustix" ,rust-rustix-0.38.34))))
    (home-page "https://github.com/bytecodealliance/arf-strings")
    (synopsis "Encoding and decoding for ARF strings")
    (description
     "This package provides Encoding and decoding for ARF strings.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

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

(define-public rust-arrow-50
  (package
    (name "rust-arrow")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1377lks8shrrq3klps6h1q0gd73qwd0wbgc5k7a2kn54zd1m6a5a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrow-arith" ,rust-arrow-arith-50)
                       ("rust-arrow-array" ,rust-arrow-array-50)
                       ("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-cast" ,rust-arrow-cast-50)
                       ("rust-arrow-csv" ,rust-arrow-csv-50)
                       ("rust-arrow-data" ,rust-arrow-data-50)
                       ("rust-arrow-ipc" ,rust-arrow-ipc-50)
                       ("rust-arrow-json" ,rust-arrow-json-50)
                       ("rust-arrow-ord" ,rust-arrow-ord-50)
                       ("rust-arrow-row" ,rust-arrow-row-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-arrow-select" ,rust-arrow-select-50)
                       ("rust-arrow-string" ,rust-arrow-string-50)
                       ("rust-pyo3" ,rust-pyo3-0.20)
                       ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Rust implementation of Apache Arrow")
    (description "This package provides Rust implementation of Apache Arrow.")
    (license license:asl2.0)))

(define-public rust-arrow-arith-50
  (package
    (name "rust-arrow-arith")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-arith" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01aplk8ppkk3bc5i92qlyk2mj5kxdxaklqn6wynvrhcha85bsfkm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrow-array" ,rust-arrow-array-50)
                       ("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-data" ,rust-arrow-data-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-half" ,rust-half-2)
                       ("rust-num" ,rust-num-0.4))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Arrow arithmetic kernels")
    (description "This package provides Arrow arithmetic kernels.")
    (license license:asl2.0)))

(define-public rust-arrow-array-50
  (package
    (name "rust-arrow-array")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-array" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02cnfz4n865n74cii7h6svhf5wdfbc11l254jz4qxdr1gzmzx46k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-data" ,rust-arrow-data-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-chrono-tz" ,rust-chrono-tz-0.8)
                       ("rust-half" ,rust-half-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-num" ,rust-num-0.4))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Array abstractions for Apache Arrow")
    (description "This package provides Array abstractions for Apache Arrow.")
    (license license:asl2.0)))

(define-public rust-arrow-buffer-50
  (package
    (name "rust-arrow-buffer")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-buffer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "192s1xlvzfrfjw65has71clxa9y8hmzbqmi7qvxxzg012w35nqb9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-half" ,rust-half-2)
                       ("rust-num" ,rust-num-0.4))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Buffer abstractions for Apache Arrow")
    (description "This package provides Buffer abstractions for Apache Arrow.")
    (license license:asl2.0)))

(define-public rust-arrow-cast-50
  (package
    (name "rust-arrow-cast")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-cast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vydyjyg964kdw3bfdbkqyndqplgf0qnbwm1fidvy4s15zfyaj74"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrow-array" ,rust-arrow-array-50)
                       ("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-data" ,rust-arrow-data-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-arrow-select" ,rust-arrow-select-50)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-comfy-table" ,rust-comfy-table-7)
                       ("rust-half" ,rust-half-2)
                       ("rust-lexical-core" ,rust-lexical-core-0.8)
                       ("rust-num" ,rust-num-0.4))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Cast kernel and utilities for Apache Arrow")
    (description
     "This package provides Cast kernel and utilities for Apache Arrow.")
    (license license:asl2.0)))

(define-public rust-arrow-csv-50
  (package
    (name "rust-arrow-csv")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-csv" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "109pk0la2z9asfzmy399hzfgn6xdp4q5achqbcpn24h73whp5bs6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrow-array" ,rust-arrow-array-50)
                       ("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-cast" ,rust-arrow-cast-50)
                       ("rust-arrow-data" ,rust-arrow-data-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-csv" ,rust-csv-1)
                       ("rust-csv-core" ,rust-csv-core-0.1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-lexical-core" ,rust-lexical-core-0.8)
                       ("rust-regex" ,rust-regex-1))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Support for parsing CSV format to and from the Arrow format")
    (description
     "This package provides Support for parsing CSV format to and from the Arrow format.")
    (license license:asl2.0)))

(define-public rust-arrow-data-50
  (package
    (name "rust-arrow-data")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-data" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kn6fjjpg4lfkvr0h7jqda0qphii196iiqaw2g9klbqn3awl9mk7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-half" ,rust-half-2)
                       ("rust-num" ,rust-num-0.4))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Array data abstractions for Apache Arrow")
    (description
     "This package provides Array data abstractions for Apache Arrow.")
    (license license:asl2.0)))

(define-public rust-arrow-ipc-50
  (package
    (name "rust-arrow-ipc")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-ipc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03dqxzz6hj21qpv39lbpgfz0awgamyq64gzh0hp6rpj8kgksbph3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrow-array" ,rust-arrow-array-50)
                       ("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-cast" ,rust-arrow-cast-50)
                       ("rust-arrow-data" ,rust-arrow-data-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-flatbuffers" ,rust-flatbuffers-23)
                       ("rust-lz4-flex" ,rust-lz4-flex-0.11)
                       ("rust-zstd" ,rust-zstd-0.13))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Support for the Arrow IPC format")
    (description "This package provides Support for the Arrow IPC format.")
    (license license:asl2.0)))

(define-public rust-arrow-json-50
  (package
    (name "rust-arrow-json")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-json" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03zf56l3frl61f80245q7x5p52kaa3ir4560gb9lfyirh2972l49"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrow-array" ,rust-arrow-array-50)
                       ("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-cast" ,rust-arrow-cast-50)
                       ("rust-arrow-data" ,rust-arrow-data-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-half" ,rust-half-2)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-lexical-core" ,rust-lexical-core-0.8)
                       ("rust-num" ,rust-num-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Support for parsing JSON format to and from the Arrow format")
    (description
     "This package provides Support for parsing JSON format to and from the Arrow format.")
    (license license:asl2.0)))

(define-public rust-arrow-ord-50
  (package
    (name "rust-arrow-ord")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-ord" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gk0q9has0jdbdhkpackvlrqy8mcnx1ajx4f5nc7fh03g44n7n8y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrow-array" ,rust-arrow-array-50)
                       ("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-data" ,rust-arrow-data-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-arrow-select" ,rust-arrow-select-50)
                       ("rust-half" ,rust-half-2)
                       ("rust-num" ,rust-num-0.4))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Ordering kernels for arrow arrays")
    (description "This package provides Ordering kernels for arrow arrays.")
    (license license:asl2.0)))

(define-public rust-arrow-row-50
  (package
    (name "rust-arrow-row")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-row" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1krxv1sb52biybgy4f6d4ywszw7djrdqpjz4jf4lx770gbhkaw00"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-arrow-array" ,rust-arrow-array-50)
                       ("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-data" ,rust-arrow-data-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-half" ,rust-half-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.14))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Arrow row format")
    (description "This package provides Arrow row format.")
    (license license:asl2.0)))

(define-public rust-arrow-schema-50
  (package
    (name "rust-arrow-schema")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-schema" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0a80kvnf66rkkp8500wn0jkj5rnhj9l957r6klvnklbw3z0fkwqg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Defines the logical types for arrow arrays")
    (description
     "This package provides Defines the logical types for arrow arrays.")
    (license license:asl2.0)))

(define-public rust-arrow-select-50
  (package
    (name "rust-arrow-select")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-select" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "136pzylrxjbxcgxxgfbvjwspx52hks169q288d8ycbciq5rhkqhw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-arrow-array" ,rust-arrow-array-50)
                       ("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-data" ,rust-arrow-data-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-num" ,rust-num-0.4))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "Selection kernels for arrow arrays")
    (description "This package provides Selection kernels for arrow arrays.")
    (license license:asl2.0)))

(define-public rust-arrow-string-50
  (package
    (name "rust-arrow-string")
    (version "50.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrow-string" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19rjd741xd8rhnv7xp1vw28gb7mnmdyh66vdcfi33kpf59zv7wq0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrow-array" ,rust-arrow-array-50)
                       ("rust-arrow-buffer" ,rust-arrow-buffer-50)
                       ("rust-arrow-data" ,rust-arrow-data-50)
                       ("rust-arrow-schema" ,rust-arrow-schema-50)
                       ("rust-arrow-select" ,rust-arrow-select-50)
                       ("rust-num" ,rust-num-0.4)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-regex-syntax" ,rust-regex-syntax-0.8))))
    (home-page "https://github.com/apache/arrow-rs")
    (synopsis "String kernels for arrow arrays")
    (description "This package provides String kernels for arrow arrays.")
    (license license:asl2.0)))

(define-public rust-assert-fs-1.1.1
  (package
    (name "rust-assert-fs")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "assert_fs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v52l81h93pwk40c7g7bg3g7276cb2afbkdn26dn5vf823hn5mrc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anstream" ,rust-anstream-0.6)
                       ("rust-anstyle" ,rust-anstyle-1)
                       ("rust-doc-comment" ,rust-doc-comment-0.3)
                       ("rust-globwalk" ,rust-globwalk-0.9)
                       ("rust-predicates" ,rust-predicates-3.1.0)
                       ("rust-predicates-core" ,rust-predicates-core-1)
                       ("rust-predicates-tree" ,rust-predicates-tree-1)
                       ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/assert-rs/assert_fs")
    (synopsis "Filesystem fixtures and assertions for testing")
    (description
     "This package provides Filesystem fixtures and assertions for testing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-async-native-tls-0.4
  (package
    (name "rust-async-native-tls")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-native-tls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zhkka5azpr03wg2bswabmwcwcqbdia17h2d17hk4wk47kn4qzfm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://docs.rs/crate/async-native-tls/")
    (synopsis "Native TLS using futures")
    (description "This package provides Native TLS using futures.")
    (license (list license:expat license:asl2.0))))

(define-public rust-async-session-3
  (package
    (name "rust-async-session")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-session" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c76vazdlcs2rsxq8gd8a6wnb913vxhnfx1hyfmfpqml4gjlrnh7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-async-lock" ,rust-async-lock-2)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-base64" ,rust-base64-0.13)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-blake3" ,rust-blake3-0.3)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-hmac" ,rust-hmac-0.11)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-sha2" ,rust-sha2-0.9))))
    (home-page "https://github.com/http-rs/async-session")
    (synopsis "Async session support with pluggable middleware")
    (description
     "This package provides Async session support with pluggable middleware.")
    (license (list license:expat license:asl2.0))))

(define-public rust-atspi-0.19
  (package
    (name "rust-atspi")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "atspi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jl7iv3bvnabg5jd4cpf8ba7zz2dbhk39cr70yh3wnbgmd8g6nb0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atspi-common" ,rust-atspi-common-0.3)
                       ("rust-atspi-connection" ,rust-atspi-connection-0.3)
                       ("rust-atspi-proxies" ,rust-atspi-proxies-0.3))))
    (home-page "https://github.com/odilia-app/atspi")
    (synopsis "Pure-Rust, zbus-based AT-SPI2 protocol implementation")
    (description
     "This package provides Pure-Rust, zbus-based AT-SPI2 protocol implementation.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-atspi-common-0.3
  (package
    (name "rust-atspi-common")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "atspi-common" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xfdn94r697l98669gsq04rpfxysivkc4cn65fb1yhyjcvwrbbwj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-enumflags2" ,rust-enumflags2-0.7)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-static-assertions" ,rust-static-assertions-1)
                       ("rust-zbus" ,rust-zbus-3)
                       ("rust-zbus-names" ,rust-zbus-names-2)
                       ("rust-zvariant" ,rust-zvariant-3))))
    (home-page "https://github.com/odilia-app/atspi")
    (synopsis
     "Primitive types used for sending and receiving Linux accessibility events")
    (description
     "This package provides Primitive types used for sending and receiving Linux accessibility events.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-atspi-connection-0.3
  (package
    (name "rust-atspi-connection")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "atspi-connection" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fdrfsgjg3d84mkk6nk3knqz0ygryfdmsn1d7c74qvgqf1ymxim0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atspi-common" ,rust-atspi-common-0.3)
                       ("rust-atspi-proxies" ,rust-atspi-proxies-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-zbus" ,rust-zbus-3))))
    (home-page "https://github.com/odilia-app/atspi/")
    (synopsis
     "method of connecting, querying, sending and receiving over AT-SPI.")
    (description
     "This package provides a method of connecting, querying, sending and receiving
over AT-SPI.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-atspi-proxies-0.3
  (package
    (name "rust-atspi-proxies")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "atspi-proxies" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lmvfycsrach6phz1ymcg9lks8iqiy6bxp2njci7lgkhfc96d5b4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-atspi-common" ,rust-atspi-common-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-zbus" ,rust-zbus-3))))
    (home-page "https://github.com/odilia-app/atspi")
    (synopsis "AT-SPI2 proxies to query or manipulate UI objects")
    (description
     "This package provides AT-SPI2 proxies to query or manipulate UI objects.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-av-data-0.4
  (package
    (name "rust-av-data")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "av-data" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lk5pq6jfmfp5ihvnzqdqxympk5rk7648bcsvwhgj02xaairhnyp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byte-slice-cast" ,rust-byte-slice-cast-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-num-derive" ,rust-num-derive-0.4)
                       ("rust-num-rational" ,rust-num-rational-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/rust-av/rust-av")
    (synopsis "Multimedia data structures")
    (description "This package provides Multimedia data structures.")
    (license license:expat)))

(define-public rust-axum-0.7
  (package
    (name "rust-axum")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "axum" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kyb7pzgn60crl9wyq7dhciv40sxdr1mbqx2r4s7g9j253qrlv1s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-axum-core" ,rust-axum-core-0.4)
                       ("rust-axum-macros" ,rust-axum-macros-0.4)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-http-body" ,rust-http-body-1)
                       ("rust-http-body-util" ,rust-http-body-util-0.1.1)
                       ("rust-hyper" ,rust-hyper-1.3)
                       ("rust-hyper-util" ,rust-hyper-util-0.1)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-matchit" ,rust-matchit-0.7)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-multer" ,rust-multer-3)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-serde-path-to-error" ,rust-serde-path-to-error-0.1)
                       ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-sync-wrapper" ,rust-sync-wrapper-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-tungstenite" ,rust-tokio-tungstenite-0.21)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tower-http" ,rust-tower-http-0.5)
                       ("rust-tower-layer" ,rust-tower-layer-0.3)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/tokio-rs/axum")
    (synopsis "Web framework that focuses on ergonomics and modularity")
    (description
     "This package provides Web framework that focuses on ergonomics and modularity.")
    (license license:expat)))

(define-public rust-axum-core-0.4
  (package
    (name "rust-axum-core")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "axum-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qx28wg4j6qdcdrisqwyaavlzc0zvbsrcwa99zf9456lfbyn6p51"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-http-body" ,rust-http-body-1)
                       ("rust-http-body-util" ,rust-http-body-util-0.1.1)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-sync-wrapper" ,rust-sync-wrapper-0.1)
                       ("rust-tower-http" ,rust-tower-http-0.5)
                       ("rust-tower-layer" ,rust-tower-layer-0.3)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/tokio-rs/axum")
    (synopsis "Core types and traits for axum")
    (description "This package provides Core types and traits for axum.")
    (license license:expat)))

(define-public rust-axum-macros-0.4
  (package
    (name "rust-axum-macros")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "axum-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ahfy8z5z2xlibj41gyr2jm84di1x1s660g13jcfajh15pp5bh00"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.4)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/tokio-rs/axum")
    (synopsis "Macros for axum")
    (description "This package provides Macros for axum.")
    (license license:expat)))

(define-public rust-backtrace-0.3
  (package
    (name "rust-backtrace")
    (version "0.3.74")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "backtrace" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06pfif7nwx66qf2zaanc2fcq7m64i91ki9imw9xd3bnz5hrwp0ld"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-addr2line" ,rust-addr2line-0.24)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-miniz-oxide" ,rust-miniz-oxide-0.8)
                       ("rust-object" ,rust-object-0.36)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/rust-lang/backtrace-rs")
    (synopsis
     "library to acquire a stack trace (backtrace) at runtime in a Rust program.")
    (description
     "This package provides a library to acquire a stack trace (backtrace) at runtime
in a Rust program.")
    (license (list license:expat license:asl2.0))))

(define-public rust-base64-0.22.1
  (package
    (name "rust-base64")
    (version "0.22.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "base64" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/marshallpierce/rust-base64")
    (synopsis "encodes and decodes base64 as bytes or utf8")
    (description
     "This package provides encodes and decodes base64 as bytes or utf8.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bcrypt-pbkdf-0.10
  (package
    (name "rust-bcrypt-pbkdf")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bcrypt-pbkdf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18pjhsy3m2v0silsp4mjzz8i92zrpqxk9b059zrnk1w8zvhw5ska"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-blowfish" ,rust-blowfish-0.9)
                       ("rust-pbkdf2" ,rust-pbkdf2-0.12)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page
     "https://github.com/RustCrypto/password-hashes/tree/master/bcrypt-pbkdf")
    (synopsis "bcrypt-pbkdf password-based key derivation function")
    (description
     "This package provides bcrypt-pbkdf password-based key derivation function.")
    (license (list license:expat license:asl2.0))))

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

(define-public rust-bear-lib-terminal-2
  (package
    (name "rust-bear-lib-terminal")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bear-lib-terminal" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05kij0gr0i0phikh1qc5mdgi73f3ly9x1fhy3snzizm3jpv4jm9i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bear-lib-terminal-sys" ,rust-bear-lib-terminal-sys-1))))
    (home-page "https://github.com/nabijaczleweli/BearLibTerminal.rs")
    (synopsis "BearLibTerminal FFI for Rust")
    (description "This package provides @code{BearLibTerminal} FFI for Rust.")
    (license license:expat)))

(define-public rust-bear-lib-terminal-sys-1
  (package
    (name "rust-bear-lib-terminal-sys")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bear-lib-terminal-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17r71abbdz4l0vkwwv9p3lsmvy21sai8xabz2wl73w025hxwh11s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2.155))))
    (home-page "https://github.com/nabijaczleweli/BearLibTerminal-sys.rs")
    (synopsis "Pure BearLibTerminal FFI for Rust")
    (description
     "This package provides Pure @code{BearLibTerminal} FFI for Rust.")
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

(define-public rust-bindgen-0.70
  (package
    (name "rust-bindgen")
    (version "0.70.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vyf0jp6apcy9kjyz4s8vldj0xqycnbzb6zv3skkwiqdi3nqz7gl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-annotate-snippets" ,rust-annotate-snippets-0.9)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-cexpr" ,rust-cexpr-0.6)
                       ("rust-clang-sys" ,rust-clang-sys-1)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-prettyplease" ,rust-prettyplease-0.2)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-shlex" ,rust-shlex-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
     "Automatically generates Rust FFI bindings to C and C++ libraries")
    (description
     "This package provides Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license license:bsd-3)))

(define-public rust-bitflags-2.6
  (package
    (name "rust-bitflags")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitflags" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pkidwzn3hnxlsl8zizh0bncgbjnw7c41cx7bby26ncbzmiznj5h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bitflags/bitflags")
    (synopsis "macro to generate structures which behave like bitflags.")
    (description
     "This package provides a macro to generate structures which behave like bitflags.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bitflags-2
  (package
    (name "rust-bitflags")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitflags" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h91vdx1il069vdiiissj8ymzj130rbiic0dbs77yxjgjim9sjyg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/bitflags/bitflags")
    (synopsis "macro to generate structures which behave like bitflags.")
    (description
     "This package provides a macro to generate structures which behave like bitflags.")
    (license (list license:expat license:asl2.0))))

(define-public rust-block2-0.5
  (package
    (name "rust-block2")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "block2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pyiha5his2grzqr3mynmq244laql2j20992i59asp0gy7mjw4rc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-objc2" ,rust-objc2-0.5))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Apple's C language extension of blocks")
    (description
     "This package provides Apple's C language extension of blocks.")
    (license license:expat)))

(define-public rust-brotli-6
  (package
    (name "rust-brotli")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "brotli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0swvf6cgbwhwrpd5y23vq6wipb6q2wqvi2j0hy0xa9lkplfrgxvl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-alloc-no-stdlib" ,rust-alloc-no-stdlib-2)
                       ("rust-alloc-stdlib" ,rust-alloc-stdlib-0.2)
                       ("rust-brotli-decompressor" ,rust-brotli-decompressor-4)
                       ("rust-sha2" ,rust-sha2-0.10))))
    (home-page "https://github.com/dropbox/rust-brotli")
    (synopsis
     "brotli compressor and decompressor that with an interface avoiding the rust stdlib. This makes it suitable for embedded devices and kernels. It is designed with a pluggable allocator so that the standard lib's allocator may be employed. The default build also includes a stdlib allocator and stream interface. Disable this with --features=no-stdlib. All included code is safe.")
    (description
     "This package provides a brotli compressor and decompressor that with an
interface avoiding the rust stdlib.  This makes it suitable for embedded devices
and kernels.  It is designed with a pluggable allocator so that the standard
lib's allocator may be employed.  The default build also includes a stdlib
allocator and stream interface.  Disable this with --features=no-stdlib.  All
included code is safe.")
    (license (list license:bsd-3 license:expat))))

(define-public rust-brotli-decompressor-4
  (package
    (name "rust-brotli-decompressor")
    (version "4.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "brotli-decompressor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qn39c7n6wm40i2bm0d3q2qslmaavlh804iv0ccbba4m80pbsics"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-alloc-no-stdlib" ,rust-alloc-no-stdlib-2)
                       ("rust-alloc-stdlib" ,rust-alloc-stdlib-0.2))))
    (home-page "https://github.com/dropbox/rust-brotli-decompressor")
    (synopsis
     "brotli decompressor that with an interface avoiding the rust stdlib. This makes it suitable for embedded devices and kernels. It is designed with a pluggable allocator so that the standard lib's allocator may be employed. The default build also includes a stdlib allocator and stream interface. Disable this with --features=no-stdlib. Alternatively, --features=unsafe turns off array bounds checks and memory initialization but provides a safe interface for the caller.  Without adding the --features=unsafe argument, all included code is safe. For compression in addition to this library, download https://github.com/dropbox/rust-brotli")
    (description
     "This package provides a brotli decompressor that with an interface avoiding the
rust stdlib.  This makes it suitable for embedded devices and kernels.  It is
designed with a pluggable allocator so that the standard lib's allocator may be
employed.  The default build also includes a stdlib allocator and stream
interface.  Disable this with --features=no-stdlib.  Alternatively,
--features=unsafe turns off array bounds checks and memory initialization but
provides a safe interface for the caller.  Without adding the --features=unsafe
argument, all included code is safe.  For compression in addition to this
library, download https://github.com/dropbox/rust-brotli.")
    (license (list license:bsd-3 license:expat))))

(define-public rust-bumpalo-3
  (package
    (name "rust-bumpalo")
    (version "3.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bumpalo" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b015qb4knwanbdlp1x48pkb4pm57b8gidbhhhxr900q2wb6fabr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-allocator-api2" ,rust-allocator-api2-0.2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/fitzgen/bumpalo")
    (synopsis "fast bump allocation arena for Rust.")
    (description
     "This package provides a fast bump allocation arena for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-byte-slice-cast-1
  (package
    (name "rust-byte-slice-cast")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "byte-slice-cast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "033vv1qddzsj9yfsam4abj55rp60digngcr9a8wgv9pccf5rzb63"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/sdroege/bytes-num-slice-cast")
    (synopsis
     "Safely cast bytes slices from/to slices of built-in fundamental numeric types")
    (description
     "This package provides Safely cast bytes slices from/to slices of built-in fundamental numeric types.")
    (license license:expat)))

(define-public rust-byteorder-lite-0.1
  (package
    (name "rust-byteorder-lite")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "byteorder-lite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15alafmz4b9az56z6x7glcbcb6a8bfgyd109qc3bvx07zx4fj7wg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/image-rs/byteorder-lite")
    (synopsis
     "Library for reading/writing numbers in big-endian and little-endian")
    (description
     "This package provides Library for reading/writing numbers in big-endian and little-endian.")
    (license (list license:unlicense license:expat))))

(define-public rust-bytestring-1
  (package
    (name "rust-bytestring")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytestring" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wpf0c5c72x3ycdb85vznkmcy8fy6ckzd512064dyabbx81h5n3l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://actix.rs")
    (synopsis "UTF-8 encoded read-only string using `Bytes` as storage")
    (description
     "This package provides a UTF-8 encoded read-only string using `Bytes` as storage.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cap-fs-ext-3
  (package
    (name "rust-cap-fs-ext")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-fs-ext" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vp56jm43srrkhwmqnlzjm727rk8ww7hh4x7bkjd9sn4q4ghc8zb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arf-strings" ,rust-arf-strings-0.7)
                       ("rust-camino" ,rust-camino-1)
                       ("rust-cap-primitives" ,rust-cap-primitives-3)
                       ("rust-cap-std" ,rust-cap-std-3)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Extension traits for `Dir`, `File`, etc")
    (description
     "This package provides Extension traits for `Dir`, `File`, etc.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-net-ext-3
  (package
    (name "rust-cap-net-ext")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-net-ext" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qg0hxccczazj3hk4rq461cnpf8x6i8g4skw6b2szjvb24gy2fpq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cap-primitives" ,rust-cap-primitives-3)
                       ("rust-cap-std" ,rust-cap-std-3)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Extension traits for `TcpListener`, `Pool`, etc")
    (description
     "This package provides Extension traits for `@code{TcpListener`}, `Pool`, etc.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-primitives-3
  (package
    (name "rust-cap-primitives")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-primitives" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ccms8hk580z19lrld1w3jd0i8k4g4w3ga5a1sahs9y44s6vs03d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ambient-authority" ,rust-ambient-authority-0.0.2)
                       ("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-fs-set-times" ,rust-fs-set-times-0.20)
                       ("rust-io-extras" ,rust-io-extras-0.18)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-ipnet" ,rust-ipnet-2)
                       ("rust-maybe-owned" ,rust-maybe-owned-0.3)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-windows-sys" ,rust-windows-sys-0.52)
                       ("rust-winx" ,rust-winx-0.36))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Capability-based primitives")
    (description "This package provides Capability-based primitives.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-rand-3
  (package
    (name "rust-cap-rand")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-rand" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04aj5ylnz6f0gr0zi756fw9cf6ia1llvshhzsqg23f6q36k1djyv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ambient-authority" ,rust-ambient-authority-0.0.2)
                       ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Capability-based random number generators")
    (description
     "This package provides Capability-based random number generators.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-std-3
  (package
    (name "rust-cap-std")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-std" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zxxbz0pzvv92kj79j5xqqm7afcn8f591lqy3isjhs4rf4yqxsqr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arf-strings" ,rust-arf-strings-0.7)
                       ("rust-camino" ,rust-camino-1)
                       ("rust-cap-primitives" ,rust-cap-primitives-3)
                       ("rust-io-extras" ,rust-io-extras-0.18)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-rustix" ,rust-rustix-0.38.34))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Capability-based version of the Rust standard library")
    (description
     "This package provides Capability-based version of the Rust standard library.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-time-ext-3
  (package
    (name "rust-cap-time-ext")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-time-ext" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09bpjmw3wn2z7w3w2imspciaqpk9qgi8qmyaf34srdr53v2js531"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ambient-authority" ,rust-ambient-authority-0.0.2)
                       ("rust-cap-primitives" ,rust-cap-primitives-3)
                       ("rust-cap-std" ,rust-cap-std-3)
                       ("rust-iana-time-zone" ,rust-iana-time-zone-0.1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-winx" ,rust-winx-0.36))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Extension traits for `SystemClock` and `MonotonicClock`")
    (description
     "This package provides Extension traits for `@code{SystemClock`} and `@code{MonotonicClock`}.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-capstone-0.12
  (package
    (name "rust-capstone")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "capstone" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v2vfzpibdbbabi7nzqrbxn2i5p0a7m8hbhcdchjnnjqv4wa935h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-capstone-sys" ,rust-capstone-sys-0.16)
                       ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/capstone-rust/capstone-rs")
    (synopsis
     "High level bindings to capstone disassembly engine (https://capstone-engine.org/)")
    (description
     "This package provides High level bindings to capstone disassembly engine
(https://capstone-engine.org/).")
    (license license:expat)))

(define-public rust-capstone-sys-0.16
  (package
    (name "rust-capstone-sys")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "capstone-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qshi53z72yciyqskswyll6i9q40yjxf90347b3bgzqi2wkq6wgy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bindgen" ,rust-bindgen-0.59)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1))))
    (home-page
     "https://github.com/capstone-rust/capstone-rs/tree/master/capstone-sys")
    (synopsis "System bindings to the capstone disassembly library")
    (description
     "This package provides System bindings to the capstone disassembly library.")
    (license license:expat)))

(define-public rust-castaway-0.1
  (package
    (name "rust-castaway")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "castaway" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xhspwy477qy5yg9c3jp713asxckjpx0vfrmz5l7r5zg7naqysd2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/sagebind/castaway")
    (synopsis
     "Safe, zero-cost downcasting for limited compile-time specialization")
    (description
     "This package provides Safe, zero-cost downcasting for limited compile-time specialization.")
    (license license:expat)))

(define-public rust-cc-1.1
  (package
    (name "rust-cc")
    (version "1.1.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vscf59yxf665s4fv9yn3l39gfw99mgp6wnbc76cyv80ahmrdry2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-jobserver" ,rust-jobserver-0.1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-shlex" ,rust-shlex-1))))
    (home-page "https://github.com/rust-lang/cc-rs")
    (synopsis
     "build-time dependency for Cargo build scripts to assist in invoking the native
C compiler to compile native C code into a static archive to be linked into Rust
code.")
    (description
     "This package provides a build-time dependency for Cargo build scripts to assist
in invoking the native C compiler to compile native C code into a static archive
to be linked into Rust code.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cc-1
  (package
    (name "rust-cc")
    (version "1.0.99")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15gnhjiyl323b6lmm05sn8rasyckjqf4n2w7gym4y4j4zmki1icn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-jobserver" ,rust-jobserver-0.1)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-once-cell" ,rust-once-cell-1))))
    (home-page "https://github.com/rust-lang/cc-rs")
    (synopsis
     "build-time dependency for Cargo build scripts to assist in invoking the native
C compiler to compile native C code into a static archive to be linked into Rust
code.")
    (description
     "This package provides a build-time dependency for Cargo build scripts to assist
in invoking the native C compiler to compile native C code into a static archive
to be linked into Rust code.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cfg-aliases-0.2.1
  (package
    (name "rust-cfg-aliases")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cfg_aliases" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "092pxdc1dbgjb6qvh83gk56rkic2n2ybm4yvy76cgynmzi3zwfk1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/katharostech/cfg_aliases")
    (synopsis
     "tiny utility to help save you a lot of effort with long winded `#[cfg()]` checks.")
    (description
     "This package provides a tiny utility to help save you a lot of effort with long
winded `#[cfg()]` checks.")
    (license license:expat)))

(define-public rust-chacha20-0.7
  (package
    (name "rust-chacha20")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chacha20" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1c8h4sp9zh13v8p9arydjcj92xc6j3mccrjc4mizrvq7fzx9717h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cipher" ,rust-cipher-0.3)
                       ("rust-cpufeatures" ,rust-cpufeatures-0.2)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/RustCrypto/stream-ciphers")
    (synopsis
     "The ChaCha20 stream cipher (RFC 8439) implemented in pure Rust using traits
from the RustCrypto `cipher` crate, with optional architecture-specific
hardware acceleration (AVX2, SSE2). Additionally provides the ChaCha8, ChaCha12,
XChaCha20, XChaCha12 and XChaCha8 stream ciphers, and also optional
rand_core-compatible RNGs based on those ciphers.")
    (description
     "This package provides The @code{ChaCha20} stream cipher (RFC 8439) implemented in pure Rust using
traits from the @code{RustCrypto} `cipher` crate, with optional
architecture-specific hardware acceleration (AVX2, SSE2).  Additionally provides
the @code{ChaCha8}, @code{ChaCha12}, X@code{ChaCha20}, X@code{ChaCha12} and
X@code{ChaCha8} stream ciphers, and also optional rand_core-compatible RNGs
based on those ciphers.")
    (license (list license:asl2.0 license:expat))))

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

(define-public rust-chacha20poly1305-0.8
  (package
    (name "rust-chacha20poly1305")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chacha20poly1305" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18mb6k1w71dqv5q50an4rvp19l6yg8ssmvfrmknjfh2z0az7lm5n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aead" ,rust-aead-0.4)
                       ("rust-chacha20" ,rust-chacha20-0.7)
                       ("rust-cipher" ,rust-cipher-0.3)
                       ("rust-poly1305" ,rust-poly1305-0.7)
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

(define-public rust-char-device-0.16
  (package
    (name "rust-char-device")
    (version "0.16.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "char-device" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lcvym9n8v01fwi2jmxx1rq51fqzls35jfxyxvdfyd3c1k3w804x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-io-extras" ,rust-io-extras-0.18)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-winx" ,rust-winx-0.36))))
    (home-page "https://github.com/sunfishcode/char-device")
    (synopsis "Character Device I/O")
    (description "This package provides Character Device I/O.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-clap-4.5.20
  (package
    (name "rust-clap")
    (version "4.5.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s37v23gcxkjy4800qgnkxkpliz68vslpr5sgn1xar56hmnkfzxr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap-builder" ,rust-clap-builder-4.5.20)
                       ("rust-clap-derive" ,rust-clap-derive-4.5.18))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-4.5.6
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

(define-public rust-clap-builder-4.5.20
  (package
    (name "rust-clap-builder")
    (version "4.5.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_builder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0m6w10l2f65h3ch0d53lql6p26xxrh20ffipra9ysjsfsjmq1g0r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anstream" ,rust-anstream-0.6)
                       ("rust-anstyle" ,rust-anstyle-1)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-clap-lex" ,rust-clap-lex-0.7)
                       ("rust-strsim" ,rust-strsim-0.11)
                       ("rust-terminal-size" ,rust-terminal-size-0.4)
                       ("rust-unicase" ,rust-unicase-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.2))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser.")
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

(define-public rust-clap-complete-4.5.35
  (package
    (name "rust-clap-complete")
    (version "4.5.35")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_complete" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1swz6bdyyfzjr4dvg5qpc0pknagr29n3zf38bvixn4ybp2skm887"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-4.5.20)
                       ("rust-clap-lex" ,rust-clap-lex-0.7)
                       ("rust-completest" ,rust-completest-0.4)
                       ("rust-completest-pty" ,rust-completest-pty-0.5)
                       ("rust-is-executable" ,rust-is-executable-1)
                       ("rust-shlex" ,rust-shlex-1))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis "Generate shell completion scripts for your clap::Command")
    (description
     "This package provides Generate shell completion scripts for your clap::Command.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-complete-4.5.5
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
       #:cargo-inputs (("rust-clap" ,rust-clap-4.5.6)
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

(define-public rust-clap-derive-4.5.18
  (package
    (name "rust-clap-derive")
    (version "4.5.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ardb26bvcpg72q9myr7yir3a8c83gx7vxk1cccabsd9n73s1ija"))))
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

(define-public rust-clap-mangen-0.2.21
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
       #:cargo-inputs (("rust-clap" ,rust-clap-4.5.6)
                       ("rust-roff" ,rust-roff-0.2))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis "manpage generator for clap")
    (description "This package provides a manpage generator for clap.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-verbosity-flag-2.2
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
       #:cargo-inputs (("rust-clap" ,rust-clap-4.5.6)
                       ("rust-log" ,rust-log-0.4.21))))
    (home-page "https://github.com/clap-rs/clap-verbosity-flag")
    (synopsis "Easily add a `--verbose` flag to CLIs using Clap")
    (description
     "This package provides Easily add a `--verbose` flag to CLIs using Clap.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clipboard-win-5
  (package
    (name "rust-clipboard-win")
    (version "5.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clipboard-win" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ba48760mbzv6jsfxbqyhf3zdp86ix3p4adgrsd0vqj4a4zlgx3r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-error-code" ,rust-error-code-3)
                       ("rust-windows-win" ,rust-windows-win-3))))
    (home-page "https://github.com/DoumanAsh/clipboard-win")
    (synopsis "Provides simple way to interact with Windows clipboard")
    (description
     "This package provides simple way to interact with Windows clipboard.")
    (license license:boost1.0)))

(define-public rust-color-hex-0.2
  (package
    (name "rust-color-hex")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "color-hex" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yacshskcjybr727rh6d38lrfrcdivnd184h49j6qsrj7a8zppzc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/newcomb-luke/color-hex")
    (synopsis
     "Procedural macro for converting hexadecimal strings to an RGB or RGBA byte array at compile time")
    (description
     "This package provides Procedural macro for converting hexadecimal strings to an RGB or RGBA byte array
at compile time.")
    (license license:expat)))

(define-public rust-com-0.6
  (package
    (name "rust-com")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "com" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xnryd43mqdyq66qlnagwxrcs9iyr0kcbw9f3ddvclvks5zqh5vy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-com-macros" ,rust-com-macros-0.6))))
    (home-page "https://github.com/microsoft/com-rs")
    (synopsis "Utilities for implementing COM Client and Servers")
    (description
     "This package provides Utilities for implementing COM Client and Servers.")
    (license license:expat)))

(define-public rust-com-macros-0.6
  (package
    (name "rust-com-macros")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "com_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "198k9fqd9rnpv3x6pxav6g636gl6m30iyqx63r4cfs56h0sqhxfk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-com-macros-support" ,rust-com-macros-support-0.6)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/microsoft/com-rs")
    (synopsis "COM crate macros")
    (description "This package provides COM crate macros.")
    (license license:expat)))

(define-public rust-com-macros-support-0.6
  (package
    (name "rust-com-macros-support")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "com_macros_support" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "033ix2k6j0930b0gpm77r2zc2d4f5fvpqbbr8ib6sad9hw89m2dd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/microsoft/com-rs")
    (synopsis "Support library for COM crate macros")
    (description "This package provides Support library for COM crate macros.")
    (license license:expat)))

(define-public rust-completest-0.4
  (package
    (name "rust-completest")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "completest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nsxyiz1dnwy2pk5n17lbhiijgcy9rc4g5sr1w2als0kwvzy23a1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/assert-rs/completest")
    (synopsis "Run completions for your program")
    (description "This package provides Run completions for your program.")
    (license (list license:expat license:asl2.0))))

(define-public rust-completest-pty-0.5
  (package
    (name "rust-completest-pty")
    (version "0.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "completest-pty" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04s30kz6rvi4d7grx8my5siwmfiv6sm09ib152yj5ccxk4mg5lpv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-completest" ,rust-completest-0.4)
                       ("rust-ptyprocess" ,rust-ptyprocess-0.4)
                       ("rust-vt100" ,rust-vt100-0.15))))
    (home-page "https://github.com/assert-rs/completest")
    (synopsis "Run completions for your program")
    (description "This package provides Run completions for your program.")
    (license (list license:expat license:asl2.0))))

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
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-yaml" ,rust-serde-yaml-0.9)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-toml" ,rust-toml-0.8))))
    (home-page "https://github.com/rust-cli/confy")
    (synopsis "Boilerplate-free configuration management")
    (description
     "This package provides Boilerplate-free configuration management.")
    (license (list license:expat license:x11 license:asl2.0))))

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
                       ("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-publicsuffix" ,rust-publicsuffix-2)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-time" ,rust-time-0.3.36)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/pfernie/cookie_store")
    (synopsis "Implementation of Cookie storage and retrieval")
    (description
     "This package provides Implementation of Cookie storage and retrieval.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cpp-demangle-0.4
  (package
    (name "rust-cpp-demangle")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cpp_demangle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z8c656jiwphnw1brkb0whm4kgh39h1msvgig2wc44yi58s8vrcn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-afl" ,rust-afl-0.15)
                       ("rust-cfg-if" ,rust-cfg-if-1))))
    (home-page "https://github.com/gimli-rs/cpp_demangle")
    (synopsis "crate for demangling C++ symbols")
    (description "This package provides a crate for demangling C++ symbols.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cranelift-bforest-0.111
  (package
    (name "rust-cranelift-bforest")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-bforest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rp0qvqfpnm81l8jnrgg6sggqx3pd13df3iwyysybiy4p583l35q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.111))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "forest of B+-trees")
    (description "This package provides a forest of B+-trees.")
    (license license:asl2.0)))

(define-public rust-cranelift-bitset-0.111
  (package
    (name "rust-cranelift-bitset")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-bitset" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vaxv71bd431n9cl4mshgibznqf5w0s926djmh2qp4faq9c8fxrq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Various bitset stuff for use inside Cranelift")
    (description
     "This package provides Various bitset stuff for use inside Cranelift.")
    (license license:asl2.0)))

(define-public rust-cranelift-codegen-0.111
  (package
    (name "rust-cranelift-codegen")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15ykkadm98pggplj70b6bnrlpkfza07n539sq6znir0hmmkqc9aq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-capstone" ,rust-capstone-0.12)
                       ("rust-cranelift-bforest" ,rust-cranelift-bforest-0.111)
                       ("rust-cranelift-bitset" ,rust-cranelift-bitset-0.111)
                       ("rust-cranelift-codegen-meta" ,rust-cranelift-codegen-meta-0.111)
                       ("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.111)
                       ("rust-cranelift-control" ,rust-cranelift-control-0.111)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.111)
                       ("rust-cranelift-isle" ,rust-cranelift-isle-0.111)
                       ("rust-gimli" ,rust-gimli-0.29)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-postcard" ,rust-postcard-1)
                       ("rust-regalloc2" ,rust-regalloc2-0.9)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-souper-ir" ,rust-souper-ir-2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12.16))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Low-level code generator library")
    (description "This package provides Low-level code generator library.")
    (license license:asl2.0)))

(define-public rust-cranelift-codegen-meta-0.111
  (package
    (name "rust-cranelift-codegen-meta")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-meta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01pfa4vk90q9xg2p4larjda7ncfmwx07vgcjzw3wp7aj5rq0ngq4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.111))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Metaprogram for cranelift-codegen code generator library")
    (description
     "This package provides Metaprogram for cranelift-codegen code generator library.")
    (license license:asl2.0)))

(define-public rust-cranelift-codegen-shared-0.111
  (package
    (name "rust-cranelift-codegen-shared")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fzzjih8dl8hdl8grkxdpz1853l27yal38bxrsjyqlxbi245fqvp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "For code shared between cranelift-codegen-meta and cranelift-codegen")
    (description
     "This package provides For code shared between cranelift-codegen-meta and cranelift-codegen.")
    (license license:asl2.0)))

(define-public rust-cranelift-control-0.111
  (package
    (name "rust-cranelift-control")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-control" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12rxyfz50xmpfy1lk8y86x5scjf43v5k7az8247mgpq5ikq1bnrj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "White-box fuzz testing framework")
    (description "This package provides White-box fuzz testing framework.")
    (license license:asl2.0)))

(define-public rust-cranelift-entity-0.111
  (package
    (name "rust-cranelift-entity")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-entity" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c0106lcmd0ws2qp1vxf94ypq00nb4c446zspgkjf6iqk6rwv2aj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-bitset" ,rust-cranelift-bitset-0.111)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Data structures using entity references as mapping keys")
    (description
     "This package provides Data structures using entity references as mapping keys.")
    (license license:asl2.0)))

(define-public rust-cranelift-frontend-0.111
  (package
    (name "rust-cranelift-frontend")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-frontend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s1lq8rj35acij34484s1mdaqjd6k73s7pwdx5vh8ixr9sr8mfii"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.111)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12.16))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Cranelift IR builder helper")
    (description "This package provides Cranelift IR builder helper.")
    (license license:asl2.0)))

(define-public rust-cranelift-isle-0.111
  (package
    (name "rust-cranelift-isle")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-isle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yg8f2kvrfjgjz03s0knxb0qg9vipg8bs2djvhk099v6q72s6wib"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-codespan-reporting" ,rust-codespan-reporting-0.11)
                       ("rust-log" ,rust-log-0.4))))
    (home-page
     "https://github.com/bytecodealliance/wasmtime/tree/main/cranelift/isle")
    (synopsis
     "ISLE: Instruction Selection and Lowering Expressions. A domain-specific language for instruction selection in Cranelift")
    (description
     "This package provides ISLE: Instruction Selection and Lowering Expressions.  A domain-specific
language for instruction selection in Cranelift.")
    (license license:asl2.0)))

(define-public rust-cranelift-native-0.111
  (package
    (name "rust-cranelift-native")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-native" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06ypjnrcgns8blmgms0a8b2mcqc9vxrn0w62qlgw7fsnr4j29926"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.111)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12.16))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Support for targeting the host with Cranelift")
    (description
     "This package provides Support for targeting the host with Cranelift.")
    (license license:asl2.0)))

(define-public rust-cranelift-reader-0.111
  (package
    (name "rust-cranelift-reader")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-reader" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1js835jaq7pckyjzbv3zha78874xirrky9pjdqsjzj9b38mdf6pw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.111)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12.16))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Cranelift textual IR reader")
    (description "This package provides Cranelift textual IR reader.")
    (license license:asl2.0)))

(define-public rust-cranelift-wasm-0.111
  (package
    (name "rust-cranelift-wasm")
    (version "0.111.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-wasm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0s4zl250yxlvw4v01ph167w0q0rya52s6c1wp4sxfcwr53s8sxs9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.111)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.111)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.111)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-itertools" ,rust-itertools-0.12)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.215)
                       ("rust-wasmtime-types" ,rust-wasmtime-types-24))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Translator from WebAssembly to Cranelift IR")
    (description
     "This package provides Translator from @code{WebAssembly} to Cranelift IR.")
    (license license:asl2.0)))

(define-public rust-crc16-0.4
  (package
    (name "rust-crc16")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crc16" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zzwb5iv51wnh96532cxkk4aa8ys47rhzrjy98wqcys25ks8k01k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/blackbeam/rust-crc16")
    (synopsis "CRC16 implementation")
    (description "This package provides a CRC16 implementation.")
    (license license:expat)))

(define-public rust-crosstermion-0.13
  (package
    (name "rust-crosstermion")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crosstermion" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1q877s6rfm4n4amsg79ihxi583lhmlnq57hj9sg1ph2ddyw1a120"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ansiterm" ,rust-ansiterm-0.12)
                       ("rust-async-channel" ,rust-async-channel-2)
                       ("rust-crossterm" ,rust-crossterm-0.27)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-2)
                       ("rust-ratatui" ,rust-ratatui-0.25.0)
                       ("rust-tui-react" ,rust-tui-react-0.22))))
    (home-page "https://github.com/Byron/tui-crates")
    (synopsis "utilities for `crossterm`, without ties to `termion`")
    (description
     "This package provides utilities for `crossterm`, without ties to `termion`.")
    (license license:expat)))

(define-public rust-csrf-0.4
  (package
    (name "rust-csrf")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "csrf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1q7ixhshj6a7x2vgsr4d4iqa5mgp4fwkr4lx2hgvnj9xcy1py9dh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aead" ,rust-aead-0.4)
                       ("rust-aes-gcm" ,rust-aes-gcm-0.9)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-chacha20poly1305" ,rust-chacha20poly1305-0.8)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-data-encoding" ,rust-data-encoding-2)
                       ("rust-generic-array" ,rust-generic-array-0.14)
                       ("rust-hmac" ,rust-hmac-0.11)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-sha2" ,rust-sha2-0.9)
                       ("rust-typemap" ,rust-typemap-0.3))))
    (home-page "https://github.com/heartsucker/rust-csrf")
    (synopsis "CSRF protection primitives")
    (description "This package provides CSRF protection primitives.")
    (license license:expat)))

(define-public rust-csscolorparser-0.6
  (package
    (name "rust-csscolorparser")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "csscolorparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gxh11hajx96mf5sd0az6mfsxdryfqvcfcphny3yfbfscqq7sapb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cint" ,rust-cint-0.3)
                       ("rust-lab" ,rust-lab-0.11)
                       ("rust-phf" ,rust-phf-0.11)
                       ("rust-rgb" ,rust-rgb-0.8)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/mazznoer/csscolorparser-rs")
    (synopsis "CSS color parser library")
    (description "This package provides CSS color parser library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-csv-sniffer-0.3
  (package
    (name "rust-csv-sniffer")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "csv-sniffer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0705g1alpvs5ja71nw93ldicr9i2ri431q0sbkai094m7fljmqx1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-csv" ,rust-csv-1)
                       ("rust-csv-core" ,rust-csv-core-0.1)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-regex" ,rust-regex-1))))
    (home-page "https://github.com/jblondin/csv-sniffer")
    (synopsis "CSV file format sniffer for Rust")
    (description "This package provides a CSV file format sniffer for Rust.")
    (license license:expat)))

(define-public rust-cursive-0.20
  (package
    (name "rust-cursive")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cursive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0faqb53cw4cxbjkjpj2yg8i614habpplyxkl3srm3byqplbfnf2l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-bear-lib-terminal" ,rust-bear-lib-terminal-2)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-crossterm" ,rust-crossterm-0.25)
                       ("rust-cursive-core" ,rust-cursive-core-0.3)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-maplit" ,rust-maplit-1)
                       ("rust-ncurses" ,rust-ncurses-5)
                       ("rust-pancurses" ,rust-pancurses-0.17)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-term-size" ,rust-term-size-0.3)
                       ("rust-termion" ,rust-termion-1)
                       ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/gyscos/cursive")
    (synopsis "TUI (Text User Interface) library focused on ease-of-use.")
    (description
     "This package provides a TUI (Text User Interface) library focused on
ease-of-use.")
    (license license:expat)))

(define-public rust-cursive-core-0.3
  (package
    (name "rust-cursive-core")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cursive_core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kfr5jm62w6msy5fb0w9kv9kmw63fig8r5n78p5hv392c60vbcsd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-ansi-parser" ,rust-ansi-parser-0.8)
                       ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-enum-map" ,rust-enum-map-2)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-num" ,rust-num-0.4)
                       ("rust-owning-ref" ,rust-owning-ref-0.4)
                       ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.9)
                       ("rust-time" ,rust-time-0.3.36)
                       ("rust-toml" ,rust-toml-0.5)
                       ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-xi-unicode" ,rust-xi-unicode-0.3))))
    (home-page "https://github.com/gyscos/cursive")
    (synopsis "Core components for the Cursive TUI")
    (description "This package provides Core components for the Cursive TUI.")
    (license license:expat)))

(define-public rust-curve25519-dalek-4
  (package
    (name "rust-curve25519-dalek")
    (version "4.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "curve25519-dalek" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gmjb9dsknrr8lypmhkyjd67p1arb8mbfamlwxm7vph38my8pywp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cpufeatures" ,rust-cpufeatures-0.2)
                       ("rust-curve25519-dalek-derive" ,rust-curve25519-dalek-derive-0.1)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-ff" ,rust-ff-0.13)
                       ("rust-fiat-crypto" ,rust-fiat-crypto-0.2)
                       ("rust-group" ,rust-group-0.13)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/dalek-cryptography/curve25519-dalek")
    (synopsis
     "pure-Rust implementation of group operations on ristretto255 and Curve25519")
    (description
     "This package provides a pure-Rust implementation of group operations on
ristretto255 and Curve25519.")
    (license license:bsd-3)))

(define-public rust-curve25519-dalek-derive-0.1
  (package
    (name "rust-curve25519-dalek-derive")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "curve25519-dalek-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cry71xxrr0mcy5my3fb502cwfxy6822k4pm19cwrilrg7hq4s7l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/dalek-cryptography/curve25519-dalek")
    (synopsis "curve25519-dalek Derives")
    (description "This package provides curve25519-dalek Derives.")
    (license (list license:expat license:asl2.0))))

(define-public rust-d3d12-0.19
  (package
    (name "rust-d3d12")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "d3d12" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01x322av5z761lrgcfzyxwfpwqznc5pihlmp4k5a340221zp8g9y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-libloading" ,rust-libloading-0.7)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/gfx-rs/wgpu/tree/trunk/d3d12")
    (synopsis "Low level D3D12 API wrapper")
    (description "This package provides Low level D3D12 API wrapper.")
    (license (list license:expat license:asl2.0))))

(define-public rust-databake-0.1
  (package
    (name "rust-databake")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "databake" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kb0lnhka1fklrii3qaj40zcrbclfn8fyvy0r1whd3yaxkxzn13a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-databake-derive" ,rust-databake-derive-0.1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1))))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis
     "Trait that lets structs represent themselves as (const) Rust expressions")
    (description
     "This package provides Trait that lets structs represent themselves as (const) Rust expressions.")
    (license license:expat)))

(define-public rust-databake-derive-0.1
  (package
    (name "rust-databake-derive")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "databake-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yymbr1z93k7lg0pl5mw9mjhw8fpsfykg7bmkvmir9h1wmfjfy20"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-synstructure" ,rust-synstructure-0.13))))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis "Custom derive for the databake crate")
    (description "This package provides Custom derive for the databake crate.")
    (license license:expat)))

(define-public rust-dav1d-0.10
  (package
    (name "rust-dav1d")
    (version "0.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dav1d" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qd13sm1bfbc5chjgrzk4syffkky994lkyzhqrqklqxg1fj58jqd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-av-data" ,rust-av-data-0.4)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-dav1d-sys" ,rust-dav1d-sys-0.8)
                       ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://github.com/rust-av/dav1d-rs")
    (synopsis "libdav1d bindings")
    (description "This package provides libdav1d bindings.")
    (license license:expat)))

(define-public rust-dav1d-sys-0.8
  (package
    (name "rust-dav1d-sys")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dav1d-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "158fqp97ny3206sydnimc2jy1c1gcxa4llqvvkp3ii2dixg1rjvf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2.155)
                       ("rust-system-deps" ,rust-system-deps-6))))
    (home-page "https://github.com/rust-av/dav1d-rs")
    (synopsis "FFI bindings to dav1d")
    (description "This package provides FFI bindings to dav1d.")
    (license license:expat)))

(define-public rust-dcv-color-primitives-0.6
  (package
    (name "rust-dcv-color-primitives")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dcv-color-primitives" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0k3384cfwhc8z9pxj0gb6dz8sjcwsamnpbrkbc570sfhzvnn5b87"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-paste" ,rust-paste-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://github.com/aws/dcv-color-primitives")
    (synopsis "a library to perform image color model conversion")
    (description
     "This package provides a library to perform image color model conversion.")
    (license license:expat-0)))

(define-public rust-deltae-0.3
  (package
    (name "rust-deltae")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "deltae" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d3hw9hpvicl9x0x34jr2ybjk5g5ym1lhbyz6zj31110gq8zaaap"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://gitlab.com/ryanobeirne/deltae")
    (synopsis "Calculate Delta E between two colors in CIE Lab space")
    (description
     "This package provides Calculate Delta E between two colors in CIE Lab space.")
    (license license:expat)))

(define-public rust-derive-new-0.6
  (package
    (name "rust-derive-new")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-new" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b8jv6jx0b8jgkz9kmz0ciqmnf74xkk0mmvkb5z1c87932kdwl6i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/nrc/derive-new")
    (synopsis
     "`#[derive(new)]` implements simple constructor functions for structs and enums")
    (description
     "This package provides `#[derive(new)]` implements simple constructor functions for structs and enums.")
    (license license:expat)))

(define-public rust-document-features-0.2
  (package
    (name "rust-document-features")
    (version "0.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "document-features" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15cvgxqngxslgllz15m8aban6wqfgsi6nlhr0g25yfsnd6nq4lpg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-litrs" ,rust-litrs-0.4))))
    (home-page "https://slint-ui.com")
    (synopsis
     "Extract documentation for the feature flags from comments in Cargo.toml")
    (description
     "This package provides Extract documentation for the feature flags from comments in Cargo.toml.")
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
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-time" ,rust-time-0.3.36)
                       ("rust-ureq" ,rust-ureq-2)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/thibmeu/drand-rs/tree/main/drand_core")
    (synopsis "drand client library.")
    (description "This package provides a drand client library.")
    (license license:expat)))

(define-public rust-ecolor-0.27
  (package
    (name "rust-ecolor")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ecolor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "041vlwgk57lysyh45ksnsprr6j4df24n15q7bvascmxx5d1hm4r0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-cint" ,rust-cint-0.3)
                       ("rust-color-hex" ,rust-color-hex-0.2)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/emilk/egui")
    (synopsis "Color structs and color conversion utilities")
    (description
     "This package provides Color structs and color conversion utilities.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ecolor-0.24
  (package
    (name "rust-ecolor")
    (version "0.24.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ecolor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0whrk6jxqk7jfai7z76sd9vsqqf09zzr1b0vjd97xlbl5vy3fxjb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-cint" ,rust-cint-0.3)
                       ("rust-color-hex" ,rust-color-hex-0.2)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/emilk/egui")
    (synopsis "Color structs and color conversion utilities")
    (description
     "This package provides Color structs and color conversion utilities.")
    (license (list license:expat license:asl2.0))))

(define-public rust-edit-0.1.5
  (package
    (name "rust-edit")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "edit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02dan6bg9pcj42ny48g8fq9f76w30c826n4gihy1d1s7fq78cr7k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-shell-words" ,rust-shell-words-1)
                       ("rust-tempfile" ,rust-tempfile-3.10.1)
                       ("rust-which" ,rust-which-4))))
    (home-page "https://github.com/milkey-mouse/edit")
    (synopsis "Open a file in the default text editor")
    (description
     "This package provides Open a file in the default text editor.")
    (license license:cc0)))

(define-public rust-eframe-0.27
  (package
    (name "rust-eframe")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "eframe" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cmsj5y31zd8dmsga9v70z1nz155cknpwbslphfwgkmvyv72q3h2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-cocoa" ,rust-cocoa-0.25)
                       ("rust-directories-next" ,rust-directories-next-2)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-egui" ,rust-egui-0.27)
                       ("rust-egui-wgpu" ,rust-egui-wgpu-0.27)
                       ("rust-egui-winit" ,rust-egui-winit-0.27)
                       ("rust-egui-glow" ,rust-egui-glow-0.27)
                       ("rust-glow" ,rust-glow-0.13)
                       ("rust-glutin" ,rust-glutin-0.31)
                       ("rust-glutin-winit" ,rust-glutin-winit-0.4)
                       ("rust-image" ,rust-image-0.24)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-objc" ,rust-objc-0.2)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pollster" ,rust-pollster-0.3)
                       ("rust-puffin" ,rust-puffin-0.19)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.6)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.5)
                       ("rust-ron" ,rust-ron-0.8)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-static-assertions" ,rust-static-assertions-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-web-time" ,rust-web-time-0.2)
                       ("rust-wgpu" ,rust-wgpu-0.19)
                       ("rust-winapi" ,rust-winapi-0.3)
                       ("rust-winit" ,rust-winit-0.29))))
    (home-page "https://github.com/emilk/egui/tree/master/crates/eframe")
    (synopsis
     "egui framework - write GUI apps that compiles to web and/or natively")
    (description
     "This package provides egui framework - write GUI apps that compiles to web and/or natively.")
    (license (list license:expat license:asl2.0))))

(define-public rust-egui-0.27
  (package
    (name "rust-egui")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "egui" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16p2gwngk1qij01y3411agmiy6my5liay8rki9vjayx6z4dmsk2q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-accesskit" ,rust-accesskit-0.12)
                       ("rust-ahash" ,rust-ahash-0.8)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-epaint" ,rust-epaint-0.27)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-nohash-hasher" ,rust-nohash-hasher-0.2)
                       ("rust-puffin" ,rust-puffin-0.19)
                       ("rust-ron" ,rust-ron-0.8)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/emilk/egui")
    (synopsis
     "An easy-to-use immediate mode GUI that runs on both web and native")
    (description
     "This package provides An easy-to-use immediate mode GUI that runs on both web and native.")
    (license (list license:expat license:asl2.0))))

(define-public rust-egui-0.24
  (package
    (name "rust-egui")
    (version "0.24.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "egui" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0szfj7r2vvipcq91bb9q0wjplrap8y9bhf2sa64vhkkn9f3cnny5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-accesskit" ,rust-accesskit-0.12)
                       ("rust-ahash" ,rust-ahash-0.8)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-epaint" ,rust-epaint-0.24)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-nohash-hasher" ,rust-nohash-hasher-0.2)
                       ("rust-puffin" ,rust-puffin-0.18)
                       ("rust-ron" ,rust-ron-0.8)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/emilk/egui")
    (synopsis
     "An easy-to-use immediate mode GUI that runs on both web and native")
    (description
     "This package provides An easy-to-use immediate mode GUI that runs on both web and native.")
    (license (list license:expat license:asl2.0))))

(define-public rust-egui-extras-0.24
  (package
    (name "rust-egui-extras")
    (version "0.24.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "egui_extras" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dapdkfmrrsvw8ynk3vwmxdnb63p2qp72gisblk5hq512yplwqlp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-chrono" ,rust-chrono-0.4)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-egui" ,rust-egui-0.24)
                       ("rust-ehttp" ,rust-ehttp-0.3)
                       ("rust-enum-map" ,rust-enum-map-2)
                       ("rust-image" ,rust-image-0.24)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-mime-guess2" ,rust-mime-guess2-2)
                       ("rust-puffin" ,rust-puffin-0.18)
                       ("rust-resvg" ,rust-resvg-0.28)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-syntect" ,rust-syntect-5)
                       ("rust-tiny-skia" ,rust-tiny-skia-0.8)
                       ("rust-usvg" ,rust-usvg-0.28))))
    (home-page "https://github.com/emilk/egui")
    (synopsis "Extra functionality and widgets for the egui GUI library")
    (description
     "This package provides Extra functionality and widgets for the egui GUI library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-egui-glow-0.27
  (package
    (name "rust-egui-glow")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "egui_glow" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jj47zg5xav894bazdfkamydwpf14yxqinxi6lyxqvn8ydsxkrg0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-egui" ,rust-egui-0.27)
                       ("rust-egui-winit" ,rust-egui-winit-0.27)
                       ("rust-glow" ,rust-glow-0.13)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-memoffset" ,rust-memoffset-0.9)
                       ("rust-puffin" ,rust-puffin-0.19)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-winit" ,rust-winit-0.29))))
    (home-page "https://github.com/emilk/egui/tree/master/crates/egui_glow")
    (synopsis "Bindings for using egui natively using the glow library")
    (description
     "This package provides Bindings for using egui natively using the glow library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-egui-plot-0.27
  (package
    (name "rust-egui-plot")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "egui_plot" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18c868r635wk0cd18m5msq9sknhi01h3vnvha8n3ab8wvj34p1d7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-document-features" ,rust-document-features-0.2)
                       ("rust-egui" ,rust-egui-0.27)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/emilk/egui")
    (synopsis "Immediate mode plotting for the egui GUI library")
    (description
     "This package provides Immediate mode plotting for the egui GUI library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-egui-wgpu-0.27
  (package
    (name "rust-egui-wgpu")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "egui-wgpu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dwvrd36rq5h48x0zrw3sab8w3ivs2vk458sfcmp12pq8dcgd7s6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-egui" ,rust-egui-0.27)
                       ("rust-epaint" ,rust-epaint-0.27)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-puffin" ,rust-puffin-0.19)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-type-map" ,rust-type-map-0.5)
                       ("rust-web-time" ,rust-web-time-0.2)
                       ("rust-wgpu" ,rust-wgpu-0.19)
                       ("rust-winit" ,rust-winit-0.29))))
    (home-page "https://github.com/emilk/egui/tree/master/crates/egui-wgpu")
    (synopsis "Bindings for using egui natively using the wgpu library")
    (description
     "This package provides Bindings for using egui natively using the wgpu library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-egui-winit-0.27
  (package
    (name "rust-egui-winit")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "egui-winit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "029nay2wh2bgs57n51fymc07pbz45nwkb6sr1i2l3wr0w35s0g9f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-accesskit-winit" ,rust-accesskit-winit-0.16)
                       ("rust-arboard" ,rust-arboard-3.4)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-egui" ,rust-egui-0.27)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-puffin" ,rust-puffin-0.19)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.6)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-smithay-clipboard" ,rust-smithay-clipboard-0.7)
                       ("rust-web-time" ,rust-web-time-0.2)
                       ("rust-webbrowser" ,rust-webbrowser-0.8)
                       ("rust-winit" ,rust-winit-0.29))))
    (home-page "https://github.com/emilk/egui/tree/master/crates/egui-winit")
    (synopsis "Bindings for using egui with winit")
    (description "This package provides Bindings for using egui with winit.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ehttp-0.3
  (package
    (name "rust-ehttp")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ehttp" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pd7cy3kr98nifdwdxqp2kh2wdfq1a8wjawygpy6myan4dk4b3zq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-channel" ,rust-async-channel-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-ureq" ,rust-ureq-2)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
                       ("rust-wasm-streams" ,rust-wasm-streams-0.3)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://github.com/emilk/ehttp")
    (synopsis "Minimal HTTP client for both native and WASM")
    (description
     "This package provides Minimal HTTP client for both native and WASM.")
    (license (list license:expat license:asl2.0))))

(define-public rust-emath-0.27
  (package
    (name "rust-emath")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "emath" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gqgc81shxci0p372dr7cdcx38443ks3b7a4083n656arx9abhz4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-mint" ,rust-mint-0.5)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/emilk/egui/tree/master/crates/emath")
    (synopsis "Minimal 2D math library for GUI work")
    (description "This package provides Minimal 2D math library for GUI work.")
    (license (list license:expat license:asl2.0))))

(define-public rust-emath-0.24
  (package
    (name "rust-emath")
    (version "0.24.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "emath" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1r6caqgn0ral6kxbkk6a4yn82a5l78c9s7pw2f2yjdabnk0ccid0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-mint" ,rust-mint-0.5)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/emilk/egui/tree/master/crates/emath")
    (synopsis "Minimal 2D math library for GUI work")
    (description "This package provides Minimal 2D math library for GUI work.")
    (license (list license:expat license:asl2.0))))

(define-public rust-enum-map-2
  (package
    (name "rust-enum-map")
    (version "2.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "enum-map" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sgjgl4mmz93jdkfdsmapc3dmaq8gddagw9s0fd501w2vyzz6rk8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-enum-map-derive" ,rust-enum-map-derive-0.17)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://codeberg.org/xfix/enum-map")
    (synopsis "map with C-like enum keys represented internally as an array")
    (description
     "This package provides a map with C-like enum keys represented internally as an
array.")
    (license (list license:expat license:asl2.0))))

(define-public rust-enum-map-derive-0.17
  (package
    (name "rust-enum-map-derive")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "enum-map-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sv4mb343rsz4lc3rh7cyn0pdhf7fk18k1dgq8kfn5i5x7gwz0pj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://codeberg.org/xfix/enum-map")
    (synopsis "Macros 1.1 implementation of #[derive(Enum)]")
    (description
     "This package provides Macros 1.1 implementation of #[derive(Enum)].")
    (license (list license:expat license:asl2.0))))

(define-public rust-enumn-0.1
  (package
    (name "rust-enumn")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "enumn" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hnvrp440hwjfd4navbni2mhcjd63adxp8ryk6z3prw8d7yh1l3g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/dtolnay/enumn")
    (synopsis "Convert number to enum")
    (description "This package provides Convert number to enum.")
    (license (list license:expat license:asl2.0))))

(define-public rust-env-logger-0.10.2
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
                       ("rust-log" ,rust-log-0.4.21)
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

(define-public rust-epaint-0.27
  (package
    (name "rust-epaint")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "epaint" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xj16dv8vqc4vz27z0f1mv2dab7k74c3b5bhhg7llyk596qzi0dk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ab-glyph" ,rust-ab-glyph-0.2)
                       ("rust-ahash" ,rust-ahash-0.8)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-ecolor" ,rust-ecolor-0.27)
                       ("rust-emath" ,rust-emath-0.27)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-nohash-hasher" ,rust-nohash-hasher-0.2)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-puffin" ,rust-puffin-0.19)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/emilk/egui/tree/master/crates/epaint")
    (synopsis "Minimal 2D graphics library for GUI work")
    (description
     "This package provides Minimal 2D graphics library for GUI work.")
    (license (list license:expat license:expat license:silofl1.1 license:expat))))

(define-public rust-epaint-0.24
  (package
    (name "rust-epaint")
    (version "0.24.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "epaint" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f7szv3waqb5jcip4v3zfwzqpqjvfkvzjy6f6nsvkfi11l09w6vx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ab-glyph" ,rust-ab-glyph-0.2)
                       ("rust-ahash" ,rust-ahash-0.8)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-ecolor" ,rust-ecolor-0.24)
                       ("rust-emath" ,rust-emath-0.24)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-nohash-hasher" ,rust-nohash-hasher-0.2)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/emilk/egui/tree/master/crates/epaint")
    (synopsis "Minimal 2D graphics library for GUI work")
    (description
     "This package provides Minimal 2D graphics library for GUI work.")
    (license (list license:expat license:expat license:silofl1.1 license:expat))))

(define-public rust-error-code-3
  (package
    (name "rust-error-code")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "error-code" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nqpbhi501z3ydaxg4kjyb68xcw025cj22prwabiky0xsljl8ix0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/DoumanAsh/error-code")
    (synopsis "Error code")
    (description "This package provides Error code.")
    (license license:boost1.0)))

(define-public rust-ffmpeg-next-7
  (package
    (name "rust-ffmpeg-next")
    (version "7.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ffmpeg-next" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yd9wb10mwh6b6x9hlxi906sy3fm4v515z275925w9z0i216j0ns"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2.6)
                       ("rust-ffmpeg-sys-next" ,rust-ffmpeg-sys-next-7)
                       ("rust-image" ,rust-image-0.25)
                       ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/zmwangx/rust-ffmpeg#readme")
    (synopsis
     "Safe FFmpeg wrapper (FFmpeg 4 compatible fork of the ffmpeg crate)")
    (description
     "This package provides Safe FFmpeg wrapper (FFmpeg 4 compatible fork of the ffmpeg crate).")
    (license license:wtfpl2)))

(define-public rust-ffmpeg-sys-next-7
  (package
    (name "rust-ffmpeg-sys-next")
    (version "7.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ffmpeg-sys-next" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0igyml28fvx9jh7vcwc7j09kgn4xdh68dl4r6q47sbsb196j7hrb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bindgen" ,rust-bindgen-0.70)
                       ("rust-cc" ,rust-cc-1.1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-num-cpus" ,rust-num-cpus-1)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (home-page "https://github.com/zmwangx/rust-ffmpeg-sys")
    (synopsis "FFI bindings to FFmpeg")
    (description "This package provides FFI bindings to FFmpeg.")
    (license license:wtfpl2)))

(define-public rust-fiat-crypto-0.2
  (package
    (name "rust-fiat-crypto")
    (version "0.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fiat-crypto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07c1vknddv3ak7w89n85ik0g34nzzpms6yb845vrjnv9m4csbpi8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/mit-plv/fiat-crypto")
    (synopsis "Fiat-crypto generated Rust")
    (description "This package provides Fiat-crypto generated Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-figment-0.10
  (package
    (name "rust-figment")
    (version "0.10.19")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "figment" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ww9sxdzjj2i80w7bq0kllnymjyrfb1cdx2h70ap5wqcdga1rc4c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atomic" ,rust-atomic-0.6)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-pear" ,rust-pear-0.2)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-serde-yaml" ,rust-serde-yaml-0.9)
                       ("rust-tempfile" ,rust-tempfile-3.10.1)
                       ("rust-toml" ,rust-toml-0.8)
                       ("rust-uncased" ,rust-uncased-0.9)
                       ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/SergioBenitez/Figment")
    (synopsis "configuration library so con-free, it's unreal.")
    (description
     "This package provides a configuration library so con-free, it's unreal.")
    (license (list license:expat license:asl2.0))))

(define-public rust-file-per-thread-logger-0.2
  (package
    (name "rust-file-per-thread-logger")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "file-per-thread-logger" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ww3yqf7mdpdwb9b75rcbmxw3zg6wnny9jn8604sz2dg6cfc4g4a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-env-logger" ,rust-env-logger-0.10)
                       ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/bnjbvr/file-per-thread-logger")
    (synopsis "logging implementation that writes logs in one file per thread")
    (description
     "This package provides a logging implementation that writes logs in one file per
thread.")
    (license license:asl2.0)))

(define-public rust-filecheck-0.5
  (package
    (name "rust-filecheck")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "filecheck" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1amvf0jyhrrk16lvjwrxnrv46qv3k9xynw11p3w3aj3wgd10pq1g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-regex" ,rust-regex-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/CraneStation/filecheck")
    (synopsis
     "Library for writing tests for utilities that read text files and produce text output")
    (description
     "This package provides Library for writing tests for utilities that read text files and produce text
output.")
    (license license:asl2.0)))

(define-public rust-finl-unicode-1
  (package
    (name "rust-finl-unicode")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "finl_unicode" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ipdx778849czik798sjbgk5yhwxqybydac18d2g9jb20dxdrkwg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://finl.xyz")
    (synopsis
     "Library for handling Unicode functionality for finl (categories and grapheme segmentation)")
    (description
     "This package provides Library for handling Unicode functionality for finl (categories and grapheme
segmentation).")
    (license (list license:expat license:asl2.0))))

(define-public rust-fluent-0.16
  (package
    (name "rust-fluent")
    (version "0.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fluent" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0njmdpwz52yjzyp55iik9k6vrixqiy7190d98pk0rgdy0x3n6x5v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fluent-bundle" ,rust-fluent-bundle-0.15)
                       ("rust-fluent-pseudo" ,rust-fluent-pseudo-0.3)
                       ("rust-unic-langid" ,rust-unic-langid-0.9))))
    (home-page "http://www.projectfluent.org")
    (synopsis
     "localization system designed to unleash the entire expressive power of
natural language translations.")
    (description
     "This package provides a localization system designed to unleash the entire
expressive power of natural language translations.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fluent-bundle-0.15
  (package
    (name "rust-fluent-bundle")
    (version "0.15.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fluent-bundle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14zl0cjn361is69pb1zry4k2zzh5nzsfv0iz05wccl00x0ga5q3z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fluent-langneg" ,rust-fluent-langneg-0.13)
                       ("rust-fluent-syntax" ,rust-fluent-syntax-0.11)
                       ("rust-intl-memoizer" ,rust-intl-memoizer-0.5)
                       ("rust-intl-pluralrules" ,rust-intl-pluralrules-7)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-self-cell" ,rust-self-cell-0.10)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-unic-langid" ,rust-unic-langid-0.9))))
    (home-page "http://www.projectfluent.org")
    (synopsis
     "localization system designed to unleash the entire expressive power of
natural language translations.")
    (description
     "This package provides a localization system designed to unleash the entire
expressive power of natural language translations.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fluent-langneg-0.13
  (package
    (name "rust-fluent-langneg")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fluent-langneg" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "152yxplc11vmxkslvmaqak9x86xnavnhdqyhrh38ym37jscd0jic"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unic-langid" ,rust-unic-langid-0.9))))
    (home-page "http://projectfluent.org/")
    (synopsis "library for language and locale negotiation.")
    (description
     "This package provides a library for language and locale negotiation.")
    (license license:asl2.0)))

(define-public rust-fluent-pseudo-0.3
  (package
    (name "rust-fluent-pseudo")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fluent-pseudo" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mp5rib3mzhiwbw9s3g0climzy4wxxp0angn5ycmspl0gdid6d81"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-regex" ,rust-regex-1))))
    (home-page "http://www.projectfluent.org")
    (synopsis
     "Pseudolocalization transformation API for use with Project Fluent API.")
    (description
     "This package provides Pseudolocalization transformation API for use with Project Fluent API.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fluent-syntax-0.11
  (package
    (name "rust-fluent-syntax")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fluent-syntax" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gd3cdvsx9ymbb8hijcsc9wyf8h1pbcbpsafg4ldba56ji30qlra"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "http://www.projectfluent.org")
    (synopsis "Parser/Serializer tools for Fluent Syntax.")
    (description
     "This package provides Parser/Serializer tools for Fluent Syntax.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fontconfig-parser-0.5
  (package
    (name "rust-fontconfig-parser")
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fontconfig-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kfqacd2m7rpcnhs4wdp2610b4h4hdlzr783jrv136j3a2smqnba"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4.21)
                       ("rust-roxmltree" ,rust-roxmltree-0.19)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/Riey/fontconfig-parser")
    (synopsis "fontconfig file parser in pure Rust")
    (description "This package provides fontconfig file parser in pure Rust.")
    (license license:expat)))

(define-public rust-fontdb-0.14
  (package
    (name "rust-fontdb")
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fontdb" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17pwk5s3mn7l3d36plx1b3q9c4lqf93jbjjbx3bhf4zjm2z8r3dg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fontconfig-parser" ,rust-fontconfig-parser-0.5)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-memmap2" ,rust-memmap2-0.6)
                       ("rust-slotmap" ,rust-slotmap-1)
                       ("rust-tinyvec" ,rust-tinyvec-1)
                       ("rust-ttf-parser" ,rust-ttf-parser-0.19))))
    (home-page "https://github.com/RazrFalcon/fontdb")
    (synopsis "simple, in-memory font database with CSS-like queries.")
    (description
     "This package provides a simple, in-memory font database with CSS-like queries.")
    (license license:expat)))

(define-public rust-fontdb-0.10
  (package
    (name "rust-fontdb")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fontdb" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1r8v0w0s52a4jnkal63dxkkxcxyi78ihhg9byhh6m1rv7wmpacc1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fontconfig-parser" ,rust-fontconfig-parser-0.5)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-memmap2" ,rust-memmap2-0.5)
                       ("rust-ttf-parser" ,rust-ttf-parser-0.17))))
    (home-page "https://github.com/RazrFalcon/fontdb")
    (synopsis "simple, in-memory font database with CSS-like queries.")
    (description
     "This package provides a simple, in-memory font database with CSS-like queries.")
    (license license:expat)))

(define-public rust-fs-set-times-0.20
  (package
    (name "rust-fs-set-times")
    (version "0.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fs-set-times" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yxqkl8khk1593ribn4s9v60vf375gi9sgw9hq6nk5svf9yk6fq3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/bytecodealliance/fs-set-times")
    (synopsis "Set filesystem timestamps")
    (description "This package provides Set filesystem timestamps.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-futures-codec-0.4
  (package
    (name "rust-futures-codec")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures_codec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nzadpxhdxdlnlk2f0gfn0qbifqc3pbnzm10v4z04x8ciczxcm6f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-0.5)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-pin-project" ,rust-pin-project-0.4)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-cbor" ,rust-serde-cbor-0.11)
                       ("rust-serde-json" ,rust-serde-json-1.0.117))))
    (home-page "https://github.com/matthunz/futures-codec")
    (synopsis "Utilities for encoding and decoding frames using `async/await`")
    (description
     "This package provides Utilities for encoding and decoding frames using `async/await`.")
    (license license:expat)))

(define-public rust-futures-rustls-0.24
  (package
    (name "rust-futures-rustls")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0a1acak02s42wh6qjmjyviscc5j77qsh1qrqd023hdqqikv3rg9m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-rustls" ,rust-rustls-0.21))))
    (home-page "https://github.com/quininer/futures-rustls")
    (synopsis "Asynchronous TLS/SSL streams for futures using Rustls")
    (description
     "This package provides Asynchronous TLS/SSL streams for futures using Rustls.")
    (license (list license:expat license:asl2.0))))

(define-public rust-fxprof-processed-profile-0.6
  (package
    (name "rust-fxprof-processed-profile")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fxprof-processed-profile" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ggsn3im2bfcnxic0jzk00qgiacfrg2as6i4d8kj87kzxl52rl97"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-debugid" ,rust-debugid-0.8)
                       ("rust-fxhash" ,rust-fxhash-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/mstange/samply/")
    (synopsis
     "Create profiles in the Firefox Profiler's processed profile JSON format")
    (description
     "This package provides Create profiles in the Firefox Profiler's processed profile JSON format.")
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
                       ("rust-libc" ,rust-libc-0.2.155)
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

(define-public rust-gettext-0.4
  (package
    (name "rust-gettext")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gettext" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wd9kfy7nmbrqx2znw186la99as8y265lvh3pvj9fn9xfm75kfwy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-encoding" ,rust-encoding-0.2))))
    (home-page "https://github.com/justinas/gettext")
    (synopsis "An implementation of Gettext translation framework for Rust")
    (description
     "This package provides An implementation of Gettext translation framework for Rust.")
    (license license:expat)))

(define-public rust-ghash-0.4
  (package
    (name "rust-ghash")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ghash" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "169wvrc2k9lw776x3pmqp76kc0w5717wz01bfg9rz0ypaqbcr0qm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-opaque-debug" ,rust-opaque-debug-0.3)
                       ("rust-polyval" ,rust-polyval-0.5)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/RustCrypto/universal-hashes")
    (synopsis
     "Universal hash over GF(2^128) useful for constructing a Message Authentication Code (MAC),
as in the AES-GCM authenticated encryption cipher.")
    (description
     "This package provides Universal hash over GF(2^128) useful for constructing a Message Authentication
Code (MAC), as in the AES-GCM authenticated encryption cipher.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-gif-0.13
  (package
    (name "rust-gif")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gif" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1whrkvdg26gp1r7f95c6800y6ijqw5y0z8rgj6xihpi136dxdciz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-color-quant" ,rust-color-quant-1)
                       ("rust-weezl" ,rust-weezl-0.1))))
    (home-page "https://github.com/image-rs/image-gif")
    (synopsis "GIF de- and encoder")
    (description "This package provides GIF de- and encoder.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gimli-0.31
  (package
    (name "rust-gimli")
    (version "0.31.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gvqc0ramx8szv76jhfd4dms0zyamvlg4whhiz11j34hh3dqxqh7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis "library for reading and writing the DWARF debugging format.")
    (description
     "This package provides a library for reading and writing the DWARF debugging
format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gimli-0.30
  (package
    (name "rust-gimli")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jfz1sj9h0rnlhjnmy315db2drsn54f0b5qcpndvl8lpprzxkqg2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis "library for reading and writing the DWARF debugging format.")
    (description
     "This package provides a library for reading and writing the DWARF debugging
format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gimli-0.29
  (package
    (name "rust-gimli")
    (version "0.29.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zgzprnjaawmg6zyic4f2q2hc39kdhn116qnkqpgvsasgc3x9v20"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis "library for reading and writing the DWARF debugging format.")
    (description
     "This package provides a library for reading and writing the DWARF debugging
format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-0.61
  (package
    (name "rust-gix")
    (version "0.61.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xyqvr0hs4p4i8jl59hx5j2gin4y7k7nx3g9iq2xw05z8jdfbq74"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-curl" ,rust-curl-0.4)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-actor" ,rust-gix-actor-0.31)
                       ("rust-gix-archive" ,rust-gix-archive-0.11)
                       ("rust-gix-attributes" ,rust-gix-attributes-0.22)
                       ("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-commitgraph" ,rust-gix-commitgraph-0.24)
                       ("rust-gix-config" ,rust-gix-config-0.36)
                       ("rust-gix-credentials" ,rust-gix-credentials-0.24)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-diff" ,rust-gix-diff-0.42)
                       ("rust-gix-dir" ,rust-gix-dir-0.3)
                       ("rust-gix-discover" ,rust-gix-discover-0.31)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-filter" ,rust-gix-filter-0.11)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-hashtable" ,rust-gix-hashtable-0.5)
                       ("rust-gix-ignore" ,rust-gix-ignore-0.11)
                       ("rust-gix-index" ,rust-gix-index-0.31)
                       ("rust-gix-lock" ,rust-gix-lock-13)
                       ("rust-gix-macros" ,rust-gix-macros-0.1)
                       ("rust-gix-mailmap" ,rust-gix-mailmap-0.23)
                       ("rust-gix-negotiate" ,rust-gix-negotiate-0.13)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-odb" ,rust-gix-odb-0.59)
                       ("rust-gix-pack" ,rust-gix-pack-0.49)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-pathspec" ,rust-gix-pathspec-0.7)
                       ("rust-gix-prompt" ,rust-gix-prompt-0.8)
                       ("rust-gix-protocol" ,rust-gix-protocol-0.44)
                       ("rust-gix-ref" ,rust-gix-ref-0.43)
                       ("rust-gix-refspec" ,rust-gix-refspec-0.23)
                       ("rust-gix-revision" ,rust-gix-revision-0.27)
                       ("rust-gix-revwalk" ,rust-gix-revwalk-0.13)
                       ("rust-gix-sec" ,rust-gix-sec-0.10)
                       ("rust-gix-status" ,rust-gix-status-0.8)
                       ("rust-gix-submodule" ,rust-gix-submodule-0.10)
                       ("rust-gix-tempfile" ,rust-gix-tempfile-13)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-transport" ,rust-gix-transport-0.41)
                       ("rust-gix-traverse" ,rust-gix-traverse-0.38)
                       ("rust-gix-url" ,rust-gix-url-0.27)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-gix-validate" ,rust-gix-validate-0.8)
                       ("rust-gix-worktree" ,rust-gix-worktree-0.32)
                       ("rust-gix-worktree-state" ,rust-gix-worktree-state-0.9)
                       ("rust-gix-worktree-stream" ,rust-gix-worktree-stream-0.11)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-prodash" ,rust-prodash-28)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-reqwest" ,rust-reqwest-0.11)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Interact with git repositories just like git would")
    (description
     "This package provides Interact with git repositories just like git would.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-actor-0.31
  (package
    (name "rust-gix-actor")
    (version "0.31.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-actor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zydagiaxww9g5l5fhrbyd2yj3yzss4n1zdnhm1wkrn7jb9mk76n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "way to identify git actors")
    (description "This package provides a way to identify git actors.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-archive-0.11
  (package
    (name "rust-gix-archive")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-archive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1knc5yclpafkgnbxk52wp9pyr7vh9pif7kgynj6a5nn6sfgzxk1j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-worktree-stream" ,rust-gix-worktree-stream-0.11)
                       ("rust-tar" ,rust-tar-0.4)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-time" ,rust-time-0.3.36)
                       ("rust-zip" ,rust-zip-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "archive generation from of a worktree stream")
    (description
     "This package provides archive generation from of a worktree stream.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-attributes-0.22
  (package
    (name "rust-gix-attributes")
    (version "0.22.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-attributes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1j7cyx9vkffw8ln7dvc9jmx1rgiixia9mx130156l4xc5vs4iyzf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-quote" ,rust-gix-quote-0.4)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-kstring" ,rust-kstring-2)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-unicode-bom" ,rust-unicode-bom-2))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing .gitattributes files")
    (description
     "This package provides a crate of the gitoxide project dealing .gitattributes
files.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-bitmap-0.2
  (package
    (name "rust-gix-bitmap")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-bitmap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bl7gqqlsdwngvvpgj6cby07cwidf7m0yk6wv473zqflrdkdnwd3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project dedicated implementing the standard git bitmap format")
    (description
     "This package provides a crate of the gitoxide project dedicated implementing the
standard git bitmap format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-chunk-0.4
  (package
    (name "rust-gix-chunk")
    (version "0.4.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-chunk" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lhcmzamr5rlcw8h9bvsjqn9dak1mwj3ng2i1djaf6wnd48pbj25"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "Interact with the git chunk file format used in multi-pack index and commit-graph files")
    (description
     "This package provides Interact with the git chunk file format used in multi-pack index and
commit-graph files.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-command-0.3
  (package
    (name "rust-gix-command")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-command" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09f29p1lfqf57023nvvjznj9shym484mrp2wzqzw95a0663f08kc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-shell-words" ,rust-shell-words-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project handling internal git command execution")
    (description
     "This package provides a crate of the gitoxide project handling internal git
command execution.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-commitgraph-0.24
  (package
    (name "rust-gix-commitgraph")
    (version "0.24.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-commitgraph" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1i0jrf5msqx8ry8z7skj4bxh1ifpfr8knh93i3qlmnl520qh5cgp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-chunk" ,rust-gix-chunk-0.4)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Read-only access to the git commitgraph file format")
    (description
     "This package provides Read-only access to the git commitgraph file format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-config-0.36
  (package
    (name "rust-gix-config")
    (version "0.36.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-config" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rd61kgvdxlvz4d1f5z5zyiydh71jbmsq7jfs1x394z8jrcy103m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-config-value" ,rust-gix-config-value-0.14)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-ref" ,rust-gix-ref-0.43)
                       ("rust-gix-sec" ,rust-gix-sec-0.10)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-unicode-bom" ,rust-unicode-bom-2)
                       ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "git-config file parser and editor from the gitoxide project")
    (description
     "This package provides a git-config file parser and editor from the gitoxide
project.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-config-value-0.14
  (package
    (name "rust-gix-config-value")
    (version "0.14.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-config-value" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0158q089kc151h3n0wk43fg4s28v0cjscll2r1w3mcx9n41n5l7v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project providing git-config value parsing")
    (description
     "This package provides a crate of the gitoxide project providing git-config value
parsing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-credentials-0.24
  (package
    (name "rust-gix-credentials")
    (version "0.24.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-credentials" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18fsixnzwa0qyd6pywldwkdhl3mas6976g4s68cp2g5xhdhi8w2w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-config-value" ,rust-gix-config-value-0.14)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-prompt" ,rust-gix-prompt-0.8)
                       ("rust-gix-sec" ,rust-gix-sec-0.10)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-url" ,rust-gix-url-0.27)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project to interact with git credentials helpers")
    (description
     "This package provides a crate of the gitoxide project to interact with git
credentials helpers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-date-0.8
  (package
    (name "rust-gix-date")
    (version "0.8.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-date" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16gs32jn6dilmsbpalxb9r9i69q8l6vciiy50kyh8aqc7c4yjzin"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-time" ,rust-time-0.3.36))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project parsing dates the way git does")
    (description
     "This package provides a crate of the gitoxide project parsing dates the way git
does.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-diff-0.42
  (package
    (name "rust-gix-diff")
    (version "0.42.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-diff" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1i4sz4hsdpfjcyxhr8xsfb57ribxkj8f1b9lln04kxrf7ichbrkq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-filter" ,rust-gix-filter-0.11)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-tempfile" ,rust-gix-tempfile-13)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-worktree" ,rust-gix-worktree-0.32)
                       ("rust-imara-diff" ,rust-imara-diff-0.1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Calculate differences between various git objects")
    (description
     "This package provides Calculate differences between various git objects.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-dir-0.3
  (package
    (name "rust-gix-dir")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-dir" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ckd5iw7pisd8bvfp7xfmh4pk17483kawy26awbhr41hj79cq4rl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-discover" ,rust-gix-discover-0.31)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-gix-ignore" ,rust-gix-ignore-0.11)
                       ("rust-gix-index" ,rust-gix-index-0.31)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-pathspec" ,rust-gix-pathspec-0.7)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-gix-worktree" ,rust-gix-worktree-0.32)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing with directory walks")
    (description
     "This package provides a crate of the gitoxide project dealing with directory
walks.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-discover-0.31
  (package
    (name "rust-gix-discover")
    (version "0.31.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-discover" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cc22hhj3w95jwsl2r6cihys6k65xz03sivyyz510dzdhy8b9fk4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-dunce" ,rust-dunce-1)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-ref" ,rust-gix-ref-0.43)
                       ("rust-gix-sec" ,rust-gix-sec-0.10)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "Discover git repositories and check if a directory is a git repository")
    (description
     "This package provides Discover git repositories and check if a directory is a git repository.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-features-0.38
  (package
    (name "rust-gix-features")
    (version "0.38.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-features" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sfw6zs3qgmlqjkj4cvyfz6q6dgdlw1d16c7yckwgyg5kyn4aw5c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-bytesize" ,rust-bytesize-1)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-jwalk" ,rust-jwalk-0.8)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-prodash" ,rust-prodash-28)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-sha1-smol" ,rust-sha1-smol-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate to integrate various capabilities using compile-time feature flags")
    (description
     "This package provides a crate to integrate various capabilities using
compile-time feature flags.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-filter-0.11
  (package
    (name "rust-gix-filter")
    (version "0.11.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-filter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cja5wzh1w856i8mz8ba70n24b29w2ws2j1wqvdpmjlgmjjnxkh0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-gix-attributes" ,rust-gix-attributes-0.22)
                       ("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-packetline-blocking" ,rust-gix-packetline-blocking-0.17)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-quote" ,rust-gix-quote-0.4)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project implementing git filters")
    (description
     "This package provides a crate of the gitoxide project implementing git filters.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-fs-0.10
  (package
    (name "rust-gix-fs")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-fs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f1iwqvscsjvsvx23v974kczz27pmj0v9j1ig1kjj1ciwx04q672"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate providing file system specific utilities to `gitoxide`")
    (description
     "This package provides a crate providing file system specific utilities to
`gitoxide`.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-glob-0.16
  (package
    (name "rust-gix-glob")
    (version "0.16.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-glob" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1r5cgs9vyfycflvbhd000w6mmsyxvg86xixalx42rw0ck789m8n2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing with pattern matching")
    (description
     "This package provides a crate of the gitoxide project dealing with pattern
matching.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-hash-0.14
  (package
    (name "rust-gix-hash")
    (version "0.14.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-hash" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pjdlxbqxd9lbkccryfw2ghifiq3gz9h8ylliw0va8b16vvpsggr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-document-features" ,rust-document-features-0.2)
                       ("rust-faster-hex" ,rust-faster-hex-0.9)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "Borrowed and owned git hash digests used to identify git objects")
    (description
     "This package provides Borrowed and owned git hash digests used to identify git objects.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-hashtable-0.5
  (package
    (name "rust-gix-hashtable")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-hashtable" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hp2m2rvbv0vav5lkq7d7bvx74qrb6w3hnj1rq3aq69wdzhq1pvx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-parking-lot" ,rust-parking-lot-0.12))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate that provides hashtable based data structures optimized to utilize ObjectId keys")
    (description
     "This package provides a crate that provides hashtable based data structures
optimized to utilize @code{ObjectId} keys.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-ignore-0.11
  (package
    (name "rust-gix-ignore")
    (version "0.11.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-ignore" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wb33zq9pn9hs4d5abg34hxf8l039aim9xii9p0rz7w2ynsbw3b4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-unicode-bom" ,rust-unicode-bom-2))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing .gitignore files")
    (description
     "This package provides a crate of the gitoxide project dealing .gitignore files.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-index-0.31
  (package
    (name "rust-gix-index")
    (version "0.31.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-index" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rnjpxlqcpmvg9lcb0aij67x1w3a4sihcmg4gmd35kww7pqj35jl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-filetime" ,rust-filetime-0.2)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-gix-bitmap" ,rust-gix-bitmap-0.2)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-lock" ,rust-gix-lock-13)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-traverse" ,rust-gix-traverse-0.38)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "work-in-progress crate of the gitoxide project dedicated implementing the git index file")
    (description
     "This package provides a work-in-progress crate of the gitoxide project dedicated
implementing the git index file.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-lock-13
  (package
    (name "rust-gix-lock")
    (version "13.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-lock" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jfh6i58rqq624w0cr20gf4a0zlvg0wwp6ricch3bf013zw5khz7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gix-tempfile" ,rust-gix-tempfile-13)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "git-style lock-file implementation")
    (description "This package provides a git-style lock-file implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-macros-0.1
  (package
    (name "rust-gix-macros")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05ycxnh5sxjsn4lvay309n6knr8ksvkb6zx6f50ik24zc4iyk74r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Proc-macro utilities for gix")
    (description "This package provides Proc-macro utilities for gix.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-mailmap-0.23
  (package
    (name "rust-gix-mailmap")
    (version "0.23.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-mailmap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1grjdjghbbjdfbiw0xpc19km9h1v54gs7x8paddb53q5s7x84c6g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-actor" ,rust-gix-actor-0.31)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project for parsing mailmap files")
    (description
     "This package provides a crate of the gitoxide project for parsing mailmap files.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-negotiate-0.13
  (package
    (name "rust-gix-negotiate")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-negotiate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11311lqpmh018drg5lyp4lc1wir4l1yr9ph1br4ml5adaiafqzfm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-gix-commitgraph" ,rust-gix-commitgraph-0.24)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-revwalk" ,rust-gix-revwalk-0.13)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project implementing negotiation algorithms")
    (description
     "This package provides a crate of the gitoxide project implementing negotiation
algorithms.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-object-0.42
  (package
    (name "rust-gix-object")
    (version "0.42.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-object" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pz1bb7ps05izla94ry4hdch01w11iivsvifjh66h70r855drqhz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-actor" ,rust-gix-actor-0.31)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-gix-validate" ,rust-gix-validate-0.8)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "Immutable and mutable git objects with decoding and encoding support")
    (description
     "This package provides Immutable and mutable git objects with decoding and encoding support.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-odb-0.59
  (package
    (name "rust-gix-odb")
    (version "0.59.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-odb" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vhpzakavhcfd7y8k1qxk39fw8b7whfd57bdys036s8rqxw57dc1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arc-swap" ,rust-arc-swap-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-pack" ,rust-gix-pack-0.49)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-quote" ,rust-gix-quote-0.4)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-tempfile" ,rust-tempfile-3.10.1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Implements various git object databases")
    (description "This package implements various git object databases.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-pack-0.49
  (package
    (name "rust-gix-pack")
    (version "0.49.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-pack" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c7c2j39vd207fq0a5s1nipmqkhwpdlmr7va6jx4mmha0fmax4b3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clru" ,rust-clru-0.6)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-chunk" ,rust-gix-chunk-0.4)
                       ("rust-gix-diff" ,rust-gix-diff-0.42)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-hashtable" ,rust-gix-hashtable-0.5)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-tempfile" ,rust-gix-tempfile-13)
                       ("rust-gix-traverse" ,rust-gix-traverse-0.38)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-uluru" ,rust-uluru-3))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Implements git packs and related data structures")
    (description
     "This package implements git packs and related data structures.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-packetline-0.17
  (package
    (name "rust-gix-packetline")
    (version "0.17.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-packetline" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05d5airkhk7pykgs4p1nwvscv62hb106xyjxnvavc0q9vaz8c15p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-faster-hex" ,rust-faster-hex-0.9)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-2)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project implementing the pkt-line serialization format")
    (description
     "This package provides a crate of the gitoxide project implementing the pkt-line
serialization format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-packetline-blocking-0.17
  (package
    (name "rust-gix-packetline-blocking")
    (version "0.17.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-packetline-blocking" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jp1fz5mqbikh1xfrxyc1qv57lnh62crg2fmwhr4fa1xi8vl47f3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-faster-hex" ,rust-faster-hex-0.9)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "duplicate of `gix-packetline` with the `blocking-io` feature pre-selected")
    (description
     "This package provides a duplicate of `gix-packetline` with the `blocking-io`
feature pre-selected.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-path-0.10
  (package
    (name "rust-gix-path")
    (version "0.10.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-path" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10w7abk2wcp0w2y943sdlsic3xc91d6qr29zjinilsbmykq3qqi3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-home" ,rust-home-0.5)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project dealing paths and their conversions")
    (description
     "This package provides a crate of the gitoxide project dealing paths and their
conversions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-pathspec-0.7
  (package
    (name "rust-gix-pathspec")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-pathspec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06gfl9aiq84wg9fbf45zniylvskd36znckv3kzca42y1il4snv57"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-attributes" ,rust-gix-attributes-0.22)
                       ("rust-gix-config-value" ,rust-gix-config-value-0.14)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing magical pathspecs")
    (description
     "This package provides a crate of the gitoxide project dealing magical pathspecs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-prompt-0.8
  (package
    (name "rust-gix-prompt")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-prompt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1k00y2nzrm9y0ihpyqrg39ydwfx5kyqj6iiwmc01c90wqp3vpnpx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-config-value" ,rust-gix-config-value-0.14)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project for handling prompts in the terminal")
    (description
     "This package provides a crate of the gitoxide project for handling prompts in
the terminal.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-protocol-0.44
  (package
    (name "rust-gix-protocol")
    (version "0.44.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-protocol" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "169vnddd4wapba6lpn8w6qw3snwwi25gk0929xpyvn3fjh0cs1d9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-2)
                       ("rust-gix-credentials" ,rust-gix-credentials-0.24)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-transport" ,rust-gix-transport-0.41)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-maybe-async" ,rust-maybe-async-0.2)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project for implementing git protocols")
    (description
     "This package provides a crate of the gitoxide project for implementing git
protocols.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-quote-0.4
  (package
    (name "rust-gix-quote")
    (version "0.4.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-quote" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zyrl6qchw2f6j25ian699ifzas3a5a2zrhflwjpmym3ksdlzzyb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project dealing with various quotations used by git")
    (description
     "This package provides a crate of the gitoxide project dealing with various
quotations used by git.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-ref-0.43
  (package
    (name "rust-gix-ref")
    (version "0.43.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-ref" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rbvqwv5prqdi84qkf4xaxj16s7hkabjiwvdbns1q415p5lbljpx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-actor" ,rust-gix-actor-0.31)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-lock" ,rust-gix-lock-13)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-tempfile" ,rust-gix-tempfile-13)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-gix-validate" ,rust-gix-validate-0.8)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate to handle git references")
    (description "This package provides a crate to handle git references.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-refspec-0.23
  (package
    (name "rust-gix-refspec")
    (version "0.23.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-refspec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cl0z2nbid2jxp9l46q67npqx9p9s0akymxlv7j4z99lb234is6x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-revision" ,rust-gix-revision-0.27)
                       ("rust-gix-validate" ,rust-gix-validate-0.8)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project for parsing and representing refspecs")
    (description
     "This package provides a crate of the gitoxide project for parsing and
representing refspecs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-revision-0.27
  (package
    (name "rust-gix-revision")
    (version "0.27.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-revision" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0arvn7wkbhpfspqr75w4rpvb6z2c10w4rfyg7fl967zd0y0qzq33"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-hashtable" ,rust-gix-hashtable-0.5)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-revwalk" ,rust-gix-revwalk-0.13)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project dealing with finding names for revisions and parsing specifications")
    (description
     "This package provides a crate of the gitoxide project dealing with finding names
for revisions and parsing specifications.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-revwalk-0.13
  (package
    (name "rust-gix-revwalk")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-revwalk" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13vq7rx1dwfp9llvahdli2vlryb1pffmd4cf4pyx1lfnzjfdp0a1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gix-commitgraph" ,rust-gix-commitgraph-0.24)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-hashtable" ,rust-gix-hashtable-0.5)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate providing utilities for walking the revision graph")
    (description
     "This package provides a crate providing utilities for walking the revision
graph.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-sec-0.10
  (package
    (name "rust-gix-sec")
    (version "0.10.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-sec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18brd8k370ddq19fbq04fkq8ry84b1ar0xz90gfj0fv49ac2gp7x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project providing a shared trust model")
    (description
     "This package provides a crate of the gitoxide project providing a shared trust
model.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-status-0.8
  (package
    (name "rust-gix-status")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-status" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wkb0jfn233xj9damdxaqzkji5kglwd8bicyyq4sgv27k6w6s8fa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-filetime" ,rust-filetime-0.2)
                       ("rust-gix-diff" ,rust-gix-diff-0.42)
                       ("rust-gix-dir" ,rust-gix-dir-0.3)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-filter" ,rust-gix-filter-0.11)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-index" ,rust-gix-index-0.31)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-pathspec" ,rust-gix-pathspec-0.7)
                       ("rust-gix-worktree" ,rust-gix-worktree-0.32)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project dealing with 'git status'-like functionality")
    (description
     "This package provides a crate of the gitoxide project dealing with git
status'-like functionality.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-submodule-0.10
  (package
    (name "rust-gix-submodule")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-submodule" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v131krfd5avz321qhqvhjdmp2p4bz1iyk6lxhplfqk3cq2ymdsg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-config" ,rust-gix-config-0.36)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-pathspec" ,rust-gix-pathspec-0.7)
                       ("rust-gix-refspec" ,rust-gix-refspec-0.23)
                       ("rust-gix-url" ,rust-gix-url-0.27)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing git submodules")
    (description
     "This package provides a crate of the gitoxide project dealing git submodules.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-tempfile-13
  (package
    (name "rust-gix-tempfile")
    (version "13.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-tempfile" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "048dd8s7w7ph0rlkig9n70kk7hyy094qx4l5brkkni7ljijxfqd7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-dashmap" ,rust-dashmap-5)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-signal-hook-registry" ,rust-signal-hook-registry-1)
                       ("rust-tempfile" ,rust-tempfile-3.10.1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "tempfile implementation with a global registry to assure cleanup")
    (description
     "This package provides a tempfile implementation with a global registry to assure
cleanup.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-trace-0.1
  (package
    (name "rust-gix-trace")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-trace" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zhm2lwqr070rq3bdn4b1zjs7mn7bhlkfgwfap6xspwi11s2c97r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-document-features" ,rust-document-features-0.2)
                       ("rust-tracing-core" ,rust-tracing-core-0.1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate to provide minimal `tracing` support that can be turned off to zero cost")
    (description
     "This package provides a crate to provide minimal `tracing` support that can be
turned off to zero cost.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-transport-0.41
  (package
    (name "rust-gix-transport")
    (version "0.41.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-transport" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17gdw7mmnw9sbqgi2qlb86i41d97fkna9f8l8zj9xbcwxir5z3ng"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-curl" ,rust-curl-0.4)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-2)
                       ("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-credentials" ,rust-gix-credentials-0.24)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-packetline" ,rust-gix-packetline-0.17)
                       ("rust-gix-quote" ,rust-gix-quote-0.4)
                       ("rust-gix-sec" ,rust-gix-sec-0.10)
                       ("rust-gix-url" ,rust-gix-url-0.27)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-reqwest" ,rust-reqwest-0.11)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project dedicated to implementing the git transport layer")
    (description
     "This package provides a crate of the gitoxide project dedicated to implementing
the git transport layer.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-traverse-0.38
  (package
    (name "rust-gix-traverse")
    (version "0.38.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-traverse" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kzhkgddf7jyjmxdirg96a9s21jwh7jb324pl01m80kpqx5ziblm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gix-commitgraph" ,rust-gix-commitgraph-0.24)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-hashtable" ,rust-gix-hashtable-0.5)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-revwalk" ,rust-gix-revwalk-0.13)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project")
    (description "This package provides a crate of the gitoxide project.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-url-0.27
  (package
    (name "rust-gix-url")
    (version "0.27.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-url" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kyiah4kjqli6swc1frdlys6vpwi6lwysymy6az0y656vkmjkf0d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-home" ,rust-home-0.5)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project implementing parsing and serialization of gix-url")
    (description
     "This package provides a crate of the gitoxide project implementing parsing and
serialization of gix-url.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-utils-0.1
  (package
    (name "rust-gix-utils")
    (version "0.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1p6lschmdrg1j9cd3rm6q96dyrvivzi2305d7ck1588gzpvjs69m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-fastrand" ,rust-fastrand-2)
                       ("rust-unicode-normalization" ,rust-unicode-normalization-0.1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate with `gitoxide` utilities that don't need feature toggles")
    (description
     "This package provides a crate with `gitoxide` utilities that don't need feature
toggles.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-validate-0.8
  (package
    (name "rust-gix-validate")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-validate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kqad8a2wdz69ma7hspi21pazgpkrc5hg4iw37gsvca99b9pvhl2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Validation functions for various kinds of names in git")
    (description
     "This package provides Validation functions for various kinds of names in git.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-worktree-0.32
  (package
    (name "rust-gix-worktree")
    (version "0.32.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-worktree" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "174nxz96nxssd241fjzn2nlz0mqwk0x4c1by33mnihgfz4xf0y7y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-attributes" ,rust-gix-attributes-0.22)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-ignore" ,rust-gix-ignore-0.11)
                       ("rust-gix-index" ,rust-gix-index-0.31)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project for shared worktree related types and utilities.")
    (description
     "This package provides a crate of the gitoxide project for shared worktree
related types and utilities.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-worktree-state-0.9
  (package
    (name "rust-gix-worktree-state")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-worktree-state" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0px27a5w7hrzh7jzcymgq0rz2y5khz6qgri42ly9aw2dd7qhjn2n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-filter" ,rust-gix-filter-0.11)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-index" ,rust-gix-index-0.31)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-worktree" ,rust-gix-worktree-0.32)
                       ("rust-io-close" ,rust-io-close-0.3)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project implementing setting the worktree to a particular state")
    (description
     "This package provides a crate of the gitoxide project implementing setting the
worktree to a particular state.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-worktree-stream-0.11
  (package
    (name "rust-gix-worktree-stream")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-worktree-stream" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fihrlacjvyyh1zi62z4ggb7hbln75vxgyflz2098jw99pra69k3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gix-attributes" ,rust-gix-attributes-0.22)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-filter" ,rust-gix-filter-0.11)
                       ("rust-gix-fs" ,rust-gix-fs-0.10)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-traverse" ,rust-gix-traverse-0.38)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "generate a byte-stream from a git-tree")
    (description
     "This package provides generate a byte-stream from a git-tree.")
    (license (list license:expat license:asl2.0))))

(define-public rust-globwalk-0.9
  (package
    (name "rust-globwalk")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "globwalk" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mz7bsa66p2rrgnz3l94ac4kbklh7mq8j30iizyxjy4qyvmn1xqb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-ignore" ,rust-ignore-0.4)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/gilnaa/globwalk")
    (synopsis "Glob-matched recursive file system walking")
    (description
     "This package provides Glob-matched recursive file system walking.")
    (license license:expat)))

(define-public rust-glow-0.13
  (package
    (name "rust-glow")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glow" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1c91n554dp4bdp5d86rpl77ryv6rjyrqn7735m7mfcivqh28wd5x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-slotmap" ,rust-slotmap-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://github.com/grovesNL/glow.git")
    (synopsis
     "GL on Whatever: a set of bindings to run GL (Open GL, OpenGL ES, and WebGL) anywhere, and avoid target-specific code")
    (description
     "This package provides GL on Whatever: a set of bindings to run GL (Open GL, @code{OpenGL} ES, and
@code{WebGL}) anywhere, and avoid target-specific code.")
    (license (list license:expat license:asl2.0 license:zlib))))

(define-public rust-glutin-winit-0.4
  (package
    (name "rust-glutin-winit")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin-winit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dbppmj0m2i5df4ww565f5kg3vxmjbq5c7hqql988fzp4jxdzg0y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-aliases" ,rust-cfg-aliases-0.1)
                       ("rust-glutin" ,rust-glutin-0.31)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.5)
                       ("rust-winit" ,rust-winit-0.29))))
    (home-page "https://github.com/rust-windowing/glutin")
    (synopsis "Glutin bootstrapping helpers with winit")
    (description
     "This package provides Glutin bootstrapping helpers with winit.")
    (license license:expat)))

(define-public rust-glyph-names-0.2
  (package
    (name "rust-glyph-names")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glyph-names" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zw0pkjcpbvp22alk8kwirn4g33v9i05mdaz5alkn6kc5mq1sly3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/yeslogic/glyph-names")
    (synopsis
     "Mapping of characters to glyph names according to the Adobe Glyph List Specification")
    (description
     "This package provides Mapping of characters to glyph names according to the Adobe Glyph List
Specification.")
    (license license:bsd-3)))

(define-public rust-gpu-allocator-0.25
  (package
    (name "rust-gpu-allocator")
    (version "0.25.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gpu-allocator" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11484bhn0p8555gprr58kmz1aqccz1zqbx5ww4c3rl38i4qzcmkg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ash" ,rust-ash-0.37)
                       ("rust-egui" ,rust-egui-0.24)
                       ("rust-egui-extras" ,rust-egui-extras-0.24)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-presser" ,rust-presser-0.3)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-winapi" ,rust-winapi-0.3)
                       ("rust-windows" ,rust-windows-0.52))))
    (home-page "https://github.com/Traverse-Research/gpu-allocator")
    (synopsis "Memory allocator for GPU memory in Vulkan and DirectX 12")
    (description
     "This package provides Memory allocator for GPU memory in Vulkan and @code{DirectX} 12.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gpu-descriptor-0.2
  (package
    (name "rust-gpu-descriptor")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gpu-descriptor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b38pi460ajx8ksb61zxardwkpa27qgz8fpm252mczlfrqddy4fc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-gpu-descriptor-types" ,rust-gpu-descriptor-types-0.1)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/zakarumych/gpu-descriptor")
    (synopsis
     "Implementation agnostic descriptor allocator for Vulkan like APIs")
    (description
     "This package provides Implementation agnostic descriptor allocator for Vulkan like APIs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gpu-descriptor-types-0.1
  (package
    (name "rust-gpu-descriptor-types")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gpu-descriptor-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "135pp1b3bzyr7bfnb30rf9pkgy61h75w0jabi8fpw2q9dxpb7w3b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2))))
    (home-page "https://github.com/zakarumych/gpu-descriptor")
    (synopsis "Core types of gpu-descriptor crate")
    (description "This package provides Core types of gpu-descriptor crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-h2-0.4
  (package
    (name "rust-h2")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "h2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1aw62k5xnghpryjnlsbxxhjiwpxir6yi15l3y02w933s225f50ps"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atomic-waker" ,rust-atomic-waker-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-sink" ,rust-futures-sink-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/hyperium/h2")
    (synopsis "An HTTP/2 client and server")
    (description "This package provides An HTTP/2 client and server.")
    (license license:expat)))

(define-public rust-h2-0.3
  (package
    (name "rust-h2")
    (version "0.3.26")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "h2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s7msnfv7xprzs6xzfj5sg6p8bjcdpcqcmjjbkd345cyi1x55zl1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-sink" ,rust-futures-sink-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/hyperium/h2")
    (synopsis "An HTTP/2 client and server")
    (description "This package provides An HTTP/2 client and server.")
    (license license:expat)))

(define-public rust-h3-0.0.4
  (package
    (name "rust-h3")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "h3" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04clhh6b5iqlgnbppikbz4zpxl78g4vkyhyrjgnyg4vfkrmqij5i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-fastrand" ,rust-fastrand-2)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/hyperium/h3")
    (synopsis "An async HTTP/3 implementation")
    (description "This package provides An async HTTP/3 implementation.")
    (license license:expat)))

(define-public rust-h3-quinn-0.0.5
  (package
    (name "rust-h3-quinn")
    (version "0.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "h3-quinn" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ii06bi5a19k4qfkppn5019nw8xca2wzfl66cax949jc1v66ny3k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-h3" ,rust-h3-0.0.4)
                       ("rust-quinn" ,rust-quinn-0.10)
                       ("rust-quinn-proto" ,rust-quinn-proto-0.10)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7))))
    (home-page "https://github.com/hyperium/h3")
    (synopsis "QUIC transport implementation based on Quinn")
    (description
     "This package provides QUIC transport implementation based on Quinn.")
    (license license:expat)))

(define-public rust-hassle-rs-0.11
  (package
    (name "rust-hassle-rs")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hassle-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "147886vviw14zm2a3yh8gs1r81r5gy88lrpv67d4hk7kw5rpwamg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-com" ,rust-com-0.6)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-libloading" ,rust-libloading-0.7)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-widestring" ,rust-widestring-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/Traverse-Research/hassle-rs")
    (synopsis
     "HLSL compiler library, this crate provides an FFI layer and idiomatic rust wrappers for the new DXC HLSL compiler and validator")
    (description
     "This package provides HLSL compiler library, this crate provides an FFI layer and idiomatic rust
wrappers for the new DXC HLSL compiler and validator.")
    (license license:expat)))

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
                       ("rust-log" ,rust-log-0.4.21))))
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
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/algesten/hoot")
    (synopsis "hoot based library to emulate httpbin")
    (description
     "This package provides hoot based library to emulate httpbin.")
    (license (list license:expat license:asl2.0))))

(define-public rust-http-body-1
  (package
    (name "rust-http-body")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http-body" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hyn8n3iadrbwq8y0p1rl1275s4nm49bllw5wji29g4aa3dqbb0w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-http" ,rust-http-1))))
    (home-page "https://github.com/hyperium/http-body")
    (synopsis
     "Trait representing an asynchronous, streaming, HTTP request or response body.")
    (description
     "This package provides Trait representing an asynchronous, streaming, HTTP request or response body.")
    (license license:expat)))

(define-public rust-http-body-util-0.1.1
  (package
    (name "rust-http-body-util")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http-body-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07agldas2qgcfc05ckiarlmf9vzragbda823nqhrqrc6mjrghx84"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-http-body" ,rust-http-body-1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2))))
    (home-page "https://github.com/hyperium/http-body")
    (synopsis "Combinators and adapters for HTTP request or response bodies.")
    (description
     "This package provides Combinators and adapters for HTTP request or response bodies.")
    (license license:expat)))

(define-public rust-http-range-header-0.4
  (package
    (name "rust-http-range-header")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http-range-header" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12hnsmb8kq3hk4z95ysc61gswnp91d4bxb8ic8ykwa7ckz29g8q8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/MarcusGrass/parse-range-headers")
    (synopsis "No-dep range header parser")
    (description "This package provides No-dep range header parser.")
    (license license:expat)))

(define-public rust-human-size-0.4
  (package
    (name "rust-human-size")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "human-size" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sza13s9vrhgqnci78wn58g8601bpcipibk3dhbb6f8sijgbg54r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/Thomasdezeeuw/human-size-rs")
    (synopsis "Sizes for humans.")
    (description "This package provides Sizes for humans.")
    (license (list license:expat license:asl2.0))))

(define-public rust-hyper-1.3
  (package
    (name "rust-hyper")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0va9pjqshsr8zc07m9h4j2821hsmd9lw9j416yisjqh8gp8msmzy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-h2" ,rust-h2-0.4)
                       ("rust-http" ,rust-http-1)
                       ("rust-http-body" ,rust-http-body-1)
                       ("rust-http-body-util" ,rust-http-body-util-0.1.1)
                       ("rust-httparse" ,rust-httparse-1)
                       ("rust-httpdate" ,rust-httpdate-1)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-want" ,rust-want-0.3))))
    (home-page "https://hyper.rs")
    (synopsis "fast and correct HTTP library.")
    (description "This package provides a fast and correct HTTP library.")
    (license license:expat)))

(define-public rust-hyper-rustls-0.26
  (package
    (name "rust-hyper-rustls")
    (version "0.26.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper-rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b4m1jvs147hxi8677n2dxxib663s7c31xmfni7b5qkanihsggm0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-hyper" ,rust-hyper-1.3)
                       ("rust-hyper-util" ,rust-hyper-util-0.1)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-rustls" ,rust-rustls-0.22)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.25)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26))))
    (home-page "https://github.com/rustls/hyper-rustls")
    (synopsis "Rustls+hyper integration for pure rust HTTPS")
    (description
     "This package provides Rustls+hyper integration for pure rust HTTPS.")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-hyper-tls-0.6
  (package
    (name "rust-hyper-tls")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper-tls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1q36x2yps6hhvxq5r7mc8ph9zz6xlb573gx0x3yskb0fi736y83h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-http-body-util" ,rust-http-body-util-0.1.1)
                       ("rust-hyper" ,rust-hyper-1.3)
                       ("rust-hyper-util" ,rust-hyper-util-0.1)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
                       ("rust-tower-service" ,rust-tower-service-0.3))))
    (home-page "https://hyper.rs")
    (synopsis "Default TLS implementation for use with hyper")
    (description
     "This package provides Default TLS implementation for use with hyper.")
    (license (list license:expat license:asl2.0))))

(define-public rust-hyper-util-0.1
  (package
    (name "rust-hyper-util")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mhw6n1s40ifr5a8z0nij2yirpdi81jhcyxfp7byb5hblqj5k1vv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-http-body" ,rust-http-body-1)
                       ("rust-hyper" ,rust-hyper-1.3)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-socket2" ,rust-socket2-0.5)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://hyper.rs")
    (synopsis "hyper utilities")
    (description "This package provides hyper utilities.")
    (license license:expat)))

(define-public rust-i18n-config-0.4
  (package
    (name "rust-i18n-config")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "i18n-config" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h3ndvkk4ws2jgkrk6wnbpc6l7xmnlr1ycxr49dzs8dwik2f770c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4.21)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-toml" ,rust-toml-0.8)
                       ("rust-unic-langid" ,rust-unic-langid-0.9))))
    (home-page
     "https://github.com/kellpossible/cargo-i18n/tree/master/i18n-config")
    (synopsis
     "This library contains the configuration stucts (along with their parsing functions) for the cargo-i18n tool/system")
    (description
     "This library contains the configuration stucts (along with their parsing
functions) for the cargo-i18n tool/system.")
    (license license:expat)))

(define-public rust-i18n-embed-0.14
  (package
    (name "rust-i18n-embed")
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "i18n-embed" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17251vazz8mybcgic9wffk56acv5i5zsg3x9kvdvjnsgfsams84l"))))
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
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rust-embed" ,rust-rust-embed-8)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
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
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rust-embed" ,rust-rust-embed-6)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
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

(define-public rust-i18n-embed-fl-0.7
  (package
    (name "rust-i18n-embed-fl")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "i18n-embed-fl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18nm8w031jani3m0cxhki9fzw5fs50qwzwfwmm6grpwma5qzihcz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-dashmap" ,rust-dashmap-5)
                       ("rust-find-crate" ,rust-find-crate-0.6)
                       ("rust-fluent" ,rust-fluent-0.16)
                       ("rust-fluent-syntax" ,rust-fluent-syntax-0.11)
                       ("rust-i18n-config" ,rust-i18n-config-0.4)
                       ("rust-i18n-embed" ,rust-i18n-embed-0.14)
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

(define-public rust-i18n-embed-impl-0.8
  (package
    (name "rust-i18n-embed-impl")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "i18n-embed-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0n5ai88c34q7mnn11faxp8izs9k1cx2k3zl2cm0mjbv7053kq2c1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-find-crate" ,rust-find-crate-0.6)
                       ("rust-i18n-config" ,rust-i18n-config-0.4)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://github.com/kellpossible/cargo-i18n/tree/master/i18n-embed")
    (synopsis "Macro implementations for i18n-embed")
    (description "This package provides Macro implementations for i18n-embed.")
    (license license:expat)))

(define-public rust-id-arena-2
  (package
    (name "rust-id-arena")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "id-arena" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01ch8jhpgnih8sawqs44fqsqpc7bzwgy0xpi6j0f4j0i5mkvr8i5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rayon" ,rust-rayon-1))))
    (home-page "https://github.com/fitzgen/id-arena")
    (synopsis "simple, id-based arena.")
    (description "This package provides a simple, id-based arena.")
    (license (list license:expat license:asl2.0))))

(define-public rust-image-0.25
  (package
    (name "rust-image")
    (version "0.25.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "image" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "049xrrdvxaj23zlhqwzmz6j8b9xcc79smgi4qn97cqkkwxhdcm7x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-color-quant" ,rust-color-quant-1)
                       ("rust-dav1d" ,rust-dav1d-0.10)
                       ("rust-dcv-color-primitives" ,rust-dcv-color-primitives-0.6)
                       ("rust-exr" ,rust-exr-1)
                       ("rust-gif" ,rust-gif-0.13)
                       ("rust-image-webp" ,rust-image-webp-0.1)
                       ("rust-mp4parse" ,rust-mp4parse-0.17)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-png" ,rust-png-0.17)
                       ("rust-qoi" ,rust-qoi-0.4)
                       ("rust-ravif" ,rust-ravif-0.11)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-rgb" ,rust-rgb-0.8)
                       ("rust-tiff" ,rust-tiff-0.9)
                       ("rust-zune-core" ,rust-zune-core-0.4)
                       ("rust-zune-jpeg" ,rust-zune-jpeg-0.4))))
    (home-page "https://github.com/image-rs/image")
    (synopsis
     "Imaging library. Provides basic image processing and encoders/decoders for common image formats")
    (description
     "This package provides Imaging library.  Provides basic image processing and encoders/decoders for
common image formats.")
    (license (list license:expat license:asl2.0))))

(define-public rust-image-webp-0.1
  (package
    (name "rust-image-webp")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "image-webp" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b97mpyy8drb2r07rjchd9k035g5bccczz87znfphk9wb22v0c6p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder-lite" ,rust-byteorder-lite-0.1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/image-rs/image-webp")
    (synopsis "WebP encoding and decoding in pure Rust")
    (description
     "This package provides @code{WebP} encoding and decoding in pure Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-imagesize-0.12
  (package
    (name "rust-imagesize")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "imagesize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "114jvqiyv13il1qghv2xm0xqrcjm68fh282hdlzdds6qfgsp7782"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/Roughsketch/imagesize")
    (synopsis
     "Quick probing of image dimensions without loading the entire file")
    (description
     "This package provides Quick probing of image dimensions without loading the entire file.")
    (license license:expat)))

(define-public rust-imagesize-0.10
  (package
    (name "rust-imagesize")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "imagesize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lfrrjqk3pqjk6cyr051fbpg7cc1afaj5mlpr91w1zpvj8gdl6fz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/Roughsketch/imagesize")
    (synopsis
     "Quick probing of image dimensions without loading the entire file")
    (description
     "This package provides Quick probing of image dimensions without loading the entire file.")
    (license license:expat)))

(define-public rust-impl-more-0.1
  (package
    (name "rust-impl-more")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "impl-more" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bdv06br4p766rcgihhjwqyz8fcz31xyaq14rr53vfh3kifafv10"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/robjtede/impl-more")
    (synopsis "Concise, declarative trait implementation macros")
    (description
     "This package provides Concise, declarative trait implementation macros.")
    (license (list license:expat license:asl2.0))))

(define-public rust-include-flate-0.2
  (package
    (name "rust-include-flate")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "include-flate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1c5dsx6j9jwrd6calhxdgip85qjy45hc8v1740fr61k46ilibqf2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-include-flate-codegen-exports" ,rust-include-flate-codegen-exports-0.1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libflate" ,rust-libflate-1))))
    (home-page "https://github.com/SOF3/include-flate")
    (synopsis
     "variant of include_bytes!/include_str! with compile-time deflation and runtime lazy inflation")
    (description
     "This package provides a variant of include_bytes!/include_str! with compile-time
deflation and runtime lazy inflation.")
    (license license:asl2.0)))

(define-public rust-include-flate-codegen-0.1
  (package
    (name "rust-include-flate-codegen")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "include-flate-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s34ssq0l3d2sn8n3mxmkz3jbm600fbckd0213mjjcgs34a6wz9s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libflate" ,rust-libflate-1)
                       ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/SOF3/include-flate")
    (synopsis "Macro codegen for the include-flate crate")
    (description
     "This package provides Macro codegen for the include-flate crate.")
    (license license:asl2.0)))

(define-public rust-include-flate-codegen-exports-0.1
  (package
    (name "rust-include-flate-codegen-exports")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "include-flate-codegen-exports" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00qswg7avv92mjp0p3kmswp3jask0psz1bmq3h7jin73zx1p0rbm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-include-flate-codegen" ,rust-include-flate-codegen-0.1)
                       ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5))))
    (home-page "https://github.com/SOF3/include-flate")
    (synopsis "Macro codegen for the include-flate crate")
    (description
     "This package provides Macro codegen for the include-flate crate.")
    (license license:asl2.0)))

(define-public rust-indexmap-2.2.6
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
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/indexmap-rs/indexmap")
    (synopsis "hash table with consistent order and fast iteration.")
    (description
     "This package provides a hash table with consistent order and fast iteration.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-inlinable-string-0.1
  (package
    (name "rust-inlinable-string")
    (version "0.1.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inlinable_string" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ysjci8yfvxgf51z0ny2nnwhxrclhmb3vbngin8v4bznhr3ybyn8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/fitzgen/inlinable_string")
    (synopsis
     "The `inlinable_string` crate provides the `InlinableString` type -- an owned, grow-able UTF-8 string that stores small strings inline and avoids heap-allocation -- and the `StringExt` trait which abstracts string operations over both `std::string::String` and `InlinableString` (or even your own custom string type)")
    (description
     "This package provides The `inlinable_string` crate provides the `@code{InlinableString`} type -- an
owned, grow-able UTF-8 string that stores small strings inline and avoids
heap-allocation -- and the `@code{StringExt`} trait which abstracts string
operations over both `std::string::String` and `@code{InlinableString`} (or even
your own custom string type).")
    (license (list license:asl2.0 license:expat))))

(define-public rust-intl-memoizer-0.5
  (package
    (name "rust-intl-memoizer")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "intl-memoizer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nkvql7c7b76axv4g68di1p2m9bnxq1cbn6mlqcawf72zhhf08py"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-type-map" ,rust-type-map-0.5)
                       ("rust-unic-langid" ,rust-unic-langid-0.9))))
    (home-page "http://www.projectfluent.org")
    (synopsis "memoizer specifically tailored for storing lazy-initialized
intl formatters.")
    (description
     "This package provides a memoizer specifically tailored for storing
lazy-initialized intl formatters.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-intl-pluralrules-7
  (package
    (name "rust-intl-pluralrules")
    (version "7.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "intl_pluralrules" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wprd3h6h8nfj62d8xk71h178q7zfn3srxm787w4sawsqavsg3h7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unic-langid" ,rust-unic-langid-0.9))))
    (home-page "https://github.com/zbraniecki/pluralrules")
    (synopsis "Unicode Plural Rules categorizer for numeric input")
    (description
     "This package provides Unicode Plural Rules categorizer for numeric input.")
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

(define-public rust-is-terminal-0.4
  (package
    (name "rust-is-terminal")
    (version "0.4.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "is-terminal" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12vk6g0f94zlxl6mdh5gc4jdjb469n9k9s7y3vb0iml05gpzagzj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hermit-abi" ,rust-hermit-abi-0.3)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/sunfishcode/is-terminal")
    (synopsis "Test whether a given stream is a terminal")
    (description
     "This package provides Test whether a given stream is a terminal.")
    (license license:expat)))

(define-public rust-isahc-1
  (package
    (name "rust-isahc")
    (version "1.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "isahc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1scfgyv3dpjbkqa9im25cd12cs6rbd8ygcaw67f3dx41sys08kik"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-channel" ,rust-async-channel-1)
                       ("rust-castaway" ,rust-castaway-0.1)
                       ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.7)
                       ("rust-curl" ,rust-curl-0.4)
                       ("rust-curl-sys" ,rust-curl-sys-0.4)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-event-listener" ,rust-event-listener-2)
                       ("rust-futures-lite" ,rust-futures-lite-1)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-httpdate" ,rust-httpdate-1)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.9)
                       ("rust-polling" ,rust-polling-2)
                       ("rust-publicsuffix" ,rust-publicsuffix-2)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-sluice" ,rust-sluice-0.5)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-futures" ,rust-tracing-futures-0.2)
                       ("rust-url" ,rust-url-2)
                       ("rust-waker-fn" ,rust-waker-fn-1))))
    (home-page "https://github.com/sagebind/isahc")
    (synopsis "The practical HTTP client that is fun to use")
    (description
     "This package provides The practical HTTP client that is fun to use.")
    (license license:expat)))

(define-public rust-ittapi-0.4
  (package
    (name "rust-ittapi")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ittapi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cb41dapbximlma0vnar144m2j2km44g8g6zmv6ra4y42kk6z6bb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-ittapi-sys" ,rust-ittapi-sys-0.4)
                       ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/intel/ittapi/tree/master/rust/ittapi")
    (synopsis "High-level Rust bindings for ittapi")
    (description "This package provides High-level Rust bindings for ittapi.")
    (license (list license:gpl2 license:bsd-3))))

(define-public rust-ittapi-sys-0.4
  (package
    (name "rust-ittapi-sys")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ittapi-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z7lgc7gwlhcvkdk6bg9sf1ww4w0b41blp90hv4a4kq6ji9kixaj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/intel/ittapi/tree/master/rust/ittapi-sys")
    (synopsis "Rust bindings for ittapi")
    (description "This package provides Rust bindings for ittapi.")
    (license (list license:gpl2 license:bsd-3))))

(define-public rust-jobserver-0.1
  (package
    (name "rust-jobserver")
    (version "0.1.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jobserver" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vnyfxr5gm03j3lpnd1zswnyvqa40kbssy08pz2m35salfm9kc6j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2.155))))
    (home-page "https://github.com/rust-lang/jobserver-rs")
    (synopsis "An implementation of the GNU Make jobserver for Rust.")
    (description
     "This package provides An implementation of the GNU Make jobserver for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-jsonwebtoken-7
  (package
    (name "rust-jsonwebtoken")
    (version "7.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonwebtoken" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ciz205wcjcn7n6i871zz5xlbzk863b0ybgiqi7li9ipwhawraxg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.12)
                       ("rust-pem" ,rust-pem-0.8)
                       ("rust-ring" ,rust-ring-0.16)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-simple-asn1" ,rust-simple-asn1-0.4))))
    (home-page "https://github.com/Keats/jsonwebtoken")
    (synopsis "Create and decode JWTs in a strongly typed way")
    (description
     "This package provides Create and decode JWTs in a strongly typed way.")
    (license license:expat)))

(define-public rust-khronos-egl-6
  (package
    (name "rust-khronos-egl")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "khronos-egl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xnzdx0n1bil06xmh8i1x6dbxvk7kd2m70bbm6nw1qzc43r1vbka"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2.155)
                       ("rust-libloading" ,rust-libloading-0.8)
                       ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/timothee-haudebourg/khronos-egl")
    (synopsis "Rust bindings for EGL")
    (description "This package provides Rust bindings for EGL.")
    (license (list license:expat license:asl2.0))))

(define-public rust-kurbo-0.9
  (package
    (name "rust-kurbo")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "kurbo" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16w4k313z8smic4zifpwnxk8alh17dncgj2r40p0ql6rdivsb1dx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-libm" ,rust-libm-0.2)
                       ("rust-mint" ,rust-mint-0.5)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/linebender/kurbo")
    (synopsis "2D curves library")
    (description "This package provides a 2D curves library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-kurbo-0.8
  (package
    (name "rust-kurbo")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "kurbo" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jgl678sygzs93lz6dr8qnpqhp24k01ay6662wxqgyqw4xnpflvs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-mint" ,rust-mint-0.5)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/linebender/kurbo")
    (synopsis "2D curves library")
    (description "This package provides a 2D curves library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-libamdgpu-top-0.8
  (package
    (name "rust-libamdgpu-top")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libamdgpu_top" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1df8hiqjizm75kl2n0hdly08b3fync0rblk0abbvcv69492hz72j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-libdrm-amdgpu-sys" ,rust-libdrm-amdgpu-sys-0.7))))
    (home-page "https://github.com/Umio-Yasuno/amdgpu_top")
    (synopsis "library for amdgpu_top")
    (description "This package provides a library for amdgpu_top.")
    (license license:expat)))

(define-public rust-libc-0.2.161
  (package
    (name "rust-libc")
    (version "0.2.161")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lc5s3zd0491x9zxrv2kvclai1my1spz950pkkyry4vwh318k54f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/rust-lang/libc")
    (synopsis "Raw FFI bindings to platform libraries like libc.")
    (description
     "This package provides Raw FFI bindings to platform libraries like libc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-libc-0.2.155
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

(define-public rust-libdrm-amdgpu-sys-0.7
  (package
    (name "rust-libdrm-amdgpu-sys")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libdrm_amdgpu_sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00m8mnhvnwzml0hhnxa1kmzrr2gvmwzvqmm8k7b2p1rb04cwbzxd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bindgen" ,rust-bindgen-0.69)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/Umio-Yasuno/libdrm-amdgpu-sys-rs")
    (synopsis
     "libdrm_amdgpu bindings for Rust, and some methods ported from Mesa3D")
    (description
     "This package provides libdrm_amdgpu bindings for Rust, and some methods ported from Mesa3D.")
    (license license:expat)))

(define-public rust-libz-sys-1
  (package
    (name "rust-libz-sys")
    (version "1.1.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libz-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bpqmfzvijbrqs29vphnafjz834lpz6pabbsnf85rqppb9pa4pf1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-cmake" ,rust-cmake-0.1)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (home-page "https://github.com/rust-lang/libz-sys")
    (synopsis
     "Low-level bindings to the system libz library (also known as zlib)")
    (description
     "This package provides Low-level bindings to the system libz library (also known as zlib).")
    (license (list license:expat license:asl2.0))))

(define-public rust-litrs-0.4
  (package
    (name "rust-litrs")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "litrs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19cssch9gc0x2snd9089nvwzz79zx6nzsi3icffpx25p4hck1kml"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/LukasKalbertodt/litrs/")
    (synopsis
     "Parse and inspect Rust literals (i.e. tokens in the Rust programming language
representing fixed values). Particularly useful for proc macros, but can also
be used outside of a proc-macro context.")
    (description
     "This package provides Parse and inspect Rust literals (i.e.  tokens in the Rust programming language
representing fixed values).  Particularly useful for proc macros, but can also
be used outside of a proc-macro context.")
    (license (list license:expat license:asl2.0))))

(define-public rust-local-channel-0.1
  (package
    (name "rust-local-channel")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "local-channel" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1j1ywn459kl4fdmjfyljm379k40qwwscd7mqp25lppxqd5gcijxn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-sink" ,rust-futures-sink-0.3)
                       ("rust-local-waker" ,rust-local-waker-0.1))))
    (home-page "https://github.com/actix/actix-net")
    (synopsis
     "non-threadsafe multi-producer, single-consumer, futures-aware, FIFO queue")
    (description
     "This package provides a non-threadsafe multi-producer, single-consumer,
futures-aware, FIFO queue.")
    (license (list license:expat license:asl2.0))))

(define-public rust-local-waker-0.1
  (package
    (name "rust-local-waker")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "local-waker" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11vlcm8q6dhdf0srkgjnwca48dn9zcz820fq20hv82ffcxy3v1sd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/actix/actix-net")
    (synopsis "synchronization primitive for thread-local task wakeup")
    (description
     "This package provides a synchronization primitive for thread-local task wakeup.")
    (license (list license:expat license:asl2.0))))

(define-public rust-log-0.4.21
  (package
    (name "rust-log")
    (version "0.4.21")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "log" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "074hldq1q8rlzq2s2qa8f25hj4s3gpw71w64vdwzjd01a4g8rvch"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1.0.203)
                       ("rust-sval" ,rust-sval-2)
                       ("rust-sval-ref" ,rust-sval-ref-2)
                       ("rust-value-bag" ,rust-value-bag-1))))
    (home-page "https://github.com/rust-lang/log")
    (synopsis "lightweight logging facade for Rust")
    (description
     "This package provides a lightweight logging facade for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-lopdf-0.31
  (package
    (name "rust-lopdf")
    (version "0.31.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lopdf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0npqs454hz7z8ycldyi154fxmra0vkmp5xbjbzm346sb32vf3j07"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-chrono" ,rust-chrono-0.4)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-image" ,rust-image-0.24)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-linked-hash-map" ,rust-linked-hash-map-0.5)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-md5" ,rust-md5-0.7)
                       ("rust-nom" ,rust-nom-7)
                       ("rust-pom" ,rust-pom-3)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-weezl" ,rust-weezl-0.1))))
    (home-page "https://github.com/J-F-Liu/lopdf")
    (synopsis "Rust library for PDF document manipulation.")
    (description
     "This package provides a Rust library for PDF document manipulation.")
    (license license:expat)))

(define-public rust-maybe-owned-0.3
  (package
    (name "rust-maybe-owned")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "maybe-owned" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d3sqiv59i06k73x6p7mf294zgdfb2qkky127ipfnjj9mr9wgb2g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rustonaut/maybe-owned")
    (synopsis
     "provides a `MaybeOwned` (and `MaybeOwnedMut`) type similar to std's `Cow` but it implements `From<T>` and `From<&'a T>` and does not require `ToOwned`")
    (description
     "This package provides provides a `@code{MaybeOwned`} (and `@code{MaybeOwnedMut`}) type similar to
std's `Cow` but it implements `From<T>` and `From<&'a T>` and does not require
`@code{ToOwned`}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-memfd-0.6
  (package
    (name "rust-memfd")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memfd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r5cm3wzyr1x7768h3hns77b494qbz0g05cb9wgpjvrcsm5gmkxj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustix" ,rust-rustix-0.38.34))))
    (home-page "https://github.com/lucab/memfd-rs")
    (synopsis "pure-Rust library to work with Linux memfd and sealing")
    (description
     "This package provides a pure-Rust library to work with Linux memfd and sealing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-memmap2-0.9
  (package
    (name "rust-memmap2")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memmap2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08hkmvri44j6h14lyq4yw5ipsp91a9jacgiww4bs9jm8whi18xgy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
    (home-page "https://github.com/RazrFalcon/memmap2-rs")
    (synopsis "Cross-platform Rust API for memory-mapped file IO")
    (description
     "This package provides Cross-platform Rust API for memory-mapped file IO.")
    (license (list license:expat license:asl2.0))))

(define-public rust-memmap2-0.6
  (package
    (name "rust-memmap2")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memmap2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wm8avdjma6j3x5fjdqwxcj89h52pzmwanw46xkn9rnz9albna3d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
    (home-page "https://github.com/RazrFalcon/memmap2-rs")
    (synopsis "Cross-platform Rust API for memory-mapped file IO")
    (description
     "This package provides Cross-platform Rust API for memory-mapped file IO.")
    (license (list license:expat license:asl2.0))))

(define-public rust-metal-0.27
  (package
    (name "rust-metal")
    (version "0.27.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "metal" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09bz461vyi9kw69k55gy2fpd3hz17j6g2n0v08gm3glc7yap6gy4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-block" ,rust-block-0.1)
                       ("rust-core-graphics-types" ,rust-core-graphics-types-0.1)
                       ("rust-dispatch" ,rust-dispatch-0.2)
                       ("rust-foreign-types" ,rust-foreign-types-0.5)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-objc" ,rust-objc-0.2)
                       ("rust-paste" ,rust-paste-1))))
    (home-page "https://github.com/gfx-rs/metal-rs")
    (synopsis "Rust bindings for Metal")
    (description "This package provides Rust bindings for Metal.")
    (license (list license:expat license:asl2.0))))

(define-public rust-mime-guess-2
  (package
    (name "rust-mime-guess")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mime_guess" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vs28rxnbfwil6f48hh58lfcx90klcvg68gxdc60spwa4cy2d4j1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-mime" ,rust-mime-0.3)
                       ("rust-unicase" ,rust-unicase-2)
                       ("rust-unicase" ,rust-unicase-2))))
    (home-page "https://github.com/abonander/mime_guess")
    (synopsis
     "simple crate for detection of a file's MIME type by its extension.")
    (description
     "This package provides a simple crate for detection of a file's MIME type by its
extension.")
    (license license:expat)))

(define-public rust-mime-guess2-2
  (package
    (name "rust-mime-guess2")
    (version "2.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mime_guess2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h8c0bf58s469lph49nflis2hxy1nhwnlxnw3rh015b0n4xk78r5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-mime" ,rust-mime-0.3)
                       ("rust-unicase" ,rust-unicase-2)
                       ("rust-unicase" ,rust-unicase-2))))
    (home-page "https://github.com/ttys3/mime_guess2")
    (synopsis
     "simple crate for detection of a file's MIME type by its extension.")
    (description
     "This package provides a simple crate for detection of a file's MIME type by its
extension.")
    (license license:expat)))

(define-public rust-miniz-oxide-0.8
  (package
    (name "rust-miniz-oxide")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miniz_oxide" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wadxkg6a6z4lr7kskapj5d8pxlx7cp1ifw4daqnkzqjxych5n72"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-adler2" ,rust-adler2-2)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-simd-adler32" ,rust-simd-adler32-0.3))))
    (home-page "https://github.com/Frommi/miniz_oxide/tree/master/miniz_oxide")
    (synopsis
     "DEFLATE compression and decompression library rewritten in Rust based on miniz")
    (description
     "This package provides DEFLATE compression and decompression library rewritten in Rust based on miniz.")
    (license (list license:expat license:zlib license:asl2.0))))

(define-public rust-multer-3
  (package
    (name "rust-multer")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "multer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jr2snfay5fjz50yvdja4vbnddlj1iriiqjym88pbj3daiv7gs43"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-httparse" ,rust-httparse-1)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-spin" ,rust-spin-0.9)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/rwf2/multer")
    (synopsis "An async parser for `multipart/form-data` content-type in Rust")
    (description
     "This package provides An async parser for `multipart/form-data` content-type in Rust.")
    (license license:expat)))

(define-public rust-naga-0.19
  (package
    (name "rust-naga")
    (version "0.19.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "naga" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hq82fg8rj067wppqrk7h9q5b89vkp98spmb37s9lggm89355qsh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-bit-set" ,rust-bit-set-0.5)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-codespan-reporting" ,rust-codespan-reporting-0.11)
                       ("rust-hexf-parse" ,rust-hexf-parse-0.2)
                       ("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-petgraph" ,rust-petgraph-0.6)
                       ("rust-pp-rs" ,rust-pp-rs-0.2)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-spirv" ,rust-spirv-0.3)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/gfx-rs/wgpu/tree/trunk/naga")
    (synopsis "Shader translation infrastructure")
    (description "This package provides Shader translation infrastructure.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ncurses-5
  (package
    (name "rust-ncurses")
    (version "5.101.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ncurses" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ci0flh7j8v7yir2y1lrqvqy90df1ba2a74acd5xqmr6sws5sb2y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/jeaye/ncurses-rs")
    (synopsis "very thin wrapper around the ncurses TUI library")
    (description
     "This package provides a very thin wrapper around the ncurses TUI library.")
    (license license:expat)))

(define-public rust-ndarray-0.16
  (package
    (name "rust-ndarray")
    (version "0.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ndarray" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ha8sg5ad501pgkxw0wczh8myc2ma3gyxgcny4mq8rckrqnxfbl8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-approx" ,rust-approx-0.5)
                       ("rust-cblas-sys" ,rust-cblas-sys-0.1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-matrixmultiply" ,rust-matrixmultiply-0.3)
                       ("rust-num-complex" ,rust-num-complex-0.4)
                       ("rust-num-integer" ,rust-num-integer-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-portable-atomic" ,rust-portable-atomic-1)
                       ("rust-portable-atomic-util" ,rust-portable-atomic-util-0.2)
                       ("rust-rawpointer" ,rust-rawpointer-0.2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-ndarray/ndarray")
    (synopsis
     "An n-dimensional array for general elements and for numerics. Lightweight array views and slicing; views support chunking and splitting")
    (description
     "This package provides An n-dimensional array for general elements and for numerics.  Lightweight array
views and slicing; views support chunking and splitting.")
    (license (list license:expat license:asl2.0))))

(define-public rust-nix-0.29.0
  (package
    (name "rust-nix")
    (version "0.29.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nix" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ikvn7s9r2lrfdm3mx1h7nbfjvcc6s9vxdzw7j5xfkd2qdnp9qki"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cfg-aliases" ,rust-cfg-aliases-0.2.1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-memoffset" ,rust-memoffset-0.9)
                       ("rust-pin-utils" ,rust-pin-utils-0.1))))
    (home-page "https://github.com/nix-rust/nix")
    (synopsis "Rust friendly bindings to *nix APIs")
    (description "This package provides Rust friendly bindings to *nix APIs.")
    (license license:expat)))

(define-public rust-nohash-hasher-0.2
  (package
    (name "rust-nohash-hasher")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nohash-hasher" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lf4p6k01w4wm7zn4grnihzj8s7zd5qczjmzng7wviwxawih5x9b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/paritytech/nohash-hasher")
    (synopsis
     "An implementation of `std::hash::Hasher` which does not hash at all")
    (description
     "This package provides An implementation of `std::hash::Hasher` which does not hash at all.")
    (license (list license:asl2.0 license:expat))))

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

(define-public rust-objc-sys-0.3
  (package
    (name "rust-objc-sys")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0423gry7s3rmz8s3pzzm1zy5mdjif75g6dbzc2lf2z0c77fipffd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Raw bindings to the Objective-C runtime and ABI")
    (description
     "This package provides Raw bindings to the Objective-C runtime and ABI.")
    (license license:expat)))

(define-public rust-objc2-0.5
  (package
    (name "rust-objc2")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "015qa2d3vh7c1j2736h5wjrznri7x5ic35vl916c22gzxva8b9s6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-malloc-buf" ,rust-malloc-buf-1)
                       ("rust-objc-sys" ,rust-objc-sys-0.3)
                       ("rust-objc2-encode" ,rust-objc2-encode-4)
                       ("rust-objc2-proc-macros" ,rust-objc2-proc-macros-0.1))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Objective-C interface and runtime bindings")
    (description
     "This package provides Objective-C interface and runtime bindings.")
    (license license:expat)))

(define-public rust-objc2-app-kit-0.2
  (package
    (name "rust-objc2-app-kit")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-app-kit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zqyi5l1bm26j1bgmac9783ah36m5kcrxlqp5carglnpwgcrms74"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-block2" ,rust-block2-0.5)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-objc2" ,rust-objc2-0.5)
                       ("rust-objc2-core-data" ,rust-objc2-core-data-0.2)
                       ("rust-objc2-core-image" ,rust-objc2-core-image-0.2)
                       ("rust-objc2-foundation" ,rust-objc2-foundation-0.2)
                       ("rust-objc2-quartz-core" ,rust-objc2-quartz-core-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the AppKit framework")
    (description
     "This package provides Bindings to the @code{AppKit} framework.")
    (license license:expat)))

(define-public rust-objc2-core-data-0.2
  (package
    (name "rust-objc2-core-data")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-core-data" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vvk8zjylfjjj04dzawydmqqz5ajvdkhf22cnb07ihbiw14vyzv1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-block2" ,rust-block2-0.5)
                       ("rust-objc2" ,rust-objc2-0.5)
                       ("rust-objc2-foundation" ,rust-objc2-foundation-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the CoreData framework")
    (description
     "This package provides Bindings to the @code{CoreData} framework.")
    (license license:expat)))

(define-public rust-objc2-core-image-0.2
  (package
    (name "rust-objc2-core-image")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-core-image" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "102csfb82zi2sbzliwsfd589ckz0gysf7y6434c9zj97lmihj9jm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-block2" ,rust-block2-0.5)
                       ("rust-objc2" ,rust-objc2-0.5)
                       ("rust-objc2-foundation" ,rust-objc2-foundation-0.2)
                       ("rust-objc2-metal" ,rust-objc2-metal-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the CoreImage framework")
    (description
     "This package provides Bindings to the @code{CoreImage} framework.")
    (license license:expat)))

(define-public rust-objc2-encode-4
  (package
    (name "rust-objc2-encode")
    (version "4.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-encode" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1y7hjg4k828zhn4fjnbidrz3vzw4llk9ldy92drj47ydjc9yg4bq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Objective-C type-encoding representation and parsing")
    (description
     "This package provides Objective-C type-encoding representation and parsing.")
    (license license:expat)))

(define-public rust-objc2-foundation-0.2
  (package
    (name "rust-objc2-foundation")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-foundation" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1a6mi77jsig7950vmx9ydvsxaighzdiglk5d229k569pvajkirhf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-block2" ,rust-block2-0.5)
                       ("rust-dispatch" ,rust-dispatch-0.2)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-objc2" ,rust-objc2-0.5))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the Foundation framework")
    (description "This package provides Bindings to the Foundation framework.")
    (license license:expat)))

(define-public rust-objc2-metal-0.2
  (package
    (name "rust-objc2-metal")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-metal" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mmdga66qpxrcfq3gxxhysfx3zg1hpx4z886liv3j0pnfq9bl36x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-block2" ,rust-block2-0.5)
                       ("rust-objc2" ,rust-objc2-0.5)
                       ("rust-objc2-foundation" ,rust-objc2-foundation-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the Metal framework")
    (description "This package provides Bindings to the Metal framework.")
    (license license:expat)))

(define-public rust-objc2-proc-macros-0.1
  (package
    (name "rust-objc2-proc-macros")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-proc-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w335fj58k76z94d242xq18qkj7iw082lpy3kxnisaa5r7q4aaa6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Procedural macros for the objc2 project")
    (description
     "This package provides Procedural macros for the objc2 project.")
    (license license:expat)))

(define-public rust-objc2-quartz-core-0.2
  (package
    (name "rust-objc2-quartz-core")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-quartz-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ynw8819c36l11rim8n0yzk0fskbzrgaqayscyqi8swhzxxywaz4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-block2" ,rust-block2-0.5)
                       ("rust-objc2" ,rust-objc2-0.5)
                       ("rust-objc2-foundation" ,rust-objc2-foundation-0.2)
                       ("rust-objc2-metal" ,rust-objc2-metal-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the QuartzCore/CoreAnimation framework")
    (description
     "This package provides Bindings to the @code{QuartzCore/CoreAnimation} framework.")
    (license license:expat)))

(define-public rust-object-0.35
  (package
    (name "rust-object")
    (version "0.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "object" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pnv84mx3f3p847hfnsp4znivnwkc1x53maq459a92w42fw7mv5q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-ruzstd" ,rust-ruzstd-0.6)
                       ("rust-wasmparser" ,rust-wasmparser-0.202))))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis "unified interface for reading and writing object file formats.")
    (description
     "This package provides a unified interface for reading and writing object file
formats.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-opentelemetry-0.21
  (package
    (name "rust-opentelemetry")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "opentelemetry" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12jfmyx8k9q2sjlx4wp76ddzaf94i7lnkliv1c9mj164bnd36chy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-sink" ,rust-futures-sink-0.3)
                       ("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-urlencoding" ,rust-urlencoding-2))))
    (home-page "https://github.com/open-telemetry/opentelemetry-rust")
    (synopsis "OpenTelemetry API for Rust")
    (description "This package provides @code{OpenTelemetry} API for Rust.")
    (license license:asl2.0)))

(define-public rust-opentelemetry-http-0.10
  (package
    (name "rust-opentelemetry-http")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "opentelemetry-http" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17irqlgsqr1f0in5rhvgl224x2gdcycy8w3ybydlyrdyx2f1hlbz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-isahc" ,rust-isahc-1)
                       ("rust-opentelemetry" ,rust-opentelemetry-0.21)
                       ("rust-reqwest" ,rust-reqwest-0.11)
                       ("rust-surf" ,rust-surf-2)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/open-telemetry/opentelemetry-rust")
    (synopsis
     "Helper implementations for sending HTTP requests. Uses include propagating and extracting context over http, exporting telemetry, requesting sampling strategies")
    (description
     "This package provides Helper implementations for sending HTTP requests.  Uses include propagating and
extracting context over http, exporting telemetry, requesting sampling
strategies.")
    (license license:asl2.0)))

(define-public rust-opentelemetry-prometheus-0.14
  (package
    (name "rust-opentelemetry-prometheus")
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "opentelemetry-prometheus" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gbrl3kgn8l4wik29m0s7ab8yavrp383x7l2a2rdrc0ml4nhi3vg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-once-cell" ,rust-once-cell-1)
                       ("rust-opentelemetry" ,rust-opentelemetry-0.21)
                       ("rust-opentelemetry-sdk" ,rust-opentelemetry-sdk-0.21)
                       ("rust-prometheus" ,rust-prometheus-0.13)
                       ("rust-protobuf" ,rust-protobuf-2))))
    (home-page "https://github.com/open-telemetry/opentelemetry-rust")
    (synopsis "Prometheus exporter for OpenTelemetry")
    (description
     "This package provides Prometheus exporter for @code{OpenTelemetry}.")
    (license license:asl2.0)))

(define-public rust-opentelemetry-sdk-0.21
  (package
    (name "rust-opentelemetry-sdk")
    (version "0.21.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "opentelemetry_sdk" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1r7gw2j2n800rd0vdnga32yhlfmc3c4y0sadcr97licam74aw5ig"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-executor" ,rust-futures-executor-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-glob" ,rust-glob-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-opentelemetry" ,rust-opentelemetry-0.21)
                       ("rust-opentelemetry-http" ,rust-opentelemetry-http-0.10)
                       ("rust-ordered-float" ,rust-ordered-float-4)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/open-telemetry/opentelemetry-rust")
    (synopsis
     "The SDK for the OpenTelemetry metrics collection and distributed tracing framework")
    (description
     "This package provides The SDK for the @code{OpenTelemetry} metrics collection and distributed tracing
framework.")
    (license license:asl2.0)))

(define-public rust-opentelemetry-semantic-conventions-0.13
  (package
    (name "rust-opentelemetry-semantic-conventions")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "opentelemetry-semantic-conventions" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "115wbgk840dklyhpg3lwp4x1m643qd7f0vkz8hmfz0pry4g4yxzm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-opentelemetry" ,rust-opentelemetry-0.21))))
    (home-page
     "https://github.com/open-telemetry/opentelemetry-rust/tree/main/opentelemetry-semantic-conventions")
    (synopsis "Semantic conventions for OpenTelemetry")
    (description
     "This package provides Semantic conventions for @code{OpenTelemetry}.")
    (license license:asl2.0)))

(define-public rust-openvino-0.7
  (package
    (name "rust-openvino")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openvino" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xkyj1j5849zbqws49n6g7g2dgq6vkn10krl580wdvi7d5wi7q5f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-openvino-finder" ,rust-openvino-finder-0.7)
                       ("rust-openvino-sys" ,rust-openvino-sys-0.7)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/intel/openvino-rs")
    (synopsis "High-level bindings for OpenVINO")
    (description
     "This package provides High-level bindings for @code{OpenVINO}.")
    (license license:asl2.0)))

(define-public rust-openvino-finder-0.7
  (package
    (name "rust-openvino-finder")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openvino-finder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ajywiww9s5nrb2d0pi5pljv5dl1iwsg659hfkphzmjcvx0nhk5g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/intel/openvino-rs")
    (synopsis "helper crate for finding OpenVINO installations on a system.")
    (description
     "This package provides a helper crate for finding @code{OpenVINO} installations
on a system.")
    (license license:asl2.0)))

(define-public rust-openvino-sys-0.7
  (package
    (name "rust-openvino-sys")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openvino-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z0lrlhi27ygmcm5hcykjl4xg1i556nyl5shdc531wl2d2yw4bzn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-env-logger" ,rust-env-logger-0.10)
                       ("rust-libloading" ,rust-libloading-0.8)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-openvino-finder" ,rust-openvino-finder-0.7)
                       ("rust-openvino-finder" ,rust-openvino-finder-0.7))))
    (home-page "https://github.com/intel/openvino-rs")
    (synopsis
     "Low-level bindings for OpenVINO (use the `openvino` crate for easier-to-use bindings)")
    (description
     "This package provides Low-level bindings for @code{OpenVINO} (use the `openvino` crate for
easier-to-use bindings).")
    (license license:asl2.0)))

(define-public rust-ordered-float-4
  (package
    (name "rust-ordered-float")
    (version "4.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ordered-float" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kjqcvvbcsibbx3hnj7ag06bd9gv2zfi5ja6rgyh2kbxbh3zfvd7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-borsh" ,rust-borsh-1)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-proptest" ,rust-proptest-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rkyv" ,rust-rkyv-0.7)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-speedy" ,rust-speedy-0.8))))
    (home-page "https://github.com/reem/rust-ordered-float")
    (synopsis "Wrappers for total ordering on floats")
    (description
     "This package provides Wrappers for total ordering on floats.")
    (license license:expat)))

(define-public rust-ort-2
  (package
    (name "rust-ort")
    (version "2.0.0-rc.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ort" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zh95gizmsbkkkm54p7g97y6nizayi07fb7983bbf3vc5qbmmr25"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-half" ,rust-half-2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libloading" ,rust-libloading-0.8)
                       ("rust-ndarray" ,rust-ndarray-0.16)
                       ("rust-ort-sys" ,rust-ort-sys-2)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-ureq" ,rust-ureq-2)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/pykeio/ort")
    (synopsis
     "safe Rust wrapper for ONNX Runtime 1.18 - Optimize and accelerate machine learning inference & training")
    (description
     "This package provides a safe Rust wrapper for ONNX Runtime 1.18 - Optimize and
accelerate machine learning inference & training.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ort-sys-2
  (package
    (name "rust-ort-sys")
    (version "2.0.0-rc.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ort-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fm8kvwlzrmm00d4lv3hqj099blzd3z7mq5ykk0x0z26m5jf4vzc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-flate2" ,rust-flate2-1)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-tar" ,rust-tar-0.4)
                       ("rust-ureq" ,rust-ureq-2))))
    (home-page "https://github.com/pykeio/ort")
    (synopsis
     "Unsafe Rust bindings for ONNX Runtime 1.18 - Optimize and Accelerate Machine Learning Inferencing")
    (description
     "This package provides Unsafe Rust bindings for ONNX Runtime 1.18 - Optimize and Accelerate Machine
Learning Inferencing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-os-pipe-1
  (package
    (name "rust-os-pipe")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "os_pipe" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0292yfjc5dj4j60im9md05sbl8gyvknspl810lxw3ypqval3pmr9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2.155)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/oconnor663/os_pipe.rs")
    (synopsis "a cross-platform library for opening OS pipes")
    (description
     "This package provides a cross-platform library for opening OS pipes.")
    (license license:expat)))

(define-public rust-pancurses-0.17
  (package
    (name "rust-pancurses")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pancurses" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nqkkmsljdk3z2bifxapmx1yv2w1vfwhkdxzk7pbkb6b6rf9flh3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2.155)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-ncurses" ,rust-ncurses-5)
                       ("rust-pdcurses-sys" ,rust-pdcurses-sys-0.7)
                       ("rust-winreg" ,rust-winreg-0.52))))
    (home-page "https://github.com/ihalila/pancurses")
    (synopsis
     "pancurses is a curses libary for Rust that supports both Unix and Windows
platforms by abstracting away the backend that it uses
(ncurses-rs and pdcurses-sys respectively).")
    (description
     "This package provides pancurses is a curses libary for Rust that supports both Unix and Windows
platforms by abstracting away the backend that it uses (ncurses-rs and
pdcurses-sys respectively).")
    (license license:expat)))

(define-public rust-path-absolutize-3
  (package
    (name "rust-path-absolutize")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "path-absolutize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xc36c5lz187wy452qph3lrr41x8ffgxk1clj2s9b8czwwgkibz4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-path-dedot" ,rust-path-dedot-3))))
    (home-page "https://magiclen.org/path-absolutize")
    (synopsis
     "library for extending `Path` and `PathBuf` in order to get an absolute path and remove the containing dots.")
    (description
     "This package provides a library for extending `Path` and `@code{PathBuf`} in
order to get an absolute path and remove the containing dots.")
    (license license:expat)))

(define-public rust-path-dedot-3
  (package
    (name "rust-path-dedot")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "path-dedot" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15wkx8q3vra34fslzlg1lkq7liyxwqrpbxiz44a28wa7w3bhmfh7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-once-cell" ,rust-once-cell-1))))
    (home-page "https://magiclen.org/path-dedot")
    (synopsis
     "library for extending `Path` and `PathBuf` in order to parse the path which contains dots.")
    (description
     "This package provides a library for extending `Path` and `@code{PathBuf`} in
order to parse the path which contains dots.")
    (license license:expat)))

(define-public rust-pdf-writer-0.9
  (package
    (name "rust-pdf-writer")
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pdf-writer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0arksb7ahf389q0r7gjm3y3x4fh4v7nckahwcrp82g06ams15s94"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-ryu" ,rust-ryu-1))))
    (home-page "https://github.com/typst/pdf-writer")
    (synopsis "step-by-step PDF writer.")
    (description "This package provides a step-by-step PDF writer.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pear-0.2
  (package
    (name "rust-pear")
    (version "0.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pear" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rxlyizzaqq6lswgyfdxjxd3dyb1jfml9gwfpbx5g1j8rq0amvmx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-inlinable-string" ,rust-inlinable-string-0.1)
                       ("rust-pear-codegen" ,rust-pear-codegen-0.2)
                       ("rust-yansi" ,rust-yansi-1))))
    (home-page "https://github.com/SergioBenitez/Pear")
    (synopsis "pear is a fruit.")
    (description "This package provides a pear is a fruit.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pear-codegen-0.2
  (package
    (name "rust-pear-codegen")
    (version "0.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pear_codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0izijffdd2xs762497mk0xr7xwmyw62dzdqjz12v70n0bnc5pasb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-proc-macro2-diagnostics" ,rust-proc-macro2-diagnostics-0.10)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/SergioBenitez/Pear")
    (synopsis "(codegen) pear is a fruit.")
    (description "This package provides a (codegen) pear is a fruit.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pico-args-0.5
  (package
    (name "rust-pico-args")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pico-args" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05d30pvxd6zlnkg2i3ilr5a70v3f3z2in18m67z25vinmykngqav"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/RazrFalcon/pico-args")
    (synopsis "An ultra simple CLI arguments parser")
    (description "This package provides An ultra simple CLI arguments parser.")
    (license license:expat)))

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
       #:cargo-inputs (("rust-log" ,rust-log-0.4.21)
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

(define-public rust-pkg-config-0.3
  (package
    (name "rust-pkg-config")
    (version "0.3.30")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pkg-config" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v07557dj1sa0aly9c90wsygc0i8xv5vnmyv0g94lpkvj8qb4cfj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rust-lang/pkg-config-rs")
    (synopsis
     "library to run the pkg-config system tool at build time in order to be used in
Cargo build scripts.")
    (description
     "This package provides a library to run the pkg-config system tool at build time
in order to be used in Cargo build scripts.")
    (license (list license:expat license:asl2.0))))

(define-public rust-png-0.17
  (package
    (name "rust-png")
    (version "0.17.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "png" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "077hkp7az7w1hhlvibw03g4xcf9644a66l7fkhhgy9pcji67y3lg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-miniz-oxide" ,rust-miniz-oxide-0.5))))
    (home-page "https://github.com/image-rs/image-png")
    (synopsis "PNG decoding and encoding library in pure Rust")
    (description
     "This package provides PNG decoding and encoding library in pure Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-poem-1
  (package
    (name "rust-poem")
    (version "1.3.59")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "poem" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0159agmjig6s45sjf1jcbira8icpbakfadwa23pc2i07gg4p8ish"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-async-compression" ,rust-async-compression-0.4)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-cookie" ,rust-cookie-0.17)
                       ("rust-csrf" ,rust-csrf-0.4)
                       ("rust-eyre" ,rust-eyre-0.6)
                       ("rust-fluent" ,rust-fluent-0.16)
                       ("rust-fluent-langneg" ,rust-fluent-langneg-0.13)
                       ("rust-fluent-syntax" ,rust-fluent-syntax-0.11)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-headers" ,rust-headers-0.3)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-httpdate" ,rust-httpdate-1)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-hyper-rustls" ,rust-hyper-rustls-0.24)
                       ("rust-intl-memoizer" ,rust-intl-memoizer-0.5)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-multer" ,rust-multer-2)
                       ("rust-nix" ,rust-nix-0.27)
                       ("rust-openssl" ,rust-openssl-0.10)
                       ("rust-opentelemetry" ,rust-opentelemetry-0.21)
                       ("rust-opentelemetry-http" ,rust-opentelemetry-http-0.10)
                       ("rust-opentelemetry-prometheus" ,rust-opentelemetry-prometheus-0.14)
                       ("rust-opentelemetry-semantic-conventions" ,rust-opentelemetry-semantic-conventions-0.13)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-poem-derive" ,rust-poem-derive-1)
                       ("rust-priority-queue" ,rust-priority-queue-1)
                       ("rust-prometheus" ,rust-prometheus-0.13)
                       ("rust-quick-xml" ,rust-quick-xml-0.30)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rcgen" ,rust-rcgen-0.11)
                       ("rust-redis" ,rust-redis-0.23)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-rfc7239" ,rust-rfc7239-0.1)
                       ("rust-ring" ,rust-ring-0.16)
                       ("rust-rust-embed" ,rust-rust-embed-8)
                       ("rust-rustls-pemfile" ,rust-rustls-pemfile-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
                       ("rust-serde-yaml" ,rust-serde-yaml-0.9)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sse-codec" ,rust-sse-codec-0.3)
                       ("rust-tempfile" ,rust-tempfile-3.10.1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-time" ,rust-time-0.3.36)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-metrics" ,rust-tokio-metrics-0.3)
                       ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
                       ("rust-tokio-openssl" ,rust-tokio-openssl-0.6)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.24)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tokio-tungstenite" ,rust-tokio-tungstenite-0.20)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-unic-langid" ,rust-unic-langid-0.9)
                       ("rust-wildmatch" ,rust-wildmatch-2)
                       ("rust-x509-parser" ,rust-x509-parser-0.15))))
    (home-page "https://github.com/poem-web/poem")
    (synopsis
     "Poem is a full-featured and easy-to-use web framework with the Rust programming language")
    (description
     "This package provides Poem is a full-featured and easy-to-use web framework with the Rust programming
language.")
    (license (list license:expat license:asl2.0))))

(define-public rust-poem-derive-1
  (package
    (name "rust-poem-derive")
    (version "1.3.59")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "poem-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cdvid2ryn4h9wj7087shf20ijvahh1n44bmwghngn6qh13czpa2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-crate" ,rust-proc-macro-crate-2)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/poem-web/poem")
    (synopsis "Macros for poem")
    (description "This package provides Macros for poem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-polyval-0.5
  (package
    (name "rust-polyval")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "polyval" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1890wqvc0csc9y9k9k4gsbz91rgdnhn6xnfmy9pqkh674fvd46c4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cpufeatures" ,rust-cpufeatures-0.2)
                       ("rust-opaque-debug" ,rust-opaque-debug-0.3)
                       ("rust-universal-hash" ,rust-universal-hash-0.4)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/RustCrypto/universal-hashes")
    (synopsis
     "POLYVAL is a GHASH-like universal hash over GF(2^128) useful for constructing
a Message Authentication Code (MAC)")
    (description
     "This package provides POLYVAL is a GHASH-like universal hash over GF(2^128) useful for constructing a
Message Authentication Code (MAC).")
    (license (list license:asl2.0 license:expat))))

(define-public rust-portable-atomic-util-0.2
  (package
    (name "rust-portable-atomic-util")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "portable-atomic-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kbh4ik8cqr4bdbpyfh8n4xcwip93yciccvv815darif0wh89pgw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-portable-atomic" ,rust-portable-atomic-1))))
    (home-page "https://github.com/taiki-e/portable-atomic")
    (synopsis "Synchronization primitives built with portable-atomic.")
    (description
     "This package provides Synchronization primitives built with portable-atomic.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pp-rs-0.2
  (package
    (name "rust-pp-rs")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pp-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vkd9lgwf5rxy7qgzl8mka7vnghaq6nnn0nmg7mycl72ysvqnidv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/Kangz/glslpp-rs")
    (synopsis "Shader preprocessor")
    (description "This package provides Shader preprocessor.")
    (license license:bsd-3)))

(define-public rust-predicates-3.1.0
  (package
    (name "rust-predicates")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "predicates" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s676s13sva6ikv2qmfmm7n3y3jnzvwbbhy1xzgnr4h58vyppf38"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anstyle" ,rust-anstyle-1)
                       ("rust-difflib" ,rust-difflib-0.4)
                       ("rust-float-cmp" ,rust-float-cmp-0.9)
                       ("rust-normalize-line-endings" ,rust-normalize-line-endings-0.3)
                       ("rust-predicates-core" ,rust-predicates-core-1)
                       ("rust-regex" ,rust-regex-1))))
    (home-page "https://github.com/assert-rs/predicates-rs")
    (synopsis "An implementation of boolean-valued predicate functions")
    (description
     "This package provides An implementation of boolean-valued predicate functions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-presser-0.3
  (package
    (name "rust-presser")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "presser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ykvqx861sjmhkdh540aafqba7i7li7gqgwrcczy6v56i9m8xkz8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/EmbarkStudios/presser")
    (synopsis
     "crate to help you copy things into raw buffers without invoking spooky action at a distance (undefined behavior).")
    (description
     "This package provides a crate to help you copy things into raw buffers without
invoking spooky action at a distance (undefined behavior).")
    (license (list license:expat license:asl2.0))))

(define-public rust-printpdf-0.7
  (package
    (name "rust-printpdf")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "printpdf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "078b70v7iibk25shbq3nh3nd3y2kf651bnvh967ska9wgk44q2n3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-allsorts" ,rust-allsorts-0.14)
                       ("rust-image" ,rust-image-0.24)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-lopdf" ,rust-lopdf-0.31)
                       ("rust-owned-ttf-parser" ,rust-owned-ttf-parser-0.19)
                       ("rust-pdf-writer" ,rust-pdf-writer-0.9)
                       ("rust-svg2pdf" ,rust-svg2pdf-0.8)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-usvg" ,rust-usvg-0.35))))
    (home-page "https://github.com/fschutt/printpdf")
    (synopsis "Rust library for writing PDF files")
    (description "This package provides Rust library for writing PDF files.")
    (license license:expat)))

(define-public rust-proc-quote-0.4
  (package
    (name "rust-proc-quote")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-quote" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0051nax31x1yzr1imbp200l2gpz6pqcmlcna099r33773lbap12y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-proc-quote-impl" ,rust-proc-quote-impl-0.3)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/Goncalerta/proc-quote")
    (synopsis "procedural macro implementation of quote!.")
    (description
     "This package provides a procedural macro implementation of quote!.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-quote-impl-0.3
  (package
    (name "rust-proc-quote-impl")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-quote-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "184ax14pyazv5g6yma60ls7x4hd5q6wah1kf677xng06idifrcvz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1))))
    (home-page "https://github.com/Goncalerta/proc-quote")
    (synopsis "procedural macro implementation of quote!.")
    (description
     "This package provides a procedural macro implementation of quote!.")
    (license (list license:expat license:asl2.0))))

(define-public rust-procfs-0.16
  (package
    (name "rust-procfs")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "procfs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d4k8ai16b5cv05dpz7b87qn5dap3jdyfnrvycb5zhmhas9hs7kk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-procfs-core" ,rust-procfs-core-0.16)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/eminence/procfs")
    (synopsis "Interface to the linux procfs pseudo-filesystem")
    (description
     "This package provides Interface to the linux procfs pseudo-filesystem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-procfs-core-0.16
  (package
    (name "rust-procfs-core")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "procfs-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0acs0p19yfcs0h787ls24vi5ql4g6c62cm57qh2cxx397a958d9d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/eminence/procfs")
    (synopsis
     "Data structures and parsing for the linux procfs pseudo-filesystem")
    (description
     "This package provides Data structures and parsing for the linux procfs pseudo-filesystem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-prodash-28
  (package
    (name "rust-prodash")
    (version "28.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prodash" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y9d16s79168rc5k2djjb16vjcx27yargbfb6xz6m2mq4r6jcjkl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-io" ,rust-async-io-2)
                       ("rust-bytesize" ,rust-bytesize-1)
                       ("rust-crosstermion" ,rust-crosstermion-0.13)
                       ("rust-ctrlc" ,rust-ctrlc-3)
                       ("rust-dashmap" ,rust-dashmap-5)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-2)
                       ("rust-human-format" ,rust-human-format-1)
                       ("rust-humantime" ,rust-humantime-2)
                       ("rust-is-terminal" ,rust-is-terminal-0.4)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-ratatui" ,rust-ratatui-0.25.0)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-time" ,rust-time-0.3.36)
                       ("rust-tui-react" ,rust-tui-react-0.22)
                       ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/Byron/prodash")
    (synopsis
     "dashboard for visualizing progress of asynchronous and possibly blocking tasks")
    (description
     "This package provides a dashboard for visualizing progress of asynchronous and
possibly blocking tasks.")
    (license license:expat)))

(define-public rust-prometheus-0.13
  (package
    (name "rust-prometheus")
    (version "0.13.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prometheus" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lbymqdsh9v4zk4fjdq2gq6lbxspp1w3z2b9vfb7y7vp625c4crx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-procfs" ,rust-procfs-0.16)
                       ("rust-protobuf" ,rust-protobuf-2)
                       ("rust-protobuf-codegen-pure" ,rust-protobuf-codegen-pure-2)
                       ("rust-reqwest" ,rust-reqwest-0.12)
                       ("rust-thiserror" ,rust-thiserror-1.0.61))))
    (home-page "https://github.com/tikv/rust-prometheus")
    (synopsis "Prometheus instrumentation library for Rust applications")
    (description
     "This package provides Prometheus instrumentation library for Rust applications.")
    (license license:asl2.0)))

(define-public rust-psm-0.1
  (package
    (name "rust-psm")
    (version "0.1.23")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "psm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01gj25ma73zv0iy3z5bxg49zr299i9d53sgs6dh9f146ll6ghdxa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/rust-lang/stacker/")
    (synopsis
     "Portable Stack Manipulation: stack manipulation and introspection routines")
    (description
     "This package provides Portable Stack Manipulation: stack manipulation and introspection routines.")
    (license (list license:expat license:asl2.0))))

(define-public rust-puffin-0.19
  (package
    (name "rust-puffin")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "puffin" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bx0hyifrr2n9fhc718zyk8za7rqnv5p5pvjwpadx7q4pga6mxxr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-lz4-flex" ,rust-lz4-flex-0.11)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-ruzstd" ,rust-ruzstd-0.4)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-web-time" ,rust-web-time-0.2)
                       ("rust-zstd" ,rust-zstd-0.12))))
    (home-page "https://github.com/EmbarkStudios/puffin")
    (synopsis "Simple instrumentation profiler for games")
    (description
     "This package provides Simple instrumentation profiler for games.")
    (license (list license:expat license:asl2.0))))

(define-public rust-qrcode-0.14
  (package
    (name "rust-qrcode")
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "qrcode" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v693x68yg90wfpas5v4bf6cfmnq9dq54qfgd3kb33j07r3851yn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-image" ,rust-image-0.25))))
    (home-page "https://github.com/kennytm/qrcode-rust")
    (synopsis "QR code encoder in Rust")
    (description "This package provides QR code encoder in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-quick-xml-0.36.2
  (package
    (name "rust-quick-xml")
    (version "0.36.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quick-xml" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zj3sjcjk6sn544wb2wvhr1km5f9cy664vzclygfsnph9mxrlr7p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/tafia/quick-xml")
    (synopsis "High performance xml reader and writer")
    (description
     "This package provides High performance xml reader and writer.")
    (license license:expat)))

(define-public rust-range-alloc-0.1
  (package
    (name "rust-range-alloc")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "range-alloc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1azfwh89nd4idj0s272qgmw3x1cj6m7d3f44b2la02wzvkyrk2lw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/gfx-rs/range-alloc")
    (synopsis "Generic range allocator")
    (description "This package provides Generic range allocator.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ratatui-0.25.0
  (package
    (name "rust-ratatui")
    (version "0.25.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ratatui" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sw0s4s9y09n2nsxs996frrlmy4fay7ibwfrvar0fvmswi99wrd5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-cassowary" ,rust-cassowary-0.3)
                       ("rust-crossterm" ,rust-crossterm-0.27)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-indoc" ,rust-indoc-2)
                       ("rust-itertools" ,rust-itertools-0.12)
                       ("rust-lru" ,rust-lru-0.12)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-stability" ,rust-stability-0.1)
                       ("rust-strum" ,rust-strum-0.25)
                       ("rust-termion" ,rust-termion-2)
                       ("rust-termwiz" ,rust-termwiz-0.20)
                       ("rust-time" ,rust-time-0.3.36)
                       ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://ratatui.rs")
    (synopsis "library that's all about cooking up terminal user interfaces")
    (description
     "This package provides a library that's all about cooking up terminal user
interfaces.")
    (license license:expat)))

(define-public rust-redis-0.23
  (package
    (name "rust-redis")
    (version "0.23.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "redis" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fpqnckjlrhl7jbr1flrqg2hpccy3pz91gfiwzw2nh9zpg0csjag"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.7)
                       ("rust-arc-swap" ,rust-arc-swap-1)
                       ("rust-async-native-tls" ,rust-async-native-tls-0.4)
                       ("rust-async-std" ,rust-async-std-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-combine" ,rust-combine-4)
                       ("rust-crc16" ,rust-crc16-0.4)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-futures-rustls" ,rust-futures-rustls-0.24)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-r2d2" ,rust-r2d2-0.8)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rustls" ,rust-rustls-0.21)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.6)
                       ("rust-ryu" ,rust-ryu-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-sha1-smol" ,rust-sha1-smol-1)
                       ("rust-socket2" ,rust-socket2-0.4)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
                       ("rust-tokio-retry" ,rust-tokio-retry-0.3)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.24)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-url" ,rust-url-2)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.23))))
    (home-page "https://github.com/redis-rs/redis-rs")
    (synopsis "Redis driver for Rust")
    (description "This package provides Redis driver for Rust.")
    (license license:bsd-3)))

(define-public rust-regalloc2-0.9
  (package
    (name "rust-regalloc2")
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regalloc2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19i94jyjma82hgyf5wj83zkqc5wnfxnh38k3lcj7m6w7ki9ns5dd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-libfuzzer-sys" ,rust-libfuzzer-sys-0.4)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-slice-group-by" ,rust-slice-group-by-0.3)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/regalloc2")
    (synopsis "Backtracking register allocator inspired from IonMonkey")
    (description
     "This package provides Backtracking register allocator inspired from @code{IonMonkey}.")
    (license license:asl2.0)))

(define-public rust-regex-lite-0.1
  (package
    (name "rust-regex-lite")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex-lite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13ndx7ibckvlasyzylqpmwlbp4kahrrdl3ph2sybsdviyar63dih"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rust-lang/regex/tree/master/regex-lite")
    (synopsis
     "lightweight regex engine that optimizes for binary size and compilation time.")
    (description
     "This package provides a lightweight regex engine that optimizes for binary size
and compilation time.")
    (license (list license:expat license:asl2.0))))

(define-public rust-renderdoc-sys-1
  (package
    (name "rust-renderdoc-sys")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "renderdoc-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cj8zjs7k0gvchcx3jhpg8r9bbqy8b1hsgbz0flcq2ydn12hmcqr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page
     "https://github.com/ebkalderon/renderdoc-rs/tree/master/renderdoc-sys")
    (synopsis "Low-level bindings to the RenderDoc API")
    (description
     "This package provides Low-level bindings to the @code{RenderDoc} API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-reqwest-0.12
  (package
    (name "rust-reqwest")
    (version "0.12.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "reqwest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "047aa0qnngnlnf9i0abrs6pgmz15vk81p5pvscwhk3l6jbfsyv2n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-compression" ,rust-async-compression-0.4)
                       ("rust-base64" ,rust-base64-0.22.1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-cookie" ,rust-cookie-0.17)
                       ("rust-cookie-store" ,rust-cookie-store-0.20)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-h2" ,rust-h2-0.4)
                       ("rust-h3" ,rust-h3-0.0.4)
                       ("rust-h3-quinn" ,rust-h3-quinn-0.0.5)
                       ("rust-hickory-resolver" ,rust-hickory-resolver-0.24)
                       ("rust-http" ,rust-http-1)
                       ("rust-http-body" ,rust-http-body-1)
                       ("rust-http-body-util" ,rust-http-body-util-0.1.1)
                       ("rust-hyper" ,rust-hyper-1.3)
                       ("rust-hyper-rustls" ,rust-hyper-rustls-0.26)
                       ("rust-hyper-tls" ,rust-hyper-tls-0.6)
                       ("rust-hyper-util" ,rust-hyper-util-0.1)
                       ("rust-ipnet" ,rust-ipnet-2)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-quinn" ,rust-quinn-0.10)
                       ("rust-rustls" ,rust-rustls-0.22)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-pemfile" ,rust-rustls-pemfile-2)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
                       ("rust-sync-wrapper" ,rust-sync-wrapper-0.1)
                       ("rust-system-configuration" ,rust-system-configuration-0.5)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.25)
                       ("rust-tokio-socks" ,rust-tokio-socks-0.5)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-url" ,rust-url-2)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
                       ("rust-wasm-streams" ,rust-wasm-streams-0.4)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26)
                       ("rust-winreg" ,rust-winreg-0.52))))
    (home-page "https://github.com/seanmonstar/reqwest")
    (synopsis "higher level HTTP client library")
    (description "This package provides higher level HTTP client library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-resvg-0.28
  (package
    (name "rust-resvg")
    (version "0.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "resvg" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hcl2cw7f3bhvxs8r97nxzgh4r5ijay1iqw7y6f9j89n5lzqc5f1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gif" ,rust-gif-0.11)
                       ("rust-jpeg-decoder" ,rust-jpeg-decoder-0.3)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-pico-args" ,rust-pico-args-0.5)
                       ("rust-png" ,rust-png-0.17)
                       ("rust-rgb" ,rust-rgb-0.8)
                       ("rust-svgfilters" ,rust-svgfilters-0.4)
                       ("rust-svgtypes" ,rust-svgtypes-0.8)
                       ("rust-tiny-skia" ,rust-tiny-skia-0.8)
                       ("rust-usvg" ,rust-usvg-0.28)
                       ("rust-usvg-text-layout" ,rust-usvg-text-layout-0.28))))
    (home-page "https://github.com/RazrFalcon/resvg")
    (synopsis "An SVG rendering library")
    (description "This package provides An SVG rendering library.")
    (license license:mpl2.0)))

(define-public rust-rfc7239-0.1
  (package
    (name "rust-rfc7239")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rfc7239" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qqhdbxriyv6k0irmsxizga62a7raywfl83adp8kc0svxdgah1mi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-uncased" ,rust-uncased-0.9))))
    (home-page "https://github.com/icewind1991/rfc7239")
    (synopsis "Parser for rfc7239 formatted Forwarded headers")
    (description
     "This package provides Parser for rfc7239 formatted Forwarded headers.")
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
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-spin" ,rust-spin-0.9)
                       ("rust-untrusted" ,rust-untrusted-0.9)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/briansmith/ring")
    (synopsis "Safe, fast, small crypto using Rust")
    (description "This package provides Safe, fast, small crypto using Rust.")
    (license license:isc)))

(define-public rust-rocket-0.5
  (package
    (name "rust-rocket")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rocket" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gypf9z6s0kshv33qq1vf16raw8xnr1p03ii0kfgf7d3jrr905m5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-stream" ,rust-async-stream-0.3)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-atomic" ,rust-atomic-0.5)
                       ("rust-binascii" ,rust-binascii-0.1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-either" ,rust-either-1)
                       ("rust-figment" ,rust-figment-0.10)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-multer" ,rust-multer-3)
                       ("rust-num-cpus" ,rust-num-cpus-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-ref-cast" ,rust-ref-cast-1)
                       ("rust-rmp-serde" ,rust-rmp-serde-1)
                       ("rust-rocket-codegen" ,rust-rocket-codegen-0.5)
                       ("rust-rocket-http" ,rust-rocket-http-0.5)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-state" ,rust-state-0.6)
                       ("rust-tempfile" ,rust-tempfile-3.10.1)
                       ("rust-time" ,rust-time-0.3.36)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-ubyte" ,rust-ubyte-0.10)
                       ("rust-uuid" ,rust-uuid-1)
                       ("rust-version-check" ,rust-version-check-0.9)
                       ("rust-yansi" ,rust-yansi-1))))
    (home-page "https://rocket.rs")
    (synopsis
     "Web framework with a focus on usability, security, extensibility, and speed.")
    (description
     "This package provides Web framework with a focus on usability, security, extensibility, and speed.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rocket-codegen-0.5
  (package
    (name "rust-rocket-codegen")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rocket_codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0inxw7nzr52sabwpz83cz5rh1a0mg32cg7w7ih8715qsxkbk4pap"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-devise" ,rust-devise-0.4)
                       ("rust-glob" ,rust-glob-0.3)
                       ("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-rocket-http" ,rust-rocket-http-0.5)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2)
                       ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://rocket.rs")
    (synopsis "Procedural macros for the Rocket web framework")
    (description
     "This package provides Procedural macros for the Rocket web framework.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rocket-http-0.5
  (package
    (name "rust-rocket-http")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rocket_http" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fc2z0a7zhmf8rh7s1dwdmmkjmq7qiivsi6027v6ac7f41d92x72"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cookie" ,rust-cookie-0.18)
                       ("rust-either" ,rust-either-1)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-pear" ,rust-pear-0.2)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-ref-cast" ,rust-ref-cast-1)
                       ("rust-rustls" ,rust-rustls-0.21)
                       ("rust-rustls-pemfile" ,rust-rustls-pemfile-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-stable-pattern" ,rust-stable-pattern-0.1)
                       ("rust-state" ,rust-state-0.6)
                       ("rust-time" ,rust-time-0.3.36)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.24)
                       ("rust-uncased" ,rust-uncased-0.9)
                       ("rust-uuid" ,rust-uuid-1)
                       ("rust-x509-parser" ,rust-x509-parser-0.13))))
    (home-page "https://rocket.rs")
    (synopsis
     "Types, traits, and parsers for HTTP requests, responses, and headers.")
    (description
     "This package provides Types, traits, and parsers for HTTP requests, responses, and headers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-roxmltree-0.19
  (package
    (name "rust-roxmltree")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "roxmltree" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zs0q8hg5nnh91s1ib6r0fky7xm8ay63ayfa5i1afxxpwgalzl9w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/RazrFalcon/roxmltree")
    (synopsis "Represent an XML as a read-only tree")
    (description "This package provides Represent an XML as a read-only tree.")
    (license (list license:expat license:asl2.0))))

(define-public rust-roxmltree-0.18
  (package
    (name "rust-roxmltree")
    (version "0.18.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "roxmltree" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00mkd2xyrxm8ap39sxpkhzdzfn2m98q3zicf6wd2f6yfa7il08w6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-xmlparser" ,rust-xmlparser-0.13))))
    (home-page "https://github.com/RazrFalcon/roxmltree")
    (synopsis "Represent an XML as a read-only tree")
    (description "This package provides Represent an XML as a read-only tree.")
    (license (list license:expat license:asl2.0))))

(define-public rust-roxmltree-0.15
  (package
    (name "rust-roxmltree")
    (version "0.15.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "roxmltree" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12p4vyg6c906pclhpgq8h21x1acza3dl5wk1gqp156qj3a1yk7bb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-xmlparser" ,rust-xmlparser-0.13))))
    (home-page "https://github.com/RazrFalcon/roxmltree")
    (synopsis "Represent an XML as a read-only tree")
    (description "This package provides Represent an XML as a read-only tree.")
    (license (list license:expat license:asl2.0))))

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
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-signature" ,rust-signature-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/RustCrypto/RSA")
    (synopsis "Pure Rust RSA implementation")
    (description "This package provides Pure Rust RSA implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rust-embed-8
  (package
    (name "rust-rust-embed")
    (version "8.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-embed" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sl0fxzf8rpi04agfa8slpny2gk6l1vy23pdlycyn0j9c10rfm0r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-actix-web" ,rust-actix-web-4)
                       ("rust-axum" ,rust-axum-0.7)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-include-flate" ,rust-include-flate-0.2)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-poem" ,rust-poem-1)
                       ("rust-rocket" ,rust-rocket-0.5)
                       ("rust-rust-embed-impl" ,rust-rust-embed-impl-8)
                       ("rust-rust-embed-utils" ,rust-rust-embed-utils-8)
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

(define-public rust-rust-embed-impl-8
  (package
    (name "rust-rust-embed-impl")
    (version "8.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-embed-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1r0fyjdzfdaalbpq2hw29krn29gbmbi8xpyk60gl0r7chgi9d7yb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-rust-embed-utils" ,rust-rust-embed-utils-8)
                       ("rust-shellexpand" ,rust-shellexpand-3)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/pyros2097/rust-embed")
    (synopsis
     "Rust Custom Derive Macro which loads files into the rust binary at compile time during release and loads the file from the fs during dev")
    (description
     "This package provides Rust Custom Derive Macro which loads files into the rust binary at compile time
during release and loads the file from the fs during dev.")
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

(define-public rust-rust-embed-utils-8
  (package
    (name "rust-rust-embed-utils")
    (version "8.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-embed-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cmgq7f9slzw94yd43v8m55fysykgxsxwj0kf0q0hql5c5l4mirq"))))
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

(define-public rust-rustc-demangle-0.1
  (package
    (name "rust-rustc-demangle")
    (version "0.1.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-demangle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07zysaafgrkzy2rjgwqdj2a8qdpsm6zv6f5pgpk9x0lm40z9b6vi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/rust-lang/rustc-demangle")
    (synopsis "Rust compiler symbol demangling.")
    (description "This package provides Rust compiler symbol demangling.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustix-0.38.34
  (package
    (name "rust-rustix")
    (version "0.38.34")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustix" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03vkqa2ism7q56rkifyy8mns0wwqrk70f4i4fd53r97p8b05xp3h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-errno" ,rust-errno-0.3)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-linux-raw-sys" ,rust-linux-raw-sys-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/bytecodealliance/rustix")
    (synopsis "Safe Rust bindings to POSIX/Unix/Linux/Winsock-like syscalls")
    (description
     "This package provides Safe Rust bindings to POSIX/Unix/Linux/Winsock-like syscalls.")
    (license (list license:asl2.0 license:expat license:asl2.0 license:expat))))

(define-public rust-rustls-0.23
  (package
    (name "rust-rustls")
    (version "0.23.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nqcwvq3jjjagd83gl194jamq0q2x0fg697vmd7dwsans3vg0652"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aws-lc-rs" ,rust-aws-lc-rs-1)
                       ("rust-brotli" ,rust-brotli-6)
                       ("rust-brotli-decompressor" ,rust-brotli-decompressor-4)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-ring" ,rust-ring-0.17)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-rustls-webpki" ,rust-rustls-webpki-0.102)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-zeroize" ,rust-zeroize-1)
                       ("rust-zlib-rs" ,rust-zlib-rs-0.1))))
    (home-page "https://github.com/rustls/rustls")
    (synopsis "Rustls is a modern TLS library written in Rust")
    (description
     "This package provides Rustls is a modern TLS library written in Rust.")
    (license (list license:asl2.0 license:isc license:expat))))

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
                       ("rust-log" ,rust-log-0.4.21)
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

(define-public rust-rustls-pki-types-1
  (package
    (name "rust-rustls-pki-types")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls-pki-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0banlc9xzwqrx8n0h4bd0igmq3z5hc72rn941lf22cp3gkkraqlp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-web-time" ,rust-web-time-1))))
    (home-page "https://github.com/rustls/pki-types")
    (synopsis "Shared types for the rustls PKI ecosystem")
    (description
     "This package provides Shared types for the rustls PKI ecosystem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustls-webpki-0.102
  (package
    (name "rust-rustls-webpki")
    (version "0.102.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls-webpki" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gmk2abk7y2cdppqlaqmnhcv690p19af9n66sjvw84z9j9z8yi7z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aws-lc-rs" ,rust-aws-lc-rs-1)
                       ("rust-ring" ,rust-ring-0.17)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-untrusted" ,rust-untrusted-0.9))))
    (home-page "https://github.com/rustls/webpki")
    (synopsis "Web PKI X.509 Certificate Verification")
    (description
     "This package provides Web PKI X.509 Certificate Verification.")
    (license license:isc)))

(define-public rust-rustybuzz-0.7
  (package
    (name "rust-rustybuzz")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustybuzz" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0siamd66ia90ckmxszapxy280j1lhq0r2xlmndqy5gk1w91dyaqn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-libm" ,rust-libm-0.2)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-ttf-parser" ,rust-ttf-parser-0.18)
                       ("rust-unicode-bidi-mirroring" ,rust-unicode-bidi-mirroring-0.1)
                       ("rust-unicode-ccc" ,rust-unicode-ccc-0.1)
                       ("rust-unicode-general-category" ,rust-unicode-general-category-0.6)
                       ("rust-unicode-script" ,rust-unicode-script-0.5))))
    (home-page "https://github.com/RazrFalcon/rustybuzz")
    (synopsis "complete harfbuzz shaping algorithm port to Rust.")
    (description
     "This package provides a complete harfbuzz shaping algorithm port to Rust.")
    (license license:expat)))

(define-public rust-rustybuzz-0.6
  (package
    (name "rust-rustybuzz")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustybuzz" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12g40lnfsjjygv30grsdczz9k06n1gd1p9jm4d0ja1lhyvn397mb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-libm" ,rust-libm-0.2)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-ttf-parser" ,rust-ttf-parser-0.17)
                       ("rust-unicode-bidi-mirroring" ,rust-unicode-bidi-mirroring-0.1)
                       ("rust-unicode-ccc" ,rust-unicode-ccc-0.1)
                       ("rust-unicode-general-category" ,rust-unicode-general-category-0.6)
                       ("rust-unicode-script" ,rust-unicode-script-0.5))))
    (home-page "https://github.com/RazrFalcon/rustybuzz")
    (synopsis "complete harfbuzz shaping algorithm port to Rust.")
    (description
     "This package provides a complete harfbuzz shaping algorithm port to Rust.")
    (license license:expat)))

(define-public rust-ruzstd-0.7
  (package
    (name "rust-ruzstd")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ruzstd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1x0rymfy85j5xcai2vwmcsdaydxzvxy7zrxsbig997xx4qyqz2qw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-twox-hash" ,rust-twox-hash-1))))
    (home-page "https://github.com/KillingSpark/zstd-rs")
    (synopsis "decoder for the zstd compression format")
    (description
     "This package provides a decoder for the zstd compression format.")
    (license license:expat)))

(define-public rust-ruzstd-0.6
  (package
    (name "rust-ruzstd")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ruzstd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yygqpar2x910lnii4k5p43aj4943hlnxpczmqhsfddmxrqa8x2i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-twox-hash" ,rust-twox-hash-1))))
    (home-page "https://github.com/KillingSpark/zstd-rs")
    (synopsis "decoder for the zstd compression format")
    (description
     "This package provides a decoder for the zstd compression format.")
    (license license:expat)))

(define-public rust-salvo-0.16
  (package
    (name "rust-salvo")
    (version "0.16.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "salvo" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jw9h9aac4ms9shvssc8mw53q9842f5bfqv1a8aqkpcyd2j23n4b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-salvo-core" ,rust-salvo-core-0.16)
                       ("rust-salvo-extra" ,rust-salvo-extra-0.16))))
    (home-page "https://salvo.rs")
    (synopsis
     "Salvo is a powerful web framework that can make your work easier.")
    (description
     "This package provides Salvo is a powerful web framework that can make your work easier.")
    (license (list license:expat license:asl2.0))))

(define-public rust-salvo-core-0.16
  (package
    (name "rust-salvo-core")
    (version "0.16.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "salvo_core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01dazprfzmjmvwgcrvqxjd12hgwwlk71mskwyl4cj2y2gm5p80bv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-async-compression" ,rust-async-compression-0.3)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-cookie" ,rust-cookie-0.16)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-fastrand" ,rust-fastrand-1)
                       ("rust-form-urlencoded" ,rust-form-urlencoded-1)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-headers" ,rust-headers-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-multer" ,rust-multer-2)
                       ("rust-multimap" ,rust-multimap-0.8)
                       ("rust-num-cpus" ,rust-num-cpus-1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-pin-utils" ,rust-pin-utils-0.1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-rustls-pemfile" ,rust-rustls-pemfile-0.2)
                       ("rust-salvo-macros" ,rust-salvo-macros-0.16)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-tempdir" ,rust-tempdir-0.3)
                       ("rust-textnonce" ,rust-textnonce-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.23)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://salvo.rs")
    (synopsis
     "Salvo is a powerful web framework that can make your work easier.")
    (description
     "This package provides Salvo is a powerful web framework that can make your work easier.")
    (license (list license:expat license:asl2.0))))

(define-public rust-salvo-extra-0.16
  (package
    (name "rust-salvo-extra")
    (version "0.16.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "salvo_extra" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "023wagm5mpkp1jnpggllbddqigsy5h4qnw2lk8m3j25fj61fl3iy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-compression" ,rust-async-compression-0.3)
                       ("rust-async-session" ,rust-async-session-3)
                       ("rust-base64" ,rust-base64-0.13)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-cookie" ,rust-cookie-0.16)
                       ("rust-csrf" ,rust-csrf-0.4)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-hkdf" ,rust-hkdf-0.12)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-hyper-rustls" ,rust-hyper-rustls-0.23)
                       ("rust-jsonwebtoken" ,rust-jsonwebtoken-7)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-salvo-core" ,rust-salvo-core-0.16)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tokio-tungstenite" ,rust-tokio-tungstenite-0.16)
                       ("rust-tokio-util" ,rust-tokio-util-0.6)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://salvo.rs")
    (synopsis
     "Salvo is a powerful web framework that can make your work easier.")
    (description
     "This package provides Salvo is a powerful web framework that can make your work easier.")
    (license (list license:expat license:asl2.0))))

(define-public rust-salvo-macros-0.16
  (package
    (name "rust-salvo-macros")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "salvo_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hdlzvcv2vvbr60w1kmfr9bx8glx4xs9g0ry1pwa7yf7ig987z90"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-crate" ,rust-proc-macro-crate-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-proc-quote" ,rust-proc-quote-0.4)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://salvo.rs")
    (synopsis "salvo proc macros")
    (description "This package provides salvo proc macros.")
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
                       ("rust-serde" ,rust-serde-1.0.203)
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

(define-public rust-self-cell-0.10
  (package
    (name "rust-self-cell")
    (version "0.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "self_cell" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pci3zh23b7dg6jmlxbn8k4plb7hcg5jprd1qiz0rp04p1ilskp1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-self-cell" ,rust-self-cell-1))))
    (home-page "https://github.com/Voultapher/self_cell")
    (synopsis
     "Safe-to-use proc-macro-free self-referential structs in stable Rust")
    (description
     "This package provides Safe-to-use proc-macro-free self-referential structs in stable Rust.")
    (license license:asl2.0)))

(define-public rust-serde-1.0.203
  (package
    (name "rust-serde")
    (version "1.0.203")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1500ghq198n6py5anvz5qbqagd9h1hq04f4qpsvjzrvix56snlvj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-serde-derive" ,rust-serde-derive-1.203))))
    (home-page "https://serde.rs")
    (synopsis "generic serialization/deserialization framework")
    (description
     "This package provides a generic serialization/deserialization framework.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-1.0.203
  (package
    (name "rust-serde")
    (version "1.0.203")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1500ghq198n6py5anvz5qbqagd9h1hq04f4qpsvjzrvix56snlvj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-serde-derive" ,rust-serde-derive-1.203))))
    (home-page "https://serde.rs")
    (synopsis "generic serialization/deserialization framework")
    (description
     "This package provides a generic serialization/deserialization framework.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-derive-1.203
  (package
    (name "rust-serde-derive")
    (version "1.0.203")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fmmqmfza3mwxb1v80737dj01gznrh8mhgqgylkndx5npq7bq32h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://serde.rs")
    (synopsis "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (description
     "This package provides Macros 1.1 implementation of #[derive(Serialize, Deserialize)].")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-derive-1.203
  (package
    (name "rust-serde-derive")
    (version "1.0.203")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fmmqmfza3mwxb1v80737dj01gznrh8mhgqgylkndx5npq7bq32h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://serde.rs")
    (synopsis "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (description
     "This package provides Macros 1.1 implementation of #[derive(Serialize, Deserialize)].")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-json-1.0.117
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
       #:cargo-inputs (("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-ryu" ,rust-ryu-1)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/serde-rs/json")
    (synopsis "JSON serialization file format")
    (description "This package provides a JSON serialization file format.")
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
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-serde-with-macros" ,rust-serde-with-macros-2)
                       ("rust-time" ,rust-time-0.3.36))))
    (home-page "https://github.com/jonasbb/serde_with/")
    (synopsis "Custom de/serialization functions for Rust's serde")
    (description
     "This package provides Custom de/serialization functions for Rust's serde.")
    (license (list license:expat license:asl2.0))))

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

(define-public rust-simple-asn1-0.4
  (package
    (name "rust-simple-asn1")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "simple_asn1" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jxy9as8nj65c2n27j843g4fpb95x4fjz31w6qx63q3wwlys2b39"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-chrono" ,rust-chrono-0.4)
                       ("rust-num-bigint" ,rust-num-bigint-0.2)
                       ("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/acw/simple_asn1")
    (synopsis "simple DER/ASN.1 encoding/decoding library.")
    (description
     "This package provides a simple DER/ASN.1 encoding/decoding library.")
    (license license:isc)))

(define-public rust-simplecss-0.2
  (package
    (name "rust-simplecss")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "simplecss" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17g8q1z9xrkd27ic9nrfirj6in4rai6l9ws0kxz45n97573ff6x1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4.21))))
    (home-page "https://github.com/RazrFalcon/simplecss")
    (synopsis "simple CSS 2 parser and selector.")
    (description "This package provides a simple CSS 2 parser and selector.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sluice-0.5
  (package
    (name "rust-sluice")
    (version "0.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sluice" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d9ywr5039ibgaby8sc72f8fs5lpp8j5y6p3npya4jplxz000x3d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-channel" ,rust-async-channel-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-io" ,rust-futures-io-0.3))))
    (home-page "https://github.com/sagebind/sluice")
    (synopsis
     "Efficient ring buffer for byte buffers, FIFO queues, and SPSC channels")
    (description
     "This package provides Efficient ring buffer for byte buffers, FIFO queues, and SPSC channels.")
    (license license:expat)))

(define-public rust-smallvec-1
  (package
    (name "rust-smallvec")
    (version "1.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smallvec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rsw5samawl3wsw6glrsb127rx6sh89a8wyikicw6dkdcjd1lpiw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/servo/rust-smallvec")
    (synopsis
     "'Small vector' optimization: store up to a small number of items on the stack")
    (description
     "This package provides Small vector optimization: store up to a small number of items on the stack.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sorted-vec-0.8
  (package
    (name "rust-sorted-vec")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sorted-vec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0n3l8v05b2d7yd1arwylx0a6qb4vncps3k7abvfsslbg1fplqwy6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://gitlab.com/spearman/sorted-vec")
    (synopsis "Create and maintain sorted vectors and vector-backed sets")
    (description
     "This package provides Create and maintain sorted vectors and vector-backed sets.")
    (license license:asl2.0)))

(define-public rust-souper-ir-2
  (package
    (name "rust-souper-ir")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "souper-ir" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i60q84w5k3rd0j3zhsdc5xasrd4wrkamyrs01rik3lq6g71h355"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-id-arena" ,rust-id-arena-2))))
    (home-page "https://github.com/fitzgen/souper-ir")
    (synopsis "library for manipulating Souper IR")
    (description "This package provides a library for manipulating Souper IR.")
    (license (list license:expat license:asl2.0))))

(define-public rust-spdx-0.10
  (package
    (name "rust-spdx")
    (version "0.10.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spdx" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1g0li9pyw46jzh7b4b6l25164sqdp08jvbp1c4wbb19pysx7nca7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/EmbarkStudios/spdx")
    (synopsis "Helper crate for SPDX expressions")
    (description "This package provides Helper crate for SPDX expressions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-spirv-0.3
  (package
    (name "rust-spirv")
    (version "0.3.0+sdk-1.3.268.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spirv" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i3qj7yvvprai1s03dvll2gkfy8398nl64wvllkhaaa4vh1i197d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/gfx-rs/rspirv")
    (synopsis "Rust definition of SPIR-V structs and enums")
    (description
     "This package provides Rust definition of SPIR-V structs and enums.")
    (license license:asl2.0)))

(define-public rust-sse-codec-0.3
  (package
    (name "rust-sse-codec")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sse-codec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nh8b1y2k5lsvcva15da4by935bavirfpavs0d54pi2h2f0rz9c4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-0.4)
                       ("rust-bytes" ,rust-bytes-0.5)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-codec" ,rust-futures-codec-0.4)
                       ("rust-memchr" ,rust-memchr-2))))
    (home-page "https://github.com/goto-bus-stop/sse-codec")
    (synopsis "async Server-Sent Events protocol encoder/decoder")
    (description
     "This package provides async Server-Sent Events protocol encoder/decoder.")
    (license license:mpl2.0)))

(define-public rust-ssh2-0.9
  (package
    (name "rust-ssh2")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ssh2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0malilb9lbzlh3i24nb6s61lmz5as801swy30ib6v7sm20cldzp7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libssh2-sys" ,rust-libssh2-sys-0.3)
                       ("rust-parking-lot" ,rust-parking-lot-0.11))))
    (home-page "https://github.com/alexcrichton/ssh2-rs")
    (synopsis
     "Bindings to libssh2 for interacting with SSH servers and executing remote
commands, forwarding local ports, etc.")
    (description
     "This package provides Bindings to libssh2 for interacting with SSH servers and executing remote
commands, forwarding local ports, etc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-stability-0.1
  (package
    (name "rust-stability")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stability" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kn3vcicmpg8bnyalp15i2j0dbv6c0wc62022bcs58jdi5vv3lgb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/sagebind/stability")
    (synopsis "Rust API stability attributes for the rest of us")
    (description
     "This package provides Rust API stability attributes for the rest of us.")
    (license license:expat)))

(define-public rust-stable-pattern-0.1
  (package
    (name "rust-stable-pattern")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stable-pattern" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i8hq82vm82mqj02qqcsd7caibrih7x5w3a1xpm8hpv30261cr25"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-memchr" ,rust-memchr-2))))
    (home-page "https://github.com/SergioBenitez/stable-pattern")
    (synopsis "Stable port of std::str::Pattern and friends")
    (description
     "This package provides Stable port of std::str::Pattern and friends.")
    (license (list license:expat license:asl2.0))))

(define-public rust-state-0.6
  (package
    (name "rust-state")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "state" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n3n2h324h1y5zhaajh6kplvzfvg1l6hsr8siggmf4yq8m24m31b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-loom" ,rust-loom-0.5))))
    (home-page "https://github.com/SergioBenitez/state")
    (synopsis
     "library for safe and effortless global and thread-local state management.")
    (description
     "This package provides a library for safe and effortless global and thread-local
state management.")
    (license (list license:expat license:asl2.0))))

(define-public rust-strict-num-0.1
  (package
    (name "rust-strict-num")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strict-num" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cb7l1vhb8zj90mzm8avlk815k40sql9515s865rqdrdfavvldv6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-float-cmp" ,rust-float-cmp-0.9))))
    (home-page "https://github.com/RazrFalcon/strict-num")
    (synopsis "collection of bounded numeric types")
    (description
     "This package provides a collection of bounded numeric types.")
    (license license:expat)))

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

(define-public rust-subtle-2
  (package
    (name "rust-subtle")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subtle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00b6jzh9gzb0h9n25g06nqr90z3xzqppfhhb260s1hjhh4pg7pkb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://dalek.rs/")
    (synopsis
     "Pure-Rust traits and utilities for constant-time cryptographic implementations")
    (description
     "This package provides Pure-Rust traits and utilities for constant-time cryptographic implementations.")
    (license license:bsd-3)))

(define-public rust-svg2pdf-0.8
  (package
    (name "rust-svg2pdf")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "svg2pdf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1j403ljabh5fdqqdxmim06b05n77r1dnpkhvm9syxnr5gpkkla54"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-4)
                       ("rust-fontdb" ,rust-fontdb-0.14)
                       ("rust-image" ,rust-image-0.24)
                       ("rust-miniz-oxide" ,rust-miniz-oxide-0.7)
                       ("rust-pdf-writer" ,rust-pdf-writer-0.9)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-usvg" ,rust-usvg-0.35))))
    (home-page "https://github.com/typst/svg2pdf")
    (synopsis "Convert SVG files to PDFs")
    (description "This package provides Convert SVG files to PDFs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-svgfilters-0.4
  (package
    (name "rust-svgfilters")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "svgfilters" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kjbl0khhq548ciw2lnmkk3w2q6ncda6yzgkg7qjvp2zq7mvr6k3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-float-cmp" ,rust-float-cmp-0.9)
                       ("rust-rgb" ,rust-rgb-0.8))))
    (home-page "https://github.com/RazrFalcon/resvg/tree/master/svgfilters")
    (synopsis "Implementation of various SVG filters")
    (description
     "This package provides Implementation of various SVG filters.")
    (license license:mpl2.0)))

(define-public rust-svgtypes-0.11
  (package
    (name "rust-svgtypes")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "svgtypes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19q2xxy8d3sl7406jy8kd4inklp2v62y667sq1l7y9zkww8hcjzd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-kurbo" ,rust-kurbo-0.9)
                       ("rust-siphasher" ,rust-siphasher-0.3))))
    (home-page "https://github.com/RazrFalcon/svgtypes")
    (synopsis "SVG types parser")
    (description "This package provides SVG types parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-svgtypes-0.8
  (package
    (name "rust-svgtypes")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "svgtypes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r2mjyrsyrczd05hycw0ww03nqv4hyqsd67qajxpcsmc5f55x5r2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-siphasher" ,rust-siphasher-0.3))))
    (home-page "https://github.com/RazrFalcon/svgtypes")
    (synopsis "SVG types parser")
    (description "This package provides SVG types parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sync-wrapper-1
  (package
    (name "rust-sync-wrapper")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sync_wrapper" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "150k6lwvr4nl237ngsz8fj5j78k712m4bggrfyjsidllraz5l1m7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-core" ,rust-futures-core-0.3))))
    (home-page "https://docs.rs/sync_wrapper")
    (synopsis
     "tool for enlisting the compiler's help in proving the absence of concurrency")
    (description
     "This package provides a tool for enlisting the compiler's help in proving the
absence of concurrency.")
    (license license:asl2.0)))

(define-public rust-synstructure-0.13
  (package
    (name "rust-synstructure")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "synstructure" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wc9f002ia2zqcbj0q2id5x6n7g1zjqba7qkg2mr0qvvmdk7dby8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/mystor/synstructure")
    (synopsis "Helper methods and macros for custom derives")
    (description
     "This package provides Helper methods and macros for custom derives.")
    (license license:expat)))

(define-public rust-system-interface-0.27
  (package
    (name "rust-system-interface")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "system-interface" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19hh608hj3f3c0lc1vmd2dzkgmgbmhm3qbngnflqh03m49nm4n5q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-cap-fs-ext" ,rust-cap-fs-ext-3)
                       ("rust-cap-std" ,rust-cap-std-3)
                       ("rust-char-device" ,rust-char-device-0.16)
                       ("rust-fd-lock" ,rust-fd-lock-4)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-os-pipe" ,rust-os-pipe-1)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-socketpair" ,rust-socketpair-0.19)
                       ("rust-ssh2" ,rust-ssh2-0.9)
                       ("rust-windows-sys" ,rust-windows-sys-0.52)
                       ("rust-winx" ,rust-winx-0.36))))
    (home-page "https://github.com/bytecodealliance/system-interface")
    (synopsis "Extensions to the Rust standard library")
    (description
     "This package provides Extensions to the Rust standard library.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-target-lexicon-0.12.16
  (package
    (name "rust-target-lexicon")
    (version "0.12.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "target-lexicon" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cg3bnx1gdkdr5hac1hzxy64fhw4g7dqkd0n3dxy5lfngpr1mi31"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bytecodealliance/target-lexicon")
    (synopsis "Targeting utilities for compilers and related tools")
    (description
     "This package provides Targeting utilities for compilers and related tools.")
    (license license:asl2.0)))

(define-public rust-tempfile-3.10.1
  (package
    (name "rust-tempfile")
    (version "3.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tempfile" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wdzz35ri168jn9al4s1g2rnsrr5ci91khgarc2rvpb3nappzdw5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-fastrand" ,rust-fastrand-2)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://stebalien.com/projects/tempfile-rs/")
    (synopsis "library for managing temporary files and directories.")
    (description
     "This package provides a library for managing temporary files and directories.")
    (license (list license:expat license:asl2.0))))

(define-public rust-termcolor-1
  (package
    (name "rust-termcolor")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "termcolor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mappjh3fj3p2nmrg4y7qv94rchwi9mzmgmfflr8p2awdj7lyy86"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-winapi-util" ,rust-winapi-util-0.1))))
    (home-page "https://github.com/BurntSushi/termcolor")
    (synopsis
     "simple cross platform library for writing colored text to a terminal.")
    (description
     "This package provides a simple cross platform library for writing colored text
to a terminal.")
    (license (list license:unlicense license:expat))))

(define-public rust-terminal-size-0.4
  (package
    (name "rust-terminal-size")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "terminal_size" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vx6a5klj7sjkx59v78gh93j445s09y2fasiykwgsb04rbbrnnag"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustix" ,rust-rustix-0.38)
                       ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page "https://github.com/eminence/terminal-size")
    (synopsis "Gets the size of your Linux or Windows terminal")
    (description
     "This package provides Gets the size of your Linux or Windows terminal.")
    (license (list license:expat license:asl2.0))))

(define-public rust-termwiz-0.20
  (package
    (name "rust-termwiz")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "termwiz" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yj80sli95wcw0im2iic9h7mx20hms3f9shxk7jarjqgl5waj2cm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-cassowary" ,rust-cassowary-0.3)
                       ("rust-filedescriptor" ,rust-filedescriptor-0.8)
                       ("rust-finl-unicode" ,rust-finl-unicode-1)
                       ("rust-fixedbitset" ,rust-fixedbitset-0.4)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-image" ,rust-image-0.24)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-memmem" ,rust-memmem-0.1)
                       ("rust-nix" ,rust-nix-0.24)
                       ("rust-num-derive" ,rust-num-derive-0.3)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-ordered-float" ,rust-ordered-float-3)
                       ("rust-pest" ,rust-pest-2)
                       ("rust-pest-derive" ,rust-pest-derive-2)
                       ("rust-phf" ,rust-phf-0.10)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.11)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-sha2" ,rust-sha2-0.9)
                       ("rust-signal-hook" ,rust-signal-hook-0.1)
                       ("rust-siphasher" ,rust-siphasher-0.3)
                       ("rust-terminfo" ,rust-terminfo-0.7)
                       ("rust-termios" ,rust-termios-0.3)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-ucd-trie" ,rust-ucd-trie-0.1)
                       ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
                       ("rust-vtparse" ,rust-vtparse-0.6)
                       ("rust-wezterm-bidi" ,rust-wezterm-bidi-0.2)
                       ("rust-wezterm-color-types" ,rust-wezterm-color-types-0.2)
                       ("rust-wezterm-dynamic" ,rust-wezterm-dynamic-0.1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis "Terminal Wizardry for Unix and Windows")
    (description
     "This package provides Terminal Wizardry for Unix and Windows.")
    (license license:expat)))

(define-public rust-textnonce-1
  (package
    (name "rust-textnonce")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "textnonce" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10v653sz0305dlzdqh6wh795hxypk24s21iiqcfyv16p1kbzhhvp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.12)
                       ("rust-rand" ,rust-rand-0.7)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/mikedilger/textnonce")
    (synopsis "Text based random nonce generator")
    (description "This package provides Text based random nonce generator.")
    (license (list license:expat license:asl2.0))))

(define-public rust-thiserror-1.0.61
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

(define-public rust-time-0.3.36
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
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-num-conv" ,rust-num-conv-0.1)
                       ("rust-num-threads" ,rust-num-threads-0.1)
                       ("rust-powerfmt" ,rust-powerfmt-0.2)
                       ("rust-quickcheck" ,rust-quickcheck-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-time-core" ,rust-time-core-0.1)
                       ("rust-time-macros" ,rust-time-macros-0.2))))
    (home-page "https://time-rs.github.io")
    (synopsis
     "Date and time library. Fully interoperable with the standard library. Mostly compatible with #![no_std]")
    (description
     "This package provides Date and time library.  Fully interoperable with the standard library.  Mostly
compatible with #![no_std].")
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

(define-public rust-tiny-skia-path-0.10
  (package
    (name "rust-tiny-skia-path")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tiny-skia-path" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0718wy4s962wgwz2x2j08w6qr3m6mvm5c98srrx6ihlsr0sslq1g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayref" ,rust-arrayref-0.3)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-libm" ,rust-libm-0.2)
                       ("rust-strict-num" ,rust-strict-num-0.1))))
    (home-page "https://github.com/RazrFalcon/tiny-skia/tree/master/path")
    (synopsis "tiny-skia Bezier path implementation")
    (description
     "This package provides a tiny-skia Bezier path implementation.")
    (license license:bsd-3)))

(define-public rust-tinystr-0.7
  (package
    (name "rust-tinystr")
    (version "0.7.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tinystr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bxqaw7z8r2kzngxlzlgvld1r6jbnwyylyvyjbv1q71rvgaga5wi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-databake" ,rust-databake-0.1)
                       ("rust-displaydoc" ,rust-displaydoc-0.2)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-zerovec" ,rust-zerovec-0.10))))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis "small ASCII-only bounded length string representation.")
    (description
     "This package provides a small ASCII-only bounded length string representation.")
    (license license:expat)))

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
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-ark-bls12-381" ,rust-ark-bls12-381-0.4)
                       ("rust-ark-ec" ,rust-ark-ec-0.4)
                       ("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-with" ,rust-serde-with-2)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/thibmeu/tlock-rs")
    (synopsis "Rust encryption library for practical time-lock encryption")
    (description
     "This package provides Rust encryption library for practical time-lock encryption.")
    (license license:expat)))

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
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-ark-bls12-381" ,rust-ark-bls12-381-0.4)
                       ("rust-ark-ec" ,rust-ark-ec-0.4)
                       ("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-with" ,rust-serde-with-2)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/thibmeu/tlock-rs")
    (synopsis "Rust encryption library for practical time-lock encryption")
    (description
     "This package provides Rust encryption library for practical time-lock encryption.")
    (license license:expat)))

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
                       ("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-tlock" ,rust-tlock-0.0.5))))
    (home-page "https://github.com/thibmeu/tlock-rs")
    (synopsis "Rust encryption library for hybrid time-lock encryption")
    (description
     "This package provides Rust encryption library for hybrid time-lock encryption.")
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
                       ("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-tlock" ,rust-tlock-0.0.3))))
    (home-page "https://github.com/thibmeu/tlock-rs")
    (synopsis "Rust encryption library for hybrid time-lock encryption")
    (description
     "This package provides Rust encryption library for hybrid time-lock encryption.")
    (license license:expat)))

(define-public rust-tokio-metrics-0.3
  (package
    (name "rust-tokio-metrics")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-metrics" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04p1kf7sgcrs2n62331fm5yvv8scqv2x81qixdz8pjb23lj0kkpa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1))))
    (home-page "https://tokio.rs")
    (synopsis "Runtime and task level metrics for Tokio applications.")
    (description
     "This package provides Runtime and task level metrics for Tokio applications.")
    (license license:expat)))

(define-public rust-tokio-retry-0.3
  (package
    (name "rust-tokio-retry")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-retry" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kr1hnm5dmb9gfkby88yg2xj8g6x4i4gipva0c8ca3xyxhvfnmvz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-pin-project" ,rust-pin-project-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/srijs/rust-tokio-retry")
    (synopsis "Extensible, asynchronous retry behaviours for futures/tokio")
    (description
     "This package provides Extensible, asynchronous retry behaviours for futures/tokio.")
    (license license:expat)))

(define-public rust-tokio-rustls-0.26
  (package
    (name "rust-tokio-rustls")
    (version "0.26.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1m00czrmk8x7pdjnz10a3da3i1d0sdf9j9vfp5dnk5ss1q6w8yqc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustls" ,rust-rustls-0.23)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/rustls/tokio-rustls")
    (synopsis "Asynchronous TLS/SSL streams for Tokio using Rustls")
    (description
     "This package provides Asynchronous TLS/SSL streams for Tokio using Rustls.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tokio-tungstenite-0.21
  (package
    (name "rust-tokio-tungstenite")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-tungstenite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0f5wj0crsx74rlll97lhw0wk6y12nhdnqvmnjx002hjn08fmcfy8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-rustls" ,rust-rustls-0.22)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.25)
                       ("rust-tungstenite" ,rust-tungstenite-0.21)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26))))
    (home-page "https://github.com/snapview/tokio-tungstenite")
    (synopsis
     "Tokio binding for Tungstenite, the Lightweight stream-based WebSocket implementation")
    (description
     "This package provides Tokio binding for Tungstenite, the Lightweight stream-based @code{WebSocket}
implementation.")
    (license license:expat)))

(define-public rust-tokio-tungstenite-0.16
  (package
    (name "rust-tokio-tungstenite")
    (version "0.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-tungstenite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wnadcv9q2yi7bjkdp6z0g4rk7kbdblsv613fpgjrhgwdbgkj2z8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-rustls" ,rust-rustls-0.20)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.6)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.23)
                       ("rust-tungstenite" ,rust-tungstenite-0.16)
                       ("rust-webpki" ,rust-webpki-0.22)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.22))))
    (home-page "https://github.com/snapview/tokio-tungstenite")
    (synopsis
     "Tokio binding for Tungstenite, the Lightweight stream-based WebSocket implementation")
    (description
     "This package provides Tokio binding for Tungstenite, the Lightweight stream-based @code{WebSocket}
implementation.")
    (license license:expat)))

(define-public rust-tower-http-0.5
  (package
    (name "rust-tower-http")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower-http" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xakj3x0anp55gjqibiwvzma5iz0w9pcjsr7qk97sx4qm4sd970y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-compression" ,rust-async-compression-0.4)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-http-body" ,rust-http-body-1)
                       ("rust-http-body-util" ,rust-http-body-util-0.1.1)
                       ("rust-http-range-header" ,rust-http-range-header-0.4)
                       ("rust-httpdate" ,rust-httpdate-1)
                       ("rust-iri-string" ,rust-iri-string-0.7)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tower-layer" ,rust-tower-layer-0.3)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-uuid" ,rust-uuid-1))))
    (home-page "https://github.com/tower-rs/tower-http")
    (synopsis "Tower middleware and utilities for HTTP clients and servers")
    (description
     "This package provides Tower middleware and utilities for HTTP clients and servers.")
    (license license:expat)))

(define-public rust-tr-0.1
  (package
    (name "rust-tr")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xksi7qq5h8i779ik51i81147858d5nxr3ng39pm47l9asg1s491"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gettext" ,rust-gettext-0.4)
                       ("rust-gettext-rs" ,rust-gettext-rs-0.7)
                       ("rust-lazy-static" ,rust-lazy-static-1))))
    (home-page "https://github.com/woboq/tr")
    (synopsis "tr! macro for localisation")
    (description "This package provides tr! macro for localisation.")
    (license license:expat)))

(define-public rust-ttf-parser-0.18
  (package
    (name "rust-ttf-parser")
    (version "0.18.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ttf-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cvnn99d0i7bd25m9205rikjcscfji6xzqcp90w5aqcwmmqzf286"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/RazrFalcon/ttf-parser")
    (synopsis
     "high-level, safe, zero-allocation font parser for TrueType, OpenType, and AAT.")
    (description
     "This package provides a high-level, safe, zero-allocation font parser for
@code{TrueType}, @code{OpenType}, and AAT.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ttf-parser-0.17
  (package
    (name "rust-ttf-parser")
    (version "0.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ttf-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zrbcjmyz3280wlbdbxskz0gd25lxizjzkcmq50xzdns8kx14n1p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/RazrFalcon/ttf-parser")
    (synopsis
     "high-level, safe, zero-allocation font parser for TrueType, OpenType, and AAT.")
    (description
     "This package provides a high-level, safe, zero-allocation font parser for
@code{TrueType}, @code{OpenType}, and AAT.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tui-input-0.8
  (package
    (name "rust-tui-input")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tui-input" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00fwd3w06kb2w83jcdcffcwbayf8ch5rsria1a04rbx3cgw8brxk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-crossterm" ,rust-crossterm-0.27)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-termion" ,rust-termion-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/sayanarijit/tui-input")
    (synopsis "TUI input library supporting multiple backends")
    (description
     "This package provides TUI input library supporting multiple backends.")
    (license license:expat)))

(define-public rust-tui-react-0.22
  (package
    (name "rust-tui-react")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tui-react" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04b5av7fpg46bz3zbgqxdwkrx42lcfcap1afxhd6qrnlw9rwvyig"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4.21)
                       ("rust-ratatui" ,rust-ratatui-0.25.0)
                       ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/Byron/tui-crates")
    (synopsis
     "TUI widgets using a react-like paradigm, allowing mutable component state and render properties")
    (description
     "This package provides TUI widgets using a react-like paradigm, allowing mutable component state and
render properties.")
    (license license:expat)))

(define-public rust-tungstenite-0.21
  (package
    (name "rust-tungstenite")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tungstenite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qaphb5kgwgid19p64grhv2b9kxy7f1059yy92l9kwrlx90sdwcy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-data-encoding" ,rust-data-encoding-2)
                       ("rust-http" ,rust-http-1)
                       ("rust-httparse" ,rust-httparse-1)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rustls" ,rust-rustls-0.22)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-url" ,rust-url-2)
                       ("rust-utf-8" ,rust-utf-8-0.7)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26))))
    (home-page "https://github.com/snapview/tungstenite-rs")
    (synopsis "Lightweight stream-based WebSocket implementation")
    (description
     "This package provides Lightweight stream-based @code{WebSocket} implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tungstenite-0.16
  (package
    (name "rust-tungstenite")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tungstenite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l9s7gi9kgl4zynhbyb7737lmwaxaim4b818lwi7y95f2hx73lva"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.13)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-httparse" ,rust-httparse-1)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rustls" ,rust-rustls-0.20)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.6)
                       ("rust-sha-1" ,rust-sha-1-0.9)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-url" ,rust-url-2)
                       ("rust-utf-8" ,rust-utf-8-0.7)
                       ("rust-webpki" ,rust-webpki-0.22)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.22))))
    (home-page "https://github.com/snapview/tungstenite-rs")
    (synopsis "Lightweight stream-based WebSocket implementation")
    (description
     "This package provides Lightweight stream-based @code{WebSocket} implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-type-map-0.5
  (package
    (name "rust-type-map")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "type-map" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17qaga12nkankr7hi2mv43f4lnc78hg480kz6j9zmy4g0h28ddny"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustc-hash" ,rust-rustc-hash-1))))
    (home-page "https://github.com/kardeiz/type-map")
    (synopsis "Provides a typemap container with FxHashMap")
    (description
     "This package provides a typemap container with @code{FxHashMap}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-uncased-0.9
  (package
    (name "rust-uncased")
    (version "0.9.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uncased" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15q6r6g4fszr8c2lzg9z9k9g52h8g29h24awda3d72cyw37qzf71"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1.0.203)
                       ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/SergioBenitez/uncased")
    (synopsis "Case-preserving, ASCII case-insensitive, no_std string types")
    (description
     "This package provides Case-preserving, ASCII case-insensitive, no_std string types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unic-langid-0.9
  (package
    (name "rust-unic-langid")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unic-langid" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i2s024frmpfa68lzy8y8vnb1rz3m9v0ga13f7h2afx7f8g9vp93"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unic-langid-impl" ,rust-unic-langid-impl-0.9)
                       ("rust-unic-langid-macros" ,rust-unic-langid-macros-0.9))))
    (home-page "https://github.com/zbraniecki/unic-locale")
    (synopsis "API for managing Unicode Language Identifiers")
    (description
     "This package provides API for managing Unicode Language Identifiers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unic-langid-impl-0.9
  (package
    (name "rust-unic-langid-impl")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unic-langid-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rckyn5wqd5h8jxhbzlbbagr459zkzg822r4k5n30jaryv0j4m0a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-tinystr" ,rust-tinystr-0.7))))
    (home-page "https://github.com/zbraniecki/unic-locale")
    (synopsis "API for managing Unicode Language Identifiers")
    (description
     "This package provides API for managing Unicode Language Identifiers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unic-langid-macros-0.9
  (package
    (name "rust-unic-langid-macros")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unic-langid-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pi71r5474n7sdmyky7qpnia9rrr42q0d200l5lpag1d0hncv88d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
                       ("rust-tinystr" ,rust-tinystr-0.7)
                       ("rust-unic-langid-impl" ,rust-unic-langid-impl-0.9)
                       ("rust-unic-langid-macros-impl" ,rust-unic-langid-macros-impl-0.9))))
    (home-page "https://github.com/zbraniecki/unic-locale")
    (synopsis "API for managing Unicode Language Identifiers")
    (description
     "This package provides API for managing Unicode Language Identifiers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unic-langid-macros-impl-0.9
  (package
    (name "rust-unic-langid-macros-impl")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unic-langid-macros-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nsm0hky2sawgkwz511br06mkm3ba70rfc05jm0l54x3gciz9mqy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-unic-langid-impl" ,rust-unic-langid-impl-0.9))))
    (home-page "https://github.com/zbraniecki/unic-locale")
    (synopsis "API for managing Unicode Language Identifiers")
    (description
     "This package provides API for managing Unicode Language Identifiers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicode-bidi-mirroring-0.1
  (package
    (name "rust-unicode-bidi-mirroring")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-bidi-mirroring" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "150navn2n6barkzchv96n877i17m1754nzmy1282zmcjzdh25lan"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/RazrFalcon/unicode-bidi-mirroring")
    (synopsis "Unicode Bidi Mirroring property detection")
    (description
     "This package provides Unicode Bidi Mirroring property detection.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicode-canonical-combining-class-0.5
  (package
    (name "rust-unicode-canonical-combining-class")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-canonical-combining-class" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cjwhs1zk5yas1v1g95cxx4i04w4xm9hhz74273q5096z5m5h9b9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/yeslogic/unicode-canonical-combining-class")
    (synopsis "Fast lookup of the Canonical Combining Class property")
    (description
     "This package provides Fast lookup of the Canonical Combining Class property.")
    (license license:asl2.0)))

(define-public rust-unicode-ccc-0.1
  (package
    (name "rust-unicode-ccc")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-ccc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wbwny92wzmck2cix5h3r97h9z57x9831kadrs6jdy24lvpj09fc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/RazrFalcon/unicode-ccc")
    (synopsis "Unicode Canonical Combining Class detection")
    (description
     "This package provides Unicode Canonical Combining Class detection.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicode-general-category-0.6
  (package
    (name "rust-unicode-general-category")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-general-category" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rv9715c94gfl0hzy4f2a9lw7i499756bq2968vqwhr1sb0wi092"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/yeslogic/unicode-general-category")
    (synopsis "Fast lookup of the Unicode General Category property for char")
    (description
     "This package provides Fast lookup of the Unicode General Category property for char.")
    (license license:asl2.0)))

(define-public rust-unicode-joining-type-0.7
  (package
    (name "rust-unicode-joining-type")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-joining-type" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xgn8cjv3r3s9f3zqs3v2k6hv8d43l3z6nkm1047bg5qri3wpy12"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/yeslogic/unicode-joining-type")
    (synopsis
     "Fast lookup of the Unicode Joining Type and Joining Group properties")
    (description
     "This package provides Fast lookup of the Unicode Joining Type and Joining Group properties.")
    (license license:asl2.0)))

(define-public rust-unicode-script-0.5
  (package
    (name "rust-unicode-script")
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-script" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kf9v1yfxazxjx07g9g9nqg4kw2kzpnyi7syjdd2hpvffbsp33dd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-rustc-std-workspace-std" ,rust-rustc-std-workspace-std-1))))
    (home-page "https://github.com/unicode-rs/unicode-script")
    (synopsis
     "This crate exposes the Unicode `Script` and `Script_Extension` properties from [UAX #24](http://www.unicode.org/reports/tr24/)")
    (description
     "This crate exposes the Unicode `Script` and `Script_Extension` properties from
[UAX #24](http://www.unicode.org/reports/tr24/).")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicode-vo-0.1
  (package
    (name "rust-unicode-vo")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-vo" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "151sha088v9jyfvbg5164xh4dk72g53b82xm4zzbf5dlagzqdlxi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/RazrFalcon/unicode-vo")
    (synopsis "Unicode vertical orientation detection")
    (description
     "This package provides Unicode vertical orientation detection.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicode-width-0.2
  (package
    (name "rust-unicode-width")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-width" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zd0r5vs52ifxn25rs06gxrgz8cmh4xpra922k0xlmrchib1kj0z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-rustc-std-workspace-std" ,rust-rustc-std-workspace-std-1))))
    (home-page "https://github.com/unicode-rs/unicode-width")
    (synopsis "Determine displayed width of `char` and `str` types
according to Unicode Standard Annex #11 rules.")
    (description
     "This package provides Determine displayed width of `char` and `str` types according to Unicode
Standard Annex #11 rules.")
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
       #:cargo-inputs (("rust-base64" ,rust-base64-0.22.1)
                       ("rust-brotli-decompressor" ,rust-brotli-decompressor-2)
                       ("rust-cookie" ,rust-cookie-0.18)
                       ("rust-cookie-store" ,rust-cookie-store-0.21)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hootbin" ,rust-hootbin-0.1)
                       ("rust-http" ,rust-http-1)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustls" ,rust-rustls-0.22)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-rustls-webpki" ,rust-rustls-webpki-0.102)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-socks" ,rust-socks-0.3)
                       ("rust-url" ,rust-url-2)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26))))
    (home-page "https://github.com/algesten/ureq")
    (synopsis "Simple, safe HTTP client")
    (description "This package provides Simple, safe HTTP client.")
    (license (list license:expat license:asl2.0))))

(define-public rust-usvg-0.35
  (package
    (name "rust-usvg")
    (version "0.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "usvg" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rhirr4z5z94xcr0hs6im5hhky225v9kd4y04i4ghfyrn3grvl0l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.21)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-pico-args" ,rust-pico-args-0.5)
                       ("rust-usvg-parser" ,rust-usvg-parser-0.35)
                       ("rust-usvg-text-layout" ,rust-usvg-text-layout-0.35)
                       ("rust-usvg-tree" ,rust-usvg-tree-0.35)
                       ("rust-xmlwriter" ,rust-xmlwriter-0.1))))
    (home-page "https://github.com/RazrFalcon/resvg")
    (synopsis "An SVG simplification library")
    (description "This package provides An SVG simplification library.")
    (license license:mpl2.0)))

(define-public rust-usvg-0.28
  (package
    (name "rust-usvg")
    (version "0.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "usvg" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s9jyjmi51v9916cmw48q8ky7ihcw84kvjk7q1436nw460mpqnwb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.13)
                       ("rust-data-url" ,rust-data-url-0.2)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-imagesize" ,rust-imagesize-0.10)
                       ("rust-kurbo" ,rust-kurbo-0.8)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-rctree" ,rust-rctree-0.5)
                       ("rust-roxmltree" ,rust-roxmltree-0.15)
                       ("rust-simplecss" ,rust-simplecss-0.2)
                       ("rust-siphasher" ,rust-siphasher-0.3)
                       ("rust-strict-num" ,rust-strict-num-0.1)
                       ("rust-svgtypes" ,rust-svgtypes-0.8))))
    (home-page "https://github.com/RazrFalcon/resvg")
    (synopsis "An SVG simplification library")
    (description "This package provides An SVG simplification library.")
    (license license:mpl2.0)))

(define-public rust-usvg-parser-0.35
  (package
    (name "rust-usvg-parser")
    (version "0.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "usvg-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "025liny3hs2ccdyd8rhnag1yq2099q0mg1fq4ycmj4q84cyzk6yi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-data-url" ,rust-data-url-0.2)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-imagesize" ,rust-imagesize-0.12)
                       ("rust-kurbo" ,rust-kurbo-0.9)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-roxmltree" ,rust-roxmltree-0.18)
                       ("rust-simplecss" ,rust-simplecss-0.2)
                       ("rust-siphasher" ,rust-siphasher-0.3)
                       ("rust-svgtypes" ,rust-svgtypes-0.11)
                       ("rust-usvg-tree" ,rust-usvg-tree-0.35))))
    (home-page "https://github.com/RazrFalcon/resvg")
    (synopsis "An SVG parser used by usvg")
    (description "This package provides An SVG parser used by usvg.")
    (license license:mpl2.0)))

(define-public rust-usvg-text-layout-0.35
  (package
    (name "rust-usvg-text-layout")
    (version "0.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "usvg-text-layout" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d7yfqiq9hi8b7jasv5s94kab5v9jibb7f2r5452qrc99rh48l03"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fontdb" ,rust-fontdb-0.14)
                       ("rust-kurbo" ,rust-kurbo-0.9)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustybuzz" ,rust-rustybuzz-0.7)
                       ("rust-unicode-bidi" ,rust-unicode-bidi-0.3)
                       ("rust-unicode-script" ,rust-unicode-script-0.5)
                       ("rust-unicode-vo" ,rust-unicode-vo-0.1)
                       ("rust-usvg-tree" ,rust-usvg-tree-0.35))))
    (home-page "https://github.com/RazrFalcon/resvg")
    (synopsis "An SVG text layout implementation")
    (description "This package provides An SVG text layout implementation.")
    (license license:mpl2.0)))

(define-public rust-usvg-text-layout-0.28
  (package
    (name "rust-usvg-text-layout")
    (version "0.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "usvg-text-layout" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ms9qbi7hgw5n1zfxrqfy3bdrzr0qpshcswppx0qc0j811km15ac"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fontdb" ,rust-fontdb-0.10)
                       ("rust-kurbo" ,rust-kurbo-0.8)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-rustybuzz" ,rust-rustybuzz-0.6)
                       ("rust-unicode-bidi" ,rust-unicode-bidi-0.3)
                       ("rust-unicode-script" ,rust-unicode-script-0.5)
                       ("rust-unicode-vo" ,rust-unicode-vo-0.1)
                       ("rust-usvg" ,rust-usvg-0.28))))
    (home-page "https://github.com/RazrFalcon/resvg")
    (synopsis "An SVG text layout implementation")
    (description "This package provides An SVG text layout implementation.")
    (license license:mpl2.0)))

(define-public rust-usvg-tree-0.35
  (package
    (name "rust-usvg-tree")
    (version "0.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "usvg-tree" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14lbzk9qbr40prjh1ml17r6f5hw10rrkjqqx65fxpji1xpjaffbr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rctree" ,rust-rctree-0.5)
                       ("rust-strict-num" ,rust-strict-num-0.1)
                       ("rust-svgtypes" ,rust-svgtypes-0.11)
                       ("rust-tiny-skia-path" ,rust-tiny-skia-path-0.10))))
    (home-page "https://github.com/RazrFalcon/resvg")
    (synopsis "An SVG tree representation used by usvg")
    (description
     "This package provides An SVG tree representation used by usvg.")
    (license license:mpl2.0)))

(define-public rust-value-bag-1
  (package
    (name "rust-value-bag")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "value-bag" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00aij8p1n7vcggkb9nxpwx9g5nqzclrf7prd1wpi9c3sscvw312s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-value-bag-serde1" ,rust-value-bag-serde1-1)
                       ("rust-value-bag-sval2" ,rust-value-bag-sval2-1))))
    (home-page "https://github.com/sval-rs/value-bag")
    (synopsis "Anonymous structured values")
    (description "This package provides Anonymous structured values.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-value-bag-serde1-1
  (package
    (name "rust-value-bag-serde1")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "value-bag-serde1" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12rjnrh2g3ijvjgfh78y7x1ilk3mw2svri93nymsjxxhbh6gbb6c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-erased-serde" ,rust-erased-serde-0.4)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-buf" ,rust-serde-buf-0.1)
                       ("rust-serde-fmt" ,rust-serde-fmt-1)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-serde-test" ,rust-serde-test-1))))
    (home-page "")
    (synopsis "Implementation detail for value-bag")
    (description "This package provides Implementation detail for value-bag.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-value-bag-sval2-1
  (package
    (name "rust-value-bag-sval2")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "value-bag-sval2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nr8453w1357xc70ilbvwcg4qa6bgll44pci0fbznb82hvjbm18p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sval" ,rust-sval-2)
                       ("rust-sval-buffer" ,rust-sval-buffer-2)
                       ("rust-sval-dynamic" ,rust-sval-dynamic-2)
                       ("rust-sval-fmt" ,rust-sval-fmt-2)
                       ("rust-sval-json" ,rust-sval-json-2)
                       ("rust-sval-ref" ,rust-sval-ref-2)
                       ("rust-sval-serde" ,rust-sval-serde-2)
                       ("rust-sval-test" ,rust-sval-test-2))))
    (home-page "")
    (synopsis "Implementation detail for value-bag")
    (description "This package provides Implementation detail for value-bag.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-warp-0.3
  (package
    (name "rust-warp")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "warp" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07137zd13lchy5hxpspd0hs6sl19b0fv2zc1chf02nwnzw1d4y23"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-compression" ,rust-async-compression-0.4)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-headers" ,rust-headers-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-multer" ,rust-multer-2)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-rustls-pemfile" ,rust-rustls-pemfile-2)
                       ("rust-scoped-tls" ,rust-scoped-tls-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.25)
                       ("rust-tokio-tungstenite" ,rust-tokio-tungstenite-0.21)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/seanmonstar/warp")
    (synopsis "serve the web at warp speeds")
    (description "This package provides serve the web at warp speeds.")
    (license license:expat)))

(define-public rust-wasi-common-24
  (package
    (name "rust-wasi-common")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasi-common" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y6i834mq48nzn43mhxpq67w9vpavxiqpwqyr2311zn669w78dkk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-cap-fs-ext" ,rust-cap-fs-ext-3)
                       ("rust-cap-rand" ,rust-cap-rand-3)
                       ("rust-cap-std" ,rust-cap-std-3)
                       ("rust-cap-time-ext" ,rust-cap-time-ext-3)
                       ("rust-fs-set-times" ,rust-fs-set-times-0.20)
                       ("rust-io-extras" ,rust-io-extras-0.18)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-system-interface" ,rust-system-interface-0.27)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmtime" ,rust-wasmtime-24)
                       ("rust-wiggle" ,rust-wiggle-24)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "WASI implementation in Rust")
    (description "This package provides WASI implementation in Rust.")
    (license license:asl2.0)))

(define-public rust-wasm-encoder-0.216
  (package
    (name "rust-wasm-encoder")
    (version "0.216.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-encoder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "122ap5ql4iiiikjrj6d429dq6860rhqys25f6dcagj12xbmkmhh4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2)
                       ("rust-wasmparser" ,rust-wasmparser-0.216))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-encoder")
    (synopsis "low-level WebAssembly encoder.")
    (description
     "This package provides a low-level @code{WebAssembly} encoder.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wasm-encoder-0.215
  (package
    (name "rust-wasm-encoder")
    (version "0.215.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-encoder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0iw886v4jzvbwxakiswsk81824m51fjnjabxwdvnp3kbw3rnvdag"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2)
                       ("rust-wasmparser" ,rust-wasmparser-0.215))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-encoder")
    (synopsis "low-level WebAssembly encoder.")
    (description
     "This package provides a low-level @code{WebAssembly} encoder.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wasm-metadata-0.215
  (package
    (name "rust-wasm-metadata")
    (version "0.215.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-metadata" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0br3dp5rd90lk1d6jpcn96i88d8s9hls5fm9lbvhidknamyb0sqc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-spdx" ,rust-spdx-0.10)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.215)
                       ("rust-wasmparser" ,rust-wasmparser-0.215))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-metadata")
    (synopsis "Read and manipulate WebAssembly metadata")
    (description
     "This package provides Read and manipulate @code{WebAssembly} metadata.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wasm-streams-0.4
  (package
    (name "rust-wasm-streams")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-streams" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ad17c59xb8fffsnbrqbyqz93hb66nzxhizpii31icb31g4w8pdn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://github.com/MattiasBuelens/wasm-streams/")
    (synopsis
     "Bridging between web streams and Rust streams using WebAssembly")
    (description
     "This package provides Bridging between web streams and Rust streams using @code{WebAssembly}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmparser-0.216
  (package
    (name "rust-wasmparser")
    (version "0.216.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qr8j1c15r208d9nsjw01x3w71m9i4g756djnhgk37b1lfzfdpmw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wasmparser-0.215
  (package
    (name "rust-wasmparser")
    (version "0.215.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03nryws9f2awvfd47z5pn67aqif1z7w6z6zl3jw9jhgjh44dxysk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wasmparser-0.202
  (package
    (name "rust-wasmparser")
    (version "0.202.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04qljgwjv6a6nn9sx6bbz167s0dim4liphgp1sc8ngygscaqb6fn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-semver" ,rust-semver-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license license:asl2.0)))

(define-public rust-wasmprinter-0.215
  (package
    (name "rust-wasmprinter")
    (version "0.215.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmprinter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z6yawqhgfj7f407mzqw9n3dc3fxmmgcxlmk16140lshv0js7sfq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.215))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmprinter")
    (synopsis
     "Rust converter from the WebAssembly binary format to the text format.")
    (description
     "This package provides Rust converter from the @code{WebAssembly} binary format to the text format.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wasmtime-24
  (package
    (name "rust-wasmtime")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (modules '((guix build utils)))
       (snippet #~(begin
                    (substitute* "Cargo.toml"
                      (("1.78.0")
                       "1.77.0"))))
       (sha256
        (base32 "1mrklcqdzz940y78wima6r9v4kf4zxyg539xdv2j717w9pb86n4s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-addr2line" ,rust-addr2line-0.22)
                       ("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-fxprof-processed-profile" ,rust-fxprof-processed-profile-0.6)
                       ("rust-gimli" ,rust-gimli-0.29)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-ittapi" ,rust-ittapi-0.4)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libm" ,rust-libm-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-mach2" ,rust-mach2-0.4)
                       ("rust-memfd" ,rust-memfd-0.6)
                       ("rust-object" ,rust-object-0.36)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-postcard" ,rust-postcard-1)
                       ("rust-psm" ,rust-psm-0.1)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sptr" ,rust-sptr-0.3)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12.16)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.215)
                       ("rust-wasmparser" ,rust-wasmparser-0.215)
                       ("rust-wasmtime-asm-macros" ,rust-wasmtime-asm-macros-24)
                       ("rust-wasmtime-cache" ,rust-wasmtime-cache-24)
                       ("rust-wasmtime-component-macro" ,rust-wasmtime-component-macro-24)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-24)
                       ("rust-wasmtime-cranelift" ,rust-wasmtime-cranelift-24)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-24)
                       ("rust-wasmtime-fiber" ,rust-wasmtime-fiber-24)
                       ("rust-wasmtime-jit-debug" ,rust-wasmtime-jit-debug-24)
                       ("rust-wasmtime-jit-icache-coherence" ,rust-wasmtime-jit-icache-coherence-24)
                       ("rust-wasmtime-slab" ,rust-wasmtime-slab-24)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-24)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-24)
                       ("rust-wasmtime-winch" ,rust-wasmtime-winch-24)
                       ("rust-wasmtime-wmemcheck" ,rust-wasmtime-wmemcheck-24)
                       ("rust-wat" ,rust-wat-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "High-level API to expose the Wasmtime runtime")
    (description
     "This package provides High-level API to expose the Wasmtime runtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-asm-macros-24
  (package
    (name "rust-wasmtime-asm-macros")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-asm-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gp3d9vn3sq38khsjaf4m51py9sb9k8mfn5mwmmxvh3rlgicfk8w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for defining asm functions in Wasmtime")
    (description
     "This package provides Macros for defining asm functions in Wasmtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-cache-24
  (package
    (name "rust-wasmtime-cache")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cache" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08ip4dvssgmmi1hrms8iih62lpmrrdvym09jr448wc9s4sgifnva"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-directories-next" ,rust-directories-next-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-postcard" ,rust-postcard-1)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-toml" ,rust-toml-0.8)
                       ("rust-windows-sys" ,rust-windows-sys-0.52)
                       ("rust-zstd" ,rust-zstd-0.13))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Support for automatic module caching with Wasmtime")
    (description
     "This package provides Support for automatic module caching with Wasmtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-cli-flags-24
  (package
    (name "rust-wasmtime-cli-flags")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cli-flags" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ghdybl95hihnzgxlbnf39rbl8jsjzj6w21jwgn4yj4qqzai8psf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-file-per-thread-logger" ,rust-file-per-thread-logger-0.2)
                       ("rust-humantime" ,rust-humantime-2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.3)
                       ("rust-wasmtime" ,rust-wasmtime-24))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Exposes common CLI flags used for running Wasmtime")
    (description
     "This package provides Exposes common CLI flags used for running Wasmtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-component-macro-24
  (package
    (name "rust-wasmtime-component-macro")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-component-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kwgwm3klz6zmdihmrqp7q1j993s67p1c4y69q0mzarx3hypf1sb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-24)
                       ("rust-wasmtime-wit-bindgen" ,rust-wasmtime-wit-bindgen-24)
                       ("rust-wit-parser" ,rust-wit-parser-0.215))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for deriving component interface types from Rust types")
    (description
     "This package provides Macros for deriving component interface types from Rust types.")
    (license license:asl2.0)))

(define-public rust-wasmtime-component-util-24
  (package
    (name "rust-wasmtime-component-util")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-component-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0x2q1ky2b8j7hmwjx4106a4nnz78iynlkrlw6rw39s7l419p73g3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "Utility types and functions to support the component model in Wasmtime")
    (description
     "This package provides Utility types and functions to support the component model in Wasmtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-cranelift-24
  (package
    (name "rust-wasmtime-cranelift")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cranelift" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1a9di8siha49cmpnc5s3ag0x1q1lkbmv28n7v3br6pbqs0qxhw75"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.111)
                       ("rust-cranelift-control" ,rust-cranelift-control-0.111)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.111)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.111)
                       ("rust-cranelift-native" ,rust-cranelift-native-0.111)
                       ("rust-cranelift-wasm" ,rust-cranelift-wasm-0.111)
                       ("rust-gimli" ,rust-gimli-0.29)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.36)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12.16)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.215)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-24)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-24))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Integration between Cranelift and Wasmtime")
    (description
     "This package provides Integration between Cranelift and Wasmtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-environ-24
  (package
    (name "rust-wasmtime-environ")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-environ" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xvkx571chdf2imwkmc68y4rdbp1z8lmkwnllwqp8s41ppgq1zn5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
                       ("rust-cranelift-bitset" ,rust-cranelift-bitset-0.111)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.111)
                       ("rust-gimli" ,rust-gimli-0.29)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.36)
                       ("rust-postcard" ,rust-postcard-1)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12.16)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.215)
                       ("rust-wasmparser" ,rust-wasmparser-0.215)
                       ("rust-wasmprinter" ,rust-wasmprinter-0.215)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-24)
                       ("rust-wasmtime-types" ,rust-wasmtime-types-24))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "Standalone environment support for WebAssembly code in Cranelift")
    (description
     "This package provides Standalone environment support for @code{WebAssembly} code in Cranelift.")
    (license license:asl2.0)))

(define-public rust-wasmtime-explorer-24
  (package
    (name "rust-wasmtime-explorer")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-explorer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08sz6zgl5jmm13ydzvw733x8q4axnkigbcxfhd7svs4whkhg1gi6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-capstone" ,rust-capstone-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12.16)
                       ("rust-wasmprinter" ,rust-wasmprinter-0.215)
                       ("rust-wasmtime" ,rust-wasmtime-24)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-24))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Compiler explorer for Wasmtime and Cranelift")
    (description
     "This package provides Compiler explorer for Wasmtime and Cranelift.")
    (license license:asl2.0)))

(define-public rust-wasmtime-fiber-24
  (package
    (name "rust-wasmtime-fiber")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-fiber" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12mv4b087q9dykmjlh62krdffqd9j6qzx869knv8vdf72cyh8f8g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-wasmtime-asm-macros" ,rust-wasmtime-asm-macros-24)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-24)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-24)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Fiber support for Wasmtime")
    (description "This package provides Fiber support for Wasmtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-jit-debug-24
  (package
    (name "rust-wasmtime-jit-debug")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit-debug" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zxsyvpldjck4y3dr8xgpk5p7ljvlj0k4ixngh32dsv34d0ldhxf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-object" ,rust-object-0.36)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-24))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "JIT debug interfaces support for Wasmtime")
    (description
     "This package provides JIT debug interfaces support for Wasmtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-jit-icache-coherence-24
  (package
    (name "rust-wasmtime-jit-icache-coherence")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit-icache-coherence" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bj576xipsjik4vrrwjhzg5p9y63riga6qs1gb8z15mrkm1fhpfi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Utilities for JIT icache maintenance")
    (description "This package provides Utilities for JIT icache maintenance.")
    (license license:asl2.0)))

(define-public rust-wasmtime-slab-24
  (package
    (name "rust-wasmtime-slab")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-slab" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lc7bpsv1mnwglcvszjpkvvhcwwrc8q2c26nqwgmw35kls7x6s0z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Uni-typed slab with a free list for use in Wasmtime")
    (description
     "This package provides Uni-typed slab with a free list for use in Wasmtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-types-24
  (package
    (name "rust-wasmtime-types")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jajwk16a9bscv0z98kpjxzmpk48nicys446my0zqp4wkl3yfd36"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.111)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.215))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "WebAssembly type definitions for Cranelift")
    (description
     "This package provides @code{WebAssembly} type definitions for Cranelift.")
    (license license:asl2.0)))

(define-public rust-wasmtime-versioned-export-macros-24
  (package
    (name "rust-wasmtime-versioned-export-macros")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-versioned-export-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v9z289py3k9wafhn1bz3xl08qjzxnq9062p5nki2zvc3m8y6l1q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for defining versioned exports in Wasmtime")
    (description
     "This package provides Macros for defining versioned exports in Wasmtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-wasi-24
  (package
    (name "rust-wasmtime-wasi")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wasi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0g782dw30ygg97iaxsbwxxdri34lsv3zk03l9xh2bq7wiwlyhnjl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-cap-fs-ext" ,rust-cap-fs-ext-3)
                       ("rust-cap-net-ext" ,rust-cap-net-ext-3)
                       ("rust-cap-rand" ,rust-cap-rand-3)
                       ("rust-cap-std" ,rust-cap-std-3)
                       ("rust-cap-time-ext" ,rust-cap-time-ext-3)
                       ("rust-fs-set-times" ,rust-fs-set-times-0.20)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-io-extras" ,rust-io-extras-0.18)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-system-interface" ,rust-system-interface-0.27)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-wasmtime" ,rust-wasmtime-24)
                       ("rust-wiggle" ,rust-wiggle-24)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "WASI implementation in Rust")
    (description "This package provides WASI implementation in Rust.")
    (license license:asl2.0)))

(define-public rust-wasmtime-wasi-http-24
  (package
    (name "rust-wasmtime-wasi-http")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wasi-http" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wzxk1fdkv04318im6y7dahip4jcnjw89gxn730imv8zqq405dgm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-http-body" ,rust-http-body-1)
                       ("rust-http-body-util" ,rust-http-body-util-0.1.1)
                       ("rust-hyper" ,rust-hyper-1.3)
                       ("rust-rustls" ,rust-rustls-0.22)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.25)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmtime" ,rust-wasmtime-24)
                       ("rust-wasmtime-wasi" ,rust-wasmtime-wasi-24)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Experimental HTTP library for WebAssembly in Wasmtime")
    (description
     "This package provides Experimental HTTP library for @code{WebAssembly} in Wasmtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-wasi-keyvalue-24
  (package
    (name "rust-wasmtime-wasi-keyvalue")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wasi-keyvalue" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i2n86fs196ac79ny6svxi390dfzp8dg64iis41k2n8vblnw78ij"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-wasmtime" ,rust-wasmtime-24))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Wasmtime implementation of the wasi-keyvalue API")
    (description
     "This package provides Wasmtime implementation of the wasi-keyvalue API.")
    (license license:asl2.0)))

(define-public rust-wasmtime-wasi-nn-24
  (package
    (name "rust-wasmtime-wasi-nn")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wasi-nn" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pdvbpri09y1zhsqwil5b54b940kxargmwgnlflb3isjyjxh1pks"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-openvino" ,rust-openvino-0.7)
                       ("rust-ort" ,rust-ort-2)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-walkdir" ,rust-walkdir-2)
                       ("rust-wasmtime" ,rust-wasmtime-24)
                       ("rust-wiggle" ,rust-wiggle-24)
                       ("rust-windows" ,rust-windows-0.52))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Wasmtime implementation of the wasi-nn API")
    (description
     "This package provides Wasmtime implementation of the wasi-nn API.")
    (license license:asl2.0)))

(define-public rust-wasmtime-wasi-runtime-config-24
  (package
    (name "rust-wasmtime-wasi-runtime-config")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wasi-runtime-config" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0f67c5ynm19b0hr13zjaklnwwxarxpgx91kl4qi0cgwm8rqglvfn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-wasmtime" ,rust-wasmtime-24))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Wasmtime implementation of the wasi-runtime-config API")
    (description
     "This package provides Wasmtime implementation of the wasi-runtime-config API.")
    (license license:asl2.0)))

(define-public rust-wasmtime-wasi-threads-24
  (package
    (name "rust-wasmtime-wasi-threads")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wasi-threads" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v4r26nkkyls6dc4rrh7rs545gap3i7qd4bidzry2x17qg4jyf41"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-wasi-common" ,rust-wasi-common-24)
                       ("rust-wasmtime" ,rust-wasmtime-24))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Wasmtime implementation of the wasi-threads API")
    (description
     "This package provides Wasmtime implementation of the wasi-threads API.")
    (license license:asl2.0)))

(define-public rust-wasmtime-wast-24
  (package
    (name "rust-wasmtime-wast")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "159mzaj044v37xfz6fb78vfla18fl132hvndwdq902s8h7601krc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-wasmtime" ,rust-wasmtime-24)
                       ("rust-wast" ,rust-wast-215))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "wast testing support for wasmtime")
    (description "This package provides wast testing support for wasmtime.")
    (license license:asl2.0)))

(define-public rust-wasmtime-winch-24
  (package
    (name "rust-wasmtime-winch")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-winch" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1havpm0cg49rwjzk3542d5602jw8asyn83brvl9lrypg4nb1j99a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.111)
                       ("rust-gimli" ,rust-gimli-0.29)
                       ("rust-object" ,rust-object-0.36)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12.16)
                       ("rust-wasmparser" ,rust-wasmparser-0.215)
                       ("rust-wasmtime-cranelift" ,rust-wasmtime-cranelift-24)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-24)
                       ("rust-winch-codegen" ,rust-winch-codegen-0.22))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Integration between Wasmtime and Winch")
    (description
     "This package provides Integration between Wasmtime and Winch.")
    (license license:asl2.0)))

(define-public rust-wasmtime-wit-bindgen-24
  (package
    (name "rust-wasmtime-wit-bindgen")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wit-bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07qjhiazrlkphwqbnn482ibshlipjw8npnywrm4vmmfigsn33crw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-wit-parser" ,rust-wit-parser-0.215))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Internal `*.wit` support for the `wasmtime` crate's macros")
    (description
     "This package provides Internal `*.wit` support for the `wasmtime` crate's macros.")
    (license license:asl2.0)))

(define-public rust-wasmtime-wmemcheck-24
  (package
    (name "rust-wasmtime-wmemcheck")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wmemcheck" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14k3dxpl7fb9x9baah7a2b19f52qfn19c9iwrl3zmx3z1mla56cc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Memcheck implementation for Wasmtime")
    (description "This package provides Memcheck implementation for Wasmtime.")
    (license license:asl2.0)))

(define-public rust-wast-216
  (package
    (name "rust-wast")
    (version "216.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "022aall56anr2hywpdkdmjc0llr41yfl7hy61pggs4yrxhp1zszp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-gimli" ,rust-gimli-0.30)
                       ("rust-leb128" ,rust-leb128-0.2)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.216))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wast")
    (synopsis
     "Customizable Rust parsers for the WebAssembly Text formats WAT and WAST")
    (description
     "This package provides Customizable Rust parsers for the @code{WebAssembly} Text formats WAT and WAST.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wast-215
  (package
    (name "rust-wast")
    (version "215.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jslxdhsnrjfky3a41iqvk2g2hhzgi5f02vjc2g294rmi46x1w8z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-gimli" ,rust-gimli-0.30)
                       ("rust-leb128" ,rust-leb128-0.2)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.215))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wast")
    (synopsis
     "Customizable Rust parsers for the WebAssembly Text formats WAT and WAST")
    (description
     "This package provides Customizable Rust parsers for the @code{WebAssembly} Text formats WAT and WAST.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wast-35
  (package
    (name "rust-wast")
    (version "35.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0s2d43g326dw21bygpalzjnr1fi83lx4afimg1h5hilrnkql1w9f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wast")
    (synopsis
     "Customizable Rust parsers for the WebAssembly Text formats WAT and WAST")
    (description
     "This package provides Customizable Rust parsers for the @code{WebAssembly} Text formats WAT and WAST.")
    (license license:asl2.0)))

(define-public rust-wat-1
  (package
    (name "rust-wat")
    (version "1.216.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wat" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0an8h093wr9gd8xxc90mffg5g7pxfmb278svzfaly5dm1w4hj15c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-wast" ,rust-wast-216))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wat")
    (synopsis "Rust parser for the WebAssembly Text format, WAT")
    (description
     "This package provides Rust parser for the @code{WebAssembly} Text format, WAT.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wayland-backend-0.3.7
  (package
    (name "rust-wayland-backend")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-backend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xhnh0mn4cv0wmq3zcm0iic2sbhsz4qdra6kb58x8l51sz73ar85"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-downcast-rs" ,rust-downcast-rs-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.5)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.6)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-scoped-tls" ,rust-scoped-tls-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wayland-sys" ,rust-wayland-sys-0.31.5))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis "Low-level bindings to the Wayland protocol")
    (description
     "This package provides Low-level bindings to the Wayland protocol.")
    (license license:expat)))

(define-public rust-wayland-backend-0.3
  (package
    (name "rust-wayland-backend")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-backend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01yzpx5pm4gc4m6sh0w5vka9afwjqwshngj3d5z4xfx2sjvfds9l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-downcast-rs" ,rust-downcast-rs-1)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.5)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.6)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-scoped-tls" ,rust-scoped-tls-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wayland-sys" ,rust-wayland-sys-0.31))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis "Low-level bindings to the Wayland protocol")
    (description
     "This package provides Low-level bindings to the Wayland protocol.")
    (license license:expat)))

(define-public rust-wayland-client-0.31.7
  (package
    (name "rust-wayland-client")
    (version "0.31.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "105j23dj1k36rpvv3nk5v3lm99gs029k3k429kbnzxv9zk9ljqmn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-wayland-backend" ,rust-wayland-backend-0.3.7)
                       ("rust-wayland-scanner" ,rust-wayland-scanner-0.31.5))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "Bindings to the standard C implementation of the wayland protocol, client side")
    (description
     "This package provides Bindings to the standard C implementation of the wayland protocol, client side.")
    (license license:expat)))

(define-public rust-wayland-client-0.31
  (package
    (name "rust-wayland-client")
    (version "0.31.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cqikb0r1d6k7q8sqx2pziqzb7srm55sgzvck0gl72imhlf80qqy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-rustix" ,rust-rustix-0.38.34)
                       ("rust-wayland-backend" ,rust-wayland-backend-0.3)
                       ("rust-wayland-scanner" ,rust-wayland-scanner-0.31))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "Bindings to the standard C implementation of the wayland protocol, client side")
    (description
     "This package provides Bindings to the standard C implementation of the wayland protocol, client side.")
    (license license:expat)))

(define-public rust-wayland-protocols-0.32.5
  (package
    (name "rust-wayland-protocols")
    (version "0.32.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-protocols" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13pmq788d2w9c7sqpjjxi1344bzq1g1ja4vlaa4rlvjfgkjsvl3w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-wayland-backend" ,rust-wayland-backend-0.3.7)
                       ("rust-wayland-client" ,rust-wayland-client-0.31.7)
                       ("rust-wayland-scanner" ,rust-wayland-scanner-0.31.5)
                       ("rust-wayland-server" ,rust-wayland-server-0.31.6))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis "Generated API for the officials wayland protocol extensions")
    (description
     "This package provides Generated API for the officials wayland protocol extensions.")
    (license license:expat)))

(define-public rust-wayland-protocols-0.31
  (package
    (name "rust-wayland-protocols")
    (version "0.31.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-protocols" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1x310l1p6p3p3l76nl1l2yava9408dy77s605917zadlp1jz70cg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-wayland-backend" ,rust-wayland-backend-0.3)
                       ("rust-wayland-client" ,rust-wayland-client-0.31)
                       ("rust-wayland-scanner" ,rust-wayland-scanner-0.31)
                       ("rust-wayland-server" ,rust-wayland-server-0.31))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis "Generated API for the officials wayland protocol extensions")
    (description
     "This package provides Generated API for the officials wayland protocol extensions.")
    (license license:expat)))

(define-public rust-wayland-protocols-wlr-0.3.5
  (package
    (name "rust-wayland-protocols-wlr")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-protocols-wlr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08j0xfpfqv6kzbfzmdv6crfzalxbxc2n5m9hc4qkqg4jrpv14bkq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-wayland-backend" ,rust-wayland-backend-0.3.7)
                       ("rust-wayland-client" ,rust-wayland-client-0.31.7)
                       ("rust-wayland-protocols" ,rust-wayland-protocols-0.32.5)
                       ("rust-wayland-scanner" ,rust-wayland-scanner-0.31.5)
                       ("rust-wayland-server" ,rust-wayland-server-0.31.6))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis "Generated API for the WLR wayland protocol extensions")
    (description
     "This package provides Generated API for the WLR wayland protocol extensions.")
    (license license:expat)))

(define-public rust-wayland-scanner-0.31.5
  (package
    (name "rust-wayland-scanner")
    (version "0.31.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-scanner" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hv16shy6j32hi9i0r54pyk5pw3q7qfpkffmwchi3z75n80j0zsr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quick-xml" ,rust-quick-xml-0.36.2)
                       ("rust-quote" ,rust-quote-1))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "Wayland Scanner for generating rust APIs from XML wayland protocol files")
    (description
     "This package provides Wayland Scanner for generating rust APIs from XML wayland protocol files.")
    (license license:expat)))

(define-public rust-wayland-scanner-0.31
  (package
    (name "rust-wayland-scanner")
    (version "0.31.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-scanner" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rd5rq8505qahq0lpqkcpms7b7pg4hzc24acxb0dwn81z2wm1nk7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quick-xml" ,rust-quick-xml-0.31)
                       ("rust-quote" ,rust-quote-1))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "Wayland Scanner for generating rust APIs from XML wayland protocol files")
    (description
     "This package provides Wayland Scanner for generating rust APIs from XML wayland protocol files.")
    (license license:expat)))

(define-public rust-wayland-server-0.31.6
  (package
    (name "rust-wayland-server")
    (version "0.31.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-server" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bc6nxzw9h9az22b42sd4m960mq2nja9dl5lkq8xnaiaf76355f8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-downcast-rs" ,rust-downcast-rs-1)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-wayland-backend" ,rust-wayland-backend-0.3.7)
                       ("rust-wayland-scanner" ,rust-wayland-scanner-0.31.5))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "Bindings to the standard C implementation of the wayland protocol, server side")
    (description
     "This package provides Bindings to the standard C implementation of the wayland protocol, server side.")
    (license license:expat)))

(define-public rust-wayland-sys-0.31.5
  (package
    (name "rust-wayland-sys")
    (version "0.31.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02cyl94ydazgjdjf7asm2phni8h62j4cg4pwr6sy7lwfiq6sra7g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-dlib" ,rust-dlib-0.5)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-memoffset" ,rust-memoffset-0.9)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "FFI bindings to the various libwayland-*.so libraries. You should only need this crate if you are working on custom wayland protocol extensions. Look at the crate wayland-client for usable bindings")
    (description
     "This package provides FFI bindings to the various libwayland-*.so libraries.  You should only need
this crate if you are working on custom wayland protocol extensions.  Look at
the crate wayland-client for usable bindings.")
    (license license:expat)))

(define-public rust-wayland-sys-0.31
  (package
    (name "rust-wayland-sys")
    (version "0.31.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04lwwxmp16769jpn4pc0b9s7yyw9f8hjljn14qazjm35v911hnqh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-dlib" ,rust-dlib-0.5)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-memoffset" ,rust-memoffset-0.9)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "FFI bindings to the various libwayland-*.so libraries. You should only need this crate if you are working on custom wayland protocol extensions. Look at the crate wayland-client for usable bindings")
    (description
     "This package provides FFI bindings to the various libwayland-*.so libraries.  You should only need
this crate if you are working on custom wayland protocol extensions.  Look at
the crate wayland-client for usable bindings.")
    (license license:expat)))

(define-public rust-web-time-1
  (package
    (name "rust-web-time")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "web-time" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fx05yqx83dhx628wb70fyy10yjfq1jpl20qfqhdkymi13rq0ras"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://github.com/daxpedda/web-time")
    (synopsis "Drop-in replacement for std::time for Wasm in browsers")
    (description
     "This package provides Drop-in replacement for std::time for Wasm in browsers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-weezl-0.1
  (package
    (name "rust-weezl")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "weezl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10lhndjgs6y5djpg3b420xngcr6jkmv70q8rb1qcicbily35pa2k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures" ,rust-futures-0.3))))
    (home-page "https://github.com/image-rs/lzw")
    (synopsis "Fast LZW compression and decompression")
    (description
     "This package provides Fast LZW compression and decompression.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wezterm-bidi-0.2
  (package
    (name "rust-wezterm-bidi")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wezterm-bidi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v7kwmnxfplv9kgdmamn6csbn2ag5xjr0y6gs797slk0alsnw2hc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4.21)
                       ("rust-wezterm-dynamic" ,rust-wezterm-dynamic-0.2))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis "The Unicode Bidi Algorithm (UBA)")
    (description "This package provides The Unicode Bidi Algorithm (UBA).")
    (license (list license:expat))))

(define-public rust-wezterm-color-types-0.2
  (package
    (name "rust-wezterm-color-types")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wezterm-color-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xvphmrqgg69v9l879xj5lq010z13f5ixi854ykmny6j7m47lvjc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-csscolorparser" ,rust-csscolorparser-0.6)
                       ("rust-deltae" ,rust-deltae-0.3)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-wezterm-dynamic" ,rust-wezterm-dynamic-0.1))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis "Types for working with colors")
    (description "This package provides Types for working with colors.")
    (license license:expat)))

(define-public rust-wezterm-dynamic-0.2
  (package
    (name "rust-wezterm-dynamic")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wezterm-dynamic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dbppcd5s509w3b25q2fx2c4c52cwdl61yw1fvh38rx8ryx2icfz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4.21)
                       ("rust-ordered-float" ,rust-ordered-float-4)
                       ("rust-strsim" ,rust-strsim-0.10)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-wezterm-dynamic-derive" ,rust-wezterm-dynamic-derive-0.1))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis
     "config serialization for wezterm via dynamic json-like data values")
    (description
     "This package provides config serialization for wezterm via dynamic json-like data values.")
    (license license:expat)))

(define-public rust-wezterm-dynamic-0.1
  (package
    (name "rust-wezterm-dynamic")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wezterm-dynamic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1al8fmfr852m62mlcr0v2lg3a18icl2sv79zv7jnv9v0rk07hpm7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4.21)
                       ("rust-ordered-float" ,rust-ordered-float-3)
                       ("rust-strsim" ,rust-strsim-0.10)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-wezterm-dynamic-derive" ,rust-wezterm-dynamic-derive-0.1))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis
     "config serialization for wezterm via dynamic json-like data values")
    (description
     "This package provides config serialization for wezterm via dynamic json-like data values.")
    (license license:expat)))

(define-public rust-wezterm-dynamic-derive-0.1
  (package
    (name "rust-wezterm-dynamic-derive")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wezterm-dynamic-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w07qf8njyq19nxi9vpshwprk00blhzg9ybis2rhfba433rmx7qc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis
     "config serialization for wezterm via dynamic json-like data values")
    (description
     "This package provides config serialization for wezterm via dynamic json-like data values.")
    (license license:expat)))

(define-public rust-wgpu-0.19
  (package
    (name "rust-wgpu")
    (version "0.19.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wgpu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "009cfqxabinkwmk93wm08gj8nz7d4hl1m17imfxgxg1aplfk3myb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cfg-aliases" ,rust-cfg-aliases-0.1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-naga" ,rust-naga-0.19)
                       ("rust-parking-lot" ,rust-parking-lot-0.11)
                       ("rust-profiling" ,rust-profiling-1)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.6)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-static-assertions" ,rust-static-assertions-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-wgpu-core" ,rust-wgpu-core-0.19)
                       ("rust-wgpu-hal" ,rust-wgpu-hal-0.19)
                       ("rust-wgpu-types" ,rust-wgpu-types-0.19))))
    (home-page "https://wgpu.rs/")
    (synopsis "Rusty WebGPU API wrapper")
    (description "This package provides Rusty @code{WebGPU} API wrapper.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wgpu-core-0.19
  (package
    (name "rust-wgpu-core")
    (version "0.19.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wgpu-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fmzd5rjga26yh96qi57244sv6y25d7pc94yk9f9xflrzhjlbf98"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-bit-vec" ,rust-bit-vec-0.6)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-cfg-aliases" ,rust-cfg-aliases-0.1)
                       ("rust-codespan-reporting" ,rust-codespan-reporting-0.11)
                       ("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-naga" ,rust-naga-0.19)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.11)
                       ("rust-profiling" ,rust-profiling-1)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.6)
                       ("rust-ron" ,rust-ron-0.8)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-wgpu-hal" ,rust-wgpu-hal-0.19)
                       ("rust-wgpu-types" ,rust-wgpu-types-0.19))))
    (home-page "https://wgpu.rs/")
    (synopsis "WebGPU core logic on wgpu-hal")
    (description "This package provides @code{WebGPU} core logic on wgpu-hal.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wgpu-hal-0.19
  (package
    (name "rust-wgpu-hal")
    (version "0.19.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wgpu-hal" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hrr9qjhyc0fjfwp4gsvm8qk5wzi6ijnsm6qlm0spxvd6qj4j6pw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-android-system-properties" ,rust-android-system-properties-0.1)
                       ("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-ash" ,rust-ash-0.37)
                       ("rust-bit-set" ,rust-bit-set-0.5)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-block" ,rust-block-0.1)
                       ("rust-cfg-aliases" ,rust-cfg-aliases-0.1)
                       ("rust-core-graphics-types" ,rust-core-graphics-types-0.1)
                       ("rust-d3d12" ,rust-d3d12-0.19)
                       ("rust-glow" ,rust-glow-0.13)
                       ("rust-glutin-wgl-sys" ,rust-glutin-wgl-sys-0.5)
                       ("rust-gpu-alloc" ,rust-gpu-alloc-0.6)
                       ("rust-gpu-allocator" ,rust-gpu-allocator-0.25)
                       ("rust-gpu-descriptor" ,rust-gpu-descriptor-0.2)
                       ("rust-hassle-rs" ,rust-hassle-rs-0.11)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-khronos-egl" ,rust-khronos-egl-6)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-libloading" ,rust-libloading-0.7)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-metal" ,rust-metal-0.27)
                       ("rust-naga" ,rust-naga-0.19)
                       ("rust-ndk-sys" ,rust-ndk-sys-0.5)
                       ("rust-objc" ,rust-objc-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.11)
                       ("rust-profiling" ,rust-profiling-1)
                       ("rust-range-alloc" ,rust-range-alloc-0.1)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.6)
                       ("rust-renderdoc-sys" ,rust-renderdoc-sys-1)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-wgpu-types" ,rust-wgpu-types-0.19)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wgpu.rs/")
    (synopsis "WebGPU hardware abstraction layer")
    (description
     "This package provides @code{WebGPU} hardware abstraction layer.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wgpu-types-0.19
  (package
    (name "rust-wgpu-types")
    (version "0.19.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wgpu-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01cqjr9qvp34bgjlnrj27wwh7mp7xghlwjbny5pv8y1zn2gzywdn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://wgpu.rs/")
    (synopsis "WebGPU types")
    (description "This package provides @code{WebGPU} types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wiggle-24
  (package
    (name "rust-wiggle")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wiggle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h6xlpfhjmmkpdldkv5lw1pvcgss9kn8rwi39n9kan1cq2ihr1fc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmtime" ,rust-wasmtime-24)
                       ("rust-wiggle-macro" ,rust-wiggle-macro-24)
                       ("rust-witx" ,rust-witx-0.9))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Runtime components of wiggle code generator")
    (description
     "This package provides Runtime components of wiggle code generator.")
    (license license:asl2.0)))

(define-public rust-wiggle-generate-24
  (package
    (name "rust-wiggle-generate")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wiggle-generate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ass9p3lni9ksdpv2s3b12d46qp8ady5zbx87ssbq03jlq28hjv3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-shellexpand" ,rust-shellexpand-2)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-witx" ,rust-witx-0.9))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Library crate for wiggle code generator")
    (description
     "This package provides Library crate for wiggle code generator.")
    (license license:asl2.0)))

(define-public rust-wiggle-macro-24
  (package
    (name "rust-wiggle-macro")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wiggle-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bxy95v31kq64cngq02qgj376zxs1dh6rmhrwqql1is2p6ypqjs7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-wiggle-generate" ,rust-wiggle-generate-24))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Wiggle code generator")
    (description "This package provides Wiggle code generator.")
    (license license:asl2.0)))

(define-public rust-wildmatch-2
  (package
    (name "rust-wildmatch")
    (version "2.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wildmatch" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06bcn7rrhs47yqpnjwid39nfrr0ykn06n9lks3z210lif6cr6a1r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/becheran/wildmatch")
    (synopsis
     "Simple string matching with single- and multi-character wildcard operator")
    (description
     "This package provides Simple string matching with single- and multi-character wildcard operator.")
    (license license:expat)))

(define-public rust-winch-codegen-0.22
  (package
    (name "rust-winch-codegen")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winch-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1q3z96ds78z01slvcjaimwa130zw19c98kw71737zbcygn4zwgh7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.111)
                       ("rust-gimli" ,rust-gimli-0.29)
                       ("rust-regalloc2" ,rust-regalloc2-0.9)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12.16)
                       ("rust-wasmparser" ,rust-wasmparser-0.215)
                       ("rust-wasmtime-cranelift" ,rust-wasmtime-cranelift-24)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-24))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Winch code generation library")
    (description "This package provides Winch code generation library.")
    (license license:asl2.0)))

(define-public rust-windows-0.52
  (package
    (name "rust-windows")
    (version "0.52.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gnh210qjlprpd1szaq04rjm1zqgdm9j7l9absg0kawi2rwm72p4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-core" ,rust-windows-core-0.52)
                       ("rust-windows-implement" ,rust-windows-implement-0.52)
                       ("rust-windows-interface" ,rust-windows-interface-0.52)
                       ("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "This package provides Rust for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-gnullvm-0.52
  (package
    (name "rust-windows-aarch64-gnullvm")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_aarch64_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-gnullvm-0.52
  (package
    (name "rust-windows-aarch64-gnullvm")
    (version "0.52.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_aarch64_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qrjimbj67nnyn7zqy15mzzmqg0mn5gsr2yciqjxm3cb3vbyx23h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-msvc-0.52
  (package
    (name "rust-windows-aarch64-msvc")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_aarch64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-msvc-0.52
  (package
    (name "rust-windows-aarch64-msvc")
    (version "0.52.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_aarch64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dmga8kqlmln2ibckk6mxc9n59vdg8ziqa2zr8awcl720hazv1cr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-core-0.52
  (package
    (name "rust-windows-core")
    (version "0.52.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nc3qv7sy24x0nlnb32f7alzpd6f72l4p24vl65vydbyil669ark"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-result" ,rust-windows-result-0.1)
                       ("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "This package provides Rust for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnu-0.52
  (package
    (name "rust-windows-i686-gnu")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnu-0.52
  (package
    (name "rust-windows-i686-gnu")
    (version "0.52.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w4np3l6qwlra9s2xpflqrs60qk1pz6ahhn91rr74lvdy4y0gfl8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnullvm-0.52
  (package
    (name "rust-windows-i686-gnullvm")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnullvm-0.52
  (package
    (name "rust-windows-i686-gnullvm")
    (version "0.52.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s9f4gff0cixd86mw3n63rpmsm4pmr4ffndl6s7qa2h35492dx47"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-msvc-0.52
  (package
    (name "rust-windows-i686-msvc")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-msvc-0.52
  (package
    (name "rust-windows-i686-msvc")
    (version "0.52.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gw7fklxywgpnwbwg43alb4hm0qjmx72hqrlwy5nanrxs7rjng6v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-implement-0.52
  (package
    (name "rust-windows-implement")
    (version "0.52.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-implement" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0il91jkdgnwl20gm8dwbjswsmiq7paif49dyk5kvhwv72wrqq5hj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "The implement macro for the windows crate")
    (description
     "This package provides The implement macro for the windows crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-interface-0.52
  (package
    (name "rust-windows-interface")
    (version "0.52.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-interface" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1la254wzd8qlbxplvb667z5mwdh9jngg1qyhxg6fx9wm00pc73cx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "The interface macro for the windows crate")
    (description
     "This package provides The interface macro for the windows crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-result-0.1
  (package
    (name "rust-windows-result")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-result" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1y274q1v0vy21lhkgslpxpq1m08hvr1mcs2l88h1b1gcx0136f2y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Windows error handling")
    (description "This package provides Windows error handling.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-sys-0.59
  (package
    (name "rust-windows-sys")
    (version "0.59.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "This package provides Rust for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-targets-0.52
  (package
    (name "rust-windows-targets")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-targets" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-aarch64-gnullvm" ,rust-windows-aarch64-gnullvm-0.52)
                       ("rust-windows-aarch64-msvc" ,rust-windows-aarch64-msvc-0.52)
                       ("rust-windows-i686-gnu" ,rust-windows-i686-gnu-0.52)
                       ("rust-windows-i686-gnullvm" ,rust-windows-i686-gnullvm-0.52)
                       ("rust-windows-i686-msvc" ,rust-windows-i686-msvc-0.52)
                       ("rust-windows-x86-64-gnu" ,rust-windows-x86-64-gnu-0.52)
                       ("rust-windows-x86-64-gnullvm" ,rust-windows-x86-64-gnullvm-0.52)
                       ("rust-windows-x86-64-msvc" ,rust-windows-x86-64-msvc-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import libs for Windows")
    (description "This package provides Import libs for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-targets-0.52
  (package
    (name "rust-windows-targets")
    (version "0.52.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-targets" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sz7jrnkygmmlj1ia8fk85wbyil450kq5qkh5qh9sh2rcnj161vg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-aarch64-gnullvm" ,rust-windows-aarch64-gnullvm-0.52)
                       ("rust-windows-aarch64-msvc" ,rust-windows-aarch64-msvc-0.52)
                       ("rust-windows-i686-gnu" ,rust-windows-i686-gnu-0.52)
                       ("rust-windows-i686-gnullvm" ,rust-windows-i686-gnullvm-0.52)
                       ("rust-windows-i686-msvc" ,rust-windows-i686-msvc-0.52)
                       ("rust-windows-x86-64-gnu" ,rust-windows-x86-64-gnu-0.52)
                       ("rust-windows-x86-64-gnullvm" ,rust-windows-x86-64-gnullvm-0.52)
                       ("rust-windows-x86-64-msvc" ,rust-windows-x86-64-msvc-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import libs for Windows")
    (description "This package provides Import libs for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-win-3
  (package
    (name "rust-windows-win")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-win" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1p7jbk3i7wj1i6w7chfp4rpbyd6ckgncp6h493wm4frbc8rkxqjq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-error-code" ,rust-error-code-3))))
    (home-page "https://github.com/DoumanAsh/windows-win-rs")
    (synopsis
     "Some windows hacking library with utilities to find windows and access them")
    (description
     "This package provides Some windows hacking library with utilities to find windows and access them.")
    (license license:boost1.0)))

(define-public rust-windows-x86-64-gnu-0.52
  (package
    (name "rust-windows-x86-64-gnu")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnu-0.52
  (package
    (name "rust-windows-x86-64-gnu")
    (version "0.52.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n8p2mcf3lw6300k77a0knksssmgwb9hynl793mhkzyydgvlchjf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnullvm-0.52
  (package
    (name "rust-windows-x86-64-gnullvm")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnullvm-0.52
  (package
    (name "rust-windows-x86-64-gnullvm")
    (version "0.52.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15n56jrh4s5bz66zimavr1rmcaw6wa306myrvmbc6rydhbj9h8l5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-msvc-0.52
  (package
    (name "rust-windows-x86-64-msvc")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-msvc-0.52
  (package
    (name "rust-windows-x86-64-msvc")
    (version "0.52.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w1bn24ap8dp9i85s8mlg8cim2bl2368bd6qyvm0xzqvzmdpxi5y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-winnow-0.6
  (package
    (name "rust-winnow")
    (version "0.6.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winnow" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "189b0mrr9lkckdyr0177hwj1c59igxc2lsl71f4wg8wrqbvfbdar"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anstream" ,rust-anstream-0.3)
                       ("rust-anstyle" ,rust-anstyle-1)
                       ("rust-is-terminal" ,rust-is-terminal-0.4)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-terminal-size" ,rust-terminal-size-0.2))))
    (home-page "https://github.com/winnow-rs/winnow")
    (synopsis "byte-oriented, zero-copy, parser combinators library")
    (description
     "This package provides a byte-oriented, zero-copy, parser combinators library.")
    (license license:expat)))

(define-public rust-winreg-0.52
  (package
    (name "rust-winreg")
    (version "0.52.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winreg" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19gh9vp7mp1ab84kc3ag48nm9y7xgjhh3xa4vxss1gylk1rsaxx2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/gentoo90/winreg-rs")
    (synopsis "Rust bindings to MS Windows Registry API")
    (description
     "This package provides Rust bindings to MS Windows Registry API.")
    (license license:expat)))

(define-public rust-winx-0.36
  (package
    (name "rust-winx")
    (version "0.36.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winx" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ikk6cnlfiq7dm36jqwrczxa8jyh9m2zmrdbxi3d430cha1knr7r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/sunfishcode/winx")
    (synopsis "Windows API helper library")
    (description "This package provides Windows API helper library.")
    (license license:asl2.0)))

(define-public rust-wit-component-0.215
  (package
    (name "rust-wit-component")
    (version "0.215.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-component" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hq752ii5fb8x5ysmwd55a9xqmdpac9vqp2wpr40d2f5by4f69gp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.215)
                       ("rust-wasm-metadata" ,rust-wasm-metadata-0.215)
                       ("rust-wasmparser" ,rust-wasmparser-0.215)
                       ("rust-wast" ,rust-wast-215)
                       ("rust-wat" ,rust-wat-1)
                       ("rust-wit-parser" ,rust-wit-parser-0.215))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wit-component")
    (synopsis "Tooling for working with `*.wit` and component files together.")
    (description
     "This package provides Tooling for working with `*.wit` and component files together.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wit-parser-0.215
  (package
    (name "rust-wit-parser")
    (version "0.215.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07rjc2wdr0wsp3c9rrsrgpzak92hnpqgh455790knz6mzzm9fnlk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-id-arena" ,rust-id-arena-2)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1.203)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2)
                       ("rust-wasmparser" ,rust-wasmparser-0.215)
                       ("rust-wat" ,rust-wat-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wit-parser")
    (synopsis
     "Tooling for parsing `*.wit` files and working with their contents.")
    (description
     "This package provides Tooling for parsing `*.wit` files and working with their contents.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-witx-0.9
  (package
    (name "rust-witx")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "witx" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jzgmayh2jjbv70jzfka38g4bk4g1fj9d0m70qkxpkdbbixg4rp3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wast" ,rust-wast-35))))
    (home-page "https://github.com/WebAssembly/WASI")
    (synopsis "Parse and validate witx file format")
    (description "This package provides Parse and validate witx file format.")
    (license license:asl2.0)))

(define-public rust-wl-clipboard-rs-0.8
  (package
    (name "rust-wl-clipboard-rs")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wl-clipboard-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nwa0bg6jpq5sd8x94xgkj0yk7zcz2m3sg2mm26b35qlj5rigd0j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-new" ,rust-derive-new-0.6)
                       ("rust-libc" ,rust-libc-0.2.155)
                       ("rust-log" ,rust-log-0.4.21)
                       ("rust-nix" ,rust-nix-0.28)
                       ("rust-os-pipe" ,rust-os-pipe-1)
                       ("rust-tempfile" ,rust-tempfile-3.10.1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-tree-magic-mini" ,rust-tree-magic-mini-3)
                       ("rust-wayland-backend" ,rust-wayland-backend-0.3)
                       ("rust-wayland-client" ,rust-wayland-client-0.31)
                       ("rust-wayland-protocols" ,rust-wayland-protocols-0.31)
                       ("rust-wayland-protocols-wlr" ,rust-wayland-protocols-wlr-0.2))))
    (home-page "https://github.com/YaLTeR/wl-clipboard-rs")
    (synopsis
     "Access to the Wayland clipboard for terminal and other window-less applications")
    (description
     "This package provides Access to the Wayland clipboard for terminal and other window-less applications.")
    (license (list license:expat license:asl2.0))))

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

(define-public rust-x25519-dalek-2
  (package
    (name "rust-x25519-dalek")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "x25519-dalek" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xyjgqpsa0q6pprakdp58q1hy45rf8wnqqscgzx0gyw13hr6ir67"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-curve25519-dalek" ,rust-curve25519-dalek-4)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/dalek-cryptography/curve25519-dalek")
    (synopsis
     "X25519 elliptic curve Diffie-Hellman key exchange in pure-Rust, using curve25519-dalek")
    (description
     "This package provides X25519 elliptic curve Diffie-Hellman key exchange in pure-Rust, using
curve25519-dalek.")
    (license license:bsd-3)))

(define-public rust-xmlparser-0.13
  (package
    (name "rust-xmlparser")
    (version "0.13.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xmlparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1r796g21c70p983ax0j6rmhzmalg4rhx61mvd4farxdhfyvy1zk6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/RazrFalcon/xmlparser")
    (synopsis "Pull-based, zero-allocation XML parser")
    (description
     "This package provides Pull-based, zero-allocation XML parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-xmlwriter-0.1
  (package
    (name "rust-xmlwriter")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xmlwriter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fg0ldmkgiis6hnxpi1c9gy7v23y0lpi824bp8yp12fi3r82lypc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/RazrFalcon/xmlwriter")
    (synopsis "simple, streaming XML writer.")
    (description "This package provides a simple, streaming XML writer.")
    (license license:expat)))

(define-public rust-yansi-1
  (package
    (name "rust-yansi")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yansi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jdh55jyv0dpd38ij4qh60zglbw9aa8wafqai6m0wa7xaxk3mrfg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-is-terminal" ,rust-is-terminal-0.4))))
    (home-page "https://github.com/SergioBenitez/yansi")
    (synopsis "dead simple ANSI terminal color painting library.")
    (description
     "This package provides a dead simple ANSI terminal color painting library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-yoke-0.7
  (package
    (name "rust-yoke")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yoke" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "198c4jkh6i3hxijia7mfa4cpnxg1iqym9bz364697c3rn0a16nvc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1.0.203)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1)
                       ("rust-yoke-derive" ,rust-yoke-derive-0.7)
                       ("rust-zerofrom" ,rust-zerofrom-0.1))))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis
     "Abstraction allowing borrowed data to be carried along with the backing data it borrows from")
    (description
     "This package provides Abstraction allowing borrowed data to be carried along with the backing data it
borrows from.")
    (license license:expat)))

(define-public rust-yoke-derive-0.7
  (package
    (name "rust-yoke-derive")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yoke-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15cvhkci2mchfffx3fmva84fpmp34dsmnbzibwfnzjqq3ds33k18"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-synstructure" ,rust-synstructure-0.13))))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis "Custom derive for the yoke crate")
    (description "This package provides Custom derive for the yoke crate.")
    (license license:expat)))

(define-public rust-zerofrom-0.1
  (package
    (name "rust-zerofrom")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerofrom" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mdbjd7vmbix2ynxbrbrrli47a5yrpfx05hi99wf1l4pwwf13v4i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-zerofrom-derive" ,rust-zerofrom-derive-0.1))))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis "ZeroFrom trait for constructing")
    (description
     "This package provides @code{ZeroFrom} trait for constructing.")
    (license license:expat)))

(define-public rust-zerofrom-derive-0.1
  (package
    (name "rust-zerofrom-derive")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerofrom-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19b31rrs2ry1lrq5mpdqjzgg65va51fgvwghxnf6da3ycfiv99qf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-synstructure" ,rust-synstructure-0.13))))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis "Custom derive for the zerofrom crate")
    (description "This package provides Custom derive for the zerofrom crate.")
    (license license:expat)))

(define-public rust-zeroize-1
  (package
    (name "rust-zeroize")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zeroize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z8yix823b6lz878qwg6bvwhg3lb0cbw3c9yij9p8mbv7zdzfmj7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-zeroize-derive" ,rust-zeroize-derive-1))))
    (home-page "https://github.com/RustCrypto/utils/tree/master/zeroize")
    (synopsis "Securely clear secrets from memory with a simple trait built on
stable Rust primitives which guarantee memory is zeroed using an
operation will not be 'optimized away' by the compiler.
Uses a portable pure Rust implementation that works everywhere,
even WASM!")
    (description
     "This package provides Securely clear secrets from memory with a simple trait built on stable Rust
primitives which guarantee memory is zeroed using an operation will not be
optimized away by the compiler.  Uses a portable pure Rust implementation that
works everywhere, even WASM!")
    (license (list license:asl2.0 license:expat))))

(define-public rust-zerovec-0.10
  (package
    (name "rust-zerovec")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerovec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "170hdcpc8jvl2jdq0gb6x8dx9ys69wvkzi8mi93r82bcgn1chb5v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-databake" ,rust-databake-0.1)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-twox-hash" ,rust-twox-hash-1)
                       ("rust-yoke" ,rust-yoke-0.7)
                       ("rust-zerofrom" ,rust-zerofrom-0.1)
                       ("rust-zerovec-derive" ,rust-zerovec-derive-0.10))))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis "Zero-copy vector backed by a byte array")
    (description
     "This package provides Zero-copy vector backed by a byte array.")
    (license license:expat)))

(define-public rust-zerovec-derive-0.10
  (package
    (name "rust-zerovec-derive")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerovec-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rzbjgw9jpgkdhchi6834v4p6d38qraqf36r2x22n1g53rh5dkwp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis "Custom derive for the zerovec crate")
    (description "This package provides Custom derive for the zerovec crate.")
    (license license:expat)))

(define-public rust-zlib-rs-0.1
  (package
    (name "rust-zlib-rs")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zlib-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18a49npwcrpbvsxs3dzk51kizd81qffnaxjqfn4fqq37vki0a8f5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-libz-sys" ,rust-libz-sys-1)
                       ("rust-quickcheck" ,rust-quickcheck-1))))
    (home-page "https://github.com/memorysafety/zlib-rs")
    (synopsis "memory-safe zlib implementation written in rust")
    (description
     "This package provides a memory-safe zlib implementation written in rust.")
    (license license:zlib)))

(define-public rust-zune-core-0.4
  (package
    (name "rust-zune-core")
    (version "0.4.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zune-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jj1ra86klzlcj9aha9als9d1dzs7pqv3azs1j3n96822wn3lhiz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4.21)
                       ("rust-serde" ,rust-serde-1.0.203))))
    (home-page "https://github.com/etemesi254/zune-image")
    (synopsis
     "Core utilities for image processing in the zune family of crates")
    (description
     "This package provides Core utilities for image processing in the zune family of crates.")
    (license (list license:expat license:asl2.0 license:zlib))))

(define-public rust-zune-jpeg-0.4
  (package
    (name "rust-zune-jpeg")
    (version "0.4.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zune-jpeg" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0j74rzx82w9zwfqvzrg7k67l77qp3g577w33scrn3zd1l926p1pc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-zune-core" ,rust-zune-core-0.4))))
    (home-page
     "https://github.com/etemesi254/zune-image/tree/dev/crates/zune-jpeg")
    (synopsis "fast, correct and safe jpeg decoder")
    (description
     "This package provides a fast, correct and safe jpeg decoder.")
    (license (list license:expat license:asl2.0 license:zlib))))

(define-public rust-winsafe-0.0.19
  (package
    (name "rust-winsafe")
    (version "0.0.19")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winsafe" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0169xy9mjma8dys4m8v4x0xhw2gkbhv2v1wsbvcjl9bhnxxd2dfi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rodrigocfd/winsafe")
    (synopsis "Windows API and GUI in safe, idiomatic Rust")
    (description
     "This package provides Windows API and GUI in safe, idiomatic Rust.")
    (license license:expat)))

(define-public rust-which-6
  (package
    (name "rust-which")
    (version "6.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "which" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07yg74dsq644hq5a35546c9mja6rsjdsg92rykr9hkflxf7r5vml"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-either" ,rust-either-1)
                       ("rust-home" ,rust-home-0.5)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-winsafe" ,rust-winsafe-0.0.19))))
    (home-page "https://github.com/harryfei/which-rs.git")
    (synopsis
     "Rust equivalent of Unix command \"which\". Locate installed executable in cross platforms.")
    (description
     "This package provides a Rust equivalent of Unix command \"which\".  Locate
installed executable in cross platforms.")
    (license license:expat)))

(define-public rust-webbrowser-1
  (package
    (name "rust-webbrowser")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "webbrowser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dgmn2fwxzyraq2pp5g4hwj852qmvw0i2b14apw0y4ann7my37za"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-block2" ,rust-block2-0.5)
                       ("rust-core-foundation" ,rust-core-foundation-0.10)
                       ("rust-home" ,rust-home-0.5)
                       ("rust-jni" ,rust-jni-0.21)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-ndk-context" ,rust-ndk-context-0.1)
                       ("rust-objc2" ,rust-objc2-0.5)
                       ("rust-objc2-foundation" ,rust-objc2-foundation-0.2)
                       ("rust-url" ,rust-url-2)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://github.com/amodm/webbrowser-rs")
    (synopsis "Open URLs in web browsers available on a platform")
    (description
     "This package provides Open URLs in web browsers available on a platform.")
    (license (list license:expat license:asl2.0))))

(define-public rust-derive-setters-0.1
  (package
    (name "rust-derive-setters")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive_setters" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03890w7p6zslxl0cbwxddx1sjcsmiypsgyghp1li24sf0lrz13jf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling" ,rust-darling-0.20)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/Lymia/derive_setters")
    (synopsis
     "Rust macro to automatically generates setter methods for a struct's fields")
    (description
     "This package provides Rust macro to automatically generates setter methods for a struct's fields.")
    (license (list license:expat license:asl2.0))))

(define-public rust-derive-getters-0.5
  (package
    (name "rust-derive-getters")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-getters" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zyah2rr8jdy8a0cnhnr48dxg8f6alkr59fkfynh273h7ra47vvl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://sr.ht/~kvsari/derive-getters/")
    (synopsis "Simple boilerplate getters generator")
    (description "This package provides Simple boilerplate getters generator.")
    (license license:expat)))

(define-public rust-tui-popup-0.5
  (package
    (name "rust-tui-popup")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tui-popup" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rc53jrl41yghlk9dr9awz5s1z6lqk5arrim5f90phlc0ajsvxq8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-getters" ,rust-derive-getters-0.5)
                       ("rust-derive-setters" ,rust-derive-setters-0.1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-ratatui" ,rust-ratatui-0.28))))
    (home-page "https://github.com/joshka/tui-widgets")
    (synopsis "simple popup for ratatui")
    (description "This package provides a simple popup for ratatui.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tui-input-0.10
  (package
    (name "rust-tui-input")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tui-input" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0svwk8rsdxkpcric7qjgk8llp4bz919fjvz0j6ih7ha3sy07f4xx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ratatui" ,rust-ratatui-0.28)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-termion" ,rust-termion-4)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/sayanarijit/tui-input")
    (synopsis "TUI input library supporting multiple backends")
    (description
     "This package provides TUI input library supporting multiple backends.")
    (license license:expat)))

(define-public rust-derive-builder-core-0.20
  (package
    (name "rust-derive-builder-core")
    (version "0.20.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive_builder_core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s640r6q46c2iiz25sgvxw3lk6b6v5y8hwylng7kas2d09xwynrd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling" ,rust-darling-0.20)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/colin-kiegel/rust-derive-builder")
    (synopsis "Internal helper library for the derive_builder crate")
    (description
     "This package provides Internal helper library for the derive_builder crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-derive-builder-macro-0.20
  (package
    (name "rust-derive-builder-macro")
    (version "0.20.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive_builder_macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0g1zznpqrmvjlp2w7p0jzsjvpmw5rvdag0rfyypjhnadpzib0qxb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-builder-core" ,rust-derive-builder-core-0.20)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/colin-kiegel/rust-derive-builder")
    (synopsis
     "Rust macro to automatically implement the builder pattern for arbitrary structs")
    (description
     "This package provides Rust macro to automatically implement the builder pattern for arbitrary structs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-derive-builder-0.20
  (package
    (name "rust-derive-builder")
    (version "0.20.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive_builder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0is9z7v3kznziqsxa5jqji3ja6ay9wzravppzhcaczwbx84znzah"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-builder-macro" ,rust-derive-builder-macro-0.20))))
    (home-page "https://github.com/colin-kiegel/rust-derive-builder")
    (synopsis
     "Rust macro to automatically implement the builder pattern for arbitrary structs")
    (description
     "This package provides Rust macro to automatically implement the builder pattern for arbitrary structs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tui-big-text-0.6
  (package
    (name "rust-tui-big-text")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tui-big-text" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03kcwwr895wgbwbf97pgx8irjkxmb50f6fvr8k3lww6dpma8jlxq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-builder" ,rust-derive-builder-0.20)
                       ("rust-font8x8" ,rust-font8x8-0.3)
                       ("rust-itertools" ,rust-itertools-0.13)
                       ("rust-ratatui" ,rust-ratatui-0.28))))
    (home-page "https://github.com/joshka/tui-widgets")
    (synopsis "Ratatui widget for displaying big text in the terminal")
    (description
     "This package provides a Ratatui widget for displaying big text in the terminal.")
    (license (list license:expat license:asl2.0))))

(define-public rust-textwrap-0.16
  (package
    (name "rust-textwrap")
    (version "0.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "textwrap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fgqn3mg9gdbjxwfxl76fg0qiq53w3mk4hdh1x40jylnz39k9m13"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hyphenation" ,rust-hyphenation-0.8)
                       ("rust-smawk" ,rust-smawk-0.3)
                       ("rust-terminal-size" ,rust-terminal-size-0.2)
                       ("rust-unicode-linebreak" ,rust-unicode-linebreak-0.1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/mgeisler/textwrap")
    (synopsis
     "Library for word wrapping, indenting, and dedenting strings. Has optional support for Unicode and emojis as well as machine hyphenation")
    (description
     "This package provides Library for word wrapping, indenting, and dedenting strings.  Has optional
support for Unicode and emojis as well as machine hyphenation.")
    (license license:expat)))

(define-public rust-termbg-0.5
  (package
    (name "rust-termbg")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "termbg" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06kinxr2a00s62zp8h0mqh1q6wpnaw8zmmryqrkzp78rvkwy78n5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-crossterm" ,rust-crossterm-0.28)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/dalance/termbg")
    (synopsis "Terminal background color detection")
    (description "This package provides Terminal background color detection.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sysinfo-0.32
  (package
    (name "rust-sysinfo")
    (version "0.32.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sysinfo" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bzlj3afjz4ibdsfchjk1f4md6djffw668f3npiykwph38jcscsc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-core-foundation-sys" ,rust-core-foundation-sys-0.8)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-ntapi" ,rust-ntapi-0.4)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-windows" ,rust-windows-0.57))))
    (home-page "https://github.com/GuillaumeGomez/sysinfo")
    (synopsis
     "Library to get system information such as processes, CPUs, disks, components and networks")
    (description
     "This package provides Library to get system information such as processes, CPUs, disks, components and
networks.")
    (license license:expat)))

(define-public rust-rust-strings-0.6
  (package
    (name "rust-rust-strings")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-strings" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xhlvbghbvvyxzmpipyw02lwwxrix9rj5y42jklsgc14xam5jxfi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-4)
                       ("rust-pyo3" ,rust-pyo3-0.20))))
    (home-page "https://github.com/iddohau/rust-strings")
    (synopsis
     "`rust-strings` is a library to extract ascii strings from binary data")
    (description
     "This package provides `rust-strings` is a library to extract ascii strings from binary data.")
    (license license:expat)))

(define-public rust-syscalls-0.6
  (package
    (name "rust-syscalls")
    (version "0.6.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syscalls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gkwzlb2432jrixwfkkpxv0a017qgqbpsvby7jjpcffpqxfy7l23"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1)
                       ("rust-serde-repr" ,rust-serde-repr-0.1))))
    (home-page "https://github.com/jasonwhite/syscalls")
    (synopsis "list of Linux system calls.")
    (description "This package provides a list of Linux system calls.")
    (license license:bsd-2)))

(define-public rust-linux-personality-2
  (package
    (name "rust-linux-personality")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "linux-personality" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0g4rhsgpvlix83l80g2l72rc94hzi96q8jz1x2nyl7yl2rpmmdq1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/jeandudey/linux-personality")
    (synopsis "Wrapper around Linux personality function")
    (description
     "This package provides Wrapper around Linux personality function.")
    (license license:expat)))

(define-public rust-lurk-cli-0.3
  (package
    (name "rust-lurk-cli")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lurk-cli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0phkq0gglv6wfsmqncz2cxrj5cjbsrjyc3sn9ralq0jsd08wrv8q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-comfy-table" ,rust-comfy-table-7)
                       ("rust-console" ,rust-console-0.15)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-linux-personality" ,rust-linux-personality-2)
                       ("rust-nix" ,rust-nix-0.29)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-syscalls" ,rust-syscalls-0.6)
                       ("rust-users" ,rust-users-0.11))))
    (home-page "https://github.com/JakWai01/lurk")
    (synopsis "lurk is a pretty (simple) alternative to strace")
    (description
     "This package provides lurk is a pretty (simple) alternative to strace.")
    (license (list license:expat license:asl2.0))))

(define-public rust-goblin-0.9
  (package
    (name "rust-goblin")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "goblin" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08yrnjj5j4nddh6y1r8kf35ys7p3iwg6npga3nc4cwfps4r3zask"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-plain" ,rust-plain-0.2)
                       ("rust-scroll" ,rust-scroll-0.12))))
    (home-page "https://github.com/m4b/goblin")
    (synopsis
     "An impish, cross-platform, ELF, Mach-o, and PE binary parsing and loading crate")
    (description
     "This package provides An impish, cross-platform, ELF, Mach-o, and PE binary parsing and loading crate.")
    (license license:expat)))

(define-public rust-fs-err-3
  (package
    (name "rust-fs-err")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fs-err" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zw01xqj302la1c7gnbfwi7b4pcgxv2xkjavk1czjkpk15s0xdlb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-autocfg" ,rust-autocfg-1)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/andrewhickman/fs-err")
    (synopsis
     "drop-in replacement for std::fs with more helpful error messages.")
    (description
     "This package provides a drop-in replacement for std::fs with more helpful error
messages.")
    (license (list license:expat license:asl2.0))))

(define-public rust-lddtree-0.3
  (package
    (name "rust-lddtree")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lddtree" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13mh4y1bwlqpa8jpsgj3zb0mxi4syzdqh8x13xwapdnp9g4rlxz0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fs-err" ,rust-fs-err-3)
                       ("rust-glob" ,rust-glob-0.3)
                       ("rust-goblin" ,rust-goblin-0.9))))
    (home-page "https://github.com/messense/lddtree-rs")
    (synopsis "Read the ELF dependency tree")
    (description "This package provides Read the ELF dependency tree.")
    (license license:expat)))

(define-public rust-heh-0.6
  (package
    (name "rust-heh")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "heh" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wsv34q8xnb1z4d8vr8s4rcyizf4xc5x44bhh1h4jhpbbwc1hwxa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arboard" ,rust-arboard-3.4)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-crossbeam" ,rust-crossbeam-0.8)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-ratatui" ,rust-ratatui-0.28))))
    (home-page "https://github.com/ndd7xv/heh")
    (synopsis
     "cross-platform terminal UI used for modifying file data in hex or ASCII.")
    (description
     "This package provides a cross-platform terminal UI used for modifying file data
in hex or ASCII.")
    (license license:expat)))

(define-public rust-elf-0.7
  (package
    (name "rust-elf")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "elf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yyij25ps8mln1s1xzwggjr88gb2b35c8jf8az25dmfvfaar0ia4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/cole14/rust-elf/")
    (synopsis "pure-rust library for parsing ELF files")
    (description
     "This package provides a pure-rust library for parsing ELF files.")
    (license (list license:expat license:asl2.0))))

(define-public rust-encode-unicode-1
  (package
    (name "rust-encode-unicode")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encode_unicode" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h5j7j7byi289by63s3w4a8b3g6l5ccdrws7a67nn07vdxj77ail"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ascii" ,rust-ascii-1))))
    (home-page "https://github.com/tormol/encode_unicode")
    (synopsis
     "UTF-8 and UTF-16 character types, iterators and related methods for char, u8 and u16.")
    (description
     "This package provides UTF-8 and UTF-16 character types, iterators and related methods for char, u8 and
u16.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-console-0.15
  (package
    (name "rust-console")
    (version "0.15.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "console" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06q4ag46machxp5w381x1v9l2g7d801q6sawvxcpidarh36nwg7a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-encode-unicode" ,rust-encode-unicode-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.2)
                       ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page "https://github.com/console-rs/console")
    (synopsis "terminal and console abstraction for Rust")
    (description
     "This package provides a terminal and console abstraction for Rust.")
    (license license:expat)))

(define-public rust-unicode-truncate-1
  (package
    (name "rust-unicode-truncate")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-truncate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gr7arjjhrhy8dww7hj8qqlws97xf9d276svr4hs6pxgllklcr5k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-itertools" ,rust-itertools-0.13)
                       ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/Aetf/unicode-truncate")
    (synopsis
     "Unicode-aware algorithm to pad or truncate `str` in terms of displayed width.")
    (description
     "This package provides Unicode-aware algorithm to pad or truncate `str` in terms of displayed width.")
    (license (list license:expat license:asl2.0))))

(define-public rust-termion-4
  (package
    (name "rust-termion")
    (version "4.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "termion" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19r3r56cfhl2qvlphw1vrwga37la16rdi15q1d7wz8ji1rb9iaky"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-libredox" ,rust-libredox-0.1)
                       ("rust-numtoa" ,rust-numtoa-0.2)
                       ("rust-redox-termios" ,rust-redox-termios-0.1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://gitlab.redox-os.org/redox-os/termion")
    (synopsis "bindless library for manipulating terminals.")
    (description
     "This package provides a bindless library for manipulating terminals.")
    (license license:expat)))

(define-public rust-strum-macros-0.26
  (package
    (name "rust-strum-macros")
    (version "0.26.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strum_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gl1wmq24b8md527cpyd5bw9rkbqldd7k1h38kf5ajd2ln2ywssc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.5)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/Peternator7/strum")
    (synopsis "Helpful macros for working with enums and strings")
    (description
     "This package provides Helpful macros for working with enums and strings.")
    (license license:expat)))

(define-public rust-syn-2
  (package
    (name "rust-syn")
    (version "2.0.94")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syn" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wvigzkkcbxhvwyzvyk86iabjh3x835f41mx2q1b3a6y3jzc0ywq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Parser for Rust source code")
    (description "This package provides Parser for Rust source code.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro2-1
  (package
    (name "rust-proc-macro2")
    (version "1.0.92")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1c1vjy5wg8iy7kxsxda564qf4ljp0asysmbn2i7caj177x5m9lrp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://github.com/dtolnay/proc-macro2")
    (synopsis
     "substitute implementation of the compiler's `proc_macro` API to decouple token-based libraries from the procedural macro use case.")
    (description
     "This package provides a substitute implementation of the compiler's `proc_macro`
API to decouple token-based libraries from the procedural macro use case.")
    (license (list license:expat license:asl2.0))))

(define-public rust-darling-macro-0.20
  (package
    (name "rust-darling-macro")
    (version "0.20.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling_macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01kq3ibbn47czijj39h3vxyw0c2ksd0jvc097smcrk7n2jjs4dnk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling-core" ,rust-darling-core-0.20)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis
     "Internal support for a proc-macro library for reading attributes into structs when
implementing custom derives. Use https://crates.io/crates/darling in your code.")
    (description
     "This package provides Internal support for a proc-macro library for reading attributes into structs
when implementing custom derives.  Use https://crates.io/crates/darling in your
code.")
    (license license:expat)))

(define-public rust-darling-core-0.20
  (package
    (name "rust-darling-core")
    (version "0.20.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling_core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rgr9nci61ahnim93yh3xy6fkfayh7sk4447hahawah3m1hkh4wm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fnv" ,rust-fnv-1)
                       ("rust-ident-case" ,rust-ident-case-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-strsim" ,rust-strsim-0.11)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis
     "Helper crate for proc-macro library for reading attributes into structs when
implementing custom derives. Use https://crates.io/crates/darling in your code.")
    (description
     "This package provides Helper crate for proc-macro library for reading attributes into structs when
implementing custom derives.  Use https://crates.io/crates/darling in your code.")
    (license license:expat)))

(define-public rust-darling-0.20
  (package
    (name "rust-darling")
    (version "0.20.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1299h2z88qn71mizhh05j26yr3ik0wnqmw11ijds89l8i9nbhqvg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling-core" ,rust-darling-core-0.20)
                       ("rust-darling-macro" ,rust-darling-macro-0.20))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis "proc-macro library for reading attributes into structs when
implementing custom derives.")
    (description
     "This package provides a proc-macro library for reading attributes into structs
when implementing custom derives.")
    (license license:expat)))

(define-public rust-instability-0.3
  (package
    (name "rust-instability")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "instability" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xfgw4afzbhr0v87xilscyc5dxmmcznghr6cr585jczpa5j113l9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling" ,rust-darling-0.20)
                       ("rust-indoc" ,rust-indoc-2)
                       ("rust-pretty-assertions" ,rust-pretty-assertions-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/ratatui-org/instability")
    (synopsis
     "Rust API stability attributes for the rest of us. A fork of the `stability` crate")
    (description
     "This package provides Rust API stability attributes for the rest of us.  A fork of the `stability`
crate.")
    (license license:expat)))

(define-public rust-signal-hook-mio-0.2
  (package
    (name "rust-signal-hook-mio")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "signal-hook-mio" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1k8pl9aafiadr4czsg8zal9b4jdk6kq5985p90i19jc5sh31mnrl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-mio" ,rust-mio-0.8)
                       ("rust-mio" ,rust-mio-1)
                       ("rust-mio" ,rust-mio-0.7)
                       ("rust-mio" ,rust-mio-0.6)
                       ("rust-mio-uds" ,rust-mio-uds-0.6)
                       ("rust-signal-hook" ,rust-signal-hook-0.3))))
    (home-page "https://github.com/vorner/signal-hook")
    (synopsis "MIO support for signal-hook")
    (description "This package provides MIO support for signal-hook.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-crossterm-0.28
  (package
    (name "rust-crossterm")
    (version "0.28.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossterm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1im9vs6fvkql0sr378dfr4wdm1rrkrvr22v4i8byz05k1dd9b7c2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-crossterm-winapi" ,rust-crossterm-winapi-0.9)
                       ("rust-filedescriptor" ,rust-filedescriptor-0.8)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-mio" ,rust-mio-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-signal-hook-mio" ,rust-signal-hook-mio-0.2)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/crossterm-rs/crossterm")
    (synopsis "crossplatform terminal library for manipulating terminals.")
    (description
     "This package provides a crossplatform terminal library for manipulating
terminals.")
    (license license:expat)))

(define-public rust-sqlx-sqlite-0.7
  (package
    (name "rust-sqlx-sqlite")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sqlx-sqlite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ap0bb2hazbrdgd7mhnckdg9xcchx0k094di9gnhpnhlhh5fyi5j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atoi" ,rust-atoi-2)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-flume" ,rust-flume-0.11)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-executor" ,rust-futures-executor-0.3)
                       ("rust-futures-intrusive" ,rust-futures-intrusive-0.5)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-libsqlite3-sys" ,rust-libsqlite3-sys-0.27)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sqlx-core" ,rust-sqlx-core-0.7)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-urlencoding" ,rust-urlencoding-2)
                       ("rust-uuid" ,rust-uuid-1))))
    (home-page "https://github.com/launchbadge/sqlx")
    (synopsis
     "SQLite driver implementation for SQLx. Not for direct use; see the `sqlx` crate for details")
    (description
     "This package provides SQLite driver implementation for SQLx.  Not for direct use; see the `sqlx` crate
for details.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sqlx-postgres-0.7
  (package
    (name "rust-sqlx-postgres")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sqlx-postgres" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zjp30wj4n2f25dnb32vsg6jfpa3gw6dmfd0i5pr4kw91fw4x0kw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atoi" ,rust-atoi-2)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bigdecimal" ,rust-bigdecimal-0.3)
                       ("rust-bit-vec" ,rust-bit-vec-0.6)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-crc" ,rust-crc-3)
                       ("rust-dotenvy" ,rust-dotenvy-0.15)
                       ("rust-etcetera" ,rust-etcetera-0.8)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-hkdf" ,rust-hkdf-0.12)
                       ("rust-hmac" ,rust-hmac-0.12)
                       ("rust-home" ,rust-home-0.5)
                       ("rust-ipnetwork" ,rust-ipnetwork-0.20)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-mac-address" ,rust-mac-address-1)
                       ("rust-md-5" ,rust-md-5-0.10)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rust-decimal" ,rust-rust-decimal-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sqlx-core" ,rust-sqlx-core-0.7)
                       ("rust-stringprep" ,rust-stringprep-0.1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-uuid" ,rust-uuid-1)
                       ("rust-whoami" ,rust-whoami-1))))
    (home-page "https://github.com/launchbadge/sqlx")
    (synopsis
     "PostgreSQL driver implementation for SQLx. Not for direct use; see the `sqlx` crate for details")
    (description
     "This package provides @code{PostgreSQL} driver implementation for SQLx.  Not for direct use; see the
`sqlx` crate for details.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sqlx-mysql-0.7
  (package
    (name "rust-sqlx-mysql")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sqlx-mysql" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "066lxhb80xgb8r5m2yy3a7ydjvp0b6wsk9s7whwfa83d46817lqy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atoi" ,rust-atoi-2)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bigdecimal" ,rust-bigdecimal-0.3)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-crc" ,rust-crc-3)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-dotenvy" ,rust-dotenvy-0.15)
                       ("rust-either" ,rust-either-1)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-generic-array" ,rust-generic-array-0.14)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-hkdf" ,rust-hkdf-0.12)
                       ("rust-hmac" ,rust-hmac-0.12)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-md-5" ,rust-md-5-0.10)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rsa" ,rust-rsa-0.9)
                       ("rust-rust-decimal" ,rust-rust-decimal-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sqlx-core" ,rust-sqlx-core-0.7)
                       ("rust-stringprep" ,rust-stringprep-0.1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-uuid" ,rust-uuid-1)
                       ("rust-whoami" ,rust-whoami-1))))
    (home-page "https://github.com/launchbadge/sqlx")
    (synopsis
     "MySQL driver implementation for SQLx. Not for direct use; see the `sqlx` crate for details")
    (description
     "This package provides @code{MySQL} driver implementation for SQLx.  Not for direct use; see the `sqlx`
crate for details.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sqlx-macros-core-0.7
  (package
    (name "rust-sqlx-macros-core")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sqlx-macros-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1j7k0fw7n6pgabqnj6cbp8s3rmd3yvqr4chjj878cvd1m99yycsq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-dotenvy" ,rust-dotenvy-0.15)
                       ("rust-either" ,rust-either-1)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-sqlx-core" ,rust-sqlx-core-0.7)
                       ("rust-sqlx-mysql" ,rust-sqlx-mysql-0.7)
                       ("rust-sqlx-postgres" ,rust-sqlx-postgres-0.7)
                       ("rust-sqlx-sqlite" ,rust-sqlx-sqlite-0.7)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-tempfile" ,rust-tempfile-3)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/launchbadge/sqlx")
    (synopsis
     "Macro support core for SQLx, the Rust SQL toolkit. Not intended to be used directly")
    (description
     "This package provides Macro support core for SQLx, the Rust SQL toolkit.  Not intended to be used
directly.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sqlx-macros-0.7
  (package
    (name "rust-sqlx-macros")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sqlx-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09rih250868nfkax022y5dyk24a7qfw6scjy3sgalbzb8lihx92f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-sqlx-core" ,rust-sqlx-core-0.7)
                       ("rust-sqlx-macros-core" ,rust-sqlx-macros-core-0.7)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/launchbadge/sqlx")
    (synopsis
     "Macros for SQLx, the rust SQL toolkit. Not intended to be used directly")
    (description
     "This package provides Macros for SQLx, the rust SQL toolkit.  Not intended to be used directly.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sqlformat-0.2
  (package
    (name "rust-sqlformat")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sqlformat" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14470h40gn0f6jw9xxzbpwh5qy1fgvkhkfz8xjyzgi0cvf9kmfkv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-nom" ,rust-nom-7)
                       ("rust-unicode-categories" ,rust-unicode-categories-0.1))))
    (home-page "https://github.com/shssoichiro/sqlformat-rs")
    (synopsis "Formats whitespace in a SQL string to make it easier to read")
    (description
     "This package provides Formats whitespace in a SQL string to make it easier to read.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-intrusive-0.5
  (package
    (name "rust-futures-intrusive")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-intrusive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vwm08d1pli6bdaj0i7xhk3476qlx4pll6i0w03gzdnh7lh0r4qx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-lock-api" ,rust-lock-api-0.4)
                       ("rust-parking-lot" ,rust-parking-lot-0.12))))
    (home-page "https://github.com/Matthias247/futures-intrusive")
    (synopsis
     "Futures based on intrusive data structures - for std and no-std environments.")
    (description
     "This package provides Futures based on intrusive data structures - for std and no-std environments.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sqlx-core-0.7
  (package
    (name "rust-sqlx-core")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sqlx-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xiyr35dq10sf7lq00291svcj9wbaaz1ihandjmrng9a6jlmkfi4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-async-io" ,rust-async-io-1)
                       ("rust-async-std" ,rust-async-std-1)
                       ("rust-atoi" ,rust-atoi-2)
                       ("rust-bigdecimal" ,rust-bigdecimal-0.3)
                       ("rust-bit-vec" ,rust-bit-vec-0.6)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-crc" ,rust-crc-3)
                       ("rust-crossbeam-queue" ,rust-crossbeam-queue-0.3)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-either" ,rust-either-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-event-listener" ,rust-event-listener-2)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-intrusive" ,rust-futures-intrusive-0.5)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-hashlink" ,rust-hashlink-0.8)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-ipnetwork" ,rust-ipnetwork-0.20)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-mac-address" ,rust-mac-address-1)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-rust-decimal" ,rust-rust-decimal-1)
                       ("rust-rustls" ,rust-rustls-0.21)
                       ("rust-rustls-pemfile" ,rust-rustls-pemfile-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sqlformat" ,rust-sqlformat-0.2)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-uuid" ,rust-uuid-1)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.25))))
    (home-page "https://github.com/launchbadge/sqlx")
    (synopsis
     "Core of SQLx, the rust SQL toolkit. Not intended to be used directly")
    (description
     "This package provides Core of SQLx, the rust SQL toolkit.  Not intended to be used directly.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sqlx-0.7
  (package
    (name "rust-sqlx")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sqlx" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ahadprvyhjraq0c5712x3kdkp1gkwfm9nikrmcml2h03bzwr8n9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sqlx-core" ,rust-sqlx-core-0.7)
                       ("rust-sqlx-macros" ,rust-sqlx-macros-0.7)
                       ("rust-sqlx-mysql" ,rust-sqlx-mysql-0.7)
                       ("rust-sqlx-postgres" ,rust-sqlx-postgres-0.7)
                       ("rust-sqlx-sqlite" ,rust-sqlx-sqlite-0.7))))
    (home-page "https://github.com/launchbadge/sqlx")
    (synopsis
     "ð§° The Rust SQL Toolkit. An async, pure Rust SQL crate featuring compile-time checked queries without a DSL. Supports PostgreSQL, MySQL, and SQLite")
    (description
     "This package provides ð§° The Rust SQL Toolkit.  An async, pure Rust SQL crate featuring compile-time
checked queries without a DSL. Supports @code{PostgreSQL}, @code{MySQL}, and
SQLite.")
    (license (list license:expat license:asl2.0))))

(define-public rust-castaway-0.2
  (package
    (name "rust-castaway")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "castaway" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mf0wypwnkpa1hi0058vp8g7bjh2qraip2qv7dmak7mg1azfkfha"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustversion" ,rust-rustversion-1))))
    (home-page "https://github.com/sagebind/castaway")
    (synopsis
     "Safe, zero-cost downcasting for limited compile-time specialization")
    (description
     "This package provides Safe, zero-cost downcasting for limited compile-time specialization.")
    (license license:expat)))

(define-public rust-compact-str-0.8
  (package
    (name "rust-compact-str")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "compact_str" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cmgp61hw4fwaakhilwznfgncw2p4wkbvz6dw3i7ibbckh3c8y9v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-borsh" ,rust-borsh-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-castaway" ,rust-castaway-0.2)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-diesel" ,rust-diesel-2)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-markup" ,rust-markup-0.13)
                       ("rust-proptest" ,rust-proptest-1)
                       ("rust-quickcheck" ,rust-quickcheck-1)
                       ("rust-rkyv" ,rust-rkyv-0.7)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-ryu" ,rust-ryu-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sqlx" ,rust-sqlx-0.7)
                       ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://github.com/ParkMyCar/compact_str")
    (synopsis
     "memory efficient string type that transparently stores strings on the stack, when possible")
    (description
     "This package provides a memory efficient string type that transparently stores
strings on the stack, when possible.")
    (license license:expat)))

(define-public rust-ratatui-0.28
  (package
    (name "rust-ratatui")
    (version "0.28.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ratatui" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zd5pgx1x2bda83mjw0z2skad6rlckcz9gaq1n4jy4n0wndpzvzx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-cassowary" ,rust-cassowary-0.3)
                       ("rust-compact-str" ,rust-compact-str-0.8)
                       ("rust-crossterm" ,rust-crossterm-0.28)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-instability" ,rust-instability-0.3)
                       ("rust-itertools" ,rust-itertools-0.13)
                       ("rust-lru" ,rust-lru-0.12)
                       ("rust-palette" ,rust-palette-0.7)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-strum" ,rust-strum-0.26)
                       ("rust-strum-macros" ,rust-strum-macros-0.26)
                       ("rust-termion" ,rust-termion-4)
                       ("rust-termwiz" ,rust-termwiz-0.22)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
                       ("rust-unicode-truncate" ,rust-unicode-truncate-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://ratatui.rs")
    (synopsis "library that's all about cooking up terminal user interfaces")
    (description
     "This package provides a library that's all about cooking up terminal user
interfaces.")
    (license license:expat)))

(define-public rust-ansi-to-tui-6
  (package
    (name "rust-ansi-to-tui")
    (version "6.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ansi-to-tui" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ixs2j9mdgnxa9f20ziak69m9s3gxs6g0nkhd35rx33hvxqfw0fd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-nom" ,rust-nom-7)
                       ("rust-ratatui" ,rust-ratatui-0.28)
                       ("rust-simdutf8" ,rust-simdutf8-0.1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/uttarayan21/ansi-to-tui")
    (synopsis
     "library to convert ansi color coded text into ratatui::text::Text type from ratatui library")
    (description
     "This package provides a library to convert ansi color coded text into
ratatui::text::Text type from ratatui library.")
    (license license:expat)))

(define-public rust-pdcurses-sys-0.7
  (package
    (name "rust-pdcurses-sys")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pdcurses-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sqn552nz33bmd0d8lcx862lrbxg6fgk5djfblig2q7zjqkx4k88"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/ihalila/pdcurses-sys")
    (synopsis
     "FFI bindings for PDCurses, specifically the win32a implementation")
    (description
     "This package provides FFI bindings for PDCurses, specifically the win32a implementation.")
    (license license:expat)))

(define-public rust-data-url-0.2
  (package
    (name "rust-data-url")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "data-url" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19828d6jby17ghi7vr0zia9sy3hlvvjbngrcsllmfh2zfg1kjx4d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs (("rust-serde" ,rust-serde-1)
                                   ("rust-serde-json" ,rust-serde-json-1)
                                   ("rust-tester" ,rust-tester-0.9))))
    (home-page "https://github.com/servo/rust-url")
    (synopsis "Processing of data: URL according to WHATWGâs Fetch Standard")
    (description
     "This package provides Processing of data: URL according to WHATWGâs Fetch Standard.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rctree-0.5
  (package
    (name "rust-rctree")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rctree" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kvzahkwriawhjjb08ai7rfi77px7rpx5h83hjcx6dccyxzf4hiv"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/RazrFalcon/rctree")
    (synopsis "'DOM-like' tree implemented using reference counting")
    (description
     "This package provides a DOM-like tree implemented using reference counting.")
    (license license:expat)))

(define-public rust-pq-src-0.3
  (package
    (name "rust-pq-src")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pq-src" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1is8344ffcpv7raym9h4n0dz06sxyr9n4vhcrb850ghxpx7z9yr8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-openssl-sys" ,rust-openssl-sys-0.9))))
    (home-page "https://github.com/sgrif/pq-sys")
    (synopsis "Bundled version of libpq")
    (description "This package provides Bundled version of libpq.")
    (license license:expat)))

(define-public rust-openssl-src-300
  (package
    (name "rust-openssl-src")
    (version "300.4.1+3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl-src" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1337svym5imvq9ww04xh0ss38krhbhfb7l92ar5l2qlc2g2fm97s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/alexcrichton/openssl-src-rs")
    (synopsis "Source of OpenSSL and logic to build it.")
    (description
     "This package provides Source of @code{OpenSSL} and logic to build it.")
    (license (list license:expat license:asl2.0))))

(define-public rust-mysqlclient-src-0.1
  (package
    (name "rust-mysqlclient-src")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mysqlclient-src" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15f64s43af0z6608mja7q7wzxiakbsxgad2f4ffpw89g8ppfxjac"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cmake" ,rust-cmake-0.1)
                       ("rust-link-cplusplus" ,rust-link-cplusplus-1)
                       ("rust-openssl-src" ,rust-openssl-src-300)
                       ("rust-openssl-sys" ,rust-openssl-sys-0.9))))
    (home-page "https://github.com/sgrif/mysqlclient-sys")
    (synopsis "Bundled version of libmysqlclient")
    (description "This package provides Bundled version of libmysqlclient.")
    (license license:gpl2)))

(define-public rust-dsl-auto-type-0.1
  (package
    (name "rust-dsl-auto-type")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dsl_auto_type" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01xng43pn2dlc5k422is20dapq14w9x1p46qq968c0s167kapnf5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling" ,rust-darling-0.20)
                       ("rust-either" ,rust-either-1)
                       ("rust-heck" ,rust-heck-0.5)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://diesel.rs")
    (synopsis
     "Automatically expand query fragment types for factoring as functions")
    (description
     "This package provides Automatically expand query fragment types for factoring as functions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-diesel-table-macro-syntax-0.2
  (package
    (name "rust-diesel-table-macro-syntax")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "diesel_table_macro_syntax" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09gvkyljhchbxfkxlkkrdcqcmcxwsim9sfljqilbq4x485b77710"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-syn" ,rust-syn-2))))
    (home-page "https://diesel.rs")
    (synopsis "Internal diesel crate")
    (description "This package provides Internal diesel crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-diesel-derives-2
  (package
    (name "rust-diesel-derives")
    (version "2.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "diesel_derives" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "191iw5ja7s1gjy9ymjvv91ghzbvs2fb5ca28lvr6pfp2a7gc7wp7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-diesel-table-macro-syntax" ,rust-diesel-table-macro-syntax-0.2)
                       ("rust-dsl-auto-type" ,rust-dsl-auto-type-0.1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://diesel.rs")
    (synopsis
     "You should not use this crate directly, it is internal to Diesel")
    (description
     "This package provides You should not use this crate directly, it is internal to Diesel.")
    (license (list license:expat license:asl2.0))))

(define-public rust-diesel-2
  (package
    (name "rust-diesel")
    (version "2.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "diesel" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04kxz9gss7wzis30bcgplxx8xkm635dx2vd30hr69ffdckgvxwfc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bigdecimal" ,rust-bigdecimal-0.1)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-diesel-derives" ,rust-diesel-derives-2)
                       ("rust-ipnet" ,rust-ipnet-2)
                       ("rust-ipnetwork" ,rust-ipnetwork-0.17)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libsqlite3-sys" ,rust-libsqlite3-sys-0.20)
                       ("rust-mysqlclient-src" ,rust-mysqlclient-src-0.1)
                       ("rust-mysqlclient-sys" ,rust-mysqlclient-sys-0.2)
                       ("rust-num-bigint" ,rust-num-bigint-0.2)
                       ("rust-num-integer" ,rust-num-integer-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pq-src" ,rust-pq-src-0.3)
                       ("rust-pq-sys" ,rust-pq-sys-0.4)
                       ("rust-quickcheck" ,rust-quickcheck-1)
                       ("rust-r2d2" ,rust-r2d2-0.8)
                       ("rust-serde-json" ,rust-serde-json-0.9)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-url" ,rust-url-2)
                       ("rust-uuid" ,rust-uuid-0.7))
       #:cargo-development-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                                   ("rust-dotenvy" ,rust-dotenvy-0.15)
                                   ("rust-ipnetwork" ,rust-ipnetwork-0.17)
                                   ("rust-quickcheck" ,rust-quickcheck-1)
                                   ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://diesel.rs")
    (synopsis
     "safe, extensible ORM and Query Builder for PostgreSQL, SQLite, and MySQL")
    (description
     "This package provides a safe, extensible ORM and Query Builder for
@code{PostgreSQL}, SQLite, and @code{MySQL}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-termsize-0.1.9
  (package
    (name "rust-termsize")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "termsize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zb80dcqngbvw1mgkdsagwx6hvcsxr1zpql5bf6n0wn14mfgy4bg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/softprops/termsize")
    (synopsis "Retrieves terminal size")
    (description "This package provides Retrieves terminal size.")
    (license license:expat)))

(define-public rust-ttf-parser-0.20
  (package
    (name "rust-ttf-parser")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ttf-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d4n3p9ccjvy4mj72700i0c2q6d49dxjpwflw47q79rpv1v7vxqp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/harfbuzz/ttf-parser")
    (synopsis
     "high-level, safe, zero-allocation font parser for TrueType, OpenType, and AAT.")
    (description
     "This package provides a high-level, safe, zero-allocation font parser for
@code{TrueType}, @code{OpenType}, and AAT.")
    (license (list license:expat license:asl2.0))))

(define-public rust-plotters-svg-0.3
  (package
    (name "rust-plotters-svg")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "plotters-svg" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w56sxaa2crpasa1zj0bhxzihlapqfkncggavyngg0w86anf5fji"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-image" ,rust-image-0.24)
                       ("rust-plotters-backend" ,rust-plotters-backend-0.3))))
    (home-page "https://plotters-rs.github.io")
    (synopsis "Plotters SVG backend")
    (description "This package provides Plotters SVG backend.")
    (license license:expat)))

(define-public rust-plotters-bitmap-0.3
  (package
    (name "rust-plotters-bitmap")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "plotters-bitmap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01blgzmy7czvrpkdf0xsc169dgdilwy10sf53mn2vy3b7wg1ikkj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gif" ,rust-gif-0.12)
                       ("rust-image" ,rust-image-0.24)
                       ("rust-plotters-backend" ,rust-plotters-backend-0.3))))
    (home-page "https://plotters-rs.github.io")
    (synopsis "Plotters Bitmap Backend")
    (description "This package provides Plotters Bitmap Backend.")
    (license license:expat)))

(define-public rust-plotters-backend-0.3
  (package
    (name "rust-plotters-backend")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "plotters-backend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ahpliim4hrrf7d4ispc2hwr7rzkn6d6nf7lyyrid2lm28yf2hnz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://plotters-rs.github.io")
    (synopsis "Plotters Backend API")
    (description "This package provides Plotters Backend API.")
    (license license:expat)))

(define-public rust-yeslogic-fontconfig-sys-6
  (package
    (name "rust-yeslogic-fontconfig-sys")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yeslogic-fontconfig-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gcx4brx8xvdpvryixk32b3xn9v80ilvi5frd40l8z039imhcfjh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-dlib" ,rust-dlib-0.5)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/yeslogic/fontconfig-rs")
    (synopsis "Raw bindings to Fontconfig without a vendored C library")
    (description
     "This package provides Raw bindings to Fontconfig without a vendored C library.")
    (license license:expat)))

(define-public rust-pathfinder-simd-0.5
  (package
    (name "rust-pathfinder-simd")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pathfinder_simd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wmlqn06qrhin3rblb2gdfxis0s0bbfvp9q47gm9myjch3s7xw2w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustc-version" ,rust-rustc-version-0.4))))
    (home-page "https://github.com/servo/pathfinder")
    (synopsis "simple SIMD library")
    (description "This package provides a simple SIMD library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-font-kit-0.14
  (package
    (name "rust-font-kit")
    (version "0.14.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "font-kit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08252pfhb64pdnp5631cb42kg1ira0cbr49djl2zj5fmxzs38jxn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-core-foundation" ,rust-core-foundation-0.9)
                       ("rust-core-graphics" ,rust-core-graphics-0.23)
                       ("rust-core-text" ,rust-core-text-20)
                       ("rust-dirs" ,rust-dirs-5)
                       ("rust-dwrote" ,rust-dwrote-0.11)
                       ("rust-float-ord" ,rust-float-ord-0.3)
                       ("rust-freetype" ,rust-freetype-0.7)
                       ("rust-freetype-sys" ,rust-freetype-sys-0.20)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-pathfinder-geometry" ,rust-pathfinder-geometry-0.5)
                       ("rust-pathfinder-simd" ,rust-pathfinder-simd-0.5)
                       ("rust-walkdir" ,rust-walkdir-2)
                       ("rust-winapi" ,rust-winapi-0.3)
                       ("rust-yeslogic-fontconfig-sys" ,rust-yeslogic-fontconfig-sys-6))))
    (home-page "https://github.com/servo/font-kit")
    (synopsis "cross-platform font loading library")
    (description
     "This package provides a cross-platform font loading library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-plotters-0.3.7
  (package
    (name "rust-plotters")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "plotters" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ixpy9svpmr2rkzkxvvdpysjjky4gw104d73n7pi2jbs7m06zsss"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ab-glyph" ,rust-ab-glyph-0.2)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-font-kit" ,rust-font-kit-0.14)
                       ("rust-image" ,rust-image-0.24)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pathfinder-geometry" ,rust-pathfinder-geometry-0.5)
                       ("rust-plotters-backend" ,rust-plotters-backend-0.3)
                       ("rust-plotters-bitmap" ,rust-plotters-bitmap-0.3)
                       ("rust-plotters-svg" ,rust-plotters-svg-0.3)
                       ("rust-ttf-parser" ,rust-ttf-parser-0.20)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://plotters-rs.github.io/")
    (synopsis
     "Rust drawing library focus on data plotting for both WASM and native applications")
    (description
     "This package provides a Rust drawing library focus on data plotting for both
WASM and native applications.")
    (license license:expat)))

(define-public rust-entropy-0.4
  (package
    (name "rust-entropy")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hjcsxrmsbh36iagfbws52s44lpkpfkr7bbgpr8z6wpmbvj1d1yn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/smackysnacks/entropy")
    (synopsis "Calculates the Shannon entropy of arrays of bytes and strings")
    (description
     "This package provides Calculates the Shannon entropy of arrays of bytes and strings.")
    (license license:expat)))

(define-public rust-crc32c-0.6
  (package
    (name "rust-crc32c")
    (version "0.6.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crc32c" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0iwyr3jivcnhylczqgk1rkpp9b46r25vi5dj1y7il29dc8hsyirs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustc-version" ,rust-rustc-version-0.4))))
    (home-page "https://github.com/zowens/crc32c")
    (synopsis
     "Safe implementation for hardware accelerated CRC32C instructions with software fallback")
    (description
     "This package provides Safe implementation for hardware accelerated CRC32C instructions with software
fallback.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-crc32-v2-0.0.4
  (package
    (name "rust-crc32-v2")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crc32-v2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lfs9ic0z8bkhmrsg990qaxpk0i0964hs1za7dn6k41lrk76ym3z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/wiseaidev/crc32-v2")
    (synopsis "port of the CRC-32 algorithm to Rust")
    (description
     "This package provides a port of the CRC-32 algorithm to Rust.")
    (license license:expat)))

(define-public rust-tablestream-0.1
  (package
    (name "rust-tablestream")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tablestream" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r8vchi4v9vwkamyv9fx82v5iv519gd47nz9c1qr3y7rmp3bx87y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-crossterm" ,rust-crossterm-0.20)
                       ("rust-unicode-truncate" ,rust-unicode-truncate-0.2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))
       #:cargo-development-inputs (("rust-structopt" ,rust-structopt-0.3))))
    (home-page "https://github.com/NfNitLoop/tablestream")
    (synopsis "streaming table formatter for the console")
    (description
     "This package provides a streaming table formatter for the console.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-derive-4.4
  (package
    (name "rust-clap-derive")
    (version "4.4.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hk4hcxl56qwqsf4hmf7c0gr19r9fbxk0ah2bgkr36pmmaph966g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.4)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis "Parse command line argument by defining a struct, derive crate")
    (description
     "This package provides Parse command line argument by defining a struct, derive crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-builder-4.4
  (package
    (name "rust-clap-builder")
    (version "4.4.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_builder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1iyif47075caa4x1p3ygk18b07lb4xl4k48w4c061i2hxi0dzx2d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anstream" ,rust-anstream-0.6)
                       ("rust-anstyle" ,rust-anstyle-1)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-clap-lex" ,rust-clap-lex-0.6)
                       ("rust-strsim" ,rust-strsim-0.10)
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

(define-public rust-clap-4.4
  (package
    (name "rust-clap")
    (version "4.4.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p46h346y8nval6gwzh27if3icbi9dwl95fg5ir36ihrqip8smqy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-clap-builder" ,rust-clap-builder-4.4)
                       ("rust-clap-derive" ,rust-clap-derive-4.4))
       #:cargo-development-inputs (("rust-humantime" ,rust-humantime-2)
                                   ("rust-rustversion" ,rust-rustversion-1)
                                   ("rust-shlex" ,rust-shlex-1)
                                   ("rust-snapbox" ,rust-snapbox-0.4)
                                   ("rust-trybuild" ,rust-trybuild-1)
                                   ("rust-trycmd" ,rust-trycmd-0.14))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-builder-4.5.26
  (package
    (name "rust-clap-builder")
    (version "4.5.26")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_builder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08f1mzcvi7zjhm7hvz6al4jnv70ccqhwiaq74hihlspwnl0iic4n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anstream" ,rust-anstream-0.6)
                       ("rust-anstyle" ,rust-anstyle-1)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-clap-lex" ,rust-clap-lex-0.7)
                       ("rust-strsim" ,rust-strsim-0.11)
                       ("rust-terminal-size" ,rust-terminal-size-0.4)
                       ("rust-unicase" ,rust-unicase-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.2))
       #:cargo-development-inputs (("rust-color-print" ,rust-color-print-0.3)
                                   ("rust-static-assertions" ,rust-static-assertions-1)
                                   ("rust-unic-emoji-char" ,rust-unic-emoji-char-0.9))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-4.5.26
  (package
    (name "rust-clap")
    (version "4.5.26")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10v7qvn90calfbhap1c4r249i5c7fbxj09fn3szfz9pkis85xsx8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-clap-builder" ,rust-clap-builder-4.5.26)
                       ("rust-clap-derive" ,rust-clap-derive-4))
       #:cargo-development-inputs (("rust-automod" ,rust-automod-1)
                                   ("rust-clap-cargo" ,rust-clap-cargo-0.14)
                                   ("rust-humantime" ,rust-humantime-2)
                                   ("rust-rustversion" ,rust-rustversion-1)
                                   ("rust-shlex" ,rust-shlex-1)
                                   ("rust-snapbox" ,rust-snapbox-0.6)
                                   ("rust-trybuild" ,rust-trybuild-1)
                                   ("rust-trycmd" ,rust-trycmd-0.15))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-thread-scoped-1
  (package
    (name "rust-thread-scoped")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thread-scoped" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16dxl8grpii4vh20qikv2x7r871ggsf9m733xysv1lz506inmfxw"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/arcnmx/thread-scoped-rs")
    (synopsis "Unsafe and deprecated std::thread::scoped")
    (description
     "This package provides Unsafe and deprecated std::thread::scoped.")
    (license (list license:expat license:asl2.0))))

(define-public rust-fuse-0.3
  (package
    (name "rust-fuse")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fuse" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0q46kr5z0d0ljallydb417dwgcd2ib5q2ak6jgpvyrh9a5q71rc0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.3)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-thread-scoped" ,rust-thread-scoped-1)
                       ("rust-time" ,rust-time-0.1))
       #:cargo-development-inputs (("rust-env-logger" ,rust-env-logger-0.3))))
    (home-page "https://github.com/zargony/rust-fuse")
    (synopsis "Rust library for filesystems in userspace (FUSE)")
    (description
     "This package provides Rust library for filesystems in userspace (FUSE).")
    (license license:expat)))

(define-public rust-cexpr-0.3
  (package
    (name "rust-cexpr")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cexpr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07fdfj4ff2974y33yixrb657riq9zl9b9h9lr0h7ridhhvxvbrgw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-nom" ,rust-nom-4))
       #:cargo-development-inputs (("rust-clang-sys" ,rust-clang-sys-0.28))))
    (home-page "https://github.com/jethrogb/rust-cexpr")
    (synopsis "C expression parser and evaluator")
    (description "This package provides a C expression parser and evaluator.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-bindgen-0.51
  (package
    (name "rust-bindgen")
    (version "0.51.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0x9gndlnwmxsihxvsc3izyyss7g8b2djn0daafshj1gcy69i7mzb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-cexpr" ,rust-cexpr-0.3)
                       ("rust-cfg-if" ,rust-cfg-if-0.1)
                       ("rust-clang-sys" ,rust-clang-sys-0.28)
                       ("rust-clap" ,rust-clap-2)
                       ("rust-env-logger" ,rust-env-logger-0.6)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-peeking-take-while" ,rust-peeking-take-while-0.1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-shlex" ,rust-shlex-0.1)
                       ("rust-which" ,rust-which-3))
       #:cargo-development-inputs (("rust-clap" ,rust-clap-2)
                                   ("rust-diff" ,rust-diff-0.1)
                                   ("rust-shlex" ,rust-shlex-0.1))))
    (home-page "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
     "Automatically generates Rust FFI bindings to C and C++ libraries")
    (description
     "This package provides Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license license:bsd-3)))

(define-public rust-libsqlite3-sys-0.16
  (package
    (name "rust-libsqlite3-sys")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libsqlite3-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09dfyakr6qdm35isn4c543yh9qprny6j6h68imv920ikkkl9ansy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bindgen" ,rust-bindgen-0.51)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (home-page "https://github.com/rusqlite/rusqlite")
    (synopsis "Native bindings to the libsqlite3 library")
    (description
     "This package provides Native bindings to the libsqlite3 library.")
    (license license:expat)))

(define-public rust-rusqlite-0.20
  (package
    (name "rust-rusqlite")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rusqlite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lfhxmx1isrk29vmbqg6jwsgf991vh81phhvb9j3aw2jxxrl669a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-csv" ,rust-csv-1)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
                       ("rust-fallible-streaming-iterator" ,rust-fallible-streaming-iterator-0.1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libsqlite3-sys" ,rust-libsqlite3-sys-0.16)
                       ("rust-lru-cache" ,rust-lru-cache-0.1)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-time" ,rust-time-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-uuid" ,rust-uuid-0.7))
       #:cargo-development-inputs (("rust-lazy-static" ,rust-lazy-static-1)
                                   ("rust-regex" ,rust-regex-1)
                                   ("rust-tempdir" ,rust-tempdir-0.3)
                                   ("rust-unicase" ,rust-unicase-2)
                                   ("rust-uuid" ,rust-uuid-0.7))))
    (home-page "https://github.com/rusqlite/rusqlite")
    (synopsis "Ergonomic wrapper for SQLite")
    (description "This package provides Ergonomic wrapper for SQLite.")
    (license license:expat)))
