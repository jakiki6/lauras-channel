(define-module (laura packages package-managers)
  #:use-module (guix)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix build-system meson)
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
  #:use-module (gnu packages linux))

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
                     (("get_option\\('sysconfdir'\\)") "get_option('datarootdir')")
                     (("meson.add_install_script\\('") "# meson.add_install_script('")))
        (sha256 (base32 "1iyl0q313bz7czirz21imljm8wngrwxyyh01cwfmx3c7vp282cvs"))))
    (build-system meson-build-system)
    (inputs (list python-3 libarchive openssl gpgme bash curl glibc))
    (native-inputs (list pkg-config))
    (arguments `(#:tests? #f
                 #:phases (modify-phases %standard-phases
                            (add-after 'unpack 'fix-tests
                              (lambda* (#:key inputs #:allow-other-keys)
                                (begin
                                  (use-modules (guix build utils))
                                  (substitute* (find-files ".")
                                    (("/bin/sh") (string-append (assoc-ref inputs "bash") "/bin/sh"))
                                    (("/sbin/ldconfig") (string-append (assoc-ref inputs "glibc") "/bin/sh")))))))))
    (home-page "https://gitlab.archlinux.org/pacman/pacman")
    (synopsis "Arch pacman")
    (description "Pacman - package management combining a simple binary package format with an easy-to-use build system.")
    (license license:gpl2)))
