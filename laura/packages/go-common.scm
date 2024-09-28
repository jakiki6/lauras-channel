(define-module (laura packages go-common)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system go)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix git-download)
  #:use-module (gnu packages)
  #:use-module (guix build utils)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-crypto)
  #:use-module (gnu packages prometheus)
  #:use-module (gnu packages golang-web)
  #:use-module (gnu packages golang-xyz))

(define-public go-github-com-charmbracelet-x-ansi
  (package
    (name "go-github-com-charmbracelet-x-ansi")
    (version "0.1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (string-append "ansi/v" version))))
       (file-name (git-file-name name version))
       (snippet '(begin
         (use-modules (guix build utils))
         (copy-recursively "ansi" ".")
         (delete-file-recursively "ansi")))
       (sha256
        (base32 "1j33791lkz4jzvm220dg82wr79gxncfflpqrlz34vhm7215fwbx0"))))
    (build-system go-build-system)
    (arguments
     `(#:import-path "github.com/charmbracelet/x/ansi"))
    (propagated-inputs (list go-github-com-rivo-uniseg))
    (home-page "https://pkg.go.dev/github.com/charmbracelet/x/ansi")
    (synopsis "ansi")
    (description "ANSI escape sequence parser and definitions")
    (license license:expat)))

(define-public go-github-com-carlmjohnson-requests
  (package
    (name "go-github-com-carlmjohnson-requests")
    (version "0.24.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/earthboundkid/requests")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0x95nr83k447fj0y5k23bxik368a72zvx7qqvzdn9lw9c57107zc"))))
    (build-system go-build-system)
    (arguments
     `(#:go ,go-1.22
       #:import-path "github.com/carlmjohnson/requests"
       #:phases (modify-phases %standard-phases
         (add-before 'build 'deref-symlinks
           (lambda* (#:key inputs #:allow-other-keys)
             (begin
               (delete-file-recursively "src/golang.org/x/net/publicsuffix/data")
               (copy-recursively (string-append (assoc-ref inputs "go-golang-org-x-net") "/src/golang.org/x/net/publicsuffix/data") "src/golang.org/x/net/publicsuffix/data")))))))
    (propagated-inputs (list go-golang-org-x-net))
    (home-page "https://github.com/carlmjohnson/requests")
    (synopsis "Requests")
    (description
     "Package requests is a convenience wrapper around net/http to make it faster and
easier to build requests and custom transports.")
    (license license:expat)))

(define-public go-github-com-cblgh-plain
  (package
    (name "go-github-com-cblgh-plain")
    (version "0.0.0-20240209132549-093bbe9d21f9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cblgh/plain")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03ljwy7s59h420pfapykfjg7k2s1k9q2g71xwbgc7xhasb9xadc0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/cblgh/plain"))
    (propagated-inputs (list go-golang-org-x-image
                             go-github-com-gomarkdown-markdown
                             go-github-com-golang-freetype))
    (home-page "https://github.com/cblgh/plain")
    (synopsis "")
    (description "")
    (license #f)))

(define-public go-github-com-gomarkdown-markdown
  (package
    (name "go-github-com-gomarkdown-markdown")
    (version "0.0.0-20240730141124-034f12af3bf6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gomarkdown/markdown")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1msk57pkf27l41s1yzhfgm69mz12kxhidxchsb90nxb0krf5y06p"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/gomarkdown/markdown"))
    (home-page "https://github.com/gomarkdown/markdown")
    (synopsis "Markdown Parser and HTML Renderer for Go")
    (description
     "Package markdown implements markdown parser and HTML renderer.")
    (license license:bsd-2)))

(define-public go-github-com-komkom-toml
  (package
    (name "go-github-com-komkom-toml")
    (version "0.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/komkom/toml")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rl44jkfdwzjqp31aif6ywyli6pzl2999wp3807vzxz0yd6chwfw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/komkom/toml"))
    (propagated-inputs (list go-github-com-stretchr-testify
                             go-github-com-pkg-errors))
    (home-page "https://github.com/komkom/toml")
    (synopsis "TOML")
    (description "This package provides a TOML parser and JSON encoder.")
    (license license:expat)))

(define-public go-github-com-matthewhartstonge-argon2
  (package
    (name "go-github-com-matthewhartstonge-argon2")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/matthewhartstonge/argon2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "054yaxy2jjwiwzwfcnjxinw3cskvkby9gqznrg5y28rwc2mwargb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/matthewhartstonge/argon2"))
    (propagated-inputs (list go-golang-org-x-crypto))
    (home-page "https://github.com/matthewhartstonge/argon2")
    (synopsis "🔐 argon2")
    (description
     "Package argon2 implements the key derivation function Argon2.")
    (license license:asl2.0)))

