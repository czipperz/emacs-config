(defvar my-prefix "C-s"
  "Prefix to my keyboard shortcuts that don't overload default keys")

(global-unset-key (kbd my-prefix))
(global-set-key (kbd (concat my-prefix " C-a")) 'beginning-of-visual-line)
(global-set-key (kbd (concat my-prefix " C-c")) 'comment-region)
(add-hook 'c++-mode-hook
          '(lambda () (local-set-key (kbd (concat my-prefix " C-c"))
                                     'my/c-comment-region)))
(global-set-key (kbd (concat my-prefix " C-e")) 'eval-buffer)
(global-set-key (kbd (concat my-prefix " C-f")) 'ido-find-file)
(global-set-key (kbd (concat my-prefix " C-m")) 'compile)
(global-set-key (kbd (concat my-prefix " C-r")) 'my/open-cgrb)
(add-hook 'haskell-mode-hook
          '(lambda () (local-set-key (kbd (concat my-prefix " C-t"))
                                     'doctest)))
(global-set-key (kbd (concat my-prefix " C-u")) 'uncomment-region)
(global-set-key (kbd (concat my-prefix " S")) 'sort-lines)
(global-set-key (kbd (concat my-prefix " SPC")) 'fix-indentation)
(global-set-key (kbd (concat my-prefix " c")) 'comment-line)
(add-hook 'emacs-lisp-mode-hook
          '(lambda () (local-set-key (kbd (concat my-prefix " c"))
                                     'comment-sexp)))
(global-set-key (kbd (concat my-prefix " d")) 'diff-buffer-with-current-file)
(global-set-key (kbd (concat my-prefix " e")) 'eval-and-replace)
(global-set-key (kbd (concat my-prefix " g")) 'ag-regexp)
(global-set-key (kbd (concat my-prefix " i")) 'indent-for-tab-command)
(global-set-key (kbd (concat my-prefix " r")) 'align-regexp)
(global-set-key (kbd (concat my-prefix " s")) 'magit-status)
(global-set-key (kbd (concat my-prefix " t")) 'shell)
(global-set-key (kbd (concat my-prefix " u")) 'uncomment-line)
(global-set-key (kbd (concat my-prefix " w")) 'whitespace-cleanup)

(global-unset-key (kbd (concat my-prefix " m")))
(global-set-key (kbd (concat my-prefix " m m")) 'compose-mail)
(global-set-key (kbd (concat my-prefix " m c")) 'mail-cc)
(global-set-key (kbd (concat my-prefix " m b")) 'mail-bcc)
(global-set-key (kbd (concat my-prefix " m a")) 'mail-add-attachment)

(global-unset-key (kbd (concat my-prefix " j")))
(global-set-key (kbd (concat my-prefix " j g")) 'java-get/set)
(global-set-key (kbd (concat my-prefix " j a")) 'java-get/set-&-align)
(global-set-key (kbd (concat my-prefix " j v")) 'java-line-private)
(global-set-key (kbd (concat my-prefix " j m")) 'java-function-public)
(global-set-key (kbd (concat my-prefix " j ;")) 'java-fix-semicolons)
(global-set-key (kbd (concat my-prefix " j r")) 'java-fix-return)
(global-set-key (kbd (concat my-prefix " j w")) 'java-single-method-wrap)
(global-set-key (kbd (concat my-prefix " j s")) 'java-assign-to-set)
(global-set-key (kbd (concat my-prefix " j C-s")) 'groovy-with-to-set)
(global-set-key (kbd (concat my-prefix " j e")) 'groovy-each-to-for)
(global-set-key (kbd (concat my-prefix " j (")) 'groovy-space-to-parens)
(global-set-key (kbd (concat my-prefix " j n")) 'c-prog-sep-semicolon)
(global-set-key (kbd (concat my-prefix " j C-g"))
                (lambda ()
                  (interactive)
                  (insert "get")
                  (my/capitalize-word)
                  (insert "()")))

(global-set-key (kbd (concat my-prefix " j u")) 'c++-char-to-u8)

(global-set-key (kbd (concat my-prefix " o")) 'ace-window)
(global-set-key (kbd (concat my-prefix " C-o")) 'ace-swap-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?\;))

(add-hook 'sh-mode-hook
          '(lambda ()
             (local-set-key (kbd (concat my-prefix " p")) 'insert-perl-regexp)))















(global-set-key (kbd "M-g C-c") 'print-point)

(global-unset-key (kbd "C-l"))

(global-set-key (kbd "C-l m") 'license/mpl-header)
(global-set-key (kbd "C-l p") 'license/public-domain-header)

(setq evil-mc-key-map
  (let ((map (make-sparse-keymap))
        (keys (list (cons "m" 'evil-mc-make-all-cursors)
                    (cons "u" 'evil-mc-undo-all-cursors)
                    (cons "s" 'evil-mc-pause-cursors)
                    (cons "r" 'evil-mc-resume-cursors)
                    (cons "f" 'evil-mc-make-and-goto-first-cursor)
                    (cons "l" 'evil-mc-make-and-goto-last-cursor)
                    (cons "h"
                          '(lambda ()
                             (interactive)
                             (evil-mc-make-cursor-here)
                             (evil-mc-pause-cursors)))
                    (cons "M-n" 'evil-mc-make-and-goto-next-cursor)
                    (cons "M-N" 'evil-mc-skip-and-goto-next-cursor)
                    (cons "M-p" 'evil-mc-make-and-goto-prev-cursor)
                    (cons "M-P" 'evil-mc-skip-and-goto-prev-cursor)
                    (cons "n" 'evil-mc-make-and-goto-next-match)
                    (cons "N" 'evil-mc-skip-and-goto-next-match)
                    (cons "p" 'evil-mc-make-and-goto-prev-match)
                    (cons "p" 'evil-mc-skip-and-goto-prev-match))))
    (dolist (key-data keys)
      (evil-define-key 'normal map (kbd (concat "M-r " (car key-data))) (cdr key-data))
      (evil-define-key 'visual map (kbd (concat "M-r " (car key-data))) (cdr key-data)))
    map))

(global-unset-key (kbd "C-l"))
(global-unset-key (kbd "C-l w"))

(global-set-key (kbd "C-l m") 'license/mpl-header)
(global-set-key (kbd "C-l p") 'license/public-domain-header)

(defun my-cedit-setup ()
  (local-set-key (kbd "C-M-r") 'cedit-raise)
  (local-set-key (kbd "M-S") 'cedit-barf)
  (local-set-key (kbd "M-d") 'cedit-splice-killing-backward)
  ;; C-l prefix
  (dolist (key-data (list (cons "j" 'cedit-barf)
                          (cons ";" 'cedit-slurp)
                          (cons "w b" 'cedit-wrap-brace)
                          (cons "w {" 'cedit-wrap-brace)
                          (cons "w i" 'cedit-wrap-if)
                          (cons "w d" 'cedit-wrap-do-while)
                          (cons "w w" 'cedit-wrap-while)
                          (cons "w f" 'cedit-wrap-for)
                          (cons "w t" 'cedit-wrap-try)))
    (local-set-key (kbd (concat "C-l " (car key-data))) (cdr key-data))))

(add-hook 'c++-mode-hook 'my-cedit-setup)
(add-hook 'c-mode-hook 'my-cedit-setup)

(add-hook 'paredit-mode-hook
          '(lambda () (interactive)
             (local-set-key (kbd "C-M-r") 'paredit-raise-sexp)
             (local-set-key (kbd "C-d") 'paredit-splice-sexp-killing-forward)
             (local-set-key (kbd "M-d") 'paredit-splice-sexp-killing-backward)))

;; Seems like `M-g {n,p}' have completely stopped working for some
;; random reason.  Use `M-g M-{n,p}' (defaults) to get old behavior
(global-set-key (kbd "M-g n") 'flycheck-next-error)
(global-set-key (kbd "M-g p") 'flycheck-previous-error)

(add-hook 'company-mode-hook '(lambda () (local-set-key (kbd "C-i") 'company-indent-or-complete-common)))

(global-set-key (kbd "C-q") 'string-inflection-all-cycle)

(global-set-key (kbd "C-x C-b") 'ibuffer-list-buffers)
(global-set-key (kbd "C-x b")   'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x D") 'dired-this-directory)
(global-set-key (kbd "M-x") 'helm-M-x)

(global-unset-key (kbd "C-x C-z")) ;This would sleep emacs so unbound it

(add-hook 'c-mode-hook
          '(lambda ()
             (local-set-key [C-M-tab] 'my/clang-format)))
(add-hook 'c++-mode-hook
          '(lambda ()
             (local-set-key [C-M-tab] 'my/clang-format)))
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (local-set-key [C-M-tab] 'my/elisp-format-region)))
(add-hook 'cargo-minor-mode-hook
          '(lambda ()
             (local-set-key [C-M-tab] 'cargo-process-fmt)))

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-M-\\") 'my/indent-sexp)))

(add-hook 'diff-mode-hook '(lambda () (local-set-key (kbd "q") (lambda () (interactive) (delete-window)))))

(global-set-key (kbd "C-$") 'ispell-buffer)

(global-set-key (kbd "M-'")  'insert-single-quotes)
(global-set-key (kbd "M-\"") 'insert-double-quotes)
(global-set-key (kbd "C-{")  'backward-paragraph)
(global-set-key (kbd "C-}")  'forward-paragraph)
(global-set-key (kbd "M-{")  'insert-curly-brackets)
(global-set-key (kbd "M-[")  'insert-square-brackets)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'er/contract-region)

(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-S-k") 'kill-line) ; note that this doesn't work in shells because they are dumb

(global-set-key (kbd "C-;") 'kill-start-of-text)
(global-set-key (kbd "C-:") 'kill-start-of-line)

(global-set-key (kbd "C-`") 'list-packages) ; note that this doesn't work in shells because they are dumb
(global-set-key (kbd "C-~") 'interactive-update-packages)

(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(global-set-key (kbd "C-x C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x M-h") 'backward-kill-sexp)
(global-set-key (kbd "C-x C-h") 'help)
(global-set-key (kbd "C-'") 'backward-kill-word)
(global-set-key (kbd "C-\"") 'backward-kill-sexp)

(global-set-key (kbd "<return>")
                (lambda () "Return is disabled, use `C-m', `C-j', or `C-o' instead"
                  (interactive)
                  (message "Return is disabled, use `C-m', `C-j', or `C-o' instead")))
(global-set-key (kbd "<backspace>")
                (lambda () "Backspace is disabled, use `C-h' instead"
                  (interactive)
                  (message "Backspace is disabled, use `C-h' instead")))
(global-set-key (kbd "<C-backspace>")
                (lambda () "C-Backspace is disabled, use `C-M-h' instead"
                  (interactive)
                  (message "Backspace is disabled, use `C-h' instead")))
(global-set-key (kbd "<M-backspace>")
                (lambda () "M-Backspace is disabled, use `C-M-h' instead"
                  (interactive)
                  (message "Backspace is disabled, use `C-h' instead")))
(global-set-key (kbd "<tab>")
                (lambda () "Tab is disabled, use `C-i' instead"
                  (interactive)
                  (message "Tab is disabled, use `C-i' instead")))

(global-set-key (kbd "M-c") 'my/capitalize-word)

(global-set-key (kbd "C-x 8 g a")   "α")  ;alpha
(global-set-key (kbd "C-x 8 g b")   "β")  ;beta
(global-set-key (kbd "C-x 8 g c")   "ς")  ;sigma
(global-set-key (kbd "C-x 8 g d")   "δ")  ;delta
(global-set-key (kbd "C-x 8 g D")   "Δ")  ;DELTA
(global-set-key (kbd "C-x 8 g e")   "ε")  ;epsilon
(global-set-key (kbd "C-x 8 g E")   "Σ")  ;EPSILON
(global-set-key (kbd "C-x 8 g g")   "γ")  ;gamma
(global-set-key (kbd "C-x 8 g G")   "Γ")  ;GAMMA
(global-set-key (kbd "C-x 8 g i")   "ι")  ;nu
(global-set-key (kbd "C-x 8 g k")   "κ")  ;kappa
(global-set-key (kbd "C-x 8 g l")   "λ")  ;lambda
(global-set-key (kbd "C-x 8 g L")   "Λ")  ;lambda
(global-set-key (kbd "C-x 8 g m")   "μ")  ;lambda
(global-set-key (kbd "C-x 8 g n")   "η")  ;eta
(global-set-key (kbd "C-x 8 g N")   "ν")  ;nu
(global-set-key (kbd "C-x 8 g o")   "θ")  ;XI
(global-set-key (kbd "C-x 8 g O")   "Θ")  ;zeta
(global-set-key (kbd "C-x 8 g p")   "φ")  ;phi
(global-set-key (kbd "C-x 8 g P")   "Φ")  ;PHI
(global-set-key (kbd "C-x 8 g C-p") "π")  ;pi
(global-set-key (kbd "C-x 8 g M-p") "Π")  ;PI
(global-set-key (kbd "C-x 8 g r")   "ρ")  ;rho
(global-set-key (kbd "C-x 8 g s")   "ψ")  ;psi
(global-set-key (kbd "C-x 8 g S")   "Ψ")  ;PSI
(global-set-key (kbd "C-x 8 g t")   "τ")  ;tau
(global-set-key (kbd "C-x 8 g u")   "υ")  ;upsilon
(global-set-key (kbd "C-x 8 g v")   "ν")  ;nu
(global-set-key (kbd "C-x 8 g y")   "γ")  ;gamma
(global-set-key (kbd "C-x 8 g x")   "χ")  ;chi
(global-set-key (kbd "C-x 8 g X")   "Ξ")  ;XI
(global-set-key (kbd "C-x 8 g z")   "ζ")  ;zeta

(provide 'init-mappings)
