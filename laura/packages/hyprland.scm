;; from https://codeberg.org/hako/Rosenthal/src/commit/1deb97ada4d7d8c2d501738fcc1532a605de51a7/rosenthal/packages/wm.scm
;; it is licensed under the GPLv3+

(define-module (laura packages hyprland)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system qt)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))

(define cairo-for-hyprland
  (package
    (inherit cairo)
    (name "cairo")
    (version "1.18.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cairographics.org/releases/cairo-"
                                  version ".tar.xz"))
              (sha256
               (base32
                "0r0by563s75xyzz0d0j1nmjqmdrk2x9agk7r57p3v8vqp4v0ffi4"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t
           #:configure-flags
           #~(list "-Dspectre=disabled")))
    (outputs '("out"))))

(define hwdata-for-hyprland
  (package
    (inherit hwdata)
    (arguments
     (substitute-keyword-arguments (package-arguments hwdata)
       ((#:phases _) #~%standard-phases)))
    (outputs '("out"))))

(define libdrm-for-hyprland
  (package
    (inherit libdrm)
    (name "libdrm")
    (version "2.4.120")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dri.freedesktop.org/libdrm/libdrm-"
                    version ".tar.xz"))
              (sha256
               (base32
                "0yijzgg6rdsa68bz03sw0lcfa2nclv9m3as1cja50wkcyxim7x9v"))))))

(define udis86-for-hyprland
  (let ((revision "186")
        (commit "5336633af70f3917760a6d441ff02d93477b0c86"))
    (package
      (name "udis86")
      (version (git-version "1.7.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/canihavesomecoffee/udis86")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0y5z1169wff578jylpafsww4px4y6gickhcs885a9c660d8xs9qy"))))
      (build-system gnu-build-system)
      (native-inputs (list autoconf automake libtool python-minimal-wrapper))
      (home-page "https://github.com/canihavesomecoffee/udis86")
      (synopsis "Disassembler Library for x86 and x86-64")
      (description
       "Udis86 is a disassembler for the x86 and x86-64 class of instruction
set architectures.  It consists of a C library called @code{libudis86} and a
command line tool called @code{udcli} that incorporates the library.")
      (license license:bsd-2))))

(define wayland-protocols-for-hyprland
  (package
    (inherit wayland-protocols)
    (name "wayland-protocols")
    (version "1.36")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.freedesktop.org/wayland/wayland-protocols"
                    "/-/releases/" version "/downloads/"
                    "wayland-protocols-" version ".tar.xz"))
              (sha256
               (base32
                "14kyxywpfkgpjpkrybs28q1s2prnz30k1b4zap5a3ybrbvh4vzbi"))))))

(define-public libinput-1.26.0
  (package
    (inherit libinput)
    (name "libinput")
    (version "1.26.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/libinput/libinput.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "010bqvic471prhja1j5xqni9dhqc36ikqpxi8ih0fs13wph70p4s"))))))

(define-public meson-1.6.0
  (package
    (inherit meson)
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mesonbuild/meson/"
                                  "releases/download/" version  "/meson-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "15jlkp0fxwir26k0rmf3n25l3qi2mlgrqj352gqiqm033kr6b6wr"))))))

(define-public wayland-1.23.1
  (package
    (inherit wayland)
    (name "wayland")
    (version "1.23.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.freedesktop.org/" name 
                                  "/" name  "/-/releases/" version "/downloads/"
                                  name "-" version ".tar.xz"))
              (sha256
               (base32
                "1vg5h6d94hglh7724q6wx9dpg4y0afvxksankp1hwbcy76lb4kw6"))))))

(define-public sdbus-c++-2.0.0
  (package
    (inherit sdbus-c++)
    (name "sdbus-c++")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Kistler-Group/sdbus-cpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1s6vhzln0rvac2r3v8nq08hsjhyz3y46fsy18i23ppjm30apkiav"))))
    (arguments (substitute-keyword-arguments (package-arguments sdbus-c++)
                 ((#:tests? _ #f) #f)))))

(define-public hyprutils
  (package
    (name "hyprutils")
    (version "0.2.3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/hyprwm/hyprutils")
              (commit "v0.2.3")))
        (file-name (git-file-name name version))
        (sha256 (base32 "01dh24rf62gb6xm32f7mfv6wx0dxprr1q9y73hvv7xanrjyia2zn"))))
    (build-system cmake-build-system)
    (arguments (list #:build-type "Release"))
    (native-inputs (list pkg-config gcc-13))
    (inputs (list pixman))
    (home-page "https://github.com/hyprwm/hyprutils")
    (synopsis "Hyprland utilities library used across the ecosystem.")
    (description "Hyprutils is a small C++ library for utilities used across the Hypr* ecosystem.")
    (license license:bsd-3)))

(define-public hyprcursor
  (package
    (name "hyprcursor")
    (version "0.1.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/hyprcursor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1rdn03ln7pqcwp8h4nmi7nc489q8y25dd3v4paq8ykvwzhvs3a1n"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))      ;TODO: No themes packaged.
    (inputs (list cairo-for-hyprland hyprlang librsvg libzip tomlplusplus))
    (native-inputs (list gcc-13 pkg-config))
    (home-page "https://hyprland.org/")
    (synopsis "Hyprland cursor format, library and utilities")
    (description
     "This package provides Hyprland cursor format, library and utilities.")
    (license license:bsd-3)))

(define-public hyprland-protocols
  (package
    (name "hyprland-protocols")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/hyprland-protocols")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0x86w7z3415qvixfhk9a8v5fnbnxdydzx366qz0mpmfg5h86qyha"))))
    (build-system meson-build-system)
    (home-page "https://hyprland.org")
    (synopsis "Wayland protocol extensions for Hyprland")
    (description
     "This package provides Wayland protocol extensions for Hyprland and it
exists in an effort to bridge the gap between Hyprland and KDE/Gnome's
functionality.  Since @code{wlr-protocols} is closed for new submissions, and
@code{wayland-protocols} is very slow with changes, this package will hold
protocols used by Hyprland to bridge the aforementioned gap.")
    (license license:bsd-3)))

(define-public aquamarine
  (package
    (name "aquamarine")
    (version "0.4.3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/hyprwm/aquamarine")
              (commit "v0.4.3")))
        (file-name (git-file-name name version))
        (sha256 (base32 "0x1zz1ywchs0awkjkvdgskgqnp6pz5lqwmgr8g0zc0i7inhyg1p3"))))
    (build-system cmake-build-system)
    (arguments (list #:cmake cmake-3.30 #:build-type "Release" #:tests? #f))
    (native-inputs (list pkg-config gcc-13))
    (inputs (list mesa hyprwayland-scanner libseat libinput-1.26.0 wayland wayland-protocols-for-hyprland
                  hyprutils pixman eudev libdisplay-info hwdata-for-hyprland libglvnd))
    (home-page "https://github.com/hyprwm/aquamarine")
    (synopsis "Aquamarine is a very light linux rendering backend library.")
    (description "Aquamarine is a very light linux rendering backend library. It provides basic
abstractions for an application to render on a Wayland session (in a window) or a native DRM session.")
    (license license:bsd-3)))

(define-public hyprland
  (package
    (name "hyprland")
    (version "0.44.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hyprwm/Hyprland"
                                  "/releases/download/v" version
                                  "/source-v" version ".tar.gz"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; Remove bundled sources and hyprpm utility.
                  (substitute* "meson.build"
                    ((".*hyprpm/src.*") ""))
                  (copy-file "scripts/generateVersion.sh.bak" "scripts/generateVersion.sh")
                  (for-each delete-file-recursively
                            '("hyprpm"
                              "subprojects"))))
              (sha256
               (base32
                "0qzwdlj0bwj267285l3gjklhafn3bln90z985yws4j5cbp7bj0d9"))))
    (build-system meson-build-system)
    (arguments
     (list #:build-type "release"
           #:meson meson-1.6.0
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'fix-path
                 (lambda* (#:key inputs #:allow-other-keys)
                   (substitute* (find-files "src" "\\.cpp$")
                     (("/usr/local(/bin/Hyprland)" _ path)
                      (string-append #$output path))
                     (("/usr") #$output)
                     (("(execAndGet\\(\")\\<(cat|fc-list|lspci)\\>"
                       _ pre cmd)
                      (string-append
                       pre (search-input-file
                            inputs (string-append "bin/" cmd))))
                     (("\\<cc\\>") (search-input-file inputs "bin/gcc"))
                     ;; NOTE: Add binutils to inputs will override ld-wrapper.
                     (("(execAndGet\\(\\(\")\\<nm\\>" _ pre)
                      (string-append pre #$binutils "/bin/nm"))
                     (("\\<(addr2line|objcopy)\\>" _ cmd)
                      (string-append #$binutils "/bin/" cmd))))))))
    (native-inputs (list gcc-14 hyprwayland-scanner jq pkg-config wayland-1.23.1))
    (inputs
     (list aquamarine
           cairo-for-hyprland
           gcc-14
           hyprcursor
           hyprland-protocols
           hyprlang
           hyprutils
           libinput-1.26.0
           libxcursor
           libxkbcommon
           mesa
           pango
           pciutils
           udis86-for-hyprland
           wayland-protocols-for-hyprland
           xcb-util-errors
           xcb-util-wm))
    (home-page "https://hyprland.org")
    (synopsis "Dynamic tiling Wayland compositor")
    (description
     "Hyprland is a dynamic tiling Wayland compositor that doesn't sacrifice on its looks.
It supports multiple layouts, fancy
effects, has a very flexible IPC model allowing for a lot of customization, and
more.")
    (license license:bsd-3)))

(define-public hyprlang
  (package
    (name "hyprlang")
    (version "0.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/hyprlang")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0yvfrz3hdyxzhngzhr0bgc5279ra5fv01hbfi6pdj84pz0lpaw02"))))
    (build-system cmake-build-system)
    (inputs (list hyprutils))
    (native-inputs (list pkg-config gcc-13))
    (home-page "https://hyprland.org/hyprlang/")
    (synopsis "Official implementation library for hypr config language")
    (description
     "This package provides the official implementation for hypr configuration
language used in @code{hyprland}.")
    (license license:gpl3+)))

(define-public hyprwayland-scanner
  (package
    (name "hyprwayland-scanner")
    (version "0.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/hyprwayland-scanner")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0r7ay4zjkfyr0xd73wz99qhnqjq7nma98gm51wm9lmai4igw90qw"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))      ;No tests.
    (inputs (list pugixml))
    (native-inputs (list gcc-13 pkg-config))
    (home-page "https://github.com/hyprwm/hyprwayland-scanner")
    (synopsis "Hyprland implementation of wayland-scanner, in and for C++")
    (description
     "This package provides a Hyprland implementation of wayland-scanner, in and
for C++.")
    (license license:bsd-3)))

(define-public grimblast
  (package
    (name "grimblast")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/contrib")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0ld0sj7ahf9jf8cqzbqkhj3m2w60027ixic24ih26nwy90b5qjwx"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f                ;no tests
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-after 'unpack 'chdir
                 (lambda _
                   (chdir "grimblast")))
               (add-after 'install 'wrap
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((grimblast (string-append #$output "/bin/grimblast")))
                     (wrap-script grimblast
                       `("PATH" suffix
                         ,(map (lambda (program)
                                 (dirname (search-input-file
                                           inputs (string-append "/bin/" program))))
                               '("grim" "slurp" "hyprctl" "wl-copy" "jq"
                                 "notify-send" "date"))))))))))
    (native-inputs (list scdoc))
    (inputs (list grim guile-3.0 jq libnotify slurp hyprland wl-clipboard))
    (home-page "https://github.com/hyprwm/contrib")
    (synopsis "Hyprland version of Grimshot")
    (description "A Hyprland version of Grimshot.")
    (license license:expat)))

(define-public xdg-desktop-portal-hyprland
  (package
    (name "xdg-desktop-portal-hyprland")
    (version "1.3.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/xdg-desktop-portal-hyprland")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1irj7pqz6jk4l911p33yragmfsqixgwfg1k9djkz2sdca9ddf809"))))
    (build-system qt-build-system)
    (arguments
     (list #:tests? #f                  ;No tests
           #:qtbase qtbase
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'fix-path
                 (lambda* (#:key inputs #:allow-other-keys)
                   (substitute* (find-files "." "\\.cp?*$")
                     (("/bin/sh") "sh")
                     (("\\<(sh|grim|hyprctl|slurp)\\>" _ cmd)
                      (search-input-file inputs (string-append "/bin/" cmd)))
                     (("\\<(hyprland-share-picker)\\>" _ cmd)
                      (string-append #$output "/bin/" cmd))))))))
    (native-inputs
     (list gcc-13 pkg-config wayland))
    (inputs
     (list bash-minimal
           grim
           hyprland
           hyprland-protocols
           hyprlang
           hyprutils
           hyprwayland-scanner
           mesa
           pipewire
           qtwayland
           sdbus-c++-2.0.0
           slurp
           wayland-protocols))
    (home-page "https://github.com/hyprwm/xdg-desktop-portal-hyprland")
    (synopsis "XDG Desktop Portal backend for Hyprland")
    (description
     "This package provides @code{xdg-desktop-portal-hyprland}, which extends
@code{xdg-desktop-portal-wlr} for Hyprland with support for
@code{xdg-desktop-portal} screenshot and casting interfaces, while adding a few
extra portals specific to Hyprland, mostly for window sharing.")
    (license license:bsd-3)))
