#lang racket
(require web-server/servlet
         web-server/servlet-env
         json)
(require margrave)

(define (start req)
  (define json-body (request-post-data/raw req))
  (define parsed-data (string->jsexpr (bytes->string/utf-8 json-body)))

  ;; Example Margrave operations
  (define policy1 (load-policy "*MARGRAVE*/tests/conference1.p"))
  (define policy2 (load-policy "*MARGRAVE*/tests/conference2.p"))
  (define exploration (xml-explore-result->id policy1 "permit(s, a, r)"))
  (define result (xml-make-show-realized-command exploration))

  ;; Return the result as JSON
  (response/output
   (lambda (out)
     (displayln (jsexpr->string (hash 'result result)) out))))

(serve/servlet start
               #:port 8000
               #:listen-ip "0.0.0.0"
               #:servlet-path "/compute"
               #:launch-browser? #f) ; Disable browser launch