(require 'cc-mode)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(global-set-key (kbd "C-h") 'delete-backward-char)

(setq vc-follow-symlinks t)
(setq enable-recursive-minibuffers t)

(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'Info-edit 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq-default truncate-lines nil)
(setq-default word-wrap t)
(setq-default truncate-partial-width-windows nil)
(global-visual-line-mode)
