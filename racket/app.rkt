#lang racket
(require web-server/servlet
         web-server/servlet-env
         json)

(define (start req)
  (define json-body (request-post-data/raw req))
  (define parsed-data (string->jsexpr (bytes->string/utf-8 json-body)))
  (define num1 (hash-ref parsed-data 'num1 0))
  (define num2 (hash-ref parsed-data 'num2 0))
  (define result (+ num1 num2))
  (response/output
   (lambda (out)
     (displayln (jsexpr->string (hash 'result result)) out))))

(serve/servlet start
               #:port 8000
               #:listen-ip "0.0.0.0"
               #:servlet-path "/compute"
               #:launch-browser? #f) ; Disable browser launch