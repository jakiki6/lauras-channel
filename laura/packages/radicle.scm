(define-module (laura packages radicle)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages crates-database)
  #:use-module (gnu packages crates-compression)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages crates-vcs)
  #:use-module (gnu packages crates-tls)
  #:use-module (gnu packages crates-apple)
  #:use-module (gnu packages crates-windows)
  #:use-module (gnu packages crates-crypto)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages sqlite))

(define rust-addr2line-0.22
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
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-gimli-0.29)))
    (home-page "https://github.com/gimli-rs/addr2line")
    (synopsis
     "cross-platform symbolication library written in Rust, using `gimli`")
    (description
     "This package provides a cross-platform symbolication library written in Rust,
using `gimli`.")
    (license (list license:asl2.0 license:expat))))

(define rust-amplify-4
  (package
    (name "rust-amplify")
    (version "4.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "amplify" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l3lzxcd8xbm2s1c13aha1h4gyczqqcq0v0f9wdifa6bls4i4wcy"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-amplify-derive-4 rust-amplify-num-0.5
                           rust-ascii-1 rust-wasm-bindgen-0.2)))
    (home-page "https://github.com/rust-amplify")
    (synopsis
     "Amplifying Rust language capabilities: multiple generic trait implementations, type wrappers, derive macros")
    (description
     "This package provides Amplifying Rust language capabilities: multiple generic trait implementations,
type wrappers, derive macros.")
    (license license:expat)))

(define rust-amplify-derive-4
  (package
    (name "rust-amplify-derive")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "amplify_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hfr4kg0d47qdc6qidsw6vzad2nc9k1kwjbdm1kq70sdz7xcp7bm"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-amplify-syn-2 rust-proc-macro2-1 rust-quote-1
                           rust-syn-1)))
    (home-page "https://github.com/rust-amplify")
    (synopsis "Powerful derivation macros; part of the 'amplify' library")
    (description
     "This package provides Powerful derivation macros; part of the amplify library.")
    (license license:asl2.0)))

(define rust-amplify-num-0.5
  (package
    (name "rust-amplify-num")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "amplify_num" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0f08xdn6m10dj3jcrlwfjwcbj2wkwicymqkpn48lk0fyqk2hkh04"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-wasm-bindgen-0.2)))
    (home-page "https://github.com/rust-amplify")
    (synopsis "Amplifying numeric types: big-sized and bit-sized integers")
    (description
     "This package provides Amplifying numeric types: big-sized and bit-sized integers.")
    (license license:asl2.0)))

(define rust-amplify-syn-2
  (package
    (name "rust-amplify-syn")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "amplify_syn" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0annky4dq5h5wg58pkbm0d3j07jndbgl9b2vic4q639w8y6zndkp"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-proc-macro2-1 rust-quote-1 rust-syn-1)))
    (home-page "https://github.com/rust-amplify")
    (synopsis
     "Amplifying syn capabilities: helper functions for creating proc macro libraries")
    (description
     "This package provides Amplifying syn capabilities: helper functions for creating proc macro libraries.")
    (license license:asl2.0)))

(define rust-bloomy-1
  (package
    (name "rust-bloomy")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bloomy" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1p9vxbv0kws99ilkk97kd8dhc4pr3rmaqww28y38mdsjg3sjm7a8"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-siphasher-0.3)))
    (home-page "https://docs.rs/bloomy/")
    (synopsis "simple Bloom filter using only two hash functions")
    (description
     "This package provides a simple Bloom filter using only two hash functions.")
    (license license:expat)))

(define rust-borrow-or-share-0.2
  (package
    (name "rust-borrow-or-share")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "borrow-or-share" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ciski5i69a8mx6f0fh901hn73fii3g39lpl8k3xgi88651b9siy"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/yescallop/borrow-or-share")
    (synopsis "Traits for either borrowing or sharing data")
    (description
     "This package provides Traits for either borrowing or sharing data.")
    (license license:expat-0)))

(define rust-bytes-1
  (package
    (name "rust-bytes")
    (version "1.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0smd4wi2yrhp5pmq571yiaqx84bjqlm1ixqhnvfwzzc6pqkn26yp"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/tokio-rs/bytes")
    (synopsis "Types and traits for working with bytes")
    (description
     "This package provides Types and traits for working with bytes.")
    (license license:expat)))

(define rust-bytesize-2
  (package
    (name "rust-bytesize")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytesize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fmchbqbk4pvzh0g4qmsgxlq2scdn4qgfg5fxvqaqjj114rgij53"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-serde-1)))
    (home-page "https://github.com/bytesize-rs/bytesize/")
    (synopsis "an utility for human-readable bytes representations")
    (description
     "This package provides an utility for human-readable bytes representations.")
    (license license:asl2.0)))

(define rust-crossbeam-channel-0.5
  (package
    (name "rust-crossbeam-channel")
    (version "0.5.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-channel" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cicd9ins0fkpfgvz9vhz3m9rpkh6n8d3437c3wnfsdkd3wgif42"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-crossbeam-utils-0.8)))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-channel")
    (synopsis "Multi-producer multi-consumer channels for message passing")
    (description
     "This package provides Multi-producer multi-consumer channels for message passing.")
    (license (list license:expat license:asl2.0))))

(define rust-cypheraddr-0.4
  (package
    (name "rust-cypheraddr")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cypheraddr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n9hlw1jg3qn6gi6b4kpnjkw3aqjbnvp352ihc9r9faamp958p5s"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-amplify-4 rust-base32-0.4
                           rust-cyphergraphy-0.3 rust-sha3-0.10)))
    (home-page "https://cyphernet.org")
    (synopsis
     "Network address types supporting proxying, mixnets, P2P with minimalistic dependencies (part of cyphernet suite)")
    (description
     "This package provides Network address types supporting proxying, mixnets, P2P with minimalistic
dependencies (part of cyphernet suite).")
    (license license:asl2.0)))

(define rust-cyphergraphy-0.3
  (package
    (name "rust-cyphergraphy")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cyphergraphy" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1111vaq7adf68abf1nnch8vflh05fy7gv0xbgasxmp2xxz41cz5n"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-amplify-4 rust-ec25519-0.1 rust-multibase-0.9
                           rust-sha2-0.10)))
    (home-page "https://cyphernet.org")
    (synopsis
     "Implementation-independent abstractions for main cryptographic algorithms (part of cyphernet suite)")
    (description
     "This package provides Implementation-independent abstractions for main cryptographic algorithms (part
of cyphernet suite).")
    (license license:asl2.0)))

(define rust-cyphernet-0.5
  (package
    (name "rust-cyphernet")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cyphernet" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qb25qyp6lz2h8rh8radxj6bw1y7d4984sf65j01syjai1lr755c"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cypheraddr-0.4 rust-cyphergraphy-0.3
                           rust-noise-framework-0.4 rust-socks5-client-0.4)))
    (home-page "https://cyphernet.org")
    (synopsis
     "Cyphernet is a set of libraries for privacy-preserving networking apps")
    (description
     "This package provides Cyphernet is a set of libraries for privacy-preserving networking apps.")
    (license license:asl2.0)))

(define rust-ec25519-0.1
  (package
    (name "rust-ec25519")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ec25519" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09f8f60n3m79hzylpqf26z5x46ky3yp15569733ph4f05wx57zdx"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-ct-codecs-1 rust-ed25519-1 rust-getrandom-0.2)))
    (home-page "https://github.com/jedisct1/rust-ed25519-compact")
    (synopsis
     "Small, self-contained, wasm-friendly elliptic curve algorithms for 25519 curve family")
    (description
     "This package provides Small, self-contained, wasm-friendly elliptic curve algorithms for 25519 curve
family.")
    (license license:expat)))

(define rust-email-address-0.2
  (package
    (name "rust-email-address")
    (version "0.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "email_address" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jf4v3npa524c7npy7w3jl0a6gng26f51a4bgzs3jqna12dz2yg0"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-serde-1)))
    (home-page "https://github.com/johnstonskj/rust-email_address.git")
    (synopsis
     "Rust crate providing an implementation of an RFC-compliant `EmailAddress` newtype.")
    (description
     "This package provides a Rust crate providing an implementation of an
RFC-compliant `@code{EmailAddress`} newtype.")
    (license license:expat)))

(define rust-flate2-1
  (package
    (name "rust-flate2")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "flate2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kpycx57dqpkr3vp53b4nq75p9mflh0smxy8hkys4v4ndvkr5vbw"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-crc32fast-1 rust-miniz-oxide-0.8)))
    (home-page "https://github.com/rust-lang/flate2-rs")
    (synopsis
     "DEFLATE compression and decompression exposed as Read/BufRead/Write streams.
Supports miniz_oxide and multiple zlib implementations. Supports zlib, gzip,
and raw deflate streams.")
    (description
     "This package provides DEFLATE compression and decompression exposed as Read/@code{BufRead/Write}
streams.  Supports miniz_oxide and multiple zlib implementations.  Supports
zlib, gzip, and raw deflate streams.")
    (license (list license:expat license:asl2.0))))

(define rust-fluent-uri-0.3
  (package
    (name "rust-fluent-uri")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fluent-uri" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rgp9mv03bifxysy863kf38aagvyl76ca6gd3dcx6iyzjrfvc60r"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-borrow-or-share-0.2 rust-ref-cast-1
                           rust-serde-1)))
    (home-page "https://github.com/yescallop/fluent-uri-rs")
    (synopsis "generic URI/IRI handling library compliant with RFC 3986/3987.")
    (description
     "This package provides a generic URI/IRI handling library compliant with RFC
3986/3987.")
    (license license:expat)))

