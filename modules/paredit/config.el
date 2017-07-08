(require 'paredit)

(define-key paredit-mode-map (kbd "M-r") nil)
(define-key paredit-mode-map (kbd "C-r") #'paredit-raise-sexp)

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
