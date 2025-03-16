(define-module (laura utils)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 textual-ports)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix channels)
  #:use-module (guix build-system channel))

(define guix-channel
  (package
    (source
     %default-guix-channel)
    (build-system channel-build-system)
    (name "guix-channel")
    (version "0")
    (synopsis "")
    (description "")
    (license #f)
    (home-page "")))

(define (http-get uri)
  (let* ((port (open-input-pipe (string-append "curl -sL " uri)))
         (body (get-string-all port)))
    (begin
      (close-port port) body)))

(define-public (patched-upstream-guix issues)
  (let* ((urls (map (lambda (issue)
                      (string-append "https://issues.guix.gnu.org/issue/"
                                     (number->string (car issue))
                                     "/attachment/"
                                     (string-join (map number->string
                                                       (cdr issue)) "/")))
                    issues))
         (patches (map (lambda (url)
                         (plain-file "guix-patch"
                                     (http-get url))) urls)))
    (channel
      (name 'guix)
      (url "https://git.savannah.gnu.org/git/guix.git")
      (location (computed-file "patched-guix"
                               #~())))))
