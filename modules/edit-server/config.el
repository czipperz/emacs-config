(require 'edit-server)

(when (daemonp) (edit-server-start))
