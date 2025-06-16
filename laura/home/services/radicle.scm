(define-module (laura home services radicle)
  #:use-module (guix gexp)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (laura packages radicle))

(define (home-radicle-shepherd-service config)
  (list (shepherd-service (provision '(radicle))
                          (documentation "Start radicle")
                          (start #~(make-forkexec-constructor (list (string-append #$radicle
                                                                     "/bin/radicle-node")
                                                                    "-f")))
                          (stop #~(make-kill-destructor)))))

(define-public home-radicle-service-type
  (service-type (name 'home-radicle)
                (extensions (list (service-extension
                                   home-shepherd-service-type
                                   home-radicle-shepherd-service)))
                (default-value #f)
                (description "Launch the radicle node")))