(define rust-fraction-0.15
  (package
    (name "rust-fraction")
    (version "0.15.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fraction" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rss1021dpzr12xl3dyqyj36ji4vv4f83yy9im039cx1y0zqw58g"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-lazy-static-1 rust-num-0.4)))
    (home-page "https://github.com/dnsl48/fraction.git")
    (synopsis "Lossless fractions and decimals; drop-in float replacement")
    (description
     "This package provides Lossless fractions and decimals; drop-in float replacement.")
    (license (list license:expat license:asl2.0))))

(define rust-gimli-0.29
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
     (list
      #:skip-build? #t))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis "library for reading and writing the DWARF debugging format.")
    (description
     "This package provides a library for reading and writing the DWARF debugging
format.")
    (license (list license:expat license:asl2.0))))

(define rust-git-ref-format-0.3
  (package
    (name "rust-git-ref-format")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git-ref-format" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vzf6gx5s4zp66clr5bq11iw5wrpglxawzghnrfmgjqz26vxlyhk"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-git-ref-format-core-0.3
                           rust-git-ref-format-macro-0.3)))
    (home-page
     "https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z6cFWeWpnZNHh9rUW8phgA3b5yGt/tree/README.md")
    (synopsis
     "Everything you never knew you wanted for handling git ref names")
    (description
     "This package provides Everything you never knew you wanted for handling git ref names.")
    (license license:gpl3+)))

(define rust-git-ref-format-core-0.3
  (package
    (name "rust-git-ref-format-core")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git-ref-format-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10h9wld5hvv1znld4ys0g6wzidyc1qxq535rmhi5gfk3vjfm9dpb"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bstr-1 rust-serde-1 rust-thiserror-1)))
    (home-page
     "https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z6cFWeWpnZNHh9rUW8phgA3b5yGt/tree/README.md")
    (synopsis "Core types for the git-ref-format crate")
    (description
     "This package provides Core types for the git-ref-format crate.")
    (license license:gpl3+)))

(define rust-git-ref-format-macro-0.3
  (package
    (name "rust-git-ref-format-macro")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git-ref-format-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bnjv84l41z3ifsynvar27pbgpai0yrbh0lnlfms7n9v388d1zqq"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-git-ref-format-core-0.3
                           rust-proc-macro-error-1 rust-quote-1 rust-syn-1)))
    (home-page
     "https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z6cFWeWpnZNHh9rUW8phgA3b5yGt/tree/README.md")
    (synopsis "Macros for the git-ref-format crate")
    (description "This package provides Macros for the git-ref-format crate.")
    (license license:gpl3+)))

(define rust-gix-chunk-0.4
  (package
    (name "rust-gix-chunk")
    (version "0.4.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-chunk" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vxxq4q5pn5cz2xhghcjpp8z83r8xxy74gsffvf9k1lmcj3is7qb"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-thiserror-2)))
    (home-page "https://github.com/GitoxideLabs/gitoxide")
    (synopsis
     "Interact with the git chunk file format used in multi-pack index and commit-graph files")
    (description
     "This package provides Interact with the git chunk file format used in multi-pack index and
commit-graph files.")
    (license (list license:expat license:asl2.0))))

(define rust-gix-config-value-0.14.12
  (package
    (name "rust-gix-config-value")
    (version "0.14.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-config-value" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dj4g52s18ab01pnw55rd0qdf7frdxryzawccy21h56gqi2cihld"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bitflags-2 rust-bstr-1 rust-gix-path-0.10.15
                           rust-libc-0.2 rust-thiserror-2)))
    (home-page "https://github.com/GitoxideLabs/gitoxide")
    (synopsis
     "crate of the gitoxide project providing git-config value parsing")
    (description
     "This package provides a crate of the gitoxide project providing git-config value
parsing.")
    (license (list license:expat license:asl2.0))))

(define rust-gix-date-0.9
  (package
    (name "rust-gix-date")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-date" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1r0pc9ra4r7qxwsyd0jvxh3vsnm3jvkgkr19qbxi2dbxxic018ys"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bstr-1 rust-itoa-1 rust-jiff-0.2
                           rust-thiserror-2)))
    (home-page "https://github.com/GitoxideLabs/gitoxide")
    (synopsis "crate of the gitoxide project parsing dates the way git does")
    (description
     "This package provides a crate of the gitoxide project parsing dates the way git
does.")
    (license (list license:expat license:asl2.0))))

(define rust-gix-path-0.10.15
  (package
    (name "rust-gix-path")
    (version "0.10.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-path" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11xylymhw8maxv5z81w5hrxry10sibw4vw516pzmaakb5y76c47r"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bstr-1 rust-gix-trace-0.1 rust-home-0.5
                           rust-once-cell-1 rust-thiserror-2)))
    (home-page "https://github.com/GitoxideLabs/gitoxide")
    (synopsis
     "crate of the gitoxide project dealing paths and their conversions")
    (description
     "This package provides a crate of the gitoxide project dealing paths and their
conversions.")
    (license (list license:expat license:asl2.0))))

(define rust-gix-quote-0.4
  (package
    (name "rust-gix-quote")
    (version "0.4.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-quote" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ik6l3s0hjb2p4dlgdarb59v7n9jvgvak4ij786mrj5hrpy5g4z4"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bstr-1 rust-gix-utils-0.1.14 rust-thiserror-2)))
    (home-page "https://github.com/GitoxideLabs/gitoxide")
    (synopsis
     "crate of the gitoxide project dealing with various quotations used by git")
    (description
     "This package provides a crate of the gitoxide project dealing with various
quotations used by git.")
    (license (list license:expat license:asl2.0))))

(define rust-gix-sec-0.10
  (package
    (name "rust-gix-sec")
    (version "0.10.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-sec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "122qvp6sll7hkrpjiwf9ga1dni0gwf6j3zzm6cq2zvz97pqv1bj7"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bitflags-2 rust-gix-path-0.10.15 rust-libc-0.2
                           rust-windows-sys-0.52)))
    (home-page "https://github.com/GitoxideLabs/gitoxide")
    (synopsis "crate of the gitoxide project providing a shared trust model")
    (description
     "This package provides a crate of the gitoxide project providing a shared trust
model.")
    (license (list license:expat license:asl2.0))))

(define rust-gix-trace-0.1
  (package
    (name "rust-gix-trace")
    (version "0.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-trace" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xv54v5y91vxjx351wl3yk66fwk7ybkna2knbxlnj34j6qh6lfbw"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/GitoxideLabs/gitoxide")
    (synopsis
     "crate to provide minimal `tracing` support that can be turned off to zero cost")
    (description
     "This package provides a crate to provide minimal `tracing` support that can be
turned off to zero cost.")
    (license (list license:expat license:asl2.0))))

(define rust-gix-utils-0.1.14
  (package
    (name "rust-gix-utils")
    (version "0.1.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pykxyp0cm2x8lj4ryj1pflksf9k7iyrshf8g321d2dc0d7g427z"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-fastrand-2 rust-unicode-normalization-0.1)))
    (home-page "https://github.com/GitoxideLabs/gitoxide")
    (synopsis
     "crate with `gitoxide` utilities that don't need feature toggles")
    (description
     "This package provides a crate with `gitoxide` utilities that don't need feature
toggles.")
    (license (list license:expat license:asl2.0))))

(define rust-gix-validate-0.9
  (package
    (name "rust-gix-validate")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-validate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11204daz5qlk9kqnmiq4syv0n21phkiy3xkwxmwnrnh964jz3d9l"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bstr-1 rust-thiserror-2)))
    (home-page "https://github.com/GitoxideLabs/gitoxide")
    (synopsis "Validation functions for various kinds of names in git")
    (description
     "This package provides Validation functions for various kinds of names in git.")
    (license (list license:expat license:asl2.0))))

(define rust-http-1
  (package
    (name "rust-http")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r95i5h7dr1xadp1ac9453w0s62s27hzkam356nyx2d9mqqmva7l"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bytes-1 rust-fnv-1 rust-itoa-1)))
    (home-page "https://github.com/hyperium/http")
    (synopsis "set of types for representing HTTP requests and responses.")
    (description
     "This package provides a set of types for representing HTTP requests and
responses.")
    (license (list license:expat license:asl2.0))))

(define rust-http-body-util-0.1
  (package
    (name "rust-http-body-util")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http-body-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jm6jv4gxsnlsi1kzdyffjrj8cfr3zninnxpw73mvkxy4qzdj8dh"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bytes-1 rust-futures-core-0.3 rust-http-1
                           rust-http-body-1 rust-pin-project-lite-0.2)))
    (home-page "https://github.com/hyperium/http-body")
    (synopsis "Combinators and adapters for HTTP request or response bodies.")
    (description
     "This package provides Combinators and adapters for HTTP request or response bodies.")
    (license license:expat)))

(define rust-httparse-1
  (package
    (name "rust-httparse")
    (version "1.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "httparse" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11ycd554bw2dkgw0q61xsa7a4jn1wb1xbfacmf3dbwsikvkkvgvd"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/seanmonstar/httparse")
    (synopsis "tiny, safe, speedy, zero-copy HTTP/1.x parser.")
    (description
     "This package provides a tiny, safe, speedy, zero-copy HTTP/1.x parser.")
    (license (list license:expat license:asl2.0))))

(define rust-hyper-1
  (package
    (name "rust-hyper")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "103ggny2k31z0iq2gzwk2vbx601wx6xkpjpxn40hr3p3b0b5fayc"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bytes-1
                           rust-futures-channel-0.3
                           rust-futures-util-0.3
                           rust-http-1
                           rust-http-body-1
                           rust-httparse-1
                           rust-itoa-1
                           rust-pin-project-lite-0.2
                           rust-smallvec-1
                           rust-tokio-1
                           rust-want-0.3)))
    (home-page "https://hyper.rs")
    (synopsis "protective and efficient HTTP library for all.")
    (description
     "This package provides a protective and efficient HTTP library for all.")
    (license license:expat)))

(define rust-icu-locid-transform-data-1
  (package
    (name "rust-icu-locid-transform-data")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_locid_transform_data" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07gignya9gzynnyds88bmra4blq9jxzgrcss43vzk2q9h7byc5bm"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://icu4x.unicode.org")
    (synopsis "Data for the icu_locid_transform crate")
    (description
     "This package provides Data for the icu_locid_transform crate.")
    (license license:unicode)))

(define rust-icu-normalizer-data-1
  (package
    (name "rust-icu-normalizer-data")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_normalizer_data" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dqcm86spcqcs4jnra81yqq3g5bpw6bvf5iz621spj5x52137s65"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://icu4x.unicode.org")
    (synopsis "Data for the icu_normalizer crate")
    (description "This package provides Data for the icu_normalizer crate.")
    (license license:unicode)))

