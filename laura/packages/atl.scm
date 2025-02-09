(define-module (laura packages atl)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages cmake)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages libbsd)
  #:use-module (gnu packages libunwind)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages python)
  #:use-module (gnu packages java)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages video)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages webkit))

(define-public android_translation_layer
  (package
    (name "android_translation_layer")
    (version "0.0.0-37af37b7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url
              "https://gitlab.com/android_translation_layer/android_translation_layer.git")
             (commit "37af37b7")))
       (modules '((guix build utils)))
       (snippet #~(begin
                    (substitute* "meson.build"
                      (("SkiaSharp")
                       "skia"))
                    (substitute* "src/main-executable/main.c"
                      (("/\\.\\./java/dex")
                       "/../lib/java/dex"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qm0dri263khficiykfp7w35k6xbh8gjfwndx69b1z2wh6k7frqq"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:phases #~(modify-phases %standard-phases
                   (add-before 'configure 'fix-env
                     (lambda* (#:key inputs #:allow-other-keys)
                       (setenv "LIBRARY_PATH"
                               (string-append (getenv "LIBRARY_PATH") ":"
                                              (assoc-ref inputs
                                                         "art_standalone")
                                              "/lib/art"))))
                    (add-before 'configure 'patch-paths
                     (lambda* (#:key inputs #:allow-other-keys)
                       (substitute* "../source/meson.build"
                         (("error.*$")
                          (string-append "bootclasspath = '"
                                         (assoc-ref inputs "art_standalone")
                                         "/lib/java/core-all_classes.jar'\n")) (("^bootclasspath = bootclasspath_dir.*$") "")))))))
    (native-inputs (list pkg-config openjdk gcc-toolchain-14
                         (list openjdk "jdk")
                         (list glib "bin")))
    (inputs (list art_standalone
                  bionic_translation
                  skia
                  wayland
                  wayland-protocols
                  gtk
                  openxr
                  libportal
                  sqlite-next
                  ffmpeg
                  libgudev
                  webkitgtk
                  alsa-lib))
    (home-page
     "https://gitlab.com/android_translation_layer/android_translation_layer.git")
    (synopsis
     "A translation layer that allows running Android apps on a Linux system")
    (description "Like Wine but for Android.")
    (license license:gpl3+)))

(define wolfssl-for-art
  (package
    (inherit wolfssl)
    (arguments
     '(#:configure-flags '("--enable-shared" "--disable-opensslall"
                           "--disable-opensslextra"
                           "--enable-aescbc-length-checks"
                           "--enable-curve25519"
                           "--enable-ed25519"
                           "--enable-ed25519-stream"
                           "--enable-oldtls"
                           "--enable-base64encode"
                           "--enable-tlsx"
                           "--enable-scrypt"
                           "--disable-examples"
                           "--enable-crl"
                           "--enable-jni")))))

(define-public art_standalone
  (package
    (name "art_standalone")
    (version "0.0.0-aa709f68")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url
              "https://gitlab.com/android_translation_layer/art_standalone.git")
             (commit "aa709f68")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "142rchwl798ynxx03by79p0w1qby0l2zpjgn2jd7ar0ssxp1gl30"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases #~(modify-phases %standard-phases
                   (delete 'configure)
                   (delete 'check)
                   (delete 'validate-runpath)
                   (add-before 'build 'fix-env
                     (lambda* (#:key inputs #:allow-other-keys)
                       (setenv "ANDROID_BUILD_SHELL"
                               (string-append (assoc-ref inputs "bash")
                                              "/bin/bash"))))
                   (replace 'install
                     (lambda* (#:key outputs #:allow-other-keys)
                       (system (string-append
                                "make ____LIBDIR=lib ____PREFIX="
                                (assoc-ref outputs "out") " ____INSTALL_ETC="
                                (assoc-ref outputs "out") "/etc install")))))))
    (native-inputs (list bash
                         coreutils
                         python-3
                         openjdk
                         (list openjdk "jdk")
                         gcc-toolchain-14
                         zip))
    (inputs (list zlib
                  libbsd
                  lz4
                  icu4c
                  libcap
                  expat
                  wolfssl-for-art
                  openssl
                  bionic_translation))
    (home-page "https://gitlab.com/android_translation_layer/art_standalone")
    (synopsis "art + dependencies (pulled from AOSP)")
    (description "")
    (license license:asl2.0)))

(define-public bionic_translation
  (package
    (name "bionic_translation")
    (version "0.0.0-38cbae66")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url
              "https://gitlab.com/android_translation_layer/bionic_translation.git")
             (commit "38cbae66")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0lh130drm1wwk7b6mb8p0hmq2wwhh8j0hw866yl26ph0nvpmyw08"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config gcc-toolchain-14))
    (inputs (list mesa libbsd libunwind libelf))
    (home-page
     "https://gitlab.com/android_translation_layer/bionic_translation.git")
    (synopsis
     "a set of libraries for loading bionic-linked .so files on musl/glibc")
    (description "")
    (license license:asl2.0)))
