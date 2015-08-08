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


(defun my/capitalize-word () "Upcase only current letter and don't affect others, then move to end of word"
  (interactive)
  (insert (upcase (get-byte)))
  (delete-char 1)
  (backward-char)
  (forward-word))


(defun my/end-of-visual-line () "Goes to the end of the current line instead of the beginning of the next one"
  (interactive)
  (end-of-visual-line) (backward-char))


(defun my/beginning-of-buffer () "Goes to the beginning
 of the buffer without moving the mark"
  (interactive)
  (goto-char (point-min)))
(defun my/end-of-buffer () "Goes to the end of the buffer
 without moving the mark"
  (interactive)
  (goto-char (point-max)))


(defun insert-perl-regexp (sep) "Take variable at point and make it into regexp.
Place cursor at start of variable (name or `$' works) to use.

``sep'' is the separator to use.

It will be chosen from ``;/|,.*&^%!@#$)'', default is ``.''

Ex: with `/' as `sep':

    $<cur>xs
    ``M-x insert-perl-regexp''
    $(echo \"$xs\" | perl -pe 's/<cur>//')"
  (interactive "cSeperator:")
  (let ((s (pcase sep
             (59 ";")
             (47 "/")
             (124 "|")
             (44 ",")
             (46 ".")
             (42 "*")
             (38 "&")
             (94 "^")
             (37 "%")
             (33 "!")
             (64 "@")
             (35 "#")
             (36 "$")
             (41 ")")
             (t "."))))
    (if (eq (get-byte) 36) (forward-char) nil) ;$
    (insert "(echo \"$")
    (forward-word) (while (eq (get-byte) 95) (forward-word) nil) ;_
    (insert "\" | perl -pe 's")
    (insert (format "%s%s%s')" s s s))
    (backward-char 4)))


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
   (let ((reg-t (get-register ?t))
         (reg-n (get-register ?n))
         (reg-f (get-register ?f)))
     (set-register ?f "doIt")
     (back-to-indentation)

     (let ((reg (get-region (point) (progn (forward-word) (point)))))
       (if (or (equal reg "private")
               (equal reg "public")
               (equal reg "protected"))
           (progn (backward-word)
                  (delete-region (point) (progn (forward-word 2) (backward-word) (point))))
         (backward-word)))
     (insert "public ")
     (forward-word) (backward-word)

     (let ((cur (point)))
       (forward-whitespace 1)
       (backward-char)
       (copy-to-register ?t cur (point))
       (delete-region cur (point))
       (delete-char 1))
     (if (or (equal (get-register ?t) "final")
             (equal (get-register ?t) "static")
             (equal (get-register ?t) "transient"))
         (while (or (equal (get-register ?t) "final")
                    (equal (get-register ?t) "static")
                    (equal (get-register ?t) "transient")) ;gets past `transient' and `final's
           (if (equal (get-register ?t) "final") (set-register ?f nil))
           (let ((cur (point)))
             (forward-whitespace 1)
             (backward-word) (forward-word)
             (copy-to-register ?t cur (point))
             (delete-region cur (point))))
       (prog1 nil (insert " ") (backward-char)))
     (insert (get-register ?t))

     (forward-word) (backward-word)
     (copy-to-register ?n (point) ;name
                       (progn (forward-word) (point)))
     (kill-line) ;remove rest of line

     (backward-word)
     (insert "get")
     (insert (upcase (get-byte)))
     (delete-char 1)
     (forward-word 1)
     (insert "() { return this.")
     (insert-register ?n 1)
     (insert "; }")

     (if (not (null (get-register ?f))) (prog1 nil
                                          (newline-and-indent)
                                          (insert "public void set")
                                          (insert-register ?n)
                                          (my/capitalize-word)
                                          (insert "(")
                                          (insert-register ?t 1)
                                          (insert " ")
                                          (insert-register ?n 1)
                                          (insert ") { this.")
                                          (insert-register ?n 1)
                                          (insert " = ")
                                          (insert-register ?n 1)
                                          (insert "; }")))

     (set-register ?t reg-t)
     (set-register ?n reg-n)
     (set-register ?f reg-f))
   ;; (forward-char)
   ;; ;; (forward-line 2)
   ;; ;; (backward-line -1)
   )

(defun java-get/set-&-align (times) "Runs `java-get/set' a given number of times, then aligns those calls with `{', `=', then `}'.
To use interactively use a prefix argument"
  (interactive "p")
  (let ((cur (point)))
    (while (not (eq 0 times))
      (setq times (1- times))
      (java-get/set)
      (backward-list 3)
      (newline)
      (forward-list 3)
      (backward-list 1)
      (newline)
      (forward-line))
    (align-regexp cur (point) "\\(\\s-*\\)\\((\\|{\\)" 1 1 nil)
    (align-regexp cur (point) "\\(\\s-*\\)="               1 1 nil)
    (align-regexp cur (point) "\\(\\s-*\\)\\(}\\|)\\)"               1 1 nil)))

(defun java-line-private () "Declares current line as public then moves to next"
  (interactive)
  (back-to-indentation)
  (insert "private ")
  (java-fix-semicolons)
  (back-to-indentation))

(defun java-function-public () "Declares current function as public then moves to next"
  (interactive)
  (back-to-indentation)
  (insert "public ")
  (c-end-of-defun)
  (c-end-of-defun)
  (c-beginning-of-defun)
  (back-to-indentation))

(defun java-fix-semicolons () "If no semicolon at end of line, adds it then moves to next line"
  (interactive)
  (move-end-of-line nil)
  (backward-char)
  (if (not (eq (get-byte) 59))
      (progn (forward-char) (insert ";"))
    nil)
  (forward-line))

(defun java-fix-return () "Adds return to beginning of line, then runs `java-fix-semicolons'"
  (interactive)
  (back-to-indentation)
  (insert "return ")
  (java-fix-semicolons))

(defun java-single-method-wrap ()
  "Folds a method onto one line.

Example:

    public String getName() {
        return this.name;
    }

Into

    public String getName() { return this.name; }"
  (interactive)
  (move-end-of-line nil)
  (delete-char 1)
  (just-one-space)
  (move-end-of-line nil)
  (delete-char 1)
  (just-one-space)
  (forward-line))

(defun java-assign-to-set ()
  "Takes an assignment and makes it into a `set' call.
REQUIRES line is all the code."
  (interactive)
  (back-to-indentation)
  (forward-word) (forward-word) (backward-word)
  (insert "set")
  (my/capitalize-word)
  (delete-region (point) (progn (forward-word) (backward-word) (point)))
  (insert "(")
  (end-of-line)
  (backward-char)
  (if (eq (get-byte) 59) nil (forward-char))
  (insert ")")
  (java-fix-semicolons))

(defun groovy-with-to-set ()
  (interactive)
  (end-of-line)
  (backward-delete-char 1)
  (insert ";")
  (back-to-indentation)
  (let ((cur (point)))
    (forward-whitespace 1)
    (forward-char)
    (delete-region cur (point)))
  (backward-char)
  (while (not (eq (point) (save-excursion (end-of-line) (point))))
    (insert "this.set")
    (delete-char 1)
    (my/capitalize-word)
    (delete-char 2)
    (insert "(")
    (forward-whitespace 1)
    (backward-char 2)
    (delete-char 1)
    (insert ");")))

(defun groovy-each-to-for ()
  (interactive)
  (back-to-indentation)
  (insert "for(")
  (let ((cur (point)))
    (insert " it : ")
    (forward-word)
    (delete-region (point) (progn (forward-word) (point)))
    (insert ")")
    (goto-char cur)))

(defun groovy-space-to-parens ()
  (interactive)
  (end-of-line)
  (backward-char)
  (if (eq (get-byte) 59) nil (forward-char))
  (backward-sexp)
  (forward-char)
  (delete-char 1)
  (insert "(")
  (end-of-line)
  (backward-char)
  (if (eq (get-byte) 59) nil (forward-char))
  (insert ")")
  (java-fix-semicolons))

(defun c-prog-sep-semicolon (num)
  (interactive "p")
  (cond ((eq num 0))
        (t  (back-to-indentation)
            (while (not (eq (get-byte) 59))
              (forward-char))
            (forward-char)
            (newline-and-indent)
            (c-prog-sep-semicolon (1- num)))))



(defun fix-indentation ()
  (interactive)
  (my/end-of-buffer)
  (while (not (equal (point) 1))
    (move-beginning-of-line 0)
    (just-one-space)
    (indent-for-tab-command)
    (backward-delete-char-untabify 1)

    (move-end-of-line nil)
    (just-one-space)
    (backward-delete-char-untabify 1)))


(defun interactive-update-packages () "Just type `yes' a few times"
  (interactive)
  (list-packages)
  (package-menu-mark-upgrades)
  (package-menu-execute)
  (keyboard-escape-quit)
  (quit-window))


(defun backward-whitespace ()
  (interactive)
  (while (or (eq (get-byte) 10)
             (eq (get-byte) 32)
             (eq (get-byte) 9))
    (backward-char))
  (while (not (or (eq (get-byte) 10)
                  (eq (get-byte) 32)
                  (eq (get-byte) 9)))
    (backward-char))
  (while (or (eq (get-byte) 10)
             (eq (get-byte) 32)
             (eq (get-byte) 9))
    (backward-char)))


(provide 'init-functions)
