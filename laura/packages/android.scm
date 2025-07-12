(define-module (laura packages android)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
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
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages ssh))

(define-public android-translation-layer
  (package
    (name "android-translation-layer")
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
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'fix-env
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "LIBRARY_PATH"
                      (string-append (getenv "LIBRARY_PATH") ":"
                                     (assoc-ref inputs "art-standalone")
                                     "/lib/art"))))
          (add-before 'configure 'patch-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "../source/meson.build"
                (("error.*$")
                 (string-append "bootclasspath = '"
                                (assoc-ref inputs "art-standalone")
                                "/lib/java/core-all_classes.jar'\n"))
                (("^bootclasspath = bootclasspath_dir.*$")
                 "")))))))
    (native-inputs (list pkg-config openjdk gcc-toolchain-14
                         (list openjdk "jdk")
                         (list glib "bin")))
    (inputs (list art-standalone
                  bionic-translation
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

(define-public art-standalone
  (package
    (name "art-standalone")
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
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'check)
          (delete 'validate-runpath)
          (add-before 'build 'fix-paths
            (lambda _
              (begin
                (substitute* "art/runtime/native_stack_dump.cc"
                  (("/usr/bin/addr2line")
                   (string-append #$binutils "/bin/addr2line")))
                (substitute* "art/tools/timeout_dumper/timeout_dumper.cc"
                  (("/usr/bin/addr2line")
                   (string-append #$binutils "/bin/addr2line"))))))
          (add-before 'build 'fix-env
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "ANDROID_BUILD_SHELL"
                      (string-append (assoc-ref inputs "bash") "/bin/bash"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (system (string-append "make ____LIBDIR=lib ____PREFIX="
                                     (assoc-ref outputs "out")
                                     " ____INSTALL_ETC="
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
                  binutils
                  bionic-translation))
    (home-page "https://gitlab.com/android_translation_layer/art_standalone")
    (synopsis "art + dependencies (pulled from AOSP)")
    (description "")
    (license license:asl2.0)))

(define-public bionic-translation
  (package
    (name "bionic-translation")
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

(define-public axmldec
  (package
    (name "axmldec")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ytsutano/axmldec")
             (recursive? #t)
             (commit "v1.2.0")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0k5xc3bllnsqhfm6nry986krgspwq204nq09ka8cjss3nijxjl1c"))))
    (build-system cmake-build-system)
    (inputs (list boost zlib))
    (arguments
     (list
      #:tests? #f
      #:build-type "Release"))
    (home-page "https://github.com/ytsutano/axmldec")
    (synopsis "Stand-alone binary AndroidManifest.xml decoder")
    (description
     "AndroidManifest.xml in an APK file is binary encoded. This tool accepts either a binary or a text XML file and prints the decoded XML to the standard output or a file. It also allows you to extract the decoded AndroidManifest.xml directly from an APK file.")
    (license license:isc)))

(define-public git-repo
  (package
    (name "git-repo")
    (version "2.54")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gerrit.googlesource.com/git-repo")
             (commit (string-append "v" version))))
       (file-name (string-append "git-repo-" version "-checkout"))
       (sha256
        (base32 "0a1qa7gq3ink0cfgdxx3l3p26jm2w5vsifqs9xdvb98kkswak45d"))))
    (build-system python-build-system)
    (arguments
     (list
      #:tests? #f ;tests consist of just formatting the code
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'set-executable-paths
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (substitute* '("repo" "git_command.py")
                (("^GIT = 'git'")
                 (string-append "GIT = '"
                                (search-input-file inputs "/bin/git"))))
              (substitute* "git_config.py"
                ((" command_base = \\['ssh',")
                 (string-append " command_base = ['"
                                (search-input-file inputs "/bin/ssh") ",")))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((bin-dir (string-append #$output "/bin"))
                     (repo-dir (string-append #$output "/share/git-repo")))
                (mkdir-p bin-dir)
                (mkdir-p repo-dir)
                (copy-recursively "." repo-dir)
                (delete-file-recursively (string-append repo-dir "/tests"))
                (symlink (string-append repo-dir "/repo")
                         (string-append bin-dir "/repo"))
                (wrap-program (string-append bin-dir "/repo")
                  '("REPO_SKIP_SELF_UPDATE" =
                    ("1"))
                  '("REPO_TRACE" =
                    ("0")))))))))
    (inputs (list git openssh bash-minimal))
    (home-page "https://gerrit.googlesource.com/git-repo/")
    (synopsis "Helps to manage many Git repositories")
    (description
     "Repo is a tool built on top of Git.  Repo helps manage many
Git repositories, does the uploads to revision control systems, and automates
parts of the development workflow.  Repo is not meant to replace Git, only to
make it easier to work with Git.  The repo command is an executable Python
script that you can put anywhere in your path.")
    (license license:asl2.0)))
