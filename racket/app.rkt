#lang racket
(require web-server/servlet
         web-server/servlet-env
         json
         racket/system) ; For executing external scripts

(define (start req)
  ;; Execute the Margrave DSL script
  (define-values (exit-code stdout stderr)
    (system*/exit-code "/usr/bin/racket" "/app/analysis.rkt"))

  ;; Check if the script executed successfully
  (if (zero? exit-code)
      ;; Return the script's output as JSON
      (response/output
       (lambda (out)
         (write-json (hash 'result stdout) out))) ; Return stdout as JSON
      ;; Return an error if the script failed
      (response/output
       (lambda (out)
         (write-json (hash 'error stderr) out))))) ; Return stderr as JSON

(serve/servlet start
               #:port 8000
               #:listen-ip "0.0.0.0"
               #:servlet-path "/compute"
               #:launch-browser? #f) ; Disable browser launch