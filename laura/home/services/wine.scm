(define-module (laura home services wine)
  #:use-module (guix gexp)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu packages wine))

(define (home-wineserver-shepherd-service config)
  (list (shepherd-service
          (provision '(wineserver))
          (documentation "Start wineserver")
          (start #~(lambda _
                     (begin
                       (invoke (string-append #$wine64 "/bin/wineserver") "-p")
                       (invoke (string-append #$wine64 "/bin/wineboot"))
                       #t)))
          (stop #~(lambda _
                     (begin
                       (invoke (string-append #$wine64 "/bin/wineserver") "-k")
                       #t))))))

(define-public home-wineserver-service-type
  (service-type
    (name 'home-wineserver)
    (extensions
      (list (service-extension home-shepherd-service-type
                               home-wineserver-shepherd-service)))
    (default-value #f)
    (description "Launch wineserver in persistent mode")))
