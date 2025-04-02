(define-module (laura packages bump)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix gexp)
  #:use-module (guix platform)
  #:use-module (gnu packages)
  #:use-module (gnu packages squirrel)
  #:use-module (gnu packages fpga)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages python)
  #:use-module (gnu packages man)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages image)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages video)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages music)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages mingw)
  #:use-module (gnu packages efi)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages base)
  #:use-module (gnu packages check))

(define-public squirrel-3.2
  (package
    (inherit squirrel)
    (version "3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/squirrel/squirrel3/"
                           "squirrel "
                           version
                           " stable/squirrel_"
                           (string-join (string-split version #\.) "_")
                           "_stable.tar.gz"))
       (file-name (string-append "squirrel-" version ".tar.gz"))
       (patches (search-patches
                       "laura/packages/patches/squirrel-no-cmake-files.patch"
                       "laura/packages/patches/squirrel-cve-2022-30292.patch"))
       (patch-flags '("-p1" "--binary"))
       (sha256
        (base32 "1nw1ghr4nxsvpk5bm9q0arrx4zrjpq5bai5sc17vj90by19187r1"))))))

(define-public shepherd-core
  (package
    (inherit shepherd-1.0)
    (version "1.0.100")
    (source
     (origin
       (method url-fetch)
       (uri "mirror://gnu/shepherd/shepherd-1.0.2.tar.gz")
       (patches (list (search-patch
                       "laura/packages/patches/shepherd-core.patch")))
       (sha256
        (base32 "1gr4k57jv2flks2zvvmm0i1lpi9cmj9844zdz6l6yixhnh2aqjyz"))))))

(define-public fwupd-nonfree-polkit
  (package
    (name "fwupd-nonfree-polkit")
    (version "1.8.14")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fwupd/fwupd")
             (commit version)))
       (file-name (git-file-name name version))
       (patches (search-patches "laura/packages/patches/fwupd-polkit.patch"))
       (sha256
        (base32 "179yc0nbbyrdya5q16ncf7lkslrhr3i90rgb9vdmv751ikilkby6"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "--wrap-mode=nofallback"
              "-Dsystemd=false"
              (string-append "-Defi_os_dir="
                             #$gnu-efi "/lib")
              "-Defi_binary=false"
              (string-append "-Dudevdir="
                             #$output "/lib/udev")
              "--localstatedir=/var"
              (string-append "--libexecdir="
                             #$output "/libexec")
              "-Dsupported_build=true"
              "-Dlvfs=true")
      #:glib-or-gtk? #t
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'make-source-writable
            (lambda _
              (for-each make-file-writable
                        (find-files "."))
              (substitute* "src/fu-self-test.c"
                (("/bin/sh")
                 (which "sh")))))
          (add-after 'unpack 'newer-timestamps-for-python-zip
            (lambda _
              (let ((circa-1980 (* 10 366 24 60 60)))
                (for-each (lambda (file)
                            (make-file-writable file)
                            (utime file circa-1980 circa-1980))
                          '("./libfwupdplugin/tests/colorhug/firmware.bin"
                            "./libfwupdplugin/tests/colorhug/firmware.bin.asc")))))
          (add-before 'build 'setup-home
            (lambda _
              (setenv "HOME" "/tmp")))
          (add-before 'install 'no-polkit-magic
            (lambda _
              (setenv "PKEXEC_UID" "something")))
          (add-after 'install 'ensure-all-remotes-are-enabled
            (lambda _
              (substitute* (find-files (string-append #$output "/etc")
                                       "\\.conf$")
                (("Enabled=false")
                 "Enabled=true")))))))
    (native-inputs (list gobject-introspection
                         python-pygobject
                         python-pillow
                         python-pycairo
                         python
                         pkg-config
                         vala
                         gtk-doc
                         which
                         umockdev
                         `(,glib "bin")
                         help2man
                         gettext-minimal))
    (inputs (append (list bash-completion
                          libgudev
                          libxmlb
                          sqlite
                          polkit
                          eudev
                          libelf
                          tpm2-tss
                          cairo
                          efivar
                          pango
                          protobuf-c
                          mingw-w64-tools
                          gnu-efi)
                    (if (supported-package? libsmbios
                                            (or (and=> (%current-target-system)
                                                 platform-target->system)
                                                (%current-system)))
                        (list libsmbios)
                        '())))
    (propagated-inputs (list curl
                             gcab
                             glib
                             gnutls
                             gusb
                             json-glib
                             libarchive
                             libjcat))
    (home-page "https://fwupd.org/")
    (synopsis "Daemon to allow session software to update firmware")
    (description
     "This package aims to make updating firmware on GNU/Linux
automatic, safe and reliable.  It is used by tools such as GNOME Software. Now with nonfree firmware.")
    (license license:lgpl2.1+)))

(define-public openssl-3.4.1
  (package
    (inherit openssl-3.0)
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri (list (string-append "https://www.openssl.org/source/openssl-"
                                        version ".tar.gz")
                         (string-append "ftp://ftp.openssl.org/source/"
                                        "openssl-" version ".tar.gz")
                         (string-append "ftp://ftp.openssl.org/source/old/"
                                        (string-trim-right version char-set:letter)
                                        "/openssl-" version ".tar.gz")))
              (patches (search-patches "openssl-3.0-c-rehash-in.patch"))
              (sha256
               (base32
                "1wvx37d0dvpylhm7ha64lvdgiak5cgcvshvcljzg92xm61mjsah0"))))))
