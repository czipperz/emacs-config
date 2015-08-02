(font-lock-add-keywords 'haskell-mode
                        '(("(\\(\\\\\\)"
                           (0 (progn (compose-region (match-beginning 1) (match-end 1) ?λ) nil)))))

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\(lambda () (interactive)\\)"
                           (0 (progn (compose-region (match-beginning 1) (match-end 1) ?Λ) nil)))))

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\(lambda\\)\\>"
                           (0 (progn (compose-region (match-beginning 1) (match-end 1) ?λ) nil)))))

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\(defun\\)\\>"
                           (0 (progn (compose-region (match-beginning 1) (match-end 1) ?δ) nil)))))

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\(interactive\\)\\>"
                           (0 (progn (compose-region (match-beginning 1) (match-end 1) ?ζ) nil)))))

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\(interactive\\)\\>" 1 'font-lock-keyword-face)))

(provide 'init-mode-font)
