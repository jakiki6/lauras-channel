(define-module (laura home services audio)
  #:use-module (guix gexp)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu packages pulseaudio))

(define (home-pulseaudio-shepherd-service config)
  (list (shepherd-service (provision '(pulseaudio))
                          (documentation "Start pulseaudio")
                          (start #~(make-forkexec-constructor (list (string-append #$pulseaudio
                                                                     "/bin/pulseaudio"))))
                          (stop #~(make-kill-destructor)))))

(define-public home-pulseaudio-service-type
  (service-type (name 'home-pulseaudio)
                (extensions (list (service-extension
                                   home-shepherd-service-type
                                   home-pulseaudio-shepherd-service)))
                (default-value #f)
                (description
                 "Launch pulseaudio so Discord etc. work properly.")))
