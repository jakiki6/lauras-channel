(define-module (laura home services kde)
  #:use-module (guix gexp)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu packages kde))

(define (home-kdeconnectd-shepherd-service config)
  (list (shepherd-service (provision '(kdeconnect))
                          (documentation "Start kdeconnect")
                          (start #~(make-forkexec-constructor (list (string-append #$kdeconnect
                                                                     "/bin/kdeconnectd"))))
                          (stop #~(make-kill-destructor)))))

(define-public home-kdeconnectd-service-type
  (service-type (name 'home-kdeconnect)
                (extensions (list (service-extension
                                   home-shepherd-service-type
                                   home-kdeconnectd-shepherd-service)))
                (default-value #f)
                (description
                 "Launch kdeconnectd.")))
