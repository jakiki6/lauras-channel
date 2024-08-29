(define-module (laura packages bump)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages)
  #:use-module (gnu packages squirrel))

(define squirrel-3.2
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
              (sha256
               (base32
                "1nw1ghr4nxsvpk5bm9q0arrx4zrjpq5bai5sc17vj90by19187r1"))))))

squirrel-3.2
