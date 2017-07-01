(require 'helm)
;; Note: this is not in packages because it is a file in helm proper.
(require 'helm-config)
(require 'helm-projectile)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode)
