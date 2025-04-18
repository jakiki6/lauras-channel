(define-module (laura packages go-common)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system go)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix git-download)
  #:use-module (gnu packages)
  #:use-module (guix build utils)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-crypto)
  #:use-module (gnu packages prometheus)
  #:use-module (gnu packages golang-web)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages golang-maths)
  #:use-module (gnu packages golang-compression)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gl))

(define-public go-github-com-rogpeppe-clock
  (package
    (name "go-github-com-rogpeppe-clock")
    (version "0.0.0-20190514195947-2896927a307a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rogpeppe/clock")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14lniymm87b6ar8ikyacv0805vx6kk72fqnq95rpq6pfxys544cg"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/rogpeppe/clock"))
    (propagated-inputs (list go-github-com-frankban-quicktest))
    (home-page "https://github.com/rogpeppe/clock")
    (synopsis "clock")
    (description "An interface definition for a fully defined clock.")
    (license license:lgpl3)))

(define-public go-github-com-go-retry-retry
  (package
    (name "go-github-com-go-retry-retry")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-retry/retry")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wnif9y19zca1ijl4d5ss2zyrchvr7rf0421xkmyqf1wl1qqizch"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "gopkg.in/retry.v1"))
    (propagated-inputs (list go-github-com-rogpeppe-clock
                             go-github-com-frankban-quicktest))
    (home-page "https://github.com/go-retry/retry")
    (synopsis "retry")
    (description
     "Package retry provides a framework for retrying actions.  It does not itself
invoke the action to be retried, but is intended to be used in a retry loop.")
    (license license:lgpl3)))

