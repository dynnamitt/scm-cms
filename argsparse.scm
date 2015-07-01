(use srfi-37)

(define help
  (option
    '(#\h "help") #f #f
    (lambda _
      (print "Usage: start.scm [OPTION] ARG ...
             -h  --help    
             -u  --user USER   http daemon user 
             -p  --port N      http daemon listen port")
             (exit))))

(define port
  (option
    '(#\p "port") #t #f
    (lambda (o n x vals)
      (cons `(port ,(string->number x)) vals))))

(define user
  (option
    '(#\u "user") #t #f
    (lambda (o n x vals)
      (cons (cons 'user x) vals))))

(define config
  (reverse (args-fold
    (command-line-arguments)
    (list help port user)
    (lambda (o n x vals)
      (error "unrecognized option" n) )
    cons
    '() )))

; TODOs
; clean out DUP in config var (hash2set?)
; logger-lib
; defaulting to 'help
;
(print* config)
