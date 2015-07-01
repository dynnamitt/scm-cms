(use srfi-37)

(define port
  (option
    '(#\p "port") #t #f
    (lambda (o n x vals)
      (cons `(port ,(string->number x)) vals)) ))

(print*
  (reverse (args-fold
    (command-line-arguments)
    (list port)
    (lambda (o n x vals)
      (error "unrecognized option" n) )
    cons
    '() )))
