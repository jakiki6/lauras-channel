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

(define-public verilator
  (package
    (name "verilator")
    (version "5.028")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/verilator/verilator")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1q9facgfdwwmf2ax65aznhqmk8qfisq9k5p8wrxrw6qqy38vl0k2"))))
    (native-inputs
     (list autoconf automake bison flex gettext-minimal python help2man))
    (inputs
     (list perl systemc))
    (build-system gnu-build-system)
    (arguments
     '(#:configure-flags
       (list (string-append "LDFLAGS=-L"
                            (assoc-ref %build-inputs "systemc")
                            "/lib-linux64"))
       #:make-flags
       (list (string-append "LDFLAGS=-L"
                            (assoc-ref %build-inputs "systemc")
                            "/lib-linux64"))
       #:phases
       (modify-phases %standard-phases
         (replace 'bootstrap
           (lambda _ (invoke "autoconf"))))
       #:tests? #f))
    ;; #error "Something failed during ./configure as config_build.h is incomplete.
    ;; Perhaps you used autoreconf, don't." -- so we won't. ^^
    (home-page "https://www.veripool.org/projects/verilator/")
    (synopsis "Fast Verilog/SystemVerilog simulator")
    (description
     "Verilator is invoked with parameters similar to GCC or Synopsys’s VCS.
It ``Verilates'' the specified Verilog or SystemVerilog code by reading it,
performing lint checks, and optionally inserting assertion checks and
coverage-analysis points.  It outputs single- or multi-threaded @file{.cpp}
and @file{.h} files, the ``Verilated'' code.

The user writes a little C++/SystemC wrapper file, which instantiates the
Verilated model of the user’s top level module.  These C++/SystemC files are
then compiled by a C++ compiler (GCC/Clang/etc.).  The resulting executable
performs the design simulation.  Verilator also supports linking its generated
libraries, optionally encrypted, into other simulators.")
    (license license:lgpl3)))
