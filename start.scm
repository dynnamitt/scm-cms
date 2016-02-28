#! /usr/bin/csi -script
(require 'argsparse )
(use spiffy)


(server-port (cdr (assoc 'port config)))
(root-path "publ_test")

;; When dropping privileges, switch to this user
;(spiffy-user (cdr (assoc 'user config)))
;(spiffy-group (cdr (assoc 'user config)))

(print "starting on port: " (server-port))
(start-server)
