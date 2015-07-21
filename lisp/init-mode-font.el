(font-lock-add-keywords 'emacs-lisp-mode
                        '(("\\(\\\\\\)"
                           (0 (progn (compose-region (match-beginning 1) (match-end 1) ?λ) nil)))))

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\(lambda\\)\\>"
                           (0 (progn (compose-region (match-beginning 1) (match-end 1) ?λ) nil)))))

(provide 'init-mode-font)
