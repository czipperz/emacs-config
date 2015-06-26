(defun diff-buffer-with-current-file () "Shows differences in the current buffer since the last save"
       (interactive)
       (diff-buffer-with-file))


(defun move-line-down () "Moves the current line down by one"
       (interactive)
       (let ((col (current-column)))
	 (forward-line 1)
	 (transpose-lines 1)
	 (forward-line -1)
	 (forward-char col)))
(defun move-line-up () "Moves the current line up by one"
       (interactive)
       (let ((col (current-column)))
	 (transpose-lines 1)
	 (forward-line -2)
	 (forward-char col)))


(defun vim-style-o () "Puts a new line after the current one and puts the Point there"
       (interactive)
       (move-end-of-line nil)
       (newline)
       (indent-for-tab-command))
(defun vim-style-capital-o () "Puts a new line before the current one and puts the Point there"
       (interactive)
       (forward-line -1)
       (vim-style-o))


(defun kill-start-of-line () "Kills to the start of the line"
       (interactive)
       (kill-line 0))
(defun kill-start-of-text () "Kills to the start of the text"
       (interactive)
       (let ((curr (point)))
	 (beginning-of-line-text)
	 (kill-region curr (point))))


;; Because the prefix should be the group
(defun package-list () "Display a list of packages.
This first fetches the updated list of packages before
displaying, unless a prefix argument NO-FETCH is specified.
The list is displayed in a buffer named `*Packages*'."
       (interactive)
       (list-packages))


(defun comment-line () "Comments the current line"
       (interactive)
       (save-excursion
	 (move-beginning-of-line 1)
	 (set-mark (point))
	 (move-end-of-line 1)
	 (comment-region (mark) (point))))
(defun uncomment-line () "Uncomments the current line"
       (interactive)
       (save-excursion
	 (move-beginning-of-line 1)
	 (set-mark (point))
	 (move-end-of-line 1)
	 (uncomment-region (mark) (point))))


(provide 'init-functions)
