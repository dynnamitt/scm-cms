#! /usr/bin/csi -script
(require 'argsparse )
(use spiffy)
(use intarweb)


(server-port (cdr (assoc 'port config)))

;; When dropping privileges, switch to this user
;(spiffy-user (cdr (assoc 'user config)))
;(spiffy-group (cdr (assoc 'user config)))

(print "starting on port: " (server-port))

(define (main/hnd config)
  (lambda (continue)
     (print (request-uri (current-request)))
     (send-status 'ok config)))

(vhost-map `( 
              (".*" . ,(main/hnd "accepted"))))
(start-server)
