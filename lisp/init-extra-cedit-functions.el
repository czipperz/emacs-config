(defun cedit-wrap-if () (interactive)
       (cedit-wrap-brace)
       (insert "if () ")
       (backward-char 2))

(defun cedit-wrap-do-while () (interactive)
       (cedit-wrap-brace)
       (insert "do ")
       (forward-list)
       (insert " while ();")
       (backward-char 2))

(defun cedit-wrap-while () (interactive)
       (cedit-wrap-brace)
       (insert "while () ")
       (backward-char 2))

(defun cedit-wrap-for () (interactive)
       (cedit-wrap-brace)
       (insert "for () ")
       (backward-char 2))

(provide 'init-extra-cedit-functions)
