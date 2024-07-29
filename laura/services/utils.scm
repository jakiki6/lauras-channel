(define-module (laura services utils)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu services dbus)
  #:use-module (laura packages utils))

(define (waydroid-activation config)
  #~(system (string-append #$waydroid "/bin/waydroid init")))

(define (waydroid-shepherd-service config)
  (list (shepherd-service
          (provision '(waydroid))
          (requirement '(loopback))
          (documentation "Launch the waydroid container")
          (start #~(make-forkexec-constructor
                     (list (string-append #$waydroid "/bin/waydroid") "container" "start")))
          (stop #~(make-kill-deconstructor)))))

(define-public waydroid-service-type
  (service-type
    (name 'waydroid)
    (extensions
      (list (service-extension
              activation-service-type
              waydroid-activation)
            (service-extension
              shepherd-root-service-type
              waydroid-shepherd-service)
            (service-extension
              dbus-root-service-type
              (lambda (config) (list waydroid)))))
    (default-value #f)
    (description "Run waydroid")))
