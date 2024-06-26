(define-module (laura packages wayland)
  #:use-module (guix)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages kde-plasma)
  #:use-module (guix build-system cmake)
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
     (list qtbase-5 qtdeclarative-5 qtx11extras kcoreaddons ki18n kwindowsystem knotifications xcb-util kpipewire))
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
