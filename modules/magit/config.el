(require 'magit)
(require 'magit-filenotify)

(global-set-key (kbd "C-c m") #'magit)
(add-hook 'magit-status-mode-hook 'magit-filenotify-mode)
