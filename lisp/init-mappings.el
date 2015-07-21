(global-set-key (kbd "C-,") 'vim-style-o) ; note that this doesn't work in shells because they are dumb
(global-set-key (kbd "C-.") 'vim-style-capital-o) ; note that this doesn't work in shells because they are dumb

(global-unset-key (kbd "C-z"))		;This would sleep emacs so unbound it
(global-unset-key (kbd "C-x C-z"))
(global-set-key (kbd "C-z d") 'diff-buffer-with-current-file)
(global-set-key (kbd "C-z s") 'magit-status)
(global-set-key (kbd "C-z t") 'term)
(global-set-key (kbd "C-z c") 'comment-line)
(global-set-key (kbd "C-z u") 'uncomment-line)
(global-set-key (kbd "C-z q") 'delete-window)
(global-set-key (kbd "C-z v") 'split-window-right)
(global-set-key (kbd "C-z h") 'split-window-below)
(global-set-key (kbd "C-z o") 'delete-other-windows)

(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-S-k") 'kill-line) ; note that this doesn't work in shells because they are dumb

(global-set-key (kbd "C-;") 'kill-start-of-text)
(global-set-key (kbd "C-:") 'kill-start-of-line)

(global-set-key (kbd "M-<") 'my/beginning-of-buffer)
(global-set-key (kbd "M->") 'my/end-of-buffer)

(global-set-key (kbd "C-`") 'list-packages) ; note that this doesn't work in shells because they are dumb

;; (global-set-key (kbd "M-p") 'ace-window)

(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "C-h") (lambda "Use `C-h' to delete the previous character. Use `F1' to access help" (backward-delete-char-untabify 1)))
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "M-h") 'backward-kill-sexp)
(global-set-key (kbd "C-x C-M-h") 'mark-defun)
(global-set-key (kbd "C-x M-h") 'mark-paragraph)
(global-set-key (kbd "C-x C-h") 'help)

(global-set-key (kbd "<return>") (lambda () "Return is disabled, use `C-m', `C-j', or `C-o' instead" (interactive) (message "Return is disabled, use `C-m', `C-j', or `C-o' instead")))
(global-set-key (kbd "<backspace>") (lambda () "Backspace is disabled, use `C-h' instead" (interactive) (message "Backspace is disabled, use `C-h' instead")))
(global-set-key (kbd "<C-backspace>") (lambda () "C-Backspace is disabled, use `C-M-h' instead" (interactive) (message "Backspace is disabled, use `C-h' instead")))
(global-set-key (kbd "<M-backspace>") (lambda () "M-Backspace is disabled, use `C-M-h' instead" (interactive) (message "Backspace is disabled, use `C-h' instead")))
(global-set-key (kbd "<tab>") (lambda () "Tab is disabled, use `C-i' instead" (interactive) (message "Tab is disabled, use `C-i' instead")))

(provide 'init-mappings)
