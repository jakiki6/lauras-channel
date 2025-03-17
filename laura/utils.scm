(define-module (laura utils)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 textual-ports))

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
                         (http-get url)) urls)))
    (lambda (checkout)
      (let ((cwd (getcwd)))
        (begin
          (chdir checkout)
          (map (lambda (patch)
                 (let ((port (open-output-pipe "patch -p1 --no-backup-if-mismatch")))
                        (put-string port patch)
                        (put-string port "\n")
                        (close-port port))
                   ) patches)
          (chdir cwd))))))
