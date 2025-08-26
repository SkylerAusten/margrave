#lang racket
(require web-server/servlet
         web-server/servlet-env)

;; A placeholder for your real Margrave computation
(define (run-margrave-computation input-jsexpr)
  ;; 1. Decode the JSON input from Flask
  (define input-data (jsexpr->string input-jsexpr))
  
  ;; 2. TODO: Call your actual Margrave code with the input-data
  (printf "Racket received: ~a\n" input-data)
  (define result-string (string-append "Computed result for " input-data))
  
  ;; 3. Encode the result back into JSON to send to Flask
  (string->jsexpr (format "{\"result\": \"~a\"}" result-string)))

;; This is our API endpoint
(define (start req)
  (response/jsexpr
   (run-margrave-computation (request-post-jsexpr req))))

(serve/servlet start
               #:port 8000
               #:listen-ip "0.0.0.0"
               #:servlet-path "/compute")