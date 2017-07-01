(require 'cc-mode)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(global-set-key (kbd "C-h") 'delete-backward-char)

(setq vc-follow-symlinks t)
(setq enable-recursive-minibuffers t)