(define-public go-github-com-go-errgo-errgo
  (package
    (name "go-github-com-go-errgo-errgo")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-errgo/errgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17g3lmbkg0c2axlak482cp0qqssf6vrfnhcfmrw5hzg1y13cbz9k"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "gopkg.in/errgo.v1"))
    (propagated-inputs (list go-github-com-frankban-quicktest))
    (home-page "https://github.com/go-errgo/errgo")
    (synopsis "errgo")
    (description
     "The errgo package provides a way to create and diagnose errors.  It is
compatible with the usual Go error idioms but adds a way to wrap errors so that
they record source location information while retaining a consistent way for
code to inspect errors to find out particular problems.")
    (license license:bsd-3)))

(define-public go-github-com-juju-go4
  (package
    (name "go-github-com-juju-go4")
    (version "0.0.0-20160222163258-40d72ab9641a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/juju/go4")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0sjxa2lnk244si525034fxks593fngnmdjq707g6g7x0c00q1ybg"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/juju/go4"
      #:import-path "github.com/juju/go4/lock"))
    (home-page "https://github.com/juju/go4")
    (synopsis "go4")
    (description
     "@@url{http://go4.org,go4.org} is a collection of packages for Go programmers.")
    (license license:asl2.0)))

(define-public go-github-com-acarl005-stripansi
  (package
    (name "go-github-com-acarl005-stripansi")
    (version "0.0.0-20180116102854-5a71ef0e047d")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/acarl005/stripansi")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02sxiishdixm791jqbkmhdcvc712l0fb8rqmibxzgc61h0qs6rs3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/acarl005/stripansi"))
    (home-page "https://github.com/acarl005/stripansi")
    (synopsis "Strip ANSI")
    (description "This Go package removes ANSI escape codes from strings.")
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
                        (delete-file-recursively
                         "src/golang.org/x/net/publicsuffix/data")
                        (copy-recursively (string-append (assoc-ref inputs
                                                          "go-golang-org-x-net")
                                           "/src/golang.org/x/net/publicsuffix/data")
                         "src/golang.org/x/net/publicsuffix/data")))))))
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
    (synopsis "")
    (description "")
    (license #f)))

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

(define-public go-github-com-foxboron-go-uefi-authenticode
  (package
    (name "go-github-com-foxboron-go-uefi-authenticode")
    (version "0.0.0-20240805124652-e2076f0e58ca")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/go-uefi")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a3aaddm2zk3p1r25shfy6z7xwj15zzx6ym3g5s1pxi0gzy90mgj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/foxboron/go-uefi"
      #:import-path "github.com/foxboron/go-uefi/authenticode"))
    (native-inputs (list openssl-3.0))
    (propagated-inputs (list go-github-com-spf13-afero
                             go-github-com-netflix-go-expect
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             go-golang-org-x-crypto
                             go-go-mozilla-org-pkcs7
                             go-github-com-pkg-errors))
    (home-page "https://github.com/foxboron/go-uefi")
    (synopsis "go-uefi")
    (description
     "This package provides a UEFI library written to interact with Linux efivars.
The goal is to provide a Go library to enable application authors to better
utilize secure boot and UEFI. This also includes unit-testing to ensure the
library is compatible with existing tools, and integration tests to ensure the
library is able of deal with future UEFI revisions.")
    (license license:expat)))

(define-public go-github-com-foxboron-go-uefi-efi
  (package
    (name "go-github-com-foxboron-go-uefi-efi")
    (version "0.0.0-20240805124652-e2076f0e58ca")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/go-uefi")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a3aaddm2zk3p1r25shfy6z7xwj15zzx6ym3g5s1pxi0gzy90mgj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/foxboron/go-uefi"
      #:import-path "github.com/foxboron/go-uefi/efi"))
    (propagated-inputs (list go-github-com-spf13-afero
                             go-github-com-netflix-go-expect
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             go-golang-org-x-crypto
                             go-go-mozilla-org-pkcs7
                             go-github-com-pkg-errors))
    (home-page "https://github.com/foxboron/go-uefi")
    (synopsis "go-uefi")
    (description
     "This package provides a UEFI library written to interact with Linux efivars.
The goal is to provide a Go library to enable application authors to better
utilize secure boot and UEFI. This also includes unit-testing to ensure the
library is compatible with existing tools, and integration tests to ensure the
library is able of deal with future UEFI revisions.")
    (license license:expat)))

(define-public go-github-com-foxboron-go-uefi-efivar
  (package
    (name "go-github-com-foxboron-go-uefi-efivar")
    (version "0.0.0-20240805124652-e2076f0e58ca")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/go-uefi")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a3aaddm2zk3p1r25shfy6z7xwj15zzx6ym3g5s1pxi0gzy90mgj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/foxboron/go-uefi"
      #:import-path "github.com/foxboron/go-uefi/efivar"))
    (propagated-inputs (list go-github-com-spf13-afero
                             go-github-com-netflix-go-expect
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             go-golang-org-x-crypto
                             go-go-mozilla-org-pkcs7
                             go-github-com-pkg-errors))
    (home-page "https://github.com/foxboron/go-uefi")
    (synopsis "go-uefi")
    (description
     "This package provides a UEFI library written to interact with Linux efivars.
The goal is to provide a Go library to enable application authors to better
utilize secure boot and UEFI. This also includes unit-testing to ensure the
library is compatible with existing tools, and integration tests to ensure the
library is able of deal with future UEFI revisions.")
    (license license:expat)))

(define-public go-github-com-foxboron-go-uefi-efivarfs
  (package
    (name "go-github-com-foxboron-go-uefi-efivarfs")
    (version "0.0.0-20240805124652-e2076f0e58ca")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/go-uefi")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a3aaddm2zk3p1r25shfy6z7xwj15zzx6ym3g5s1pxi0gzy90mgj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/foxboron/go-uefi"
      #:import-path "github.com/foxboron/go-uefi/efivarfs"))
    (propagated-inputs (list go-github-com-spf13-afero
                             go-github-com-netflix-go-expect
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             go-golang-org-x-crypto
                             go-go-mozilla-org-pkcs7
                             go-github-com-pkg-errors))
    (home-page "https://github.com/foxboron/go-uefi")
    (synopsis "go-uefi")
    (description
     "This package provides a UEFI library written to interact with Linux efivars.
The goal is to provide a Go library to enable application authors to better
utilize secure boot and UEFI. This also includes unit-testing to ensure the
library is compatible with existing tools, and integration tests to ensure the
library is able of deal with future UEFI revisions.")
    (license license:expat)))

(define-public go-github-com-foxboron-go-uefi-pkcs7
  (package
    (name "go-github-com-foxboron-go-uefi-pkcs7")
    (version "0.0.0-20240805124652-e2076f0e58ca")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/go-uefi")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a3aaddm2zk3p1r25shfy6z7xwj15zzx6ym3g5s1pxi0gzy90mgj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/foxboron/go-uefi"
      #:import-path "github.com/foxboron/go-uefi/pkcs7"))
    (native-inputs (list openssl-3.0))
    (propagated-inputs (list go-github-com-spf13-afero
                             go-github-com-netflix-go-expect
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             go-golang-org-x-crypto
                             go-go-mozilla-org-pkcs7
                             go-github-com-pkg-errors))
    (home-page "https://github.com/foxboron/go-uefi")
    (synopsis "go-uefi")
    (description
     "This package provides a UEFI library written to interact with Linux efivars.
The goal is to provide a Go library to enable application authors to better
utilize secure boot and UEFI. This also includes unit-testing to ensure the
library is compatible with existing tools, and integration tests to ensure the
library is able of deal with future UEFI revisions.")
    (license license:expat)))

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

(define-public go-github-com-netflix-go-expect
  (package
    (name "go-github-com-netflix-go-expect")
    (version "0.0.0-20220104043353-73e0943537d2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Netflix/go-expect")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zkvhnc4ii6ygvcsj54ng0kql26rnny7l3hy1w61g88mxjsww1b9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/Netflix/go-expect"))
    (propagated-inputs (list go-github-com-stretchr-testify
                             go-github-com-creack-pty))
    (home-page "https://github.com/Netflix/go-expect")
    (synopsis "go-expect")
    (description
     "Package expect provides an expect-like interface to automate control of
applications.  It is unlike expect in that it does not spawn or manage process
lifecycle.  This package only focuses on expecting output and sending input
through it's psuedoterminal.")
    (license license:asl2.0)))

(define-public go-github-com-spencercw-go-xz
  (package
    (name "go-github-com-spencercw-go-xz")
    (version "0.0.0-20181128201811-c82a2123b492")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/spencercw/go-xz")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0f5cm8bznjgwq51xqfxpwzp7k57hj7b0dcp0lq6kzik4qqzm1rhy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/spencercw/go-xz"))
    (home-page "https://github.com/spencercw/go-xz")
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public go-github-com-valyala-gozstd
  (package
    (name "go-github-com-valyala-gozstd")
    (version "1.21.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/valyala/gozstd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wskjbrb73j315vk615n9irhv0w993gf74b4h16kckrddkr3zp7k"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/valyala/gozstd"))
    (home-page "https://github.com/valyala/gozstd")
    (synopsis "gozstd - go wrapper for")
    (description "Package gozstd is Go wrapper for zstd.")
    (license license:expat)))

(define-public go-github-com-vbauerster-mpb-v5
  (package
    (name "go-github-com-vbauerster-mpb-v5")
    (version "5.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vbauerster/mpb")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0asijjny34mcs7afr4haxnkz5mjx75243i72h4h5a5sbvydfx43m"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/vbauerster/mpb/v5"))
    (propagated-inputs (list go-golang-org-x-sys
                             go-github-com-mattn-go-runewidth
                             go-github-com-acarl005-stripansi
                             go-github-com-vividcortex-ewma))
    (home-page "https://github.com/vbauerster/mpb")
    (synopsis "Multi Progress Bar")
    (description
     "Package mpb is a library for rendering progress bars in terminal applications.")
    (license license:unlicense)))

(define-public go-go-mozilla-org-pkcs7
  (package
    (name "go-go-mozilla-org-pkcs7")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mozilla-services/pkcs7")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0n9z6qv1rxhrdy2h7glidvma39d4fhly5r5lm445pj6ka6ss3xq9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "go.mozilla.org/pkcs7"))
    (home-page "https://go.mozilla.org/pkcs7")
    (synopsis "pkcs7")
    (description
     "Package pkcs7 implements parsing and generation of some PKCS#7 structures.")
    (license license:expat)))

(define-public go-github-com-inconshreveable-mousetrap
  (package
    (name "go-github-com-inconshreveable-mousetrap")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/inconshreveable/mousetrap")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14gjpvwgx3hmbd92jlwafgibiak2jqp25rq4q50cq89w8wgmhsax"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/inconshreveable/mousetrap"))
    (home-page "https://github.com/inconshreveable/mousetrap")
    (synopsis "mousetrap")
    (description "mousetrap is a tiny library that answers a single question.")
    (license license:asl2.0)))

(define-public go-github-com-cpuguy83-go-md2man-v2
  (package
    (name "go-github-com-cpuguy83-go-md2man-v2")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cpuguy83/go-md2man")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "051ljpzf1f5nh631lvn53ziclkzmx5lza8545mkk6wxdfnfdcx8f"))
       (modules '((guix build utils)))
       (snippet #~(delete-file-recursively "vendor"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/cpuguy83/go-md2man/v2"))
    (propagated-inputs (list go-github-com-russross-blackfriday-v2))
    (home-page "https://github.com/cpuguy83/go-md2man")
    (synopsis "go-md2man")
    (description "Converts markdown into roff (man pages).")
    (license license:expat)))

(define-public go-github-com-evanw-esbuild-internal
  (package
    (name "go-github-com-evanw-esbuild-internal")
    (version "0.24.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/evanw/esbuild")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hx8amlkrazk0pxkca216qq1wgssjrc6ja3q31lpilr5ycf4smjx"))))
    (build-system go-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (delete 'build)
          (delete 'check)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (begin
                (mkdir-p (string-append (assoc-ref outputs "out")
                          "/src/github.com/evanw/esbuild/internal"))
                (copy-recursively "src/internal"
                                  (string-append (assoc-ref outputs "out")
                                   "/src/github.com/evanw/esbuild/internal"))))))))
    (propagated-inputs (list go-golang-org-x-sys))
    (home-page "https://github.com/evanw/esbuild")
    (synopsis "Why?")
    (description
     "@@url{https://esbuild.github.io/,Website} |
@@url{https://esbuild.github.io/getting-started/,Getting started} |
@@url{https://esbuild.github.io/api/,Documentation} |
@@url{https://esbuild.github.io/plugins/,Plugins} |
@@url{https://esbuild.github.io/faq/,FAQ}.")
    (license license:expat)))

(define-public go-github-com-evanw-esbuild-api
  (package
    (inherit go-github-com-evanw-esbuild-internal)
    (name "go-github-com-evanw-esbuild-api")
    (arguments
     (list
      #:import-path "github.com/evanw/esbuild/pkg/api"
      #:unpack-path "github.com/evanw/esbuild"))
    (propagated-inputs (list go-golang-org-x-sys))))

(define-public go-github-com-titanous-json5
  (package
    (name "go-github-com-titanous-json5")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/titanous/json5")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "097a9fr95aw8kjkjykwx6db0khi358s2g3ap8kfgccycpzxfc0k9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/titanous/json5"))
    (propagated-inputs (list go-github-com-kylelemons-godebug))
    (home-page "https://github.com/titanous/json5")
    (synopsis "json5")
    (description "Package json5 implements decoding of JSON5 values.")
    (license license:expat)))

(define-public go-github-com-juju-persistent-cookiejar
  (package
    (name "go-github-com-juju-persistent-cookiejar")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/juju/persistent-cookiejar")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "059k97xilmlwqhr98f3mhw0zqswsfs1y6x9lv72lba62g66hcxpa"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/juju/persistent-cookiejar"
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'deref-symlinks
            (lambda* (#:key inputs #:allow-other-keys)
              (begin
                (delete-file-recursively
                 "src/golang.org/x/net/publicsuffix/data")
                (copy-recursively (string-append (assoc-ref inputs
                                                  "go-golang-org-x-net")
                                   "/src/golang.org/x/net/publicsuffix/data")
                                  "src/golang.org/x/net/publicsuffix/data")))))))
    (propagated-inputs (list go-github-com-juju-go4 go-golang-org-x-net
                             go-github-com-go-errgo-errgo
                             go-github-com-go-retry-retry))
    (home-page "https://github.com/juju/persistent-cookiejar")
    (synopsis "cookiejar")
    (description
     "Package cookiejar implements an in-memory
@@url{https://rfc-editor.org/rfc/rfc6265.html,RFC 6265}-compliant
http.@code{CookieJar}.")
    (license license:bsd-3)))

(define-public go-github-com-thediveo-success
  (package
    (name "go-github-com-thediveo-success")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/thediveo/success")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17xrga93znyynhabkjwcwckji37viiaflrv2cy6zrlp3gj7ajwn4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/thediveo/success"))
    (propagated-inputs (list go-github-com-onsi-gomega
                             go-github-com-onsi-ginkgo-v2))
    (home-page "https://github.com/thediveo/success")
    (synopsis #f)
    (description
     "Package success improves your testing feng shui tremendiously by shimming in
Gomega error detection whenever trying to be @code{Successful()}.")
    (license license:asl2.0)))

(define-public go-github-com-thediveo-enumflag
  (package
    (name "go-github-com-thediveo-enumflag")
    (version "2.0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/thediveo/enumflag")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zy8ciir6z9036866789x9i4cj45z9ffciyvjah4ifkfy2hbcxn8"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/thediveo/enumflag/v2"
      #:unpack-path "github.com/thediveo/enumflag/v2"))
    (propagated-inputs (list go-golang-org-x-exp
                             go-github-com-thediveo-success
                             go-github-com-spf13-cobra
                             go-github-com-sirupsen-logrus
                             go-github-com-onsi-gomega
                             go-github-com-onsi-ginkgo-v2))
    (home-page "https://github.com/thediveo/enumflag")
    (synopsis "CLI Enumeration Flags")
    (description
     "Package enumflag supplements the Golang CLI flag handling packages spf13/cobra
and spf13/pflag with enumeration flags.")
    (license license:asl2.0)))

(define-public go-github-com-d4l3k-go-bfloat16
  (package
    (name "go-github-com-d4l3k-go-bfloat16")
    (version "0.0.0-20211005043715-690c3bdd05f1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/d4l3k/go-bfloat16")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bshygdr5lcagznrh349r53whqhlg870j484zpsi3f7ilqv08rvy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/d4l3k/go-bfloat16"))
    (home-page "https://github.com/d4l3k/go-bfloat16")
    (synopsis "go-bfloat16")
    (description "BFloat16 conversion utilities for Go/Golang.")
    (license license:expat)))

(define-public go-github-com-emirpasic-gods-v2
  (package
    (name "go-github-com-emirpasic-gods-v2")
    (version "2.0.0-alpha")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emirpasic/gods")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qhjxv9rc1jjq57w84zz51lpx6baw3ywzj9ls491y1gkg5ycc765"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/emirpasic/gods"
      #:unpack-path "github.com/emirpasic/gods"
      #:phases
      #~(modify-phases %standard-phases
          (delete 'build)
          (delete 'check))))
    (home-page "https://github.com/emirpasic/gods")
    (synopsis "GoDS (Go Data Structures)")
    (description
     "Implementation of various data structures and algorithms in Go.")
    (license (list license:bsd-2 license:expat))))

(define-public go-github-com-nlpodyssey-gopickle
  (package
    (name "go-github-com-nlpodyssey-gopickle")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nlpodyssey/gopickle")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fadbyq63i55g3k91knm7m1pl3j0krxdgpajrl78h27sl3mhnhal"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/nlpodyssey/gopickle"
      #:phases
      #~(modify-phases %standard-phases
          (delete 'build)
          (delete 'check))

      ))
    (propagated-inputs (list go-golang-org-x-text))
    (home-page "https://github.com/nlpodyssey/gopickle")
    (synopsis "GoPickle")
    (description
     "@code{GoPickle} is a Go library for loading Python's data serialized with
@@code{pickle} and @code{PyTorch} module files.")
    (license license:bsd-2)))

(define-public go-github-com-apache-arrow-go-arrow
  (package
    (name "go-github-com-apache-arrow-go-arrow")
    (version "0.0.0-20211112161151-bc219186db40")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/apache/arrow")
             (commit (go-version->git-ref version
                                          #:subdir "go/arrow"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03nh7c0i3y9rkkzw428knalkrlpb8syr459i00mwp072ijn8v4hx"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/apache/arrow/go/arrow"
      #:unpack-path "github.com/apache/arrow"))
    (propagated-inputs (list go-google-golang-org-protobuf
                             go-google-golang-org-grpc
                             go-gonum-org-v1-gonum
                             go-golang-org-x-xerrors
                             go-golang-org-x-exp
                             go-github-com-stretchr-testify
                             go-github-com-pierrec-lz4-v4
                             go-github-com-klauspost-compress
                             go-github-com-google-flatbuffers
                             go-github-com-golang-protobuf))
    (home-page "https://github.com/apache/arrow")
    (synopsis #f)
    (description "Package arrow provides an implementation of Apache Arrow.")
    (license license:asl2.0)))

(define-public go-github-com-chewxy-hm
  (package
    (name "go-github-com-chewxy-hm")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chewxy/hm")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0f4qwg1q2lc9y64wrl9qxyimqnnandlqg78gn3yv4vsmyci025r7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chewxy/hm"))
    (propagated-inputs (list go-github-com-pkg-errors go-github-com-xtgo-set
                             go-github-com-stretchr-testify))
    (home-page "https://github.com/chewxy/hm")
    (synopsis "hm")
    (description
     "Package hm is a simple Hindley-Milner type inference system in Go.  It provides
the necessary data structures and functions for creating such a system.")
    (license license:expat)))

(define-public go-github-com-google-flatbuffers
  (package
    (name "go-github-com-google-flatbuffers")
    (version "25.2.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/flatbuffers")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wcpaj4k9dwccb752pl8p54pqwajr51sxjym32q2bpm9ny6ib45v"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/flatbuffers"
      #:phases
      #~(modify-phases %standard-phases
          (delete 'build)
          (delete 'check))))
    (home-page "https://github.com/google/flatbuffers")
    (synopsis "FlatBuffers")
    (description
     "@@strong{@code{FlatBuffers}} is a cross platform serialization library
architected for maximum memory efficiency.  It allows you to directly access
serialized data without parsing/unpacking it first, while still having great
forwards/backwards compatibility.")
    (license license:asl2.0)))

(define-public go-go4-org-unsafe-assume-no-moving-gc
  (package
    (name "go-go4-org-unsafe-assume-no-moving-gc")
    (version "0.0.0-20231121144256-b99613f794b6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go4org/unsafe-assume-no-moving-gc")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00ny3qha8k9nnx37ryvls2n5r7lw3bnldz6kwdmjxk8s19mxqim7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "go4.org/unsafe/assume-no-moving-gc"))
    (home-page "https://go4.org/unsafe/assume-no-moving-gc")
    (synopsis "go4.org/unsafe/assume-no-moving-gc")
    (description
     "Package go4.org/unsafe/assume-no-moving-gc exists so you can depend on it from
unsafe code that wants to declare that it assumes that the Go runtime does not
use a moving garbage collector.  Specifically, it asserts that the caller is
playing stupid games with the addresses of heap-allocated values.  It says
nothing about values that Go's escape analysis keeps on the stack.  Ensuring
things aren't stack-allocated is the caller's responsibility.")
    (license license:bsd-3)))

(define-public go-github-com-chewxy-math32
  (package
    (name "go-github-com-chewxy-math32")
    (version "1.11.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chewxy/math32")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0i7jssi872mv7h4rc4y0xa88a0hsr03mydqyrd6mrm8n7q8rfml9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chewxy/math32"))
    (home-page "https://github.com/chewxy/math32")
    (synopsis "math32")
    (description
     "Package math32 provides basic constants and mathematical functions for float32
types.")
    (license license:bsd-2)))

(define-public go-gorgonia-org-vecf32
  (package
    (name "go-gorgonia-org-vecf32")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gorgonia/vecf32")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jggbf98fbbip7znx5m4n2lqqsnw5kqycj3gcbs62ypirr1pp0m9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "gorgonia.org/vecf32"))
    (propagated-inputs (list go-github-com-stretchr-testify
                             go-github-com-pmezard-go-difflib
                             go-github-com-davecgh-go-spew
                             go-github-com-chewxy-math32))
    (home-page "https://gorgonia.org/vecf32")
    (synopsis "vecf32")
    (description
     "Package vecf32 provides common functions and methods for slices of float32.")
    (license license:expat)))

(define-public go-gorgonia-org-vecf64
  (package
    (name "go-gorgonia-org-vecf64")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gorgonia/vecf64")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a8v65cy6gyh7ww2g8q4p6dmjhcd6k7lm7z8ly4vmi4k0vq1w187"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "gorgonia.org/vecf64"))
    (propagated-inputs (list go-github-com-stretchr-testify
                             go-github-com-pmezard-go-difflib
                             go-github-com-davecgh-go-spew))
    (home-page "https://gorgonia.org/vecf64")
    (synopsis "vecf64")
    (description
     "Package vecf64 provides common functions and methods for slices of float64.")
    (license license:expat)))

(define-public go-github-com-gin-contrib-cors
  (package
    (name "go-github-com-gin-contrib-cors")
    (version "1.7.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gin-contrib/cors")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hh1vl0xqadpnkrs0ji8g9d4m4gdqgkfm1jjry66gzk70zkrdybd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/gin-contrib/cors"))
    (propagated-inputs (list go-github-com-stretchr-testify
                             go-github-com-gin-gonic-gin))
    (home-page "https://github.com/gin-contrib/cors")
    (synopsis "CORS gin's middleware")
    (description "Gin middleware/handler to enable CORS support.")
    (license license:expat)))

; from https://git.sr.ht/~efraim/my-guix
; licensed under the GPL 3
(define-public go-google-golang-org-grpc
  (package
    (name "go-google-golang-org-grpc")
    (version "1.43.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/grpc/grpc-go")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10f9363yir4l7rnj5z897qk79si7913vsyzy4nw5xhxjhxsppji8"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "google.golang.org/grpc"
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (delete 'check))))
    (propagated-inputs (list go-google-golang-org-protobuf
                             go-google-golang-org-genproto
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             ;; go-golang-org-x-oauth2
                             go-golang-org-x-net
                             ;; go-github-com-google-uuid
                             ;; go-github-com-google-go-cmp
                             go-github-com-golang-protobuf
                             go-github-com-golang-glog
                             ;; go-github-com-envoyproxy-go-control-plane
                             ;; go-github-com-cncf-xds-go
                             ;; go-github-com-cncf-udpa-go
                             go-github-com-cespare-xxhash))
    (home-page "https://google.golang.org/grpc")
    (synopsis "gRPC-Go")
    (description "Package grpc implements an RPC system called gRPC.")
    (license license:asl2.0)))

; see last comment
(define-public go-google-golang-org-genproto
  (package
    (name "go-google-golang-org-genproto")
    (version "0.0.0-20211223182754-3ac035c7e7cb")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/googleapis/go-genproto")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fk3n2f6x3pyrfx2nn5ws88sp16yr42awc1n5dsfkzx47w9grczi"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "google.golang.org/genproto"
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (delete 'check))))
    (propagated-inputs (list ;go-google-golang-org-protobuf
                             ;; go-google-golang-org-grpc
                             ;; go-golang-org-x-text
                             ;; go-golang-org-x-sys
                             ;; go-golang-org-x-net
                             ;; go-github-com-golang-protobuf
                             ))
    (home-page "https://google.golang.org/genproto")
    (synopsis "Go generated proto packages")
    (description
     "This repository contains the generated Go packages for common protocol buffer
types, and the generated @url{http://grpc.io,gRPC} code necessary for
interacting with Google's gRPC APIs.")
    (license license:asl2.0)))

(define-public go-github-com-xtgo-set
  (package
    (name "go-github-com-xtgo-set")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xtgo/set")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "148jb5f87lf7090jg8340f24r29818krydajkm75vpzylaw6yd8w"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/xtgo/set"))
    (home-page "https://github.com/xtgo/set")
    (synopsis "set")
    (description
     "Package set implements type-safe, non-allocating algorithms that operate on
ordered sets.")
    (license license:bsd-2)))

(define-public go-gorgonia-org-tensor
  (package
    (name "go-gorgonia-org-tensor")
    (version "0.9.24")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gorgonia/tensor")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13dk1gmplik5z8x27khgk5aja480znq4ryx3j0csp2j9vnwccpl3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "gorgonia.org/tensor"))
    (propagated-inputs (list go-gorgonia-org-vecf64
                             go-gorgonia-org-vecf32
                             go-gonum-org-v1-gonum
                             go-go4-org-unsafe-assume-no-moving-gc
                             go-github-com-stretchr-testify
                             go-github-com-pkg-errors
                             go-github-com-google-flatbuffers
                             go-github-com-golang-protobuf
                             go-github-com-gogo-protobuf
                             go-github-com-chewxy-math32
                             go-github-com-chewxy-hm
                             go-github-com-apache-arrow-go-arrow))
    (home-page "https://gorgonia.org/tensor")
    (synopsis "Package")
    (description
     "Package tensor is a package that provides efficient, generic n-dimensional
arrays in Go.  Also in this package are functions and methods that are used
commonly in arithmetic, comparison and linear algebra operations.")
    (license license:asl2.0)))

(define-public go-github-com-dlclark-regexp2-v1.11.5
  (package
    (name "go-github-com-dlclark-regexp2")
    (version "1.11.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dlclark/regexp2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0i5c7ak8r4wwlyrx5f1mdipqk6p6ms1jgclb7hlb4qgy83c7xplc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/dlclark/regexp2"))
    (home-page "https://github.com/dlclark/regexp2/")
    (synopsis "Full featured regular expressions for Go")
    (description "Regexp2 is a feature-rich RegExp engine for Go.")
    (license license:expat)))

(define-public go-github-com-zachomedia-go-bdf
  (package
    (name "go-github-com-zachomedia-go-bdf")
    (version "0.0.0-20220611021443-a3af701111be")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zachomedia/go-bdf")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1x7sn7nd5nsh01y2whfdc0gihkmdzhlmgz495w6z0w08wiqizbsb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/zachomedia/go-bdf"))
    (propagated-inputs (list go-golang-org-x-text go-golang-org-x-image))
    (home-page "https://github.com/zachomedia/go-bdf")
    (synopsis "Glyph Bitmap Distribution Format (BDF) Fonts for Go")
    (description "This package provides the ability to use BDF fonts in Go.")
    (license license:expat)))

(define-public go-github-com-dchest-jsmin
  (package
    (name "go-github-com-dchest-jsmin")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dchest/jsmin")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0237z3wr6xkl1qi3j48jxd9n9zxy9iwch2bazwis71bib0ih5rql"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/dchest/jsmin"))
    (home-page "https://github.com/dchest/jsmin")
    (synopsis #f)
    (description
     "Package jsmin implements @code{JavaScript} minifier.  It's a direct port of
Doulas Crockford's JSMin.")
    (license license:expat)))

(define-public go-github-com-akavel-rsrc
  (package
    (name "go-github-com-akavel-rsrc")
    (version "0.10.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/akavel/rsrc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1frdxqdnk923p4245lk0wwqrxsdy8aj2qxl3m0zfgnh02vfz3hs2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/akavel/rsrc"))
    (home-page "https://github.com/akavel/rsrc")
    (synopsis #f)
    (description #f)
    (license license:expat)))

(define-public go-github-com-josephspurrier-goversioninfo
  (package
    (name "go-github-com-josephspurrier-goversioninfo")
    (version "1.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/josephspurrier/goversioninfo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07plmi5gy7bl5n5cnymvrirhq2gv3rx6p8ry3kvcdlh7i0x0baj8"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/josephspurrier/goversioninfo"))
    (propagated-inputs (list go-github-com-stretchr-testify
                             go-github-com-akavel-rsrc))
    (home-page "https://github.com/josephspurrier/goversioninfo")
    (synopsis "GoVersionInfo")
    (description
     "Package goversioninfo creates a syso file which contains Microsoft Version
Information and an optional icon.")
    (license license:expat)))

(define-public go-github-com-randall77-makefat
  (package
    (name "go-github-com-randall77-makefat")
    (version "0.0.0-20210315173500-7ddd0e42c844")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/randall77/makefat")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0x8pwhs5srg1dwdi7dj6mi126rx6w371bxw6id228f28ndn062m2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/randall77/makefat"))
    (home-page "https://github.com/randall77/makefat")
    (synopsis "makefat")
    (description
     "This package provides a tool for making fat OSX binaries (a portable lipo).")
    (license license:unlicense)))

(define-public go-github-com-ncruces-zenity
  (package
    (name "go-github-com-ncruces-zenity")
    (version "0.10.14")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ncruces/zenity")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pyhr75f1scmgw2ffh3q35amaafwrqqlh5c8qyql6vwh8bmh02qn"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/ncruces/zenity"))
    (propagated-inputs (list go-golang-org-x-sys
                             go-golang-org-x-image
                             go-go-uber-org-goleak
                             go-github-com-randall77-makefat
                             go-github-com-ncruces-go-strftime
                             go-github-com-josephspurrier-goversioninfo
                             go-github-com-dchest-jsmin))
    (home-page "https://github.com/ncruces/zenity")
    (synopsis "Zenity dialogs for Golang, Windows and macOS")
    (description
     "Package zenity provides cross-platform access to simple dialogs that interact
graphically with the user.")
    (license license:expat)))

(define-public go-github-com-mitchellh-hashstructure-v2
  (package
    (name "go-github-com-mitchellh-hashstructure")
    (version "2.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mitchellh/hashstructure")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yyr1igvyv7dzjxs9hbwk7qhshwxys0hq59sy2g2a46hjgi311iv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/mitchellh/hashstructure"
      #:unpack-path "github.com/mitchellh/hashstructure"))
    (home-page "https://github.com/mitchellh/hashstructure")
    (synopsis "hashstructure")
    (description
     "hashstructure is a Go library for creating a unique hash value for arbitrary
values in Go.")
    (license license:expat)))

(define-public go-github-com-jeandeaual-go-locale
  (package
    (name "go-github-com-jeandeaual-go-locale")
    (version "0.0.0-20241217141322-fcc2cadd6f08")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jeandeaual/go-locale")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "162qsvf8ryj1wnk8r34vrjpv2qw07jr25rqnww67nj3ykkx0wp5n"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/jeandeaual/go-locale"))
    (propagated-inputs (list go-golang-org-x-sys
                             go-github-com-stretchr-testify))
    (home-page "https://github.com/jeandeaual/go-locale")
    (synopsis "go-locale")
    (description
     "Go library used to retrieve the current locale(s) of the operating system.")
    (license license:expat)))

(define-public go-github-com-ebitengine-gomobile
  (package
    (name "go-github-com-ebitengine-gomobile")
    (version "0.0.0-20250329061421-6d0a8e981e4c")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ebitengine/gomobile")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bd38rdn76mkadad1pqcrn7lmk2rfk12c6kdglnpq8bf6ak27yji"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'build))
      #:import-path "github.com/ebitengine/gomobile"))
    (propagated-inputs (list go-golang-org-x-tools go-golang-org-x-sync
                             go-golang-org-x-mod go-golang-org-x-image))
    (home-page "https://github.com/ebitengine/gomobile")
    (synopsis "Go support for Mobile devices")
    (description
     "The Go mobile repository holds packages and build tools for using Go on mobile
platforms.")
    (license license:bsd-3)))

(define-public go-github-com-ebitengine-hideconsole
  (package
    (name "go-github-com-ebitengine-hideconsole")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ebitengine/hideconsole")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "06q5dgzfyarc3wr8ji3v2w6miv8mgag8537in1n35ccb5b69gqv1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/ebitengine/hideconsole"))
    (propagated-inputs (list go-golang-org-x-sys))
    (home-page "https://github.com/ebitengine/hideconsole")
    (synopsis "HideConsole")
    (description
     "Package hideconsole is a utility package to hide a console automatically even
without `-ldflags \"-Hwindowsgui\"` on Windows.")
    (license license:asl2.0)))

(define-public go-github-com-ebitengine-oto-v3
  (package
    (name "go-github-com-ebitengine-oto")
    (version "3.3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ebitengine/oto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fypv4hsvxx7cmvpd5r0lr75d719y7cakmcg9cv0a4dka955nzqw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'build))
      #:import-path "github.com/ebitengine/oto/v3"
      #:unpack-path "github.com/ebitengine/oto/v3"))
    (propagated-inputs (list go-golang-org-x-sys
                             go-github-com-ebitengine-purego))
    (home-page "https://github.com/ebitengine/oto")
    (synopsis "Oto (v3)")
    (description "This package provides a low-level library to play sound.")
    (license license:asl2.0)))

(define-public go-github-com-gen2brain-mpeg
  (package
    (name "go-github-com-gen2brain-mpeg")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gen2brain/mpeg")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16nhzb3rdvqn9bz81y8gs985900lpmh4m17xhhfg7wd3k5dhkpcm"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/gen2brain/mpeg"))
    (home-page "https://github.com/gen2brain/mpeg")
    (synopsis "mpeg")
    (description
     "Package mpeg implements MPEG-1 Video decoder, MP2 Audio decoder and MPEG-PS
demuxer.")
    (license license:expat)))

(define-public go-github-com-go-text-typesetting-utils
  (package
    (name "go-github-com-go-text-typesetting-utils")
    (version "0.0.0-20250317161857-4bc07585f84e")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-text/typesetting-utils")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1iz3ns7hky0ihlwq08j4m58j4w094f8m3cxfd9l1k3dwjk7cgv3m"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'build))
      #:import-path "github.com/go-text/typesetting-utils"))
    (propagated-inputs (list go-golang-org-x-tools go-golang-org-x-text
                             go-golang-org-x-net))
    (home-page "https://github.com/go-text/typesetting-utils")
    (synopsis "Developpement resources for go-text/typesetting")
    (description
     "This module provides resources used when developping
@@url{https://github.com/go-text/typesetting,go-text/typesetting}, such as :.")
    (license (list license:unlicense license:bsd-3))))

(define-public go-github-com-go-text-typesetting
  (package
    (name "go-github-com-go-text-typesetting")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-text/typesetting")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vpqy67gv84rvn1ps0s0j7bs5dz5rsdy277fyvybrn8x55w213b6"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'build))
      #:import-path "github.com/go-text/typesetting"))
    (propagated-inputs (list go-golang-org-x-text go-golang-org-x-image
                             go-github-com-go-text-typesetting-utils))
    (home-page "https://github.com/go-text/typesetting")
    (synopsis "typesetting")
    (description
     "This library provides typesetting capabilities in pure Go.  It is appropriate
for use in GUI applications, and is shared by multiple Go UI toolkits including
@@url{https://fyne.io,Fyne}, @@url{https://gioui.org,Gio}, and
@@url{https://ebitengine.org,Ebitengine}.")
    (license (list license:unlicense license:bsd-3))))

(define-public go-github-com-ebitengine-purego
  (package
    (name "go-github-com-ebitengine-purego")
    (version "0.8.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ebitengine/purego")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ky3k7q4qkn2njikvxlrw0f0glqk7kjif1jbskd42ipyallkqx3z"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/ebitengine/purego"))
    (home-page "https://github.com/ebitengine/purego")
    (synopsis "purego")
    (description
     "This package provides a library for calling C functions from Go without Cgo.")
    (license license:asl2.0)))

(define-public go-github-com-hajimehoshi-oto-v2
  (package
    (name "go-github-com-hajimehoshi-oto")
    (version "2.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ebitengine/oto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i325fcv2v9l0yi9grjw2pxx9jaqacqqhxqnpfz5057p9252wqbh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'build))
      #:import-path "github.com/hajimehoshi/oto/v2"
      #:unpack-path "github.com/hajimehoshi/oto"))
    (propagated-inputs (list go-golang-org-x-sys
                             go-github-com-ebitengine-purego))
    (home-page "https://github.com/hajimehoshi/oto")
    (synopsis "Oto (v2)")
    (description "This package provides a low-level library to play sound.")
    (license license:asl2.0)))

(define-public go-github-com-hajimehoshi-go-mp3
  (package
    (name "go-github-com-hajimehoshi-go-mp3")
    (version "0.3.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hajimehoshi/go-mp3")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0w1yk8lxyz6y7b9a6bx79rs3q22fsfhi430zfirivlhjw8z79ac7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/hajimehoshi/go-mp3"))
    (propagated-inputs (list go-github-com-hajimehoshi-oto-v2))
    (home-page "https://github.com/hajimehoshi/go-mp3")
    (synopsis "go-mp3")
    (description "An MP3 decoder in pure Go based on
@@url{https://github.com/technosaurus/PDMP3,PDMP3}.")
    (license license:asl2.0)))

(define-public go-github-com-jakecoffman-cp
  (package
    (name "go-github-com-jakecoffman-cp")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jakecoffman/cp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09l7790y3sc0pvnkf6g57ldhwz8ais3p8d9f5mv4spxkzk1h9rhk"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/jakecoffman/cp"))
    (home-page "https://github.com/jakecoffman/cp")
    (synopsis "cp")
    (description
     "@@url{https://github.com/slembcke/Chipmunk2D,Chipmunk2D} ported to Go.")
    (license license:expat)))

(define-public go-github-com-jezek-xgb
  (package
    (name "go-github-com-jezek-xgb")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jezek/xgb")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dhhrybxs1sapxz19hb39igackv69j55bzpx75afbkcx3mdwfdif"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/jezek/xgb"))
    (home-page "https://github.com/jezek/xgb")
    (synopsis #f)
    (description
     "Package XGB provides the X Go Binding, which is a low-level API to communicate
with the core X protocol and many of the X extensions.")
    (license license:bsd-3)))

(define-public go-github-com-jfreymuth-vorbis
  (package
    (name "go-github-com-jfreymuth-vorbis")
    (version "1.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jfreymuth/vorbis")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1kkskfbfrrzmxbfiajmxv9j7kg3j1f93bl4lqbn3k93ryvybwm41"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/jfreymuth/vorbis"))
    (home-page "https://github.com/jfreymuth/vorbis")
    (synopsis "vorbis")
    (description "Package vorbis implements a vorbis decoder.")
    (license license:expat)))

(define-public go-github-com-jfreymuth-oggvorbis
  (package
    (name "go-github-com-jfreymuth-oggvorbis")
    (version "1.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jfreymuth/oggvorbis")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0p8rbrgz6l1sqb13hwds7k3ngmaknfg6ay47yi9qdpzblc4m764f"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/jfreymuth/oggvorbis"))
    (propagated-inputs (list go-github-com-jfreymuth-vorbis))
    (home-page "https://github.com/jfreymuth/oggvorbis")
    (synopsis "oggvorbis")
    (description "Package oggvorbis decodes audio from ogg/vorbis files.")
    (license license:expat)))

(define-public go-github-com-kisielk-errcheck
  (package
    (name "go-github-com-kisielk-errcheck")
    (version "1.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kisielk/errcheck")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gzqzk6nyl352w5lxr62rbxbx9pkfhasx249w3jr3708pqjah4qf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/kisielk/errcheck"))
    (propagated-inputs (list go-golang-org-x-tools))
    (home-page "https://github.com/kisielk/errcheck")
    (synopsis "errcheck")
    (description
     "errcheck is a program for checking for unchecked errors in Go code.")
    (license license:expat)))

(define-public go-github-com-hajimehoshi-ebiten-v2
  (package
    (name "go-github-com-hajimehoshi-ebiten")
    (version "2.8.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hajimehoshi/ebiten")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01fykwi1zmxyljwqvvmicmxz2iq0y52rw0cd29v9xbf2xqqg859h"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/hajimehoshi/ebiten"
      #:unpack-path "github.com/hajimehoshi/ebiten"))
    (inputs (list libx11
                  libxrandr
                  libxcursor
                  libxinerama
                  libxi
                  mesa))
    (propagated-inputs (list go-golang-org-x-tools
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             go-golang-org-x-sync
                             go-golang-org-x-image
                             go-github-com-kisielk-errcheck
                             go-github-com-jfreymuth-oggvorbis
                             go-github-com-jezek-xgb
                             go-github-com-jakecoffman-cp
                             go-github-com-hajimehoshi-go-mp3
                             go-github-com-hajimehoshi-bitmapfont-v3
                             go-github-com-go-text-typesetting
                             go-github-com-gen2brain-mpeg
                             go-github-com-ebitengine-purego
                             go-github-com-ebitengine-oto-v3
                             go-github-com-ebitengine-hideconsole
                             go-github-com-ebitengine-gomobile))
    (home-page "https://github.com/hajimehoshi/ebiten")
    (synopsis "Ebitengine (v2)")
    (description
     "Package ebiten provides graphics and input API to develop a 2D game.")
    (license license:asl2.0)))

(define-public go-github-com-hajimehoshi-bitmapfont-v3
  (package
    (name "go-github-com-hajimehoshi-bitmapfont")
    (version "3.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hajimehoshi/bitmapfont")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dfp90w555cqkd502ah8b6baib4ywwi2j45qi3pf8r9nwqnnkrfr"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (begin
                (mkdir-p (string-append #$output
                          "/src/github.com/hajimehoshi/bitmapfont"))
                (copy-recursively "."
                                  (string-append #$output
                                   "/src/github.com/hajimehoshi/bitmapfont"))))))))
    (propagated-inputs (list go-golang-org-x-text go-golang-org-x-image
                             go-github-com-pkg-browser
                             go-github-com-pierrec-lz4-v4))
    (home-page "https://github.com/hajimehoshi/bitmapfont")
    (synopsis "bitmapfont (v3)")
    (description
     "Package bitmapfont provides font.Face values with bitmap glyphs.")
    (license license:asl2.0)))

(define-public go-github-com-fardog-tmx
  (package
    (name "go-github-com-fardog-tmx")
    (version "0.0.0-20210504210836-02c45f261672")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fardog/tmx")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fby5jsv2ps99zhaszklxr5sy57yhsapmrhd1np735v83252xcga"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/fardog/tmx"))
    (home-page "https://github.com/fardog/tmx")
    (synopsis "tmx")
    (description
     "Package tmx implements a parser for the TMX file format used in the Tiled Map
Editor.")
    (license license:expat)))
