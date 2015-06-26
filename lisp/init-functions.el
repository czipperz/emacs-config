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