(define rust-icu-properties-data-1
  (package
    (name "rust-icu-properties-data")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_properties_data" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qm5vf17nyiwb87s3g9x9fsj32gkv4a7q7d2sblawx9vfncqgyw5"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://icu4x.unicode.org")
    (synopsis "Data for the icu_properties crate")
    (description "This package provides Data for the icu_properties crate.")
    (license license:unicode)))

(define rust-io-reactor-0.5
  (package
    (name "rust-io-reactor")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "io-reactor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ybcgk7d8843f9klm3ifgx546qfipg0738bbr0gac10gccz8rmvp"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-amplify-4 rust-crossbeam-channel-0.5
                           rust-libc-0.2 rust-popol-3)))
    (home-page "https://github.com/rust-amplify")
    (synopsis "Concurrent I/O resource management using reactor pattern")
    (description
     "This package provides Concurrent I/O resource management using reactor pattern.")
    (license license:asl2.0)))

(define rust-ipnet-2
  (package
    (name "rust-ipnet")
    (version "2.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ipnet" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c5i9sfi2asai28m8xp48k5gvwkqrg5ffpi767py6mzsrswv17s6"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/krisprice/ipnet")
    (synopsis
     "Provides types and useful methods for working with IPv4 and IPv6 network addresses, commonly called IP prefixes. The new `IpNet`, `Ipv4Net`, and `Ipv6Net` types build on the existing `IpAddr`, `Ipv4Addr`, and `Ipv6Addr` types already provided in Rust's standard library and align to their design to stay consistent. The module also provides useful traits that extend `Ipv4Addr` and `Ipv6Addr` with methods for `Add`, `Sub`, `BitAnd`, and `BitOr` operations. The module only uses stable feature so it is guaranteed to compile using the stable toolchain")
    (description
     "This package provides types and useful methods for working with IPv4 and IPv6
network addresses, commonly called IP prefixes.  The new `@code{IpNet`},
`Ipv4Net`, and `Ipv6Net` types build on the existing `@code{IpAddr`},
`Ipv4Addr`, and `Ipv6Addr` types already provided in Rust's standard library and
align to their design to stay consistent.  The module also provides useful
traits that extend `Ipv4Addr` and `Ipv6Addr` with methods for `Add`, `Sub`,
`@code{BitAnd`}, and `@code{BitOr`} operations.  The module only uses stable
feature so it is guaranteed to compile using the stable toolchain.")
    (license (list license:expat license:asl2.0))))

(define rust-jiff-0.2
  (package
    (name "rust-jiff")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jiff" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14yv3b7zi6aqypjkiyag7qifyfqnm20x9fy902b48bg2x6lgx41m"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-jiff-tzdb-platform-0.1
                           rust-log-0.4
                           rust-portable-atomic-1
                           rust-portable-atomic-util-0.2
                           rust-serde-1
                           rust-windows-sys-0.52)))
    (home-page "https://github.com/BurntSushi/jiff")
    (synopsis
     "date-time library that encourages you to jump into the pit of success.

This library is heavily inspired by the Temporal project.")
    (description
     "This package provides a date-time library that encourages you to jump into the
pit of success.  This library is heavily inspired by the Temporal project.")
    (license (list license:unlicense license:expat))))

(define rust-jiff-tzdb-0.1
  (package
    (name "rust-jiff-tzdb")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jiff-tzdb" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09350bna4vxdn2fv7gd08ay41llkflmfyvpx5d6l088axc2kfa61"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page
     "https://github.com/BurntSushi/jiff/tree/master/crates/jiff-tzdb")
    (synopsis "The entire Time Zone Database embedded into your binary")
    (description
     "This package provides The entire Time Zone Database embedded into your binary.")
    (license (list license:unlicense license:expat))))

(define rust-jiff-tzdb-platform-0.1
  (package
    (name "rust-jiff-tzdb-platform")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jiff-tzdb-platform" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s1ja692wyhbv7f60mc0x90h7kn1pv65xkqi2y4imarbmilmlnl7"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-jiff-tzdb-0.1)))
    (home-page
     "https://github.com/BurntSushi/jiff/tree/master/crates/jiff-tzdb-platform")
    (synopsis
     "The entire Time Zone Database embedded into your binary for specific platforms.")
    (description
     "This package provides The entire Time Zone Database embedded into your binary for specific platforms.")
    (license (list license:unlicense license:expat))))

(define rust-js-sys-0.3
  (package
    (name "rust-js-sys")
    (version "0.3.77")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "js-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13x2qcky5l22z4xgivi59xhjjx4kxir1zg7gcj0f1ijzd4yg7yhw"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-once-cell-1 rust-wasm-bindgen-0.2)))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.")
    (description
     "This package provides Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.")
    (license (list license:expat license:asl2.0))))

(define rust-jsonschema-0.30
  (package
    (name "rust-jsonschema")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonschema" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07gsyqmq02y62smmnagxzabdmahhz7f08c8lsbqzn4d6cl1nmd7i"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-ahash-0.8
                           rust-base64-0.22
                           rust-bytecount-0.6
                           rust-email-address-0.2
                           rust-fancy-regex-0.14
                           rust-fraction-0.15
                           rust-idna-1
                           rust-itoa-1
                           rust-num-cmp-0.1
                           rust-num-traits-0.2
                           rust-once-cell-1
                           rust-percent-encoding-2
                           rust-referencing-0.30
                           rust-regex-1
                           rust-regex-syntax-0.8
                           rust-reqwest-0.12
                           rust-serde-1
                           rust-serde-json-1
                           rust-uuid-simd-0.8)))
    (home-page "https://github.com/Stranger6667/jsonschema")
    (synopsis "JSON schema validaton library")
    (description "This package provides JSON schema validaton library.")
    (license license:expat)))

(define rust-litemap-0.7
  (package
    (name "rust-litemap")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "litemap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mi8ykav0s974ps79p438x04snh0cdb7lc864b42jws5375i9yr3"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis "key-value Map implementation based on a flat, sorted Vec.")
    (description
     "This package provides a key-value Map implementation based on a flat, sorted
Vec.")
    (license license:unicode)))

(define rust-localtime-1
  (package
    (name "rust-localtime")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "localtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11vdz49sqqw8ydgg6vnc892z4vpym08vyx7v54r6xfmq1fg00sh1"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-serde-1)))
    (home-page "")
    (synopsis "Minimal monotonic unix-time library")
    (description "This package provides Minimal monotonic unix-time library.")
    (license license:expat)))

(define rust-maybe-async-0.2
  (package
    (name "rust-maybe-async")
    (version "0.2.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "maybe-async" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04fvg2ywb2p9dzf7i35xqfibxc05k1pirv36jswxcqg3qw82ryaw"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-proc-macro2-1 rust-quote-1 rust-syn-2)))
    (home-page "https://github.com/fMeow/maybe-async-rs")
    (synopsis "procedure macro to unify SYNC and ASYNC implementation")
    (description
     "This package provides a procedure macro to unify SYNC and ASYNC implementation.")
    (license license:expat)))

(define rust-miniz-oxide-0.8
  (package
    (name "rust-miniz-oxide")
    (version "0.8.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miniz_oxide" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0al9iy33flfgxawj789w2c8xxwg1n2r5vv6m6p5hl2fvd2vlgriv"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-adler2-2)))
    (home-page "https://github.com/Frommi/miniz_oxide/tree/master/miniz_oxide")
    (synopsis
     "DEFLATE compression and decompression library rewritten in Rust based on miniz")
    (description
     "This package provides DEFLATE compression and decompression library rewritten in Rust based on miniz.")
    (license (list license:expat license:zlib license:asl2.0))))

(define rust-multibase-0.9
  (package
    (name "rust-multibase")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "multibase" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "014l697md16829k41hzmfx4in9jzhn774q5292bsq10z7kn3jdcv"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-base-x-0.2 rust-data-encoding-2
                           rust-data-encoding-macro-0.1)))
    (home-page "https://github.com/multiformats/rust-multibase")
    (synopsis "multibase in rust")
    (description "This package provides multibase in rust.")
    (license license:expat)))

(define rust-netservices-0.8
  (package
    (name "rust-netservices")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netservices" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1364x7xqpmb2kk3gzr9812m2j2382xfbzhvhcyvw7p5d1ahr23xg"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-amplify-4
                           rust-cyphernet-0.5
                           rust-io-reactor-0.5
                           rust-libc-0.2
                           rust-rand-0.8
                           rust-socket2-0.5)))
    (home-page "https://cyphernet.org")
    (synopsis
     "Library for building scalable privacy-preserving microservices P2P nodes")
    (description
     "This package provides Library for building scalable privacy-preserving microservices P2P nodes.")
    (license license:asl2.0)))

(define rust-noise-framework-0.4
  (package
    (name "rust-noise-framework")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "noise-framework" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bhvnpcbgza5hc6gf97n2czac2494fr5n3jxfmcdr6fm2gkrczmm"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-amplify-4 rust-chacha20poly1305-0.10
                           rust-cyphergraphy-0.3)))
    (home-page "https://cyphernet.org")
    (synopsis "Noise protocol framework in functional style")
    (description
     "This package provides Noise protocol framework in functional style.")
    (license license:asl2.0)))

(define rust-nonempty-0.5
  (package
    (name "rust-nonempty")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nonempty" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02f1x6j2yd9n4f8kaz7l9dj4jl37chcfj0yi3bbbcgd2bqgarxwz"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/cloudhead/nonempty")
    (synopsis "Correct by construction non-empty vector")
    (description
     "This package provides Correct by construction non-empty vector.")
    (license license:expat)))

(define rust-nonempty-0.9
  (package
    (name "rust-nonempty")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nonempty" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rh8yv3l0531696d27x3fmv4ykbbi4xqwbmxs7ysr2d5l3ffypcr"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-serde-1)))
    (home-page "https://github.com/cloudhead/nonempty")
    (synopsis "Correct by construction non-empty vector")
    (description
     "This package provides Correct by construction non-empty vector.")
    (license license:expat)))

