(define-module (laura packages package-managers)
  #:use-module (guix)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build utils)
  #:use-module (gnu packages python)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages base)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-crypto)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages man)
  #:use-module (gnu packages lua)
  #:use-module (laura packages go-common))

(define-public pacman
  (package
    (name "pacman")
    (version "7.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.archlinux.org/pacman/pacman")
             (commit "v7.0.0")))
       (file-name (git-file-name name version))
       (modules '((guix build utils)))
       (snippet #~(substitute* "meson.build"
                    (("get_option\\('sysconfdir'\\)")
                     "get_option('datarootdir')")
                    (("meson.add_install_script\\('")
                     "# meson.add_install_script('")))
       (sha256
        (base32 "1iyl0q313bz7czirz21imljm8wngrwxyyh01cwfmx3c7vp282cvs"))))
    (build-system meson-build-system)
    (inputs (list python-3
                  libarchive
                  openssl
                  gpgme
                  bash
                  curl
                  glibc))
    (native-inputs (list pkg-config))
    (arguments
     `(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (add-after 'unpack 'fix-tests
                    (lambda* (#:key inputs #:allow-other-keys)
                      (begin
                        (use-modules (guix build utils))
                        (substitute* (find-files ".")
                          (("/bin/sh")
                           (string-append (assoc-ref inputs "bash") "/bin/sh"))
                          (("/sbin/ldconfig")
                           (string-append (assoc-ref inputs "glibc") "/bin/sh")))))))))
    (home-page "https://gitlab.archlinux.org/pacman/pacman")
    (synopsis "Arch pacman")
    (description
     "Pacman - package management combining a simple binary package format with an easy-to-use build system.")
    (license license:gpl2)))

(define-public ipatool
  (package
    (name "ipatool")
    (version "2.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/majd/ipatool")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05px5rlvn3agz8gfccc3x4mcmp1i33jc1gbhrgk36jxw7jnmip1m"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/majd/ipatool"
      #:unpack-path "github.com/majd/ipatool"
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
    (propagated-inputs (list go-howett-net-plist
                             go-golang-org-x-term
                             go-golang-org-x-net
                             go-go-uber-org-mock
                             go-github-com-thediveo-enumflag
                             go-github-com-spf13-cobra
                             go-github-com-schollz-progressbar-v3
                             go-github-com-rs-zerolog
                             go-github-com-onsi-gomega
                             go-github-com-onsi-ginkgo-v2
                             go-github-com-juju-persistent-cookiejar
                             go-github-com-avast-retry-go
                             go-github-com-99designs-keyring))
    (home-page "https://github.com/majd/ipatool")
    (synopsis "IPATool")
    (description
     "@@code{ipatool} is a command line tool that allows you to search for @code{iOS}
apps on the @@url{https://apps.apple.com,App Store} and download a copy of the
app package, known as an file.")
    (license license:expat)))


(define-public apk-tools
  (package
    (name "apk-tools")
    (version "3.0.0_rc4")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://gitlab.alpinelinux.org/alpine/apk-tools")
              (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256 (base32 "1533hfmzdkh7v1hawmfd8b5mnl8ssxfqz4vn0kg2agrldbgh7i58"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f #:configure-flags #~(list "-Dhelp=enabled" "-Dcompressed-help=false" "-Dlua_version=")))
    (native-inputs (list pkg-config lua))
    (inputs (list zlib (list zstd "lib") openssl python scdoc))
    (home-page "https://gitlab.alpinelinux.org/alpine/apk-tools")
    (synopsis "Alpine package manager")
    (description "Alpine Package Keeper (apk) is a package manager originally built for Alpine Linux,
but now used by several other distributions as well.")
    (license license:gpl2+)))
