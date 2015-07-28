(defun diff-buffer-with-current-file () "Shows differences in the current buffer since the last save"
  (interactive)
  (diff-buffer-with-file))


(defun vim-style-o () "Puts a new line after the current one and puts the Point there"
  (interactive)
  (move-end-of-line nil)
  (newline)
  (indent-for-tab-command))
(defun vim-style-capital-o () "Puts a new line before the current one and puts the Point there"
  (interactive)
  (move-beginning-of-line nil)
  (open-line 1)
  (indent-for-tab-command))


(defun kill-start-of-line () "Kills to the start of the line"
  (interactive)
  (kill-line 0))
(defun kill-start-of-text () "Kills to the start of the text"
  (interactive)
  (let ((curr (point)))
    (beginning-of-line-text)
    (kill-region curr (point))))


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


(defun my/beginning-of-buffer () "Goes to the beginning
 of the buffer without moving the mark"
  (interactive)
  (goto-char (point-min)))
(defun my/end-of-buffer () "Goes to the end of the buffer
 without moving the mark"
  (interactive)
  (goto-char (point-max)))


(defun create-tags (dir) "Create `ctags' file for a given directory"
  (interactive "DDirectory: ")
  (shell-command (format "ctags -e -R %s" (directory-file-name dir))))
(defun er-refresh-etags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (interactive)
  (shell-command (if (equal extension nil) "etags -e -R ." (format "etags -e -R *.%s" extension))))
(defadvice find-tag (around refresh-etags activate)
  "Rerun etags and reload tags if tag not found and redo find-tag.
 If buffer is modified, ask about save before running etags"
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
        ad-do-it
      (error (and (buffer-modified-p)
                  (not (ding))
                  (y-or-n-p "Buffer is modified, save it? ")
                  (save-buffer))
             (er-refresh-etags extension)
             ad-do-it))))


(provide 'init-functions)
