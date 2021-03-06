(use srfi-37)
;; procs overview here
;;    http://srfi.schemers.org/srfi-37/srfi-37.html

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
      (cons (cons 'port (string->number x)) vals))))

(define user
  (option
    '(#\u "user") #t #f
    (lambda (o n x vals)
      (cons (cons 'user x) vals))))

;; TODO only export this one,
;;   embed above funcs inside here
(define config
  (let* ([c-args (command-line-arguments)]
        [cli/a (if 
                 (null? c-args)
                 '("-h")
                 c-args)])
    (reverse 
      (args-fold
        cli/a
        (list help port user)
        (lambda (o n x vals)
          (error "unrecognized option" n) )
        cons
        '() ))))
