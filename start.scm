#! /usr/bin/csi -script
(require 'argsparse ) ;;config
(use spiffy) ;; server-port , current-request , send-status , vhost-map , start-server 
(use intarweb) ;; request-uri


(server-port (cdr (assoc 'port config)))

;; When dropping privileges, switch to this user
;(spiffy-user (cdr (assoc 'user config)))
;(spiffy-group (cdr (assoc 'user config)))

(print "starting on port: " (server-port))

(define (main/hnd conf)
  (lambda (continue)
     (print (request-uri (current-request)))
     (send-status 'ok conf)))

(vhost-map `( (".*" . ,(main/hnd "accepted"))))
(start-server)
