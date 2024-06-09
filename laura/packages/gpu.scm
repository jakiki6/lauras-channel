(define-module (laura packages gpu)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (laura packages rust-common)
)

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
