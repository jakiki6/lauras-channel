(define-module (laura packages ai)
  #:use-module (guix)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix build-system go)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages golang-maths)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-web)
  #:use-module (gnu packages cmake)
  #:use-module (laura packages go-common))

(define-public ollama
  (package
    (name "ollama")
    (version "0.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ollama/ollama")
             (commit "v0.9.1")))
       (file-name (git-file-name name version))
       (modules '((guix build utils)))
       (snippet #~(map (lambda x
                         (substitute* x
                           (("github.com/pdevine/tensor")
                            "gorgonia.org/tensor")))
                       (list "convert/convert_llama4.go"
                             "convert/convert_mistral.go"
                             "convert/convert_mllama.go"
                             "convert/convert_gemma.go"
                             "convert/convert_gemma2_adapter.go"
                             "convert/convert_llama.go"
                             "convert/convert_llama_adapter.go"
                             "convert/tensor.go"
                             "convert/tensor_test.go"
                             "go.mod"
                             "go.sum")))
       (sha256
        (base32 "1h9gan8l70ilsnzjlw2wjsd1bh558fb3xbg06zpbz3b5cilbq5pa"))))
    (build-system go-build-system)
    (arguments
     (list
      #:go go-1.24
      #:unpack-path "github.com/ollama/ollama"
      #:import-path "github.com/ollama/ollama"
      #:phases
      #~(modify-phases %standard-phases
          (delete 'check)
          (delete 'validate-runpath)
          (add-after 'install 'accelerators
            (lambda _
              (begin
                (chdir "src/github.com/ollama/ollama")
                (system "cmake .")
                (system (string-append "make -j"
                                       (number->string (parallel-job-count))))
                (system (string-append "cp -r lib "
                                       #$output))
                (chdir "../../../..")))))))
    (native-inputs (list cmake))
    (inputs (list go-std-1.23
                  go-google-golang-org-protobuf
                  go-golang-org-x-text
                  go-golang-org-x-term
                  go-golang-org-x-sys
                  go-golang-org-x-exp
                  go-golang-org-x-crypto
                  go-github-com-gin-contrib-cors
                  go-golang-org-x-tools
                  go-golang-org-x-image
                  go-gorgonia-org-tensor
                  go-github-com-nlpodyssey-gopickle
                  go-github-com-mattn-go-runewidth
                  go-github-com-google-go-cmp
                  go-github-com-emirpasic-gods-v2
                  go-github-com-dlclark-regexp2-v1.11.5
                  go-github-com-d4l3k-go-bfloat16
                  go-github-com-agnivade-levenshtein
                  go-golang-org-x-sync
                  go-github-com-x448-float16
                  go-github-com-stretchr-testify
                  go-github-com-spf13-cobra
                  go-github-com-olekukonko-tablewriter
                  go-github-com-google-uuid
                  go-github-com-gin-gonic-gin
                  go-github-com-containerd-console))
    (home-page "https://ollama.com")
    (synopsis "Get up and running with large language models.")
    (description
     "Get up and running with Llama 3.3, DeepSeek-R1, Phi-4, Gemma 3, and other large language models.")
    (license license:expat)))
