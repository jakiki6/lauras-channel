(define-module (laura home services ai)
  #:use-module (guix gexp)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (laura packages ai))

(define (home-ollama-shepherd-service config)
  (list (shepherd-service (provision '(ollama))
                          (documentation "Start the ollama server")
                          (start #~(make-forkexec-constructor (list (string-append #$ollama
                                                                     "/bin/ollama")
                                                                    "serve")))
                          (stop #~(make-kill-destructor)))))

(define-public home-ollama-service-type
  (service-type (name 'home-ollama)
                (extensions (list (service-extension
                                   home-shepherd-service-type
                                   home-ollama-shepherd-service)))
                (default-value #f)
                (description
                 "Launch the ollama server so running ollama works out of the box.")))
