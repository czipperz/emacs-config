;; C-c commands
; Show unsaved edits
(global-set-key (kbd "C-c d") 'diff-buffer-with-current-file)
(defun diff-buffer-with-current-file () "Shows differences in the current buffer since the last save"
       (interactive)
       (diff-buffer-with-file))
; Show git status
(global-set-key (kbd "C-c s") 'magit-status)
; Terminal
(global-set-key (kbd "C-c t") 'term)

;; Move current line (where Point is) down one
(global-set-key (kbd "M-n") 'move-line-down)
(defun move-line-down () "Moves the current line down by one"
       (interactive)
       (let ((col (current-column)))
	 (forward-line 1)
	 (transpose-lines 1)
	 (forward-line -1)
	 (forward-char col)))

;; Move current line (where Point is) down one
(global-set-key (kbd "M-p") 'move-line-up)
(defun move-line-up () "Moves the current line up by one"
       (interactive)
       (let ((col (current-column)))
	 (transpose-lines 1)
	 (forward-line -2)
	 (forward-char col)))

;; rebind `C-,' to vim style `o'
;; rebind `C-.' to vim styoe `O'
(global-set-key (kbd "C-,")        'vim-style-o)
(defun vim-style-o () "Puts a new line after the current one and puts the Point there"
       (interactive)
       (move-end-of-line nil)
       (newline)
       (indent-for-tab-command))

(global-set-key (kbd "C-.")        'vim-style-capital-o)
(defun vim-style-capital-o () "Puts a new line before the current one and puts the Point there"
       (interactive)
       (forward-line -1)
       (vim-style-o))

;; Unbind `C-z' as its annoying
(global-unset-key (kbd "C-z"))

(provide 'init-mappings)
