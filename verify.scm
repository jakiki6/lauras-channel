(add-to-load-path (dirname (current-filename)))

(use-modules
  (laura packages gradle)
  (laura packages gpu)
  (laura packages package-managers)
  (laura packages wayland)
  (laura packages atl)
  (laura packages games)
  (laura packages bump)
  (laura packages go-common)
  (laura packages dee)
  (laura packages nomadnet)
  (laura packages rust-common)
  (laura packages utils)
  (laura services utils)
  (laura home services wine)
  (laura home services audio))

(define to-test
  (list
    android_translation_layer
    squirrel-3.2
    drand-rs
    minecraft-launcher
    ScuffedMinecraft
    fceux
    rpcs3
    tpt
    uesave
    amdgpu-top
    nomadnet
    pacman
    Amogus-File-Encoder
    gcc-cross-riscv64-linux-gnu-toolchain
    CasioEmu
    activate-linux
    bkcrack
    bsdiff
    cado-nfs
    cerca
    clipmon
    coremark
    csvlens
    duf
    encpipe
    ent
    flatpak-builder
    leopard
    libgfshare
    liboqs
    paper-age
    payload-dumper-go
    pesign
    ricochet-refresh
    sbctl
    vbmeta-disable-verification
    wasmtime
    waydroid
    wshowkeys
    yara
    imhex
    lite
    binsider
    mbw
    binwalk-3
    wl-screenrec
    xwaylandvideobridge
))

(use-modules
  (guix)
  (guix derivations)
  (guix monads)
  (guix packages))

(define (build pkg)
  (run-with-store (open-connection)
    (build-derivations (package->derivation pkg) %store)))

(define executed 0)
(define succeeded 0)

(map (lambda (pkg)
  (with-exception-handler
    (lambda (exn)
      (format (current-error-port) "\x1b[32mfailure\x1b[0m\n\n"))
    (begin
      (set! executed (+ executed 1))
      (format (current-error-port) "~a ... " (package-name pkg)))
      (build pkg)
      (format (current-error-port) "\x1b[32msuccess\x1b[0m\n")
      (set! succeeded (+ succeeded 1))))
to-test)

(let ((color (if (= executed succeeded) "32" "31")))
  (format (current-error-port) "summary: \x1b[~am~a/~a\x1b[0m\n" color succeeded executed))