(define rust-object-0.36
  (package
    (name "rust-object")
    (version "0.36.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "object" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11vv97djn9nc5n6w1gc6bd96d2qk2c8cg1kw5km9bsi3v4a8x532"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-memchr-2)))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis "unified interface for reading and writing object file formats.")
    (description
     "This package provides a unified interface for reading and writing object file
formats.")
    (license (list license:asl2.0 license:expat))))

(define rust-once-cell-1
  (package
    (name "rust-once-cell")
    (version "1.21.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "once_cell" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b9x77lb9f1j6nqgf5aka4s2qj0nly176bpbrv6f9iakk5ff3xa2"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/matklad/once_cell")
    (synopsis "Single assignment cells and lazy values")
    (description
     "This package provides Single assignment cells and lazy values.")
    (license (list license:expat license:asl2.0))))

(define rust-opaque-debug-0.3
  (package
    (name "rust-opaque-debug")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "opaque-debug" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10b3w0kydz5jf1ydyli5nv10gdfp97xh79bgz327d273bs46b3f0"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis "Macro for opaque Debug trait implementation")
    (description
     "This package provides Macro for opaque Debug trait implementation.")
    (license (list license:expat license:asl2.0))))

(define rust-outref-0.5
  (package
    (name "rust-outref")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "outref" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03pzw9aj4qskqhh0fkagy2mkgfwgj5a1m67ajlba5hw80h68100s"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/Nugine/outref")
    (synopsis "Out reference")
    (description "This package provides Out reference.")
    (license license:expat)))

(define rust-phf-0.11
  (package
    (name "rust-phf")
    (version "0.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "phf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y6hxp1d48rx2434wgi5g8j1pr8s5jja29ha2b65435fh057imhz"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-phf-shared-0.11)))
    (home-page "https://github.com/rust-phf/rust-phf")
    (synopsis "Runtime support for perfect hash function data structures")
    (description
     "This package provides Runtime support for perfect hash function data structures.")
    (license license:expat)))

(define rust-phf-shared-0.11
  (package
    (name "rust-phf-shared")
    (version "0.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "phf_shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rallyvh28jqd9i916gk5gk2igdmzlgvv5q0l3xbf3m6y8pbrsk7"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-siphasher-1)))
    (home-page "https://github.com/rust-phf/rust-phf")
    (synopsis "Support code shared by PHF libraries")
    (description "This package provides Support code shared by PHF libraries.")
    (license license:expat)))

(define rust-pin-project-lite-0.2
  (package
    (name "rust-pin-project-lite")
    (version "0.2.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pin-project-lite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16wzc7z7dfkf9bmjin22f5282783f6mdksnr0nv0j5ym5f9gyg1v"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/taiki-e/pin-project-lite")
    (synopsis
     "lightweight version of pin-project written with declarative macros.")
    (description
     "This package provides a lightweight version of pin-project written with
declarative macros.")
    (license (list license:asl2.0 license:expat))))

(define rust-popol-3
  (package
    (name "rust-popol")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "popol" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qskbisrdkpzyyn45dr55avgwl98wvarbks114jlci1fa0rnjh4k"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-libc-0.2)))
    (home-page "https://github.com/cloudhead/popol")
    (synopsis "Minimal non-blocking I/O")
    (description "This package provides Minimal non-blocking I/O.")
    (license license:expat)))

(define rust-portable-atomic-1
  (package
    (name "rust-portable-atomic")
    (version "1.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "portable-atomic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0glb2wngflvfmg789qbf6dbnwcf6ai212fs7n0lf1c66rd49n3im"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/taiki-e/portable-atomic")
    (synopsis
     "Portable atomic types including support for 128-bit atomics, atomic float, etc.")
    (description
     "This package provides Portable atomic types including support for 128-bit atomics, atomic float, etc.")
    (license (list license:asl2.0 license:expat))))

(define rust-portable-atomic-util-0.2
  (package
    (name "rust-portable-atomic-util")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "portable-atomic-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01rmx1li07ixsx3sqg2bxqrkzk7b5n8pibwwf2589ms0s3cg18nq"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-portable-atomic-1)))
    (home-page "https://github.com/taiki-e/portable-atomic")
    (synopsis "Synchronization primitives built with portable-atomic.")
    (description
     "This package provides Synchronization primitives built with portable-atomic.")
    (license (list license:asl2.0 license:expat))))

(define rust-prodash-29
  (package
    (name "rust-prodash")
    (version "29.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prodash" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1g6i2zk6q9dqgspxn14zp31w14rcph7983lap4ilr228yq4b2jzh"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-log-0.4 rust-parking-lot-0.12)))
    (home-page "https://github.com/Byron/prodash")
    (synopsis
     "dashboard for visualizing progress of asynchronous and possibly blocking tasks")
    (description
     "This package provides a dashboard for visualizing progress of asynchronous and
possibly blocking tasks.")
    (license license:expat)))

(define rust-qcheck-1
  (package
    (name "rust-qcheck")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "qcheck" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w7knnk2zhhczmymh6hdddsld4vlvmm6lpn930nxclfs891bsfdl"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-rand-0.8)))
    (home-page "https://github.com/cloudhead/qcheck")
    (synopsis "Automatic property based testing with shrinking")
    (description
     "This package provides Automatic property based testing with shrinking.")
    (license (list license:unlicense license:expat))))

(define rust-qcheck-macros-1
  (package
    (name "rust-qcheck-macros")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "qcheck-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ddiynmcs0i49gxx6vky3jnsg7nvyj1ikw8q9f81a1k9bapvjhi7"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-proc-macro2-1 rust-quote-1 rust-syn-1)))
    (home-page "https://github.com/cloudhead/qcheck")
    (synopsis "macro attribute for quickcheck.")
    (description "This package provides a macro attribute for quickcheck.")
    (license (list license:unlicense license:expat))))

(define rust-radicle-0.15
  (package
    (name "rust-radicle")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00178khbg9inxhir1jn8p2pa34jqnl3g384bldj55k37zglvvfqg"))
       (patches (search-patches "laura/packages/patches/radicle.patch"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #f
      #:cargo-inputs (list rust-amplify-4
                           rust-base64-0.21
                           rust-bytesize-2
                           rust-chrono-0.4
                           rust-colored-2
                           rust-crossbeam-channel-0.5
                           rust-cyphernet-0.5
                           rust-emojis-0.6
                           rust-fastrand-2
                           rust-git2-0.19
                           rust-jsonschema-0.30
                           rust-libc-0.2
                           rust-localtime-1
                           rust-log-0.4
                           rust-multibase-0.9
                           rust-nonempty-0.9
                           rust-once-cell-1
                           rust-pretty-assertions-1
                           rust-qcheck-1
                           rust-qcheck-macros-1
                           rust-radicle-cob-0.14
                           rust-radicle-crypto-0.12
                           rust-radicle-git-ext-0.8
                           rust-radicle-ssh-0.9
                           rust-schemars-1
                           rust-serde-1
                           rust-serde-json-1
                           rust-siphasher-1
                           rust-sqlite-0.32
                           rust-tempfile-3
                           rust-thiserror-1
                           rust-unicode-normalization-0.1)))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle standard library")
    (description "This package provides Radicle standard library.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-cli-0.13
  (package
    (name "rust-radicle-cli")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-cli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z9nfxh3nqj33rvxwk00gh0a3hyz7can3a8cgvj8v7pqrbp9v4k6"))))
    (build-system cargo-build-system)
    (native-inputs (list pkg-config))
    (inputs (list libgit2-1.8 libssh2 openssl zlib sqlite))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'set-env
            (lambda _
              (setenv "LIBGIT2_NO_VENDOR" "1"))))
      #:tests? #f
      #:cargo-inputs (list rust-anyhow-1
                           rust-chrono-0.4
                           rust-git-ref-format-0.3
                           rust-lexopt-0.3
                           rust-localtime-1
                           rust-log-0.4
                           rust-nonempty-0.9
                           rust-pretty-assertions-1
                           rust-radicle-0.15
                           rust-radicle-cli-test-0.11
                           rust-radicle-cob-0.14
                           rust-radicle-crypto-0.12
                           rust-radicle-git-ext-0.8
                           rust-radicle-node-0.11
                           rust-radicle-surf-0.22
                           rust-radicle-term-0.12
                           rust-schemars-1
                           rust-serde-1
                           rust-serde-json-1
                           rust-shlex-1
                           rust-tempfile-3
                           rust-thiserror-1
                           rust-timeago-0.4
                           rust-tree-sitter-0.24
                           rust-tree-sitter-bash-0.23
                           rust-tree-sitter-c-0.23
                           rust-tree-sitter-css-0.23
                           rust-tree-sitter-go-0.23
                           rust-tree-sitter-highlight-0.24
                           rust-tree-sitter-html-0.23
                           rust-tree-sitter-json-0.24
                           rust-tree-sitter-md-0.3
                           rust-tree-sitter-python-0.23
                           rust-tree-sitter-ruby-0.23
                           rust-tree-sitter-rust-0.23
                           rust-tree-sitter-toml-ng-0.6
                           rust-tree-sitter-typescript-0.23
                           rust-zeroize-1)))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle CLI")
    (description "This package provides Radicle CLI.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-cli-test-0.11
  (package
    (name "rust-radicle-cli-test")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-cli-test" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19cmwqrybz6bwssa5qqb56dp309xq7i2klr1n2sid0c7mr4pcahf"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-escargot-0.5
                           rust-log-0.4
                           rust-pretty-assertions-1
                           rust-radicle-0.15
                           rust-shlex-1
                           rust-snapbox-0.4
                           rust-thiserror-1)))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle CLI test library")
    (description "This package provides Radicle CLI test library.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-cob-0.14
  (package
    (name "rust-radicle-cob")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-cob" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s0vrh7m408ws51s5vq3rrqwk5i2n4nfgliysc0vvzm3lzpr173f"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-fastrand-2
                           rust-git2-0.19
                           rust-log-0.4
                           rust-nonempty-0.9
                           rust-once-cell-1
                           rust-qcheck-1
                           rust-qcheck-macros-1
                           rust-radicle-crypto-0.12
                           rust-radicle-dag-0.10
                           rust-radicle-git-ext-0.8
                           rust-serde-1
                           rust-serde-json-1
                           rust-signature-2
                           rust-tempfile-3
                           rust-thiserror-1)))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle Collaborative Objects library")
    (description
     "This package provides Radicle Collaborative Objects library.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-crdt-0.1
  (package
    (name "rust-radicle-crdt")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-crdt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-fastrand-2
                           rust-num-traits-0.2
                           rust-qcheck-1
                           rust-qcheck-macros-1
                           rust-radicle-crypto-0.12
                           rust-serde-1
                           rust-tempfile-3
                           rust-thiserror-1)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define rust-radicle-crypto-0.12
  (package
    (name "rust-radicle-crypto")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-crypto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08ms4mq910abzv3pr87ng9yvc2s37y4yvwqlrqyhghx60ca9wvfi"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-amplify-4
                           rust-cyphernet-0.5
                           rust-ec25519-0.1
                           rust-fastrand-2
                           rust-multibase-0.9
                           rust-qcheck-1
                           rust-qcheck-macros-1
                           rust-radicle-git-ext-0.8
                           rust-radicle-ssh-0.9
                           rust-serde-1
                           rust-signature-2
                           rust-sqlite-0.32
                           rust-ssh-key-0.6
                           rust-tempfile-3
                           rust-thiserror-1
                           rust-zeroize-1)))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle cryptographic primitives")
    (description "This package provides Radicle cryptographic primitives.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-dag-0.10
  (package
    (name "rust-radicle-dag")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-dag" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xa8c4mi4fwfrix923w9v8xd6mmgnjzrc2hrc3wlsfns1bhwfhfb"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-fastrand-2)))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle DAG implementation")
    (description "This package provides Radicle DAG implementation.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-fetch-0.11
  (package
    (name "rust-radicle-fetch")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-fetch" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cbsn667bydypwkbw6rs6lrkwqxkjcnj55gdwjvqfzxcr9ndwgl0"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bstr-1
                           rust-either-1
                           rust-gix-features-0.39
                           rust-gix-hash-0.15
                           rust-gix-odb-0.66
                           rust-gix-pack-0.56
                           rust-gix-protocol-0.47
                           rust-gix-transport-0.44
                           rust-log-0.4
                           rust-nonempty-0.9
                           rust-radicle-0.15
                           rust-radicle-git-ext-0.8
                           rust-thiserror-1)))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle fetch protocol")
    (description "This package provides Radicle fetch protocol.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-git-ext-0.8
  (package
    (name "rust-radicle-git-ext")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-git-ext" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17f1adscy8f1iks8r9d7yvhh2104y758y1p6i11y849856kfilhn"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-git-ref-format-0.3
                           rust-git2-0.19
                           rust-percent-encoding-2
                           rust-radicle-std-ext-0.1
                           rust-serde-1
                           rust-thiserror-1)))
    (home-page
     "https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z6cFWeWpnZNHh9rUW8phgA3b5yGt/tree/README.md")
    (synopsis "Utilities and extensions to the git2 crate")
    (description
     "This package provides Utilities and extensions to the git2 crate.")
    (license license:gpl3+)))

