#lang racket
(require web-server/servlet
         web-server/servlet-env
         json
         racket/system) ; For executing external scripts

(define (start req)
  ;; Execute the Margrave DSL script and capture stdout and stderr
  (define-values (exit-code stdout stderr)
    (let ([stdout-port (open-output-string)]
          [stderr-port (open-output-string)])
      (parameterize ([current-output-port stdout-port]
                     [current-error-port stderr-port])
        (values
         (system/exit-code "/usr/bin/racket /app/analysis.rkt")
         (get-output-string stdout-port)
         (get-output-string stderr-port)))))

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