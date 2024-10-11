(define-module (laura services utils)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu services dbus)
  #:use-module (gnu packages wine)
  #:use-module (laura packages utils))

(define (waydroid-activation config)
  #~(system (string-append #$waydroid "/bin/waydroid init")))

(define (waydroid-shepherd-service config)
  (list (shepherd-service
          (provision '(waydroid))
          (requirement '(loopback dbus-system))
          (documentation "Launch the waydroid container")
          (start #~(make-forkexec-constructor
                     (list (string-append #$waydroid "/bin/waydroid") "container" "start")
                     #:environment-variables `("PATH=/run/current-system/profile/bin:/run/current-system/profile/sbin")))
          (stop #~(make-kill-destructor)))))

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

(define (wine-binfmt-service config)
  (list (shepherd-service
          (provision '(wine-binfmt))
          (requirement '(file-system-/proc/sys/fs/binfmt_misc))
          (documentation "Do the registration")
          (start #~(lambda _
                     (begin
                       (let ((file (open-file "/proc/sys/fs/binfmt_misc/register" "w")))
                         (begin
                           (display (string-append ":wine64:M::MZ::" #$wine64 "/bin/wine:") file)
                           (close file)))
                        #t)))
          (stop #~(lambda _
                    (begin
                      (delete-file "/proc/sys/fs/binfmt_misc/wine64")
                      #t))))))

(define-public wine-binfmt-service-type
  (service-type
    (name 'wine-binfmt)
    (extensions
      (list (service-extension
              shepherd-root-service-type
              wine-binfmt-service)))
    (default-value #f)
    (description "Register wine as a binfmt handler for exe files.")))