(define rust-radicle-node-0.11
  (package
    (name "rust-radicle-node")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-node" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yq52l3v7zxs93l1g29h0xdl8pwbafbf5si90wgjbpss9p47apms"))))
    (build-system cargo-build-system)
    (native-inputs (list pkg-config))
    (inputs (list libgit2-1.8 libssh2 openssl zlib sqlite))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'set-env
            (lambda _
              (setenv "LIBGIT2_NO_VENDOR" "1"))))
      #:tests? #f
      #:cargo-inputs (list rust-amplify-4
                           rust-anyhow-1
                           rust-bloomy-1
                           rust-byteorder-1
                           rust-chrono-0.4
                           rust-colored-2
                           rust-crossbeam-channel-0.5
                           rust-cyphernet-0.5
                           rust-fastrand-2
                           rust-gix-config-value-0.14.12
                           rust-gix-path-0.10.15
                           rust-gix-utils-0.1.14
                           rust-io-reactor-0.5
                           rust-lexopt-0.3
                           rust-libc-0.2
                           rust-localtime-1
                           rust-log-0.4
                           rust-netservices-0.8
                           rust-nonempty-0.9
                           rust-once-cell-1
                           rust-qcheck-1
                           rust-qcheck-macros-1
                           rust-radicle-0.15
                           rust-radicle-crypto-0.12
                           rust-radicle-fetch-0.11
                           rust-radicle-git-ext-0.8
                           rust-radicle-signals-0.11
                           rust-radicle-systemd-0.9
                           rust-scrypt-0.11
                           rust-serde-1
                           rust-serde-json-1
                           rust-snapbox-0.4
                           rust-socket2-0.5
                           rust-sqlite-0.32
                           rust-tempfile-3
                           rust-thiserror-1)))
    (home-page "https://radicle.xyz")
    (synopsis "The Radicle Node")
    (description "This package provides The Radicle Node.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-remote-helper-0.10
  (package
    (name "rust-radicle-remote-helper")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-remote-helper" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xllv903in2pbynbwyir15rw7wyrnzdz6l07dbc6399ybf4jfyjk"))
       (patches (search-patches
                 "laura/packages/patches/radicle-remote-helper.patch"))))
    (build-system cargo-build-system)
    (native-inputs (list pkg-config))
    (inputs (list libgit2-1.8 libssh2 openssl zlib sqlite))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'set-env
            (lambda _
              (setenv "LIBGIT2_NO_VENDOR" "1"))))
      #:tests? #f
      #:cargo-inputs (list rust-log-0.4
                           rust-radicle-0.15
                           rust-radicle-cli-0.13
                           rust-radicle-crypto-0.12
                           rust-radicle-git-ext-0.8
                           rust-thiserror-1)))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle git remote helper")
    (description "This package provides Radicle git remote helper.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-schemars-0.1
  (package
    (name "rust-radicle-schemars")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-schemars" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-once-cell-1 rust-radicle-0.15 rust-schemars-1
                           rust-serde-1 rust-serde-json-1)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define rust-radicle-signals-0.11
  (package
    (name "rust-radicle-signals")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-signals" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mn4xc89aq6vhk344ai7hsdqqdjzg2lr1ldggm2pgi4fw1kzbg6j"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-crossbeam-channel-0.5 rust-libc-0.2
                           rust-signals-receipts-0.2)))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle signal handling")
    (description "This package provides Radicle signal handling.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-ssh-0.9
  (package
    (name "rust-radicle-ssh")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-ssh" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ik6fd64idgdyknl7lahcjqibg1wxgxr31diwhmlhr7v2207bvpv"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-byteorder-1 rust-log-0.4 rust-thiserror-1
                           rust-zeroize-1)))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle SSH library")
    (description "This package provides Radicle SSH library.")
    (license license:asl2.0)))

(define rust-radicle-std-ext-0.1
  (package
    (name "rust-radicle-std-ext")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-std-ext" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "195aflsf8s6nqvgva0a54k1gl0j9kwv6qnlfxhzkzrlspimi686v"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page
     "https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z6cFWeWpnZNHh9rUW8phgA3b5yGt/tree/README.md")
    (synopsis "Monkey patches of std types")
    (description "This package provides Monkey patches of std types.")
    (license license:gpl3+)))

(define rust-radicle-surf-0.22
  (package
    (name "rust-radicle-surf")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-surf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "057kcjp03xj23bw8lqp6sfy7zp1z4wvjfylc7pj72zq8i4wqqc7v"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-anyhow-1
                           rust-base64-0.13
                           rust-flate2-1
                           rust-git2-0.19
                           rust-log-0.4
                           rust-nonempty-0.5
                           rust-radicle-git-ext-0.8
                           rust-radicle-std-ext-0.1
                           rust-tar-0.4
                           rust-thiserror-1
                           rust-url-2)))
    (home-page
     "https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z6cFWeWpnZNHh9rUW8phgA3b5yGt/tree/radicle-surf/README.md")
    (synopsis "code surfing library for Git repositories")
    (description
     "This package provides a code surfing library for Git repositories.")
    (license license:gpl3+)))

(define rust-radicle-systemd-0.9
  (package
    (name "rust-radicle-systemd")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-systemd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1983x29w41ncqjs972jdsayf1srfyfnp7812cyhy5jc6hdfbbcpl"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle integration with Systemd")
    (description "This package provides Radicle integration with Systemd.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-term-0.12
  (package
    (name "rust-radicle-term")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-term" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pin48vijnz5mavdjd6hz6dvax0shb25104cfgcg1l6jjwfiz742"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-anstyle-query-1
                           rust-anyhow-1
                           rust-crossbeam-channel-0.5
                           rust-git2-0.19
                           rust-inquire-0.7
                           rust-libc-0.2
                           rust-once-cell-1
                           rust-pretty-assertions-1
                           rust-radicle-signals-0.11
                           rust-shlex-1
                           rust-tempfile-3
                           rust-termion-3
                           rust-thiserror-1
                           rust-unicode-display-width-0.3
                           rust-unicode-segmentation-1
                           rust-zeroize-1)))
    (home-page "https://radicle.xyz")
    (synopsis "Terminal library used by the Radicle CLI")
    (description
     "This package provides Terminal library used by the Radicle CLI.")
    (license (list license:expat license:asl2.0))))

(define rust-radicle-tools-0.9
  (package
    (name "rust-radicle-tools")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "radicle-tools" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-anyhow-1 rust-radicle-0.15
                           rust-radicle-cli-0.13 rust-radicle-git-ext-0.8
                           rust-radicle-term-0.12)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define rust-ref-cast-1
  (package
    (name "rust-ref-cast")
    (version "1.0.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ref-cast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kx57g118vs9sqi6d2dcxy6vp8jbx8n5hilmv1sacip9vc8y82ja"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-ref-cast-impl-1)))
    (home-page "https://github.com/dtolnay/ref-cast")
    (synopsis
     "Safely cast &T to &U where the struct U contains a single field of type T")
    (description
     "This package provides Safely cast &T to &U where the struct U contains a single field of type T.")
    (license (list license:expat license:asl2.0))))

