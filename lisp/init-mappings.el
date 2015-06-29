(global-set-key (kbd "C-c d") 'diff-buffer-with-current-file)
(global-set-key (kbd "C-c s") 'magit-status)
(global-set-key (kbd "C-c t") 'term)

(global-set-key (kbd "C-,")        'vim-style-o)
(global-set-key (kbd "C-.")        'vim-style-capital-o)

(global-unset-key (kbd "C-z"))		;This would sleep emacs so unbound it

(global-set-key (kbd "C-a") 'beginning-of-line-text)
(global-set-key (kbd "C-S-a") 'move-beginning-of-line)

(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-S-k") 'kill-line)

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

(provide 'init-mappings)
