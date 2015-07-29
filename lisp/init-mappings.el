(global-set-key (kbd "C-,") 'vim-style-o) ; note that this doesn't work in shells because they are dumb
(global-set-key (kbd "C-.") 'vim-style-capital-o) ; note that this doesn't work in shells because they are dumb

(global-unset-key (kbd "C-z"))		;This would sleep emacs so unbound it
(global-unset-key (kbd "C-x C-z"))
(global-set-key (kbd "C-z d") 'diff-buffer-with-current-file)
(global-set-key (kbd "C-z s") 'magit-status)
(global-set-key (kbd "C-z t") 'term)
(global-set-key (kbd "C-z c") 'comment-line)
(global-set-key (kbd "C-z u") 'uncomment-line)
(global-set-key (kbd "C-z C-c") 'comment-region)
(global-set-key (kbd "C-z C-u") 'uncomment-region)
(global-set-key (kbd "C-z q") 'delete-window)
(global-set-key (kbd "C-z v") 'split-window-right)
(global-set-key (kbd "C-z h") 'split-window-below)
(global-set-key (kbd "C-z o") 'delete-other-windows)
(global-set-key (kbd "C-z C-a") 'beginning-of-visual-line)
(global-set-key (kbd "C-z C-e") (lambda () (interactive) (end-of-visual-line) (backward-char)))

(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-S-k") 'kill-line) ; note that this doesn't work in shells because they are dumb

(global-set-key (kbd "C-;") 'kill-start-of-text)
(global-set-key (kbd "C-:") 'kill-start-of-line)

(global-set-key (kbd "M-<") 'my/beginning-of-buffer)
(global-set-key (kbd "M->") 'my/end-of-buffer)

(global-set-key (kbd "C-`") 'list-packages) ; note that this doesn't work in shells because they are dumb
(global-set-key (kbd "C-~") (lambda () (interactive)
                              (list-packages)
                              (package-menu-mark-upgrades)
                              (package-menu-execute)
                              (keyboard-escape-quit)
                              (quit-window)))

(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "C-h") (lambda () "Use `C-h' to delete the previous character. Use `F1' to access help"
                              (interactive)
                              (backward-delete-char-untabify 1)))
(global-set-key (kbd "C-x C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x M-h") 'backward-kill-sexp)
(global-set-key (kbd "C-x C-h") 'help)
(global-set-key (kbd "C-'") 'backward-kill-word)
(global-set-key (kbd "C-\"") 'backward-kill-sexp)

(global-set-key (kbd "<return>") (lambda () "Return is disabled, use `C-m', `C-j', or `C-o' instead"
                                   (interactive) (message "Return is disabled, use `C-m', `C-j', or `C-o' instead")))
(global-set-key (kbd "<backspace>") (lambda () "Backspace is disabled, use `C-h' instead"
                                      (interactive) (message "Backspace is disabled, use `C-h' instead")))
(global-set-key (kbd "<C-backspace>") (lambda () "C-Backspace is disabled, use `C-M-h' instead"
                                        (interactive) (message "Backspace is disabled, use `C-h' instead")))
(global-set-key (kbd "<M-backspace>") (lambda () "M-Backspace is disabled, use `C-M-h' instead"
                                        (interactive) (message "Backspace is disabled, use `C-h' instead")))
(global-set-key (kbd "<tab>") (lambda () "Tab is disabled, use `C-i' instead"
                                (interactive) (message "Tab is disabled, use `C-i' instead")))

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

(global-set-key (kbd "C-z SPC") 'fix-indentation)

(global-unset-key (kbd "C-z j"))
(global-set-key (kbd "C-z j g") 'java-get/set)
(global-set-key (kbd "C-z j v") 'java-line-private)
(global-set-key (kbd "C-z j m") 'java-function-public)
(global-set-key (kbd "C-z j ;") 'java-fix-semicolons)
(global-set-key (kbd "C-z j r") 'java-fix-return)
(global-set-key (kbd "C-z j w") 'java-single-method-wrap)
(global-set-key (kbd "C-z j s") 'java-assign-to-set)

(global-set-key (kbd "C-z r") 'align-regexp)

(provide 'init-mappings)
