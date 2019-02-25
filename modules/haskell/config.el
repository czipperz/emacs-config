(require 'haskell)
(require 'haskell-mode)
(require 'hi2)
(require 'paredit)

(add-hook 'haskell-mode-hook #'haskell-decl-scan-mode)
(add-hook 'haskell-mode-hook #'interactive-haskell-mode)
(add-hook 'haskell-mode-hook #'paredit-mode)

(defvar ghci-location (expand-file-name "~/.stack/programs/x86_64-linux/ghc-tinfo6-8.6.3/bin/ghci"))

(defun haskell-insert-type ()
  "Insert the type of a Haskell definition.

Example:

|numElements = 3
=>
numElements :: Integer
|numElements = 3"
  (interactive)
  (let* ((src-directory (concat (projectile-project-root)
                                (projectile-src-directory (projectile-project-type))))
         (buffer-file (file-relative-name (buffer-file-name) src-directory)))
    (beginning-of-line)
    (let* ((expr (haskell-ident-at-point))
           (expr-okay (and expr
                           (not (string-match-p "\\`[[:space:]]*\\'" expr))
                           (not (string-match-p "\n" expr)))))
      ;; No newlines in expressions, and surround with parens if it
      ;; might be a slice expression
      (when expr-okay
        (let ((input
               (format
                (if (or (string-match-p "\\`(" expr)
                        (string-match-p "\\`[_[:alpha:]]" expr))
                    ":type %s"
                  ":type (%s)")
                expr)))
          ;; (shell-command (format "cd '%s' && '%s' '%s' <<< \"%s\"" src-directory ghci-location buffer-file input))
          (insert (with-temp-buffer
                    (shell-command (format "cd '%s' && '%s' '%s' <<< \"%s\"" src-directory ghci-location buffer-file input) 1)
                    (buffer-substring-no-properties
                     (save-excursion
                       (goto-char (point-min))
                       (while (not (looking-at-p "\\*.*>"))
                         (forward-line))
                       (while (not (looking-at-p ">"))
                         (forward-char))
                       (forward-char 2)
                       (point))
                     (save-excursion
                       (goto-char (point-max))
                       (forward-line -1)
                       (point))))))))))

(define-key interactive-haskell-mode-map (kbd "C-c C-t") #'haskell-insert-type)
