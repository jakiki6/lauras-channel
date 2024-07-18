(define-module (laura packages wayland)
  #:use-module (guix)
  #:use-module ((guix licenses) #:prefix license:)
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
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix git-download))

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
        (sha256 (base32 "1k35kpmzxvys8xn3n1nw6kmjxb5c9av46bw4njfilxnjjv2ljcqg"))))
    (inputs
     (list qtbase-5 qtdeclarative-5 qtx11extras kcoreaddons-5 ki18n-5 kwindowsystem-5 knotifications-5 xcb-util kpipewire))
    (native-inputs
     (list extra-cmake-modules))
    (build-system cmake-build-system)
    (arguments (list 
                     #:build-type "Release"))
    (home-page "https://invent.kde.org/system/xwaylandvideobridge")
    (synopsis "Utility to allow streaming Wayland windows to X applications")
    (description "By design, X11 applications can't access window or screen contents for wayland clients. This is fine in principle, but it breaks screen sharing in tools like Discord, MS Teams, Skype, etc and more.
This tool allows us to share specific windows to X11 clients, but within the control of the user at all times.")
    (license license:lgpl2.0+)))


(define-public aml
  (package
    (name "aml")
    (version "0.3.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/any1/aml")
              (commit "v0.3.0")))
        (file-name (git-file-name name version))
        (sha256 (base32 "0r4k233hh3iqc6zlhh2agmdj8q973x49pdixhz7h5hz7md38qzq5"))))
    (build-system meson-build-system)
    (home-page "https://github.com/any1/aml")
    (synopsis " Another Main Loop")
    (description "Andri's Main Loop")
    (license license:isc)))

(define-public neatvnc
  (package
    (name "neatvnc")
    (version "0.8.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/any1/neatvnc")
              (commit "v0.8.0")))
        (file-name (git-file-name name version))
        (sha256 (base32 "07vjagx14yiqgaiba24xvb3qbiznlfab23c14arx225y0rlw82h4"))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list zlib pixman libdrm aml))
    (build-system meson-build-system)
    (home-page "https://github.com/any1/neatvnc")
    (synopsis "A liberally licensed VNC server library with a clean interface ")
    (description "This is a liberally licensed VNC server library that's intended to be fast and neat.")
    (license license:isc)))

(define-public wayvnc
  (package
    (name "wayvnc")
    (version "0.8.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/any1/wayvnc")
              (commit "v0.8.0")))
        (file-name (git-file-name name version))
        (sha256 (base32 "1k02i70v8niqvadzfrki8q6wiymcfdqanc9zlmzdslw2bpdhqq90"))))
    (inputs
     (list libxkbcommon pixman jansson libdrm wayland aml neatvnc zlib))
    (native-inputs
     (list pkg-config))
    (build-system meson-build-system)
    (home-page "https://github.com/any1/wayvnc")
    (synopsis "A VNC server for wlroots based Wayland compositors")
    (description "This is a VNC server for wlroots-based Wayland compositors (:no_entry: Gnome, KDE and Weston are not supported). It attaches to a running Wayland session, creates virtual input devices, and exposes a single display via the RFB protocol. The Wayland session may be a headless one, so it is also possible to run wayvnc without a physical display attached.")
    (license license:isc)))
