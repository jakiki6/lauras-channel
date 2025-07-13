(define-module (laura packages gpu)
  #:use-module (guix packages)
  #:use-module (gnu packages xdisorg)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (laura packages rust-common))

(define-public amdgpu-top
  (package
    (name "amdgpu-top")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "amdgpu_top" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09ya3szw6fn1dia7wrngxaicvy6j0liawahflyagif577v2jphv9"))))
    (build-system cargo-build-system)
    (inputs (list libdrm))
    (arguments
     `(#:cargo-inputs (("rust-amdgpu-top-gui" ,rust-amdgpu-top-gui-0.8)
                       ("rust-amdgpu-top-json" ,rust-amdgpu-top-json-0.8)
                       ("rust-amdgpu-top-tui" ,rust-amdgpu-top-tui-0.8)
                       ("rust-gix" ,rust-gix-0.61)
                       ("rust-libamdgpu-top" ,rust-libamdgpu-top-0.8)
                       ("rust-libc" ,rust-libc-0.2.155))))
    (home-page "https://github.com/Umio-Yasuno/amdgpu_top")
    (synopsis
     "Tool to displays AMDGPU usage.
The tool displays information gathered from performance counters (GRBM, GRBM2), sensors, fdinfo, gpu_metrics and AMDGPU driver.")
    (description
     "This package provides Tool to displays AMDGPU usage.  The tool displays information gathered from
performance counters (GRBM, GRBM2), sensors, fdinfo, gpu_metrics and AMDGPU
driver.")
    (license license:expat)))

(define-public clrx
  (package
    (name "clrx")
    (version "0.1.9")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/CLRX/CLRX-mirror")
              (commit "fb8fbf9")))
        (file-name (git-file-name name version))
        (sha256 (base32 "03yy2scmskgpxbjmkrqiz2f9hl5js5r7kragjpj2y4rkq7a3ff2l"))))
    (build-system cmake-build-system)
    (arguments (list #:build-type "Release" #:tests? #f))
    (home-page "http://clrx.nativeboinc.org/")
    (synopsis "CLRadeonExtender (GCN assembler, Radeon assembler)")
    (description "CLRadeonExtender provides tools to develop software in low-level for the Radeon GPU's compatible with GCN 1.0/1.1/1.2/1.4 (AMD VEGA) architecture. Since version 0.1.8 also AMD VEGA Deep Learning extensions has been supported.")
    (license (list license:gpl2 license:lgpl2.1 license:fdl1.2+))))
