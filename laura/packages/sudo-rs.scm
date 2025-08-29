(define-module (laura packages sudo-rs)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (past-crates packages crates-io)
  #:use-module (gnu packages base)
  #:use-module (gnu packages linux))

(define rust-glob-0.3
  (package
    (name "rust-glob")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glob" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cm2w34b5w45fxr522h5b0fv1bxchfswcj560m3pnjbia7asvld8"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/rust-lang/glob")
    (synopsis
     "Support for matching file paths against Unix shell style patterns.")
    (description
     "This package provides Support for matching file paths against Unix shell style patterns.")
    (license (list license:expat license:asl2.0))))

(define rust-libc-0.2
  (package
    (name "rust-libc")
    (version "0.2.172")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ykz4skj7gac14znljm5clbnrhini38jkq3d60jggx3y5w2ayl6p"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/rust-lang/libc")
    (synopsis "Raw FFI bindings to platform libraries like libc.")
    (description
     "This package provides Raw FFI bindings to platform libraries like libc.")
    (license (list license:expat license:asl2.0))))

(define rust-log-0.4
  (package
    (name "rust-log")
    (version "0.4.27")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "log" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "150x589dqil307rv0rwj0jsgz5bjbwvl83gyl61jf873a7rjvp0k"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t))
    (home-page "https://github.com/rust-lang/log")
    (synopsis "lightweight logging facade for Rust")
    (description
     "This package provides a lightweight logging facade for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public sudo-rs
  (package
    (name "sudo-rs")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sudo-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pbrl7v1w8p9a0gd02v3dzmglnasbmfxj450fj82kcj02hkpw6jv"))))
    (build-system cargo-build-system)
    (inputs (list tzdata linux-pam))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'fix-env
            (lambda _
              (substitute* "build.rs"
                (("/usr/share/zoneinfo")
                 (string-append #$tzdata "/share/zoneinfo"))))))
      #:cargo-inputs (list rust-glob-0.3 rust-libc-0.2 rust-log-0.4
                           rust-pretty-assertions-1)))
    (home-page "https://github.com/trifectatechfoundation/sudo-rs")
    (synopsis "memory safe implementation of sudo and su.")
    (description
     "This package provides a memory safe implementation of sudo and su.")
    (license (list license:asl2.0 license:expat))))
