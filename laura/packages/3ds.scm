(define-module (laura packages 3ds)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages qt))

(define-public otptool
  (package
    (name "otptool")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/SciresM/otptool")
             (commit "5ed22856538f8a3352482c24268ba42f70a2193d")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00g2nql23i6rbd08kzdd1iypzv141qii81ywjjyqg5kwsid59hc9"))))
    (build-system gnu-build-system)
    (inputs (list libgcrypt openssl))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda _
              (setenv "CC" "gcc")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (install-file "otptool"
                            (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/SciresM/otptool")
    (synopsis "View and extract data from a 3DS OTP")
    (description
     "The otptool utility views and extracts data from a 3DS OTP dump. The dump can be either encrypted or already decrypted. If no arguments are given, no files will be written.")
    (license license:gpl2)))

(define-public ctrtool
  (package
    (name "ctrtool")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/3DSGuy/Project_CTR")
             (commit "ctrtool-v1.2.1")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rhgmmp5kbkw6x01npi8ha0hbqxfac3m0vj80l2gx88l4509xahy"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda _
              (begin
                (chdir "ctrtool")
                (setenv "CC" "gcc"))))
          (replace 'build
            (lambda _
              (begin
                (system (string-append "make deps -j" (number->string (parallel-job-count))))
                (system (string-append "make program -j" (number->string (parallel-job-count)))))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (install-file "bin/ctrtool"
                            (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/3DSGuy/Project_CTR/")
    (synopsis "Tool to read/extract Nintendo 3DS files.")
    (description
     "General purpose reading/extraction tool for Nintendo 3DS file formats.")
    (license license:gpl3+)))

(define-public makerom
  (package
    (name "makerom")
    (version "0.18.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/3DSGuy/Project_CTR")
             (commit "makerom-v0.18.4")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0y49wzv9pkhy3w80b76kz4hhz9rlr72dc3bvnp4c4qygpx32ssaw"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda _
              (begin
                (chdir "makerom")
                (setenv "CC" "gcc"))))
          (replace 'build
            (lambda _
              (begin
                (system (string-append "make deps -j" (number->string (parallel-job-count))))
                (system (string-append "make program -j" (number->string (parallel-job-count)))))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (install-file "bin/makerom"
                            (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/3DSGuy/Project_CTR/")
    (synopsis "Creates CTR cxi/cfa/cci/cia files")
    (description
     "A CLI tool to create CTR (Nintendo 3DS) ROM images.")
    (license license:gpl3+)))

(define-public azahar
  (package
    (name "azahar")
    (version "2120.3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/azahar-emu/azahar")
              (recursive? #t)
              (commit "2120.3")))
        (file-name (git-file-name name version))
        (sha256 (base32 "03qpg34sizzwrkb4xjph9w7gs2l0kvblkhy6mgmcrqhk4x6qjlj5"))))
    (build-system cmake-build-system)
    (inputs (list qtbase qtmultimedia))
    (arguments (list #:tests? #f #:build-type "Release"))
    (home-page "https://azahar-emu.org/")
    (synopsis "An open-source 3DS emulator project based on Citra.")
    (description "Azahar is an open-source 3DS emulator project based on Citra.

It was created from the merging of PabloMK7's Citra fork and the Lime3DS project, both of which emerged shortly after Citra was taken down.

The goal of this project is to be the de-facto platform for future development.")
    (license license:gpl2)))