(define rust-ref-cast-impl-1
  (package
    (name "rust-ref-cast-impl")
    (version "1.0.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ref-cast-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ir7dm7hpqqdgg60hlspsc1ck6wli7wa3xcqrsxz7wdz45f24r8i"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-proc-macro2-1 rust-quote-1 rust-syn-2)))
    (home-page "https://github.com/dtolnay/ref-cast")
    (synopsis "Derive implementation for ref_cast::RefCast")
    (description
     "This package provides Derive implementation for ref_cast::@code{RefCast}.")
    (license (list license:expat license:asl2.0))))

(define rust-referencing-0.30
  (package
    (name "rust-referencing")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "referencing" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03j27y4zbghw2pi4ccfjc072zi89lzijypswx1bjlp4bfzxg9vy8"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-ahash-0.8
                           rust-fluent-uri-0.3
                           rust-once-cell-1
                           rust-parking-lot-0.12
                           rust-percent-encoding-2
                           rust-serde-json-1)))
    (home-page "https://github.com/Stranger6667/jsonschema")
    (synopsis
     "An implementation-agnostic JSON reference resolution library for Rust")
    (description
     "This package provides An implementation-agnostic JSON reference resolution library for Rust.")
    (license license:expat)))

(define rust-regex-automata-0.4
  (package
    (name "rust-regex-automata")
    (version "0.4.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex-automata" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02092l8zfh3vkmk47yjc8d631zhhcd49ck2zr133prvd3z38v7l0"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-aho-corasick-1 rust-memchr-2
                           rust-regex-syntax-0.8)))
    (home-page "https://github.com/rust-lang/regex/tree/master/regex-automata")
    (synopsis "Automata construction and matching using regular expressions")
    (description
     "This package provides Automata construction and matching using regular expressions.")
    (license (list license:expat license:asl2.0))))

(define rust-reqwest-0.12
  (package
    (name "rust-reqwest")
    (version "0.12.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "reqwest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fvvrl3jmsnlm99ldl0ariklrlsmrky06qabp7dc92ylznk4d76i"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-base64-0.22
                           rust-bytes-1
                           rust-futures-channel-0.3
                           rust-futures-core-0.3
                           rust-futures-util-0.3
                           rust-http-1
                           rust-http-body-1
                           rust-http-body-util-0.1
                           rust-hyper-1
                           rust-hyper-util-0.1
                           rust-ipnet-2
                           rust-js-sys-0.3
                           rust-log-0.4
                           rust-mime-0.3
                           rust-once-cell-1
                           rust-percent-encoding-2
                           rust-pin-project-lite-0.2
                           rust-serde-1
                           rust-serde-json-1
                           rust-serde-urlencoded-0.7
                           rust-sync-wrapper-1
                           rust-tokio-1
                           rust-tower-0.5
                           rust-tower-service-0.3
                           rust-url-2
                           rust-wasm-bindgen-0.2
                           rust-wasm-bindgen-futures-0.4
                           rust-web-sys-0.3
                           rust-windows-registry-0.4)))
    (home-page "https://github.com/seanmonstar/reqwest")
    (synopsis "higher level HTTP client library")
    (description "This package provides higher level HTTP client library.")
    (license (list license:expat license:asl2.0))))

(define rust-rustversion-1
  (package
    (name "rust-rustversion")
    (version "1.0.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustversion" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lhwjb16dsm8brd18bn2bh0ryzc7qi29bi2jjsc6ny2zbwn3ivgd"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/dtolnay/rustversion")
    (synopsis "Conditional compilation according to rustc compiler version")
    (description
     "This package provides Conditional compilation according to rustc compiler version.")
    (license (list license:expat license:asl2.0))))

(define rust-schemars-1
  (package
    (name "rust-schemars")
    (version "1.0.0-alpha.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "schemars" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1k5g3d9px3gg69wdvgai9yhflg8xkvf8sjlpvcl242j04djjmvw8"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-dyn-clone-1 rust-ref-cast-1
                           rust-schemars-derive-1 rust-serde-1
                           rust-serde-json-1)))
    (home-page "https://graham.cool/schemars/")
    (synopsis "Generate JSON Schemas from Rust code")
    (description "This package provides Generate JSON Schemas from Rust code.")
    (license license:expat)))

(define rust-schemars-derive-1
  (package
    (name "rust-schemars-derive")
    (version "1.0.0-alpha.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "schemars_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kbjmp0ib5k8pifinphqjx0pz7si4sq4k13hmbnmi7iwbaaf3m66"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-proc-macro2-1 rust-quote-1
                           rust-serde-derive-internals-0.29 rust-syn-2)))
    (home-page "https://graham.cool/schemars/")
    (synopsis "Macros for #[derive(JsonSchema)], for use with schemars")
    (description
     "This package provides Macros for #[derive(@code{JsonSchema})], for use with schemars.")
    (license license:expat)))

(define rust-sem-safe-0.2
  (package
    (name "rust-sem-safe")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sem_safe" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "056v3wi5z6lvmpgwm2am3l7ca20abvfy134p1bqnapwvsdhdc44i"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-base64-0.22 rust-errno-0.3 rust-getrandom-0.2
                           rust-libc-0.2)))
    (home-page
     "https://app.radicle.xyz/nodes/ash.radicle.garden/rad:zUAeNZN24JCzNQ9YVkoxNbw8c8TU")
    (synopsis "Safe usage of POSIX Semaphores (`sem_post`, `sem_wait`, etc)")
    (description
     "This package provides Safe usage of POSIX Semaphores (`sem_post`, `sem_wait`, etc).")
    (license license:unlicense)))

(define rust-serde-1
  (package
    (name "rust-serde")
    (version "1.0.219")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dl6nyxnsi82a197sd752128a4avm6mxnscywas1jq30srp2q3jz"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-serde-derive-1)))
    (home-page "https://serde.rs")
    (synopsis "generic serialization/deserialization framework")
    (description
     "This package provides a generic serialization/deserialization framework.")
    (license (list license:expat license:asl2.0))))

(define rust-serde-derive-1
  (package
    (name "rust-serde-derive")
    (version "1.0.219")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "001azhjmj7ya52pmfiw4ppxm16nd44y15j2pf5gkcwrcgz7pc0jv"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-proc-macro2-1 rust-quote-1 rust-syn-2)))
    (home-page "https://serde.rs")
    (synopsis "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (description
     "This package provides Macros 1.1 implementation of #[derive(Serialize, Deserialize)].")
    (license (list license:expat license:asl2.0))))

(define rust-serde-json-1
  (package
    (name "rust-serde-json")
    (version "1.0.140")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_json" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wwkp4vc20r87081ihj3vpyz5qf7wqkqipq17v99nv6wjrp8n1i0"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-indexmap-2 rust-itoa-1 rust-memchr-2
                           rust-ryu-1 rust-serde-1)))
    (home-page "https://github.com/serde-rs/json")
    (synopsis "JSON serialization file format")
    (description "This package provides a JSON serialization file format.")
    (license (list license:expat license:asl2.0))))

(define rust-signals-receipts-0.2
  (package
    (name "rust-signals-receipts")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "signals_receipts" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03k174x8i8abi01fgvi8nk9zn9h5hn4s2h92yzr6i3wlgv10gykl"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cfg-if-1 rust-errno-0.3 rust-libc-0.2
                           rust-sem-safe-0.2)))
    (home-page
     "https://app.radicle.xyz/nodes/ash.radicle.garden/rad:zEuRtz1NEa1AAcsDpE7NowDo3m6j")
    (synopsis "Simple exfiltration of the receipt of POSIX signals")
    (description
     "This package provides Simple exfiltration of the receipt of POSIX signals.")
    (license license:unlicense)))

(define rust-siphasher-1
  (package
    (name "rust-siphasher")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "siphasher" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17f35782ma3fn6sh21c027kjmd227xyrx06ffi8gw4xzv9yry6an"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://docs.rs/siphasher")
    (synopsis "SipHash-2-4, SipHash-1-3 and 128-bit variants in pure Rust")
    (description
     "This package provides @code{SipHash-2-4}, @code{SipHash-1-3} and 128-bit variants in pure Rust.")
    (license (list license:expat license:asl2.0))))

(define rust-socks5-client-0.4
  (package
    (name "rust-socks5-client")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "socks5-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0k1jpbpc0wqqqykz27706vj6rmsqqr66l01kss15vmmizbvdrizz"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-amplify-4 rust-cypheraddr-0.4)))
    (home-page "https://cyphernet.org")
    (synopsis "Socks5 clinet minimalistic library")
    (description "This package provides Socks5 clinet minimalistic library.")
    (license license:asl2.0)))

(define rust-sqlite-0.32
  (package
    (name "rust-sqlite")
    (version "0.32.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sqlite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rpqpkpxn2qdvghsnak2b73cn5ca37p6ri0ylyjdcmrq3481r003"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-libc-0.2 rust-sqlite3-sys-0.15)))
    (home-page "https://github.com/stainless-steel/sqlite")
    (synopsis "The package provides an interface to SQLite")
    (description
     "This package provides The package provides an interface to SQLite.")
    (license (list license:asl2.0 license:expat))))

(define rust-thiserror-2
  (package
    (name "rust-thiserror")
    (version "2.0.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "024791nsc0np63g2pq30cjf9acj38z3jwx9apvvi8qsqmqnqlysn"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-thiserror-impl-2)))
    (home-page "https://github.com/dtolnay/thiserror")
    (synopsis "derive(Error)")
    (description "This package provides derive(Error).")
    (license (list license:expat license:asl2.0))))

(define rust-thiserror-impl-2
  (package
    (name "rust-thiserror-impl")
    (version "2.0.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07bsn7shydaidvyyrm7jz29vp78vrxr9cr9044rfmn078lmz8z3z"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-proc-macro2-1 rust-quote-1 rust-syn-2)))
    (home-page "https://github.com/dtolnay/thiserror")
    (synopsis "Implementation detail of the `thiserror` crate")
    (description
     "This package provides Implementation detail of the `thiserror` crate.")
    (license (list license:expat license:asl2.0))))

