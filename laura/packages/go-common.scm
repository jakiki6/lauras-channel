(define-module (laura packages go-common)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix git-download)
  #:use-module (gnu packages)
  #:use-module (gnu packages golang)
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

(define-public go-github-spf13-afero
  (package
    (name "go-github-spf13-afero")
    (version "1.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/spf13/afero")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (patches (list (search-patch "laura/packages/patches/afero-nuke-google.patch")))
       (sha256
        (base32 "10c8q6bgib8vbj45z1c4gwl9ihn2wqhyxjaa2dy77mvb6rq7gdgs"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/spf13/afero"))
    (propagated-inputs `(("go-golang-org-x-tools" ,go-golang-org-x-tools)))
    (home-page "https://github.com/spf13/afero")
    (synopsis "A FileSystem Abstraction System for Go")
    (description
     "Afero is a filesystem framework providing a simple, uniform and universal API interacting with any filesystem, as an abstraction layer providing interfaces, types and methods. Afero has an exceptionally clean interface and simple design without needless constructors or initialization methods.")
    (license license:asl2.0)))
