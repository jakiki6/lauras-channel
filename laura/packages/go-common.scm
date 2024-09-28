(define-module (laura packages go-common)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix git-download)
  #:use-module (gnu packages)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-build))

(define-public go-github-com-charmbracelet-x-ansi
  (package
    (name "go-github-com-charmbracelet-x-ansi")
    (version "0.1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (string-append "ansi/v" version))))
       (file-name (git-file-name name version))
       (snippet '(begin
         (use-modules (guix build utils))
         (copy-recursively "ansi" ".")
         (delete-file-recursively "ansi")))
       (sha256
        (base32 "1j33791lkz4jzvm220dg82wr79gxncfflpqrlz34vhm7215fwbx0"))))
    (build-system go-build-system)
    (arguments
     `(#:import-path "github.com/charmbracelet/x/ansi"))
    (propagated-inputs (list go-github-com-rivo-uniseg))
    (home-page "https://pkg.go.dev/github.com/charmbracelet/x/ansi")
    (synopsis "ansi")
    (description "ANSI escape sequence parser and definitions")
    (license license:expat)))

(define-public go-github-com-carlmjohnson-requests
  (package
    (name "go-github-com-carlmjohnson-requests")
    (version "0.24.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/earthboundkid/requests")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0x95nr83k447fj0y5k23bxik368a72zvx7qqvzdn9lw9c57107zc"))))
    (build-system go-build-system)
    (arguments
     `(#:go ,go-1.22
       #:import-path "github.com/carlmjohnson/requests"
       #:phases (modify-phases %standard-phases
         (add-before 'build 'deref-symlinks
           (lambda* (#:key inputs #:allow-other-keys)
             (begin
               (delete-file-recursively "src/golang.org/x/net/publicsuffix/data")
               (copy-recursively (string-append (assoc-ref inputs "go-golang-org-x-net") "/src/golang.org/x/net/publicsuffix/data") "src/golang.org/x/net/publicsuffix/data")))))))
    (propagated-inputs (list go-golang-org-x-net))
    (home-page "https://github.com/carlmjohnson/requests")
    (synopsis "Requests")
    (description
     "Package requests is a convenience wrapper around net/http to make it faster and
easier to build requests and custom transports.")
    (license license:expat)))

(define-public go-github-com-cblgh-plain
  (package
    (name "go-github-com-cblgh-plain")
    (version "0.0.0-20240209132549-093bbe9d21f9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cblgh/plain")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03ljwy7s59h420pfapykfjg7k2s1k9q2g71xwbgc7xhasb9xadc0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/cblgh/plain"))
    (propagated-inputs (list go-golang-org-x-image
                             go-github-com-gomarkdown-markdown
                             go-github-com-golang-freetype))
    (home-page "https://github.com/cblgh/plain")
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public go-github-com-gomarkdown-markdown
  (package
    (name "go-github-com-gomarkdown-markdown")
    (version "0.0.0-20240730141124-034f12af3bf6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gomarkdown/markdown")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1msk57pkf27l41s1yzhfgm69mz12kxhidxchsb90nxb0krf5y06p"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/gomarkdown/markdown"))
    (home-page "https://github.com/gomarkdown/markdown")
    (synopsis "Markdown Parser and HTML Renderer for Go")
    (description
     "Package markdown implements markdown parser and HTML renderer.")
    (license license:bsd-2)))

(define-public go-github-com-komkom-toml
  (package
    (name "go-github-com-komkom-toml")
    (version "0.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/komkom/toml")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rl44jkfdwzjqp31aif6ywyli6pzl2999wp3807vzxz0yd6chwfw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/komkom/toml"))
    (propagated-inputs (list go-github-com-stretchr-testify
                             go-github-com-pkg-errors))
    (home-page "https://github.com/komkom/toml")
    (synopsis "TOML")
    (description "This package provides a TOML parser and JSON encoder.")
    (license license:expat)))

(define-public go-github-com-matthewhartstonge-argon2
  (package
    (name "go-github-com-matthewhartstonge-argon2")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/matthewhartstonge/argon2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "054yaxy2jjwiwzwfcnjxinw3cskvkby9gqznrg5y28rwc2mwargb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/matthewhartstonge/argon2"))
    (propagated-inputs (list go-golang-org-x-crypto))
    (home-page "https://github.com/matthewhartstonge/argon2")
    (synopsis "🔐 argon2")
    (description
     "Package argon2 implements the key derivation function Argon2.")
    (license license:asl2.0)))
