(defun font-lock-double-quotes-var (limit)
  "Search for variables in double quoted strings"
  (let (res)
    (while (and (setq res
                      (re-search-forward
                       "\\$\\({#?\\)?\\([[:alpha:]_][[:alnum:]_]*\\|[-#?@!]\\)"
                       limit t))
                (not (eq (nth 3 (syntax-ppss)) ?\"))))))

(defun font-lock-double-quotes-activate ()
  (interactive)
  (font-lock-add-keywords nil '((is-in-double-quotes
                                 (2 font-lock-double-quotes-var prepend))))
  (if (fboundp 'font-lock-flush)
      (font-lock-flush)
    (when font-lock-mode (with-no-warnings (font-lock-fontify-buffer)))))

(add-hook 'sh-mode-hook 'font-lock-double-quotes-activate)

(provide 'init-shell-highlighting)
