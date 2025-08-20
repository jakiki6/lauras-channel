(define-module (laura packages wayland)
  #:use-module (guix)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages web)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages video)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages llvm)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download)
  #:use-module (laura packages rust-common))

; take from upstream@6bbd4e45b5eda01529a51ee5c6c593c856f07552
(define-public kpipewire-5
  (package
    (name "kpipewire")
    (version "5.27.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde/stable/plasma/"
                           version
                           "/"
                           name
                           "-"
                           version
                           ".tar.xz"))
       (sha256
        (base32 "10j7sa8vv530c388z5rzafkdr4sx3agjqczlnkh7412whyw77lha"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list extra-cmake-modules pkg-config))
    (propagated-inputs (list libepoxy pipewire qtbase-5 qtdeclarative-5))
    (inputs (list ffmpeg
                  kcoreaddons-5
                  ki18n-5
                  kwayland-5
                  plasma-wayland-protocols
                  qtwayland-5
                  wayland
                  wayland-protocols))
    (home-page "https://invent.kde.org/plasma/kpipewire")
    (synopsis "Components relating to pipewire use in Plasma")
    (description "This package offers a set of convenient classes to use
PipeWire in Qt projects.")
    ;; LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-KDE-Accepted-LGPL
    (license (list license:lgpl2.1 license:lgpl3))))

(define-public wl-screenrec
  (package
    (name "wl-screenrec")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wl-screenrec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03f2sa7yya1jjqykr5jpzp7ssxzmq2db6fzf4xpd9b5bgdqf5dq7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-clap" ,rust-clap-4.5.20)
                       ("rust-clap-complete" ,rust-clap-complete-4.5.35)
                       ("rust-drm-fourcc" ,rust-drm-fourcc-2)
                       ("rust-ffmpeg-next" ,rust-ffmpeg-next-7)
                       ("rust-ffmpeg-sys-next" ,rust-ffmpeg-sys-next-7)
                       ("rust-human-size" ,rust-human-size-0.4)
                       ("rust-libc" ,rust-libc-0.2.161)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-simplelog" ,rust-simplelog-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wayland-backend" ,rust-wayland-backend-0.3.7)
                       ("rust-wayland-client" ,rust-wayland-client-0.31.7)
                       ("rust-wayland-protocols" ,rust-wayland-protocols-0.32.5)
                       ("rust-wayland-protocols-wlr" ,rust-wayland-protocols-wlr-0.3.5))
       #:cargo-development-inputs (("rust-nix" ,rust-nix-0.29.0)
                                   ("rust-serde-json" ,rust-serde-json-1))))
    (native-inputs (list pkg-config))
    (inputs (list ffmpeg clang libdrm))
    (home-page "https://github.com/russelltg/wl-screenrec")
    (synopsis "High performance screen/audio recorder for wlroots")
    (description
     "This package provides High performance screen/audio recorder for wlroots.")
    (license license:asl2.0)))

(define-public xwaylandvideobridge
  (package
    (name "xwaylandvideobridge")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://invent.kde.org/system/xwaylandvideobridge")
             (commit "v0.4.0")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1k35kpmzxvys8xn3n1nw6kmjxb5c9av46bw4njfilxnjjv2ljcqg"))))
    (inputs (list qtbase-5
                  qtdeclarative-5
                  qtx11extras
                  kcoreaddons-5
                  ki18n-5
                  kwindowsystem-5
                  knotifications-5
                  xcb-util
                  kpipewire-5))
    (native-inputs (list extra-cmake-modules))
    (build-system cmake-build-system)
    (arguments
     (list
      #:build-type "Release"))
    (home-page "https://invent.kde.org/system/xwaylandvideobridge")
    (synopsis "Utility to allow streaming Wayland windows to X applications")
    (description
     "By design, X11 applications can't access window or screen contents for wayland clients. This is fine in principle, but it breaks screen sharing in tools like Discord, MS Teams, Skype, etc and more.
This tool allows us to share specific windows to X11 clients, but within the control of the user at all times.")
    (license license:lgpl2.0+)))
