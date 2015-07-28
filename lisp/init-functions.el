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
  (kill-region (point) (progn (beginning-of-line-text) (point))))


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


(defun java-get/set () "Generate get/set for current java variable.
**THIS WILL DELETE DECLARATION**"
  (interactive)
  (let ((reg-t (get-register ?t)) (reg-n (get-register ?n)))
    (back-to-indentation)
    (kill-word 1)
    (insert "public")
    (forward-word) (backward-word)

    (copy-to-register ?t (point) ;type
                      (progn (forward-word) (point)))
    (while (or (equal (get-register ?t) "final")
               (equal (get-register ?t) "transient")) ;gets past `transient and finals'
      (forward-word) (backward-word)
      (copy-to-register ?t (point) ;type
                        (progn (forward-word) (point))))

    (forward-word) (backward-word) ;resets to beginning of next word
    (copy-to-register ?n (point) ;name
                      (progn (forward-word) (point)))
    (kill-line) ;remove rest of line

    (backward-word)
    (insert "get")
    (capitalize-word 1)
    (insert "() { return this.")
    (insert-register ?n 1)
    (insert "; }")

    (newline-and-indent)
    (insert "public void set")
    (insert-register ?n)
    (capitalize-word 1)
    (insert "(")
    (insert-register ?t 1)
    (insert " ")
    (insert-register ?n 1)
    (insert ") { this.")
    (insert-register ?n 1)
    (insert " = ")
    (insert-register ?n 1)
    (insert "; }")

    (set-register ?t reg-t)
    (set-register ?n reg-n)))


(provide 'init-functions)
