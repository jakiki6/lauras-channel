(use-modules
  (guix)
  (guix derivations)
  (guix monads))

(define (build package store)
  (run-with-store (open-connection)
    (build-derivations (package->derivation package) %store)))
