(global-set-key (kbd "C-,") 'vim-style-o) ; note that this doesn't work in shells because they are dumb
(global-set-key (kbd "C-.") 'vim-style-capital-o) ; note that this doesn't work in shells because they are dumb

(global-unset-key (kbd "C-z"))		;This would sleep emacs so unbound it
(global-unset-key (kbd "C-x C-z"))
(global-set-key (kbd "C-z d") 'diff-buffer-with-current-file)
(global-set-key (kbd "C-z s") 'magit-status)
(global-set-key (kbd "C-z t") 'term)

(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-S-k") 'kill-line) ; note that this doesn't work in shells because they are dumb

(global-set-key (kbd "C-;") 'kill-start-of-text)
(global-set-key (kbd "C-:") 'kill-start-of-line)

(global-set-key (kbd "H-c") 'comment-line)
(global-set-key (kbd "H-u") 'uncomment-line)
(global-set-key (kbd "H-q") 'delete-window)
(global-set-key (kbd "H-v") 'split-window-right)
(global-set-key (kbd "H-h") 'split-window-below)
(global-set-key (kbd "H-o") 'delete-other-windows)

(global-set-key (kbd "M-<") 'my/beginning-of-buffer)
(global-set-key (kbd "M->") 'my/end-of-buffer)

(global-set-key (kbd "C-`") 'list-packages) ; note that this doesn't work in shells because they are dumb

;; (global-set-key (kbd "M-p") 'ace-window)

(provide 'init-mappings)
