(require 'cc-mode)

;;(set-face-attribute 'default nil :height 420)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(global-set-key (kbd "C-h") #'delete-backward-char)
(global-set-key (kbd "C-x R") #'redraw-display)
(global-unset-key (kbd "C-z"))

(setq vc-follow-symlinks t)
(setq enable-recursive-minibuffers t)
(setq auto-window-vscroll nil)

(require 'dired)
(setq dired-auto-revert-buffer t)

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
(setq-default word-wrap nil)
(setq-default truncate-partial-width-windows nil)
(global-visual-line-mode)

(global-set-key (kbd "C-c RET") #'compile)