(define-public go-kernel-org-pub-linux-libs-security-libcap-psx
  (package
    (name "go-kernel-org-pub-linux-libs-security-libcap-psx")
    (version "1.2.70")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.kernel.org/pub/scm/libs/libcap/libcap.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kzchyg1zpbvwlys5d38dw436ncgsl7ms34yzvkn0qfdvmzfri04"))))
    (build-system go-build-system)
    (arguments
      `(#:phases (modify-phases %standard-phases (delete 'build) (delete 'check))
        #:import-path "kernel.org/pub/linux/libs/security/libcap/psx"))
    (home-page "https://kernel.org/pub/linux/libs/security/libcap/psx")
    (synopsis "")
    (description
     "Package psx provides support for system calls that are run simultaneously on all
threads under Linux.")
    (license license:gpl2)))

(define-public go-github-com-google-go-attestation
  (package
    (name "go-github-com-google-go-attestation")
    (version "0.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-attestation")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1kh5fv34h7n4mfrb541742fx264sviymg52ba6h896f6wiq5igan"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/go-attestation"))
    (propagated-inputs (list go-golang-org-x-sys go-github-com-google-go-tspi
                             go-github-com-google-go-tpm-tools
                             go-github-com-google-go-tpm
                             go-github-com-google-go-cmp))
    (home-page "https://github.com/google/go-attestation")
    (synopsis "Go-Attestation")
    (description
     "Go-Attestation abstracts remote attestation operations across a variety of
platforms and TPMs, enabling remote validation of machine identity and state.
This project attempts to provide high level primitives for both client and
server logic.")
    (license license:asl2.0)))

(define-public go-github-com-foxboron-go-tpm-keyfiles
  (package
    (name "go-github-com-foxboron-go-tpm-keyfiles")
    (version "0.0.0-20240805214234-f870d6f1ff68")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/go-tpm-keyfiles")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0j9agr3ax1n47wapy5gq5dcj5kpjpvb708m9j2lpx6a5ra869a0a"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/foxboron/go-tpm-keyfiles"))
    (propagated-inputs (list go-golang-org-x-crypto
                             go-github-com-google-go-tpm))
    (home-page "https://github.com/foxboron/go-tpm-keyfiles")
    (synopsis "go-tpm-keyfile")
    (description
     "This package implements the ASN.1 Specification for TPM 2.0 Key Files.")
    (license license:expat)))

(define-public go-github-com-google-go-tspi
  (package
    (name "go-github-com-google-go-tspi")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-tspi")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ql299zpkjrh7nffvasspf940b9gdi42acfzkwbkf0bsdciqs07r"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/go-tspi"))
    (propagated-inputs (list go-github-com-google-certificate-transparency-go))
    (home-page "https://github.com/google/go-tspi")
    (synopsis
     "go-tspi - Go bindings and support code for libtspi and tpm communication")
    (description
     "This is a library providing a set of bindings for communication between code
written in Go and libtspi, the library responsible for providing a TPM control
interface.  It consists of the following components:.")
    (license license:asl2.0)))

(define-public go-github-com-google-go-tpm-tools
  (package
    (name "go-github-com-google-go-tpm-tools")
    (version "0.4.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-tpm-tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02ivd2jqsvbsfzmzn1w5v3z4cv51lyykwdvwks83k1m4p4kwpxsk"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/go-tpm-tools"))
    (propagated-inputs (list go-google-golang-org-protobuf
                             go-github-com-google-logger
                             go-github-com-google-go-tpm
                             go-github-com-google-go-tdx-guest
                             go-github-com-google-go-sev-guest
                             go-github-com-google-go-cmp
                             go-github-com-google-go-attestation))
    (home-page "https://github.com/google/go-tpm-tools")
    (synopsis "Go-TPM tools")
    (description
     "The @@code{go-tpm-tools} module is a
@@url{https://trustedcomputinggroup.org/resource/trusted-platform-module-2-0-a-brief-introduction/,TPM
2.0} support library designed to complement
@@url{https://github.com/google/go-tpm,Go-TPM}.")
    (license license:asl2.0)))

(define-public go-github-com-google-certificate-transparency-go
  (package
    (name "go-github-com-google-certificate-transparency-go")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/certificate-transparency-go")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ayhl3si29g6z5xr7px0r464iqx9k5m9hrk36wrihwz42w9dcacn"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/certificate-transparency-go"))
    (propagated-inputs (list go-k8s-io-klog-v2
                             go-gopkg-in-yaml-v3
                             go-google-golang-org-protobuf
                             go-google-golang-org-grpc
                             go-golang-org-x-time
                             go-golang-org-x-net
                             go-golang-org-x-crypto
                             go-go-etcd-io-etcd-v3
                             go-go-etcd-io-etcd-etcdctl-v3
                             go-go-etcd-io-etcd-client-v3
                             go-github-com-transparency-dev-merkle
                             go-github-com-tomasen-realip
                             go-github-com-spf13-pflag
                             go-github-com-spf13-cobra
                             go-github-com-sergi-go-diff
                             go-github-com-rs-cors
                             go-github-com-prometheus-client-golang
                             go-github-com-mattn-go-sqlite3
                             go-github-com-kylelemons-godebug
                             go-github-com-hashicorp-golang-lru-v2
                             go-github-com-gorilla-mux
                             go-github-com-google-trillian
                             go-github-com-google-go-cmp
                             go-github-com-golang-mock
                             go-github-com-go-sql-driver-mysql
                             go-github-com-fullstorydev-grpcurl
                             go-github-com-data-dog-go-sqlmock))
    (home-page "https://github.com/google/certificate-transparency-go")
    (synopsis "Certificate Transparency: Go Code")
    (description
     "Package ct holds core types and utilities for Certificate Transparency.")
    (license license:asl2.0)))

(define-public go-google-golang-org-grpc
  (package
    (name "go-google-golang-org-grpc")
    (version "1.67.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/grpc/grpc-go")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cb1nvzgkw2m79kix8w52vz0xmwhylz8l210idy40pvc7vbx6cwc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/grpc"))
    (propagated-inputs (list go-google-golang-org-protobuf
                             go-google-golang-org-genproto-googleapis-rpc
                             go-golang-org-x-sys
                             go-golang-org-x-sync
                             go-golang-org-x-oauth2
                             go-golang-org-x-net
                             go-github-com-google-uuid
                             go-github-com-google-go-cmp
                             go-github-com-golang-glog
                             go-github-com-envoyproxy-go-control-plane
                             go-github-com-cncf-xds-go
                             go-github-com-cespare-xxhash-v2))
    (home-page "https://google.golang.org/grpc")
    (synopsis "gRPC-Go")
    (description "Package grpc implements an RPC system called @code{gRPC}.")
    (license license:asl2.0)))

(define-public go-go-etcd-io-etcd-v3
  (package
    (name "go-go-etcd-io-etcd-v3")
    (version "3.5.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/etcd-io/etcd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pycvylpsp9bbzknf910qk2kcqy5rmaz1zx9qdrb84ky0xdk1gb3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:go 1.22
      #:import-path "go.etcd.io/etcd/v3"
      #:unpack-path "go.etcd.io/etcd/v3"))
    (propagated-inputs (list go-gopkg-in-cheggaaa-pb-v1
                             go-google-golang-org-grpc
                             go-golang-org-x-time
                             go-go-uber-org-zap
                             go-go-etcd-io-bbolt
                             go-github-com-spf13-cobra
                             go-github-com-dustin-go-humanize
                             go-github-com-bgentry-speakeasy))
    (home-page "https://go.etcd.io/etcd/v3")
    (synopsis "etcd")
    (description
     "@@strong{Note}: The @@code{main} branch may be in an during development.  For
stable versions, see @@url{https://github.com/etcd-io/etcd/releases,releases}.")
    (license license:asl2.0)))

(define-public go-go-etcd-io-etcd-etcdctl-v3
  (package
    (name "go-go-etcd-io-etcd-etcdctl-v3")
    (version "3.5.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/etcd-io/etcd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pycvylpsp9bbzknf910qk2kcqy5rmaz1zx9qdrb84ky0xdk1gb3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:go 1.22
      #:import-path "go.etcd.io/etcd/etcdctl/v3"
      #:unpack-path "go.etcd.io/etcd/etcdctl/v3"))
    (propagated-inputs (list go-gopkg-in-cheggaaa-pb-v1
                             go-google-golang-org-grpc
                             go-golang-org-x-time
                             go-go-uber-org-zap
                             go-github-com-urfave-cli
                             go-github-com-spf13-pflag
                             go-github-com-spf13-cobra
                             go-github-com-olekukonko-tablewriter
                             go-github-com-dustin-go-humanize
                             go-github-com-bgentry-speakeasy))
    (home-page "https://go.etcd.io/etcd/etcdctl/v3")
    (synopsis "etcdctl")
    (description "etcdctl is a command line application that controls etcd.")
    (license license:asl2.0)))

(define-public go-go-etcd-io-etcd-client-v3
  (package
    (name "go-go-etcd-io-etcd-client-v3")
    (version "3.5.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/etcd-io/etcd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pycvylpsp9bbzknf910qk2kcqy5rmaz1zx9qdrb84ky0xdk1gb3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:go 1.22
      #:import-path "go.etcd.io/etcd/client/v3"
      #:unpack-path "go.etcd.io/etcd/client/v3"))
    (propagated-inputs (list go-sigs-k8s-io-yaml
                             go-google-golang-org-grpc
                             go-go-uber-org-zap
                             go-github-com-prometheus-client-golang
                             go-github-com-grpc-ecosystem-go-grpc-prometheus
                             go-github-com-dustin-go-humanize))
    (home-page "https://go.etcd.io/etcd/client/v3")
    (synopsis "etcd/clientv3")
    (description
     "Package clientv3 implements the official Go etcd client for v3.")
    (license license:asl2.0)))

(define-public go-github-com-transparency-dev-merkle
  (package
    (name "go-github-com-transparency-dev-merkle")
    (version "0.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/transparency-dev/merkle")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03yzjzc8rmvxy8vy6jwgjyir8lplw19xikl0bvbiy5g3gy2wi7qy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/transparency-dev/merkle"))
    (propagated-inputs (list go-github-com-google-go-cmp))
    (home-page "https://github.com/transparency-dev/merkle")
    (synopsis "Merkle")
    (description
     "Package merkle provides Merkle tree interfaces and implementation.")
    (license license:asl2.0)))

(define-public go-github-com-tomasen-realip
  (package
    (name "go-github-com-tomasen-realip")
    (version "0.0.0-20180522021738-f0c99a92ddce")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tomasen/realip")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1iz2cwks2ywwvvnbfmw3pfyz4ql7z0f8s9sdj6pzirpp75zar9nn"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/tomasen/realip"))
    (home-page "https://github.com/tomasen/realip")
    (synopsis "RealIP")
    (description
     "Go package that can be used to get client's real public IP, which usually useful
for logging HTTP server.")
    (license license:expat)))

(define-public go-github-com-google-trillian
  (package
    (name "go-github-com-google-trillian")
    (version "1.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/trillian")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vd80ribxzc0k7m61iawjjrwmv777xn6g555sm0qdiflb3wnxd3m"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/trillian"))
    (propagated-inputs (list go-k8s-io-klog-v2
                             go-gopkg-in-yaml-v2
                             go-google-golang-org-protobuf
                             go-google-golang-org-grpc-cmd-protoc-gen-go-grpc
                             go-google-golang-org-grpc
                             go-google-golang-org-genproto-googleapis-rpc
                             go-google-golang-org-genproto-googleapis-api
                             go-google-golang-org-genproto
                             go-google-golang-org-api
                             go-golang-org-x-tools
                             go-golang-org-x-sys
                             go-golang-org-x-sync
                             go-golang-org-x-crypto
                             go-go-opencensus-io
                             go-go-etcd-io-etcd-v3
                             go-go-etcd-io-etcd-server-v3
                             go-go-etcd-io-etcd-etcdctl-v3
                             go-go-etcd-io-etcd-client-v3
                             go-github-com-transparency-dev-merkle
                             go-github-com-pseudomuto-protoc-gen-doc
                             go-github-com-prometheus-client-model
                             go-github-com-prometheus-client-golang
                             go-github-com-lib-pq
                             go-github-com-letsencrypt-pkcs11key-v4
                             go-github-com-grpc-ecosystem-go-grpc-middleware
                             go-github-com-google-go-licenses-v2
                             go-github-com-google-go-cmp
                             go-github-com-google-btree
                             go-github-com-golang-mock
                             go-github-com-go-sql-driver-mysql
                             go-github-com-go-redis-redis
                             go-github-com-fullstorydev-grpcurl
                             go-github-com-cockroachdb-cockroach-go-v2
                             go-github-com-apache-beam-sdks-v2
                             go-contrib-go-opencensus-io-exporter-stackdriver
                             go-cloud-google-com-go-spanner
                             go-bitbucket-org-creachadair-shell))
    (home-page "https://github.com/google/trillian")
    (synopsis "Trillian: General Transparency")
    (description
     "Package trillian contains the generated protobuf code for the Trillian API.")
    (license license:asl2.0)))

(define-public go-github-com-golang-mock
  (package
    (name "go-github-com-golang-mock")
    (version "1.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/mock")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hara8j0x431njjhqxfrg1png7xa1gbrpwza6ya4mwlx76hppap4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/mock"))
    (propagated-inputs (list go-golang-org-x-tools go-golang-org-x-mod))
    (home-page "https://github.com/golang/mock")
    (synopsis "gomock")
    (description
     "gomock is a mocking framework for the @@url{http://golang.org/,Go programming
language}.  It integrates well with Go's built-in @@code{testing} package, but
can be used in other contexts too.")
    (license license:asl2.0)))

(define-public go-github-com-fullstorydev-grpcurl
  (package
    (name "go-github-com-fullstorydev-grpcurl")
    (version "1.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fullstorydev/grpcurl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bid69qdf9wgl7339ml16zzs7n0jg4wd042x5b8rbygqj0wlan9r"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/fullstorydev/grpcurl"))
    (propagated-inputs (list go-google-golang-org-protobuf
                             go-google-golang-org-grpc
                             go-github-com-jhump-protoreflect
                             go-github-com-golang-protobuf))
    (home-page "https://github.com/fullstorydev/grpcurl")
    (synopsis "gRPCurl")
    (description
     "Package grpcurl provides the core functionality exposed by the grpcurl command,
for dynamically connecting to a server, using the reflection service to inspect
the server, and invoking RPCs.  The grpcurl command-line tool constructs a
@code{DescriptorSource}, based on the command-line parameters, and supplies an
@code{InvocationEventHandler} to supply request data (which can come from
command-line args or the process's stdin) and to log the events (to the
process's stdout).")
    (license license:expat)))

(define-public go-github-com-data-dog-go-sqlmock
  (package
    (name "go-github-com-data-dog-go-sqlmock")
    (version "1.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/DATA-DOG/go-sqlmock")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vpvdx9hwmx9gm27aq5r5219xpaxz0gy4q1iqskk4saz05bspn0f"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/DATA-DOG/go-sqlmock"))
    (propagated-inputs (list go-github-com-kisielk-sqlstruct))
    (home-page "https://github.com/DATA-DOG/go-sqlmock")
    (synopsis "Sql driver mock for Golang")
    (description
     "Package sqlmock is a mock library implementing sql driver.  Which has one and
only purpose - to simulate any sql driver behavior in tests, without needing a
real database connection.  It helps to maintain correct **TDD** workflow.")
    (license license:bsd-3)))

(define-public go-google-golang-org-genproto-googleapis-rpc
  (package
    (name "go-google-golang-org-genproto-googleapis-rpc")
    (version "0.0.0-20240924160255-9d4c2d233b61")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/googleapis/go-genproto")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pnfb2qqzkpnjjrj4cgv2qvv4w6gj3pb7nk968km8akv4qmzllmp"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/genproto/googleapis/rpc"))
    (propagated-inputs (list go-google-golang-org-protobuf))
    (home-page "https://google.golang.org/genproto/googleapis/rpc")
    (synopsis "")
    (description "")
    (license license:asl2.0)))

(define-public go-github-com-envoyproxy-go-control-plane
  (package
    (name "go-github-com-envoyproxy-go-control-plane")
    (version "0.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/envoyproxy/go-control-plane")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1s9ybjmxb9gmy5i8n158himi61clqqh5bwjq5jw4cidv1h26i0ln"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/envoyproxy/go-control-plane"))
    (propagated-inputs (list go-google-golang-org-protobuf
                        go-google-golang-org-grpc
                        go-google-golang-org-genproto-googleapis-rpc
                        go-google-golang-org-genproto-googleapis-api
                        go-go-uber-org-goleak
                        go-go-opentelemetry-io-proto-otlp
                        go-github-com-stretchr-testify
                        go-github-com-prometheus-client-model
                        go-github-com-planetscale-vtprotobuf
                        go-github-com-google-go-cmp
                        go-github-com-envoyproxy-protoc-gen-validate
                        go-github-com-cncf-xds-go
                        go-github-com-census-instrumentation-opencensus-proto))
    (home-page "https://github.com/envoyproxy/go-control-plane")
    (synopsis "control-plane")
    (description
     "This repository contains a Go-based implementation of an API server that
implements the discovery service APIs defined in
@@url{https://github.com/envoyproxy/data-plane-api,data-plane-api}.")
    (license license:asl2.0)))

(define-public go-github-com-cncf-xds-go
  (package
    (name "go-github-com-cncf-xds-go")
    (version "0.0.0-20240905190251-b4127c9b8d78")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cncf/xds")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04wg9722v7mgn4ndkwbahcpxkhx6hw842h2r1qfc6xrryp8l13hr"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/cncf/xds/go"
      #:unpack-path "github.com/cncf/xds"))
    (propagated-inputs (list go-google-golang-org-protobuf
                             go-google-golang-org-grpc
                             go-google-golang-org-genproto-googleapis-api
                             go-github-com-envoyproxy-protoc-gen-validate
                             go-cel-dev-expr))
    (home-page "https://github.com/cncf/xds")
    (synopsis "")
    (description "")
    (license license:asl2.0)))

(define-public go-google-golang-org-genproto-googleapis-api
  (package
    (name "go-google-golang-org-genproto-googleapis-api")
    (version "0.0.0-20240924160255-9d4c2d233b61")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/googleapis/go-genproto")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pnfb2qqzkpnjjrj4cgv2qvv4w6gj3pb7nk968km8akv4qmzllmp"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/genproto/googleapis/api"))
    (propagated-inputs (list go-google-golang-org-protobuf
                             go-google-golang-org-grpc
                             go-google-golang-org-genproto-googleapis-rpc))
    (home-page "https://google.golang.org/genproto/googleapis/api")
    (synopsis "")
    (description "")
    (license license:asl2.0)))

(define-public go-go-opentelemetry-io-proto-otlp
  (package
    (name "go-go-opentelemetry-io-proto-otlp")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/open-telemetry/opentelemetry-proto-go")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hczl3xbkszf6rggbkail9z0ahm2vyfmc7i5ysp1v1whxpxgvy7j"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "go.opentelemetry.io/proto/otlp"))
    (propagated-inputs (list go-google-golang-org-protobuf
                             go-google-golang-org-grpc
                             go-github-com-grpc-ecosystem-grpc-gateway-v2))
    (home-page "https://go.opentelemetry.io/proto/otlp")
    (synopsis "")
    (description "")
    (license license:asl2.0)))

(define-public go-github-com-planetscale-vtprotobuf
  (package
    (name "go-github-com-planetscale-vtprotobuf")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/planetscale/vtprotobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bms8rrg8wrm3x9mspqrzzix24vjgi3p5zzbw108ydr1rnarwblf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/planetscale/vtprotobuf"))
    (propagated-inputs (list go-google-golang-org-protobuf
                             go-google-golang-org-grpc
                             go-github-com-stretchr-testify))
    (home-page "https://github.com/planetscale/vtprotobuf")
    (synopsis ", the Vitess Protocol Buffers compiler")
    (description
     "This repository provides the @@code{protoc-gen-go-vtproto} plug-in for
@@code{protoc}, which is used by Vitess to generate optimized marshall &
unmarshal code.")
    (license license:bsd-3)))

(define-public go-github-com-envoyproxy-protoc-gen-validate
  (package
    (name "go-github-com-envoyproxy-protoc-gen-validate")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bufbuild/protoc-gen-validate")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yw8r45ykziz3bkfxi8y15kdakip8rjr2r2mqyx8ld8c12mcr3j1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/envoyproxy/protoc-gen-validate"))
    (propagated-inputs (list go-google-golang-org-protobuf go-golang-org-x-net
                             go-github-com-lyft-protoc-gen-star-v2
                             go-github-com-iancoleman-strcase))
    (home-page "https://github.com/envoyproxy/protoc-gen-validate")
    (synopsis "protoc-gen-validate (PGV)")
    (description
     "PGV is a protoc plugin to generate polyglot message validators.  While protocol
buffers effectively guarantee the types of structured data, they cannot enforce
semantic rules for values.  This plugin adds support to protoc-generated code to
validate such constraints.")
    (license license:asl2.0)))

(define-public go-github-com-census-instrumentation-opencensus-proto
  (package
    (name "go-github-com-census-instrumentation-opencensus-proto")
    (version "0.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/census-instrumentation/opencensus-proto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zda7v8fqbc2hamnwajdwr9742nznajxgcw636n570v8k5ahrymw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/census-instrumentation/opencensus-proto"))
    (propagated-inputs (list go-google-golang-org-protobuf
                             go-google-golang-org-grpc
                             go-github-com-grpc-ecosystem-grpc-gateway-v2))
    (home-page "https://github.com/census-instrumentation/opencensus-proto")
    (synopsis
     "OpenCensus Proto - Language Independent Interface Types For OpenCensus")
    (description
     "Census provides a framework to define and collect stats against metrics and to
break those stats down across user-defined dimensions.")
    (license license:asl2.0)))

(define-public go-github-com-netflix-go-expect
  (package
    (name "go-github-com-netflix-go-expect")
    (version "0.0.0-20220104043353-73e0943537d2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Netflix/go-expect")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zkvhnc4ii6ygvcsj54ng0kql26rnny7l3hy1w61g88mxjsww1b9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/Netflix/go-expect"))
    (propagated-inputs (list go-github-com-stretchr-testify
                             go-github-com-creack-pty))
    (home-page "https://github.com/Netflix/go-expect")
    (synopsis "go-expect")
    (description
     "Package expect provides an expect-like interface to automate control of
applications.  It is unlike expect in that it does not spawn or manage process
lifecycle.  This package only focuses on expecting output and sending input
through it's psuedoterminal.")
    (license license:asl2.0)))

(define-public go-go-mozilla-org-pkcs7
  (package
    (name "go-go-mozilla-org-pkcs7")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mozilla-services/pkcs7")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0n9z6qv1rxhrdy2h7glidvma39d4fhly5r5lm445pj6ka6ss3xq9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "go.mozilla.org/pkcs7"))
    (home-page "https://go.mozilla.org/pkcs7")
    (synopsis "pkcs7")
    (description
     "Package pkcs7 implements parsing and generation of some PKCS#7 structures.")
    (license license:expat)))

(define-public go-github-com-foxboron-go-uefi-authenticode
  (package
    (name "go-github-com-foxboron-go-uefi-authenticode")
    (version "0.0.0-20240805124652-e2076f0e58ca")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/go-uefi")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a3aaddm2zk3p1r25shfy6z7xwj15zzx6ym3g5s1pxi0gzy90mgj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/foxboron/go-uefi"
      #:import-path "github.com/foxboron/go-uefi/authenticode"))
    (propagated-inputs (list go-github-com-spf13-afero
                             go-github-com-netflix-go-expect
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             go-golang-org-x-crypto
                             go-go-mozilla-org-pkcs7
                             go-github-com-pkg-errors))
    (home-page "https://github.com/foxboron/go-uefi")
    (synopsis "go-uefi")
    (description
     "This package provides a UEFI library written to interact with Linux efivars.
The goal is to provide a Go library to enable application authors to better
utilize secure boot and UEFI. This also includes unit-testing to ensure the
library is compatible with existing tools, and integration tests to ensure the
library is able of deal with future UEFI revisions.")
    (license license:expat)))
    
(define-public go-github-com-foxboron-go-uefi-efi
  (package
    (name "go-github-com-foxboron-go-uefi-efi")
    (version "0.0.0-20240805124652-e2076f0e58ca")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/go-uefi")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a3aaddm2zk3p1r25shfy6z7xwj15zzx6ym3g5s1pxi0gzy90mgj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/foxboron/go-uefi"
      #:import-path "github.com/foxboron/go-uefi/efi"))
    (propagated-inputs (list go-github-com-spf13-afero
                             go-github-com-netflix-go-expect
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             go-golang-org-x-crypto
                             go-go-mozilla-org-pkcs7
                             go-github-com-pkg-errors))
    (home-page "https://github.com/foxboron/go-uefi")
    (synopsis "go-uefi")
    (description
     "This package provides a UEFI library written to interact with Linux efivars.
The goal is to provide a Go library to enable application authors to better
utilize secure boot and UEFI. This also includes unit-testing to ensure the
library is compatible with existing tools, and integration tests to ensure the
library is able of deal with future UEFI revisions.")
    (license license:expat)))
    
(define-public go-github-com-foxboron-go-uefi-efivar
  (package
    (name "go-github-com-foxboron-go-uefi-efivar")
    (version "0.0.0-20240805124652-e2076f0e58ca")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/go-uefi")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a3aaddm2zk3p1r25shfy6z7xwj15zzx6ym3g5s1pxi0gzy90mgj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/foxboron/go-uefi"
      #:import-path "github.com/foxboron/go-uefi/efivar"))
    (propagated-inputs (list go-github-com-spf13-afero
                             go-github-com-netflix-go-expect
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             go-golang-org-x-crypto
                             go-go-mozilla-org-pkcs7
                             go-github-com-pkg-errors))
    (home-page "https://github.com/foxboron/go-uefi")
    (synopsis "go-uefi")
    (description
     "This package provides a UEFI library written to interact with Linux efivars.
The goal is to provide a Go library to enable application authors to better
utilize secure boot and UEFI. This also includes unit-testing to ensure the
library is compatible with existing tools, and integration tests to ensure the
library is able of deal with future UEFI revisions.")
    (license license:expat)))
    
(define-public go-github-com-foxboron-go-uefi-efivarfs
  (package
    (name "go-github-com-foxboron-go-uefi-efivarfs")
    (version "0.0.0-20240805124652-e2076f0e58ca")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/go-uefi")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a3aaddm2zk3p1r25shfy6z7xwj15zzx6ym3g5s1pxi0gzy90mgj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/foxboron/go-uefi"
      #:import-path "github.com/foxboron/go-uefi/efivarfs"))
    (propagated-inputs (list go-github-com-spf13-afero
                             go-github-com-netflix-go-expect
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             go-golang-org-x-crypto
                             go-go-mozilla-org-pkcs7
                             go-github-com-pkg-errors))
    (home-page "https://github.com/foxboron/go-uefi")
    (synopsis "go-uefi")
    (description
     "This package provides a UEFI library written to interact with Linux efivars.
The goal is to provide a Go library to enable application authors to better
utilize secure boot and UEFI. This also includes unit-testing to ensure the
library is compatible with existing tools, and integration tests to ensure the
library is able of deal with future UEFI revisions.")
    (license license:expat)))
    
(define-public go-github-com-foxboron-go-uefi-pkcs7
  (package
    (name "go-github-com-foxboron-go-uefi-pkcs7")
    (version "0.0.0-20240805124652-e2076f0e58ca")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/go-uefi")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a3aaddm2zk3p1r25shfy6z7xwj15zzx6ym3g5s1pxi0gzy90mgj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:unpack-path "github.com/foxboron/go-uefi"
      #:import-path "github.com/foxboron/go-uefi/pkcs7"))
    (propagated-inputs (list go-github-com-spf13-afero
                             go-github-com-netflix-go-expect
                             go-golang-org-x-text
                             go-golang-org-x-sys
                             go-golang-org-x-crypto
                             go-go-mozilla-org-pkcs7
                             go-github-com-pkg-errors))
    (home-page "https://github.com/foxboron/go-uefi")
    (synopsis "go-uefi")
    (description
     "This package provides a UEFI library written to interact with Linux efivars.
The goal is to provide a Go library to enable application authors to better
utilize secure boot and UEFI. This also includes unit-testing to ensure the
library is compatible with existing tools, and integration tests to ensure the
library is able of deal with future UEFI revisions.")
    (license license:expat)))