(define rust-tokio-1
  (package
    (name "rust-tokio")
    (version "1.42.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zq7gvz3fcxqhvwccrii7wdfi30vz9zpgykzx3668ixphm4a2292"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-backtrace-0.3
                           rust-libc-0.2
                           rust-mio-1
                           rust-pin-project-lite-0.2
                           rust-socket2-0.5
                           rust-windows-sys-0.52)))
    (home-page "https://tokio.rs")
    (synopsis
     "An event-driven, non-blocking I/O platform for writing asynchronous I/O
backed applications.")
    (description
     "This package provides An event-driven, non-blocking I/O platform for writing asynchronous I/O backed
applications.")
    (license license:expat)))

(define rust-tree-sitter-0.24
  (package
    (name "rust-tree-sitter")
    (version "0.24.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "195whjfrz2cd4z6vrjxg2vzsz44w0r0i1rdicdh81dp1wxasyyxn"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-regex-1 rust-regex-syntax-0.8
                           rust-streaming-iterator-0.1
                           rust-tree-sitter-language-0.1)))
    (home-page "https://tree-sitter.github.io/tree-sitter")
    (synopsis "Rust bindings to the Tree-sitter parsing library")
    (description
     "This package provides Rust bindings to the Tree-sitter parsing library.")
    (license license:expat)))

(define rust-tree-sitter-bash-0.23
  (package
    (name "rust-tree-sitter-bash")
    (version "0.23.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-bash" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bm5chcqq5fvfb505h87d6ab5ny9l60lxy0x5ga3ghrsc944v6ij"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-language-0.1)))
    (home-page "https://github.com/tree-sitter/tree-sitter-bash")
    (synopsis "Bash grammar for tree-sitter")
    (description "This package provides Bash grammar for tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-c-0.23
  (package
    (name "rust-tree-sitter-c")
    (version "0.23.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-c" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11xmccp0i281csw6sw87a8dafm0wkmy1gwgwvy0chsrwikfzlmnv"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-language-0.1)))
    (home-page "https://github.com/tree-sitter/tree-sitter-c")
    (synopsis "C grammar for tree-sitter")
    (description "This package provides C grammar for tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-css-0.23
  (package
    (name "rust-tree-sitter-css")
    (version "0.23.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-css" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pd7rmn6cf9a0abynk54fh3m06hdqnxr3f6sznv2ccnvb8kmlhr5"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-language-0.1)))
    (home-page "https://github.com/tree-sitter/tree-sitter-css")
    (synopsis "CSS grammar for tree-sitter")
    (description "This package provides CSS grammar for tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-go-0.23
  (package
    (name "rust-tree-sitter-go")
    (version "0.23.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-go" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cc4w4p12inxpsn2hgpmbvw1nyf5cm0l9pa705hbw3928milfgdi"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-language-0.1)))
    (home-page "https://github.com/tree-sitter/tree-sitter-go")
    (synopsis "Go grammar for tree-sitter")
    (description "This package provides Go grammar for tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-highlight-0.24
  (package
    (name "rust-tree-sitter-highlight")
    (version "0.24.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-highlight" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i30msnakp8m7y39m64yshf16321yx43dnv69p8scw0dw5nqa3vz"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-lazy-static-1 rust-regex-1
                           rust-streaming-iterator-0.1 rust-thiserror-1
                           rust-tree-sitter-0.24)))
    (home-page "https://tree-sitter.github.io/tree-sitter")
    (synopsis "Library for performing syntax highlighting with Tree-sitter")
    (description
     "This package provides Library for performing syntax highlighting with Tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-html-0.23
  (package
    (name "rust-tree-sitter-html")
    (version "0.23.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-html" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vk3xyxnf3xv19qisyj2knd346dq4yjamawv6bg1w1ljbn7706r6"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-language-0.1)))
    (home-page "https://github.com/tree-sitter/tree-sitter-html")
    (synopsis "HTML grammar for tree-sitter")
    (description "This package provides HTML grammar for tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-json-0.24
  (package
    (name "rust-tree-sitter-json")
    (version "0.24.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-json" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wf4gsa5mcrcprg8wh647n76rwv4cx8kbky6zw605h06lk67lwjd"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-language-0.1)))
    (home-page "https://github.com/tree-sitter/tree-sitter-json")
    (synopsis "JSON grammar for tree-sitter")
    (description "This package provides JSON grammar for tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-language-0.1
  (package
    (name "rust-tree-sitter-language")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-language" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0016bhc2p0p1mqnbckd2jcwygik4yl53bxrzy6nywphfbbizzpg8"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://tree-sitter.github.io/tree-sitter")
    (synopsis
     "The tree-sitter Language type, used by the library and by language implementations")
    (description
     "This package provides The tree-sitter Language type, used by the library and by language
implementations.")
    (license license:expat)))

(define rust-tree-sitter-md-0.3
  (package
    (name "rust-tree-sitter-md")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-md" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c5h0j9cp5rq27cig1iqnsz8vc4xfap5a14nzj1hn0815b16iy8p"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-language-0.1)))
    (home-page "https://github.com/tree-sitter-grammars/tree-sitter-markdown")
    (synopsis "Markdown grammar for tree-sitter")
    (description "This package provides Markdown grammar for tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-python-0.23
  (package
    (name "rust-tree-sitter-python")
    (version "0.23.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-python" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qsjsyw1hydqyhvhys4phkvpgz4l6czjs3r57kainbizx9zdw5i4"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-language-0.1)))
    (home-page "https://github.com/tree-sitter/tree-sitter-python")
    (synopsis "Python grammar for tree-sitter")
    (description "This package provides Python grammar for tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-ruby-0.23
  (package
    (name "rust-tree-sitter-ruby")
    (version "0.23.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-ruby" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15cz4h1sfgf838r2pmf7vg9ahh0kwgkvvnjgbdbrrfzn9vm8815y"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-language-0.1)))
    (home-page "https://github.com/tree-sitter/tree-sitter-ruby")
    (synopsis "Ruby grammar for tree-sitter")
    (description "This package provides Ruby grammar for tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-rust-0.23
  (package
    (name "rust-tree-sitter-rust")
    (version "0.23.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-rust" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bx4a58fdyqcbj99qywl4g572rk4daa46xrcaqy6hgm6ki24vmm4"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-language-0.1)))
    (home-page "https://github.com/tree-sitter/tree-sitter-rust")
    (synopsis "Rust grammar for tree-sitter")
    (description "This package provides Rust grammar for tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-toml-ng-0.6
  (package
    (name "rust-tree-sitter-toml-ng")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-toml-ng" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mblvbhba1lg59jy6b2f7n41jfxlsxv3xw3kqw16rwdchg6j0pb9"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-0.24)))
    (home-page "https://github.com/tree-sitter-grammars/tree-sitter-toml")
    (synopsis "TOML grammar for tree-sitter")
    (description "This package provides TOML grammar for tree-sitter.")
    (license license:expat)))

(define rust-tree-sitter-typescript-0.23
  (package
    (name "rust-tree-sitter-typescript")
    (version "0.23.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tree-sitter-typescript" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zsyaxx3v1sd8gx2zkscwv6z1sq2nvccqpvd8k67ayllipnpcpvc"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cc-1 rust-tree-sitter-language-0.1)))
    (home-page "https://github.com/tree-sitter/tree-sitter-typescript")
    (synopsis "TypeScript and TSX grammars for tree-sitter")
    (description
     "This package provides @code{TypeScript} and TSX grammars for tree-sitter.")
    (license license:expat)))

(define rust-typenum-1
  (package
    (name "rust-typenum")
    (version "1.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typenum" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09dqxv69m9lj9zvv6xw5vxaqx15ps0vxyy5myg33i0kbqvq0pzs2"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/paholg/typenum")
    (synopsis
     "Typenum is a Rust library for type-level numbers evaluated at
    compile time. It currently supports bits, unsigned integers, and signed
    integers. It also provides a type-level array of type-level numbers, but its
    implementation is incomplete")
    (description
     "This package provides Typenum is a Rust library for type-level numbers evaluated at compile time.  It
currently supports bits, unsigned integers, and signed integers.  It also
provides a type-level array of type-level numbers, but its implementation is
incomplete.")
    (license (list license:expat license:asl2.0))))

(define rust-unicode-display-width-0.3
  (package
    (name "rust-unicode-display-width")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-display-width" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wqb96ir19flkf557ch6lzng0mf2hzz52lz6p0mslh31clxjfhws"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-unicode-segmentation-1)))
    (home-page "https://github.com/jameslanska/unicode-display-width/")
    (synopsis
     "Unicode 15.1.0 compliant utility for determining the number of columns required to display an arbitrary string")
    (description
     "This package provides Unicode 15.1.0 compliant utility for determining the number of columns required
to display an arbitrary string.")
    (license license:expat)))

(define rust-uuid-1
  (package
    (name "rust-uuid")
    (version "1.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uuid" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1a9dkv6jm4lz7ip9l9i1mcx7sh389xjsr03l6jgwqjpmkdvpm3s5"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/uuid-rs/uuid")
    (synopsis "library to generate and parse UUIDs.")
    (description
     "This package provides a library to generate and parse UUIDs.")
    (license (list license:asl2.0 license:expat))))

(define rust-uuid-simd-0.8
  (package
    (name "rust-uuid-simd")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uuid-simd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n0b40m988h52xj03dkcp4plrzvz56r7xha1d681jrjg5ci85c13"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-outref-0.5 rust-uuid-1 rust-vsimd-0.8)))
    (home-page "https://github.com/Nugine/simd")
    (synopsis "SIMD-accelerated UUID operations")
    (description "This package provides SIMD-accelerated UUID operations.")
    (license license:expat)))

(define rust-vsimd-0.8
  (package
    (name "rust-vsimd")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vsimd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r4wn54jxb12r0x023r5yxcrqk785akmbddqkcafz9fm03584c2w"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/Nugine/simd")
    (synopsis "SIMD utilities")
    (description "This package provides SIMD utilities.")
    (license license:expat)))

(define rust-wasm-bindgen-0.2
  (package
    (name "rust-wasm-bindgen")
    (version "0.2.100")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1x8ymcm6yi3i1rwj78myl1agqv2m86i648myy3lc97s9swlqkp0y"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cfg-if-1 rust-once-cell-1 rust-rustversion-1
                           rust-wasm-bindgen-macro-0.2)))
    (home-page "https://rustwasm.github.io/")
    (synopsis "Easy support for interacting between JS and Rust.")
    (description
     "This package provides Easy support for interacting between JS and Rust.")
    (license (list license:expat license:asl2.0))))

(define rust-wasm-bindgen-backend-0.2
  (package
    (name "rust-wasm-bindgen-backend")
    (version "0.2.100")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-backend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ihbf1hq3y81c4md9lyh6lcwbx6a5j0fw4fygd423g62lm8hc2ig"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-bumpalo-3
                           rust-log-0.4
                           rust-proc-macro2-1
                           rust-quote-1
                           rust-syn-2
                           rust-wasm-bindgen-shared-0.2)))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Backend code generation of the wasm-bindgen tool")
    (description
     "This package provides Backend code generation of the wasm-bindgen tool.")
    (license (list license:expat license:asl2.0))))

(define rust-wasm-bindgen-futures-0.4
  (package
    (name "rust-wasm-bindgen-futures")
    (version "0.4.50")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-futures" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0q8ymi6i9r3vxly551dhxcyai7nc491mspj0j1wbafxwq074fpam"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-cfg-if-1 rust-js-sys-0.3 rust-once-cell-1
                           rust-wasm-bindgen-0.2 rust-web-sys-0.3)))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Bridging the gap between Rust Futures and JavaScript Promises")
    (description
     "This package provides Bridging the gap between Rust Futures and @code{JavaScript} Promises.")
    (license (list license:expat license:asl2.0))))

(define rust-wasm-bindgen-macro-0.2
  (package
    (name "rust-wasm-bindgen-macro")
    (version "0.2.100")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01xls2dvzh38yj17jgrbiib1d3nyad7k2yw9s0mpklwys333zrkz"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-quote-1 rust-wasm-bindgen-macro-support-0.2)))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Definition of the `#[wasm_bindgen]` attribute, an internal dependency")
    (description
     "This package provides Definition of the `#[wasm_bindgen]` attribute, an internal dependency.")
    (license (list license:expat license:asl2.0))))

(define rust-wasm-bindgen-macro-support-0.2
  (package
    (name "rust-wasm-bindgen-macro-support")
    (version "0.2.100")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro-support" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1plm8dh20jg2id0320pbmrlsv6cazfv6b6907z19ys4z1jj7xs4a"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-proc-macro2-1 rust-quote-1 rust-syn-2
                           rust-wasm-bindgen-backend-0.2
                           rust-wasm-bindgen-shared-0.2)))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in the shared backend crate")
    (description
     "This package provides The part of the implementation of the `#[wasm_bindgen]` attribute that is not in
the shared backend crate.")
    (license (list license:expat license:asl2.0))))

(define rust-wasm-bindgen-shared-0.2
  (package
    (name "rust-wasm-bindgen-shared")
    (version "0.2.100")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gffxvqgbh9r9xl36gprkfnh3w9gl8wgia6xrin7v11sjcxxf18s"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-unicode-ident-1)))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.")
    (description
     "This package provides Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.")
    (license (list license:expat license:asl2.0))))

(define rust-web-sys-0.3
  (package
    (name "rust-web-sys")
    (version "0.3.77")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "web-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lnmc1ffbq34qw91nndklqqm75rasaffj2g4f8h1yvqqz4pdvdik"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-js-sys-0.3 rust-wasm-bindgen-0.2)))
    (home-page "https://rustwasm.github.io/wasm-bindgen/web-sys/index.html")
    (synopsis
     "Bindings for all Web APIs, a procedurally generated crate from WebIDL")
    (description
     "This package provides Bindings for all Web APIs, a procedurally generated crate from @code{WebIDL}.")
    (license (list license:expat license:asl2.0))))

(define rust-windows-registry-0.4
  (package
    (name "rust-windows-registry")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-registry" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18wbgr6z6765qdnasi8mmvxhvp82xd1zlvd6s7pp2l5lvn8av1j2"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-windows-result-0.3 rust-windows-strings-0.3
                           rust-windows-targets-0.53)))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Windows registry")
    (description "This package provides Windows registry.")
    (license (list license:expat license:asl2.0))))

(define rust-windows-strings-0.3
  (package
    (name "rust-windows-strings")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-strings" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06bkhkyclbfchcsv5bnhz77r290k20m15glj2xq60ra0bp64iyl7"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-windows-link-0.1)))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Windows string types")
    (description "This package provides Windows string types.")
    (license (list license:expat license:asl2.0))))

(define rust-windows-targets-0.53
  (package
    (name "rust-windows-targets")
    (version "0.53.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-targets" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12yakpjizhfpppz1i3zgcwxlbar8axrp9j87fmywpydarvlcgr5i"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-windows-aarch64-gnullvm-0.53
                           rust-windows-aarch64-msvc-0.53
                           rust-windows-i686-gnu-0.53
                           rust-windows-i686-gnullvm-0.53
                           rust-windows-i686-msvc-0.53
                           rust-windows-x86-64-gnu-0.53
                           rust-windows-x86-64-gnullvm-0.53
                           rust-windows-x86-64-msvc-0.53)))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import libs for Windows")
    (description "This package provides Import libs for Windows.")
    (license (list license:expat license:asl2.0))))

