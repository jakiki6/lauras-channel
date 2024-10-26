(define-module (laura packages bump)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix gexp)
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
  #:use-module (gnu packages gcc))

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
       (patches (list (search-patch
                       "laura/packages/patches/squirrel-no-cmake-files.patch")))
       (patch-flags '("-p1" "--binary"))
       (sha256
        (base32 "1nw1ghr4nxsvpk5bm9q0arrx4zrjpq5bai5sc17vj90by19187r1"))))))

(define-public iverilog-fixed
  (package
    (inherit iverilog)
    (version "12.0-1")
    (inputs (list zlib))))

(define-public yosys-0.46
  (package
    (inherit yosys)
    (name "yosys")
    (version "0.46")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/YosysHQ/yosys")
             (commit version)))
       (sha256
        (base32 "1zj7vbpy6v1wn4p5cjs4hdjd467a1j1aj2qhs148bl2s6mzq3p86"))
       (file-name (git-file-name name version))))
    (native-inputs (modify-inputs (package-native-inputs yosys)
                     (replace "iverilog" iverilog-fixed)))))
