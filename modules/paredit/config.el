(require 'paredit)

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(define-key paredit-mode-map (kbd "M-r") nil)
(define-key paredit-mode-map (kbd "C-r") #'paredit-raise-sexp)