(define rust-windows-aarch64-gnullvm-0.53
  (package
    (name "rust-windows-aarch64-gnullvm")
    (version "0.53.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_aarch64_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r77pbpbcf8bq4yfwpz2hpq3vns8m0yacpvs2i5cn6fx1pwxbf46"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define rust-windows-aarch64-msvc-0.53
  (package
    (name "rust-windows-aarch64-msvc")
    (version "0.53.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_aarch64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v766yqw51pzxxwp203yqy39ijgjamp54hhdbsyqq6x1c8gilrf7"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define rust-windows-i686-gnu-0.53
  (package
    (name "rust-windows-i686-gnu")
    (version "0.53.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hvjc8nv95sx5vdd79fivn8bpm7i517dqyf4yvsqgwrmkmjngp61"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define rust-windows-i686-gnullvm-0.53
  (package
    (name "rust-windows-i686-gnullvm")
    (version "0.53.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04df1in2k91qyf1wzizvh560bvyzq20yf68k8xa66vdzxnywrrlw"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define rust-windows-i686-msvc-0.53
  (package
    (name "rust-windows-i686-msvc")
    (version "0.53.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pcvb25fkvqnp91z25qr5x61wyya12lx8p7nsa137cbb82ayw7sq"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define rust-windows-x86-64-gnu-0.53
  (package
    (name "rust-windows-x86-64-gnu")
    (version "0.53.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1flh84xkssn1n6m1riddipydcksp2pdl45vdf70jygx3ksnbam9f"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define rust-windows-x86-64-gnullvm-0.53
  (package
    (name "rust-windows-x86-64-gnullvm")
    (version "0.53.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mvc8119xpbi3q2m6mrjcdzl6afx4wffacp13v76g4jrs1fh6vha"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define rust-windows-x86-64-msvc-0.53
  (package
    (name "rust-windows-x86-64-msvc")
    (version "0.53.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11h4i28hq0zlnjcaqi2xdxr7ibnpa8djfggch9rki1zzb8qi8517"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define rust-winnow-0.6
  (package
    (name "rust-winnow")
    (version "0.6.26")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winnow" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0a4sjbbrkhbd0ba6dy0011hln1q3ry4iv6srqjjpi8hsmk9fv40y"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-memchr-2)))
    (home-page "https://github.com/winnow-rs/winnow")
    (synopsis "byte-oriented, zero-copy, parser combinators library")
    (description
     "This package provides a byte-oriented, zero-copy, parser combinators library.")
    (license license:expat)))

(define rust-zerofrom-0.1
  (package
    (name "rust-zerofrom")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerofrom" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19dyky67zkjichsb7ykhv0aqws3q0jfvzww76l66c19y6gh45k2h"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-zerofrom-derive-0.1)))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis "ZeroFrom trait for constructing")
    (description
     "This package provides @code{ZeroFrom} trait for constructing.")
    (license license:unicode)))

(define rust-zerofrom-derive-0.1
  (package
    (name "rust-zerofrom-derive")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerofrom-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00l5niw7c1b0lf1vhvajpjmcnbdp2vn96jg4nmkhq2db0rp5s7np"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:cargo-inputs (list rust-proc-macro2-1 rust-quote-1 rust-syn-2
                           rust-synstructure-0.13)))
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis "Custom derive for the zerofrom crate")
    (description "This package provides Custom derive for the zerofrom crate.")
    (license license:unicode)))

(define-public radicle
  (package
    (name "radicle")
    (version "1.2.0")
    (source
     #f)
    (build-system trivial-build-system)
    (inputs (list rust-radicle-cli-0.13 rust-radicle-node-0.11
                  rust-radicle-remote-helper-0.10))
    (arguments
     (list
      #:builder
      #~(begin
          (mkdir #$output)
          (mkdir (string-append #$output "/bin"))
          (symlink (string-append #$rust-radicle-cli-0.13 "/bin/rad")
                   (string-append #$output "/bin/rad"))
          (symlink (string-append #$rust-radicle-node-0.11 "/bin/rad")
                   (string-append #$output "/bin/radicle-node"))
          (symlink (string-append #$rust-radicle-remote-helper-0.10 "/bin/rad")
                   (string-append #$output "/bin/git-remote-rad")))))
    (home-page "https://radicle.xyz")
    (synopsis "Radicle Heartwood Protocol & Stack")
    (description
     "Heartwood is the third iteration of the Radicle Protocol, a powerful peer-to-peer code collaboration and publishing stack. The repository contains a full implementation of Heartwood, complete with a user-friendly command-line interface (rad) and network daemon (radicle-node).")
    (license (list license:expat license:asl2.0))))

