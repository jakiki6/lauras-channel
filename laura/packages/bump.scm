(define-module (laura packages bump)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages squirrel)
  #:use-module (gnu packages fpga)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages python)
  #:use-module (gnu packages man)
  #:use-module (gnu packages perl))

(define-public squirrel-3.2
  (package
    (inherit squirrel)
    (version "3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://sourceforge/squirrel/squirrel3/"
                                  "squirrel " version " stable/squirrel_"
                                  (string-join (string-split version #\.) "_")
                                  "_stable.tar.gz"))
              (file-name (string-append "squirrel-" version ".tar.gz"))
              (patches (list (search-patch "laura/packages/patches/squirrel-no-cmake-files.patch")))
              (patch-flags '("-p1" "--binary"))
              (sha256
               (base32
                "1nw1ghr4nxsvpk5bm9q0arrx4zrjpq5bai5sc17vj90by19187r1"))))))
