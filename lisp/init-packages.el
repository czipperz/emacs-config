;;; Install packages

(load-theme 'solarized-dark) ; load theme here

(set-default-font "Meslo LG S DZ-12")

;; Magit - Git inside emacs is awesome -> `C-c s' or `M-x magit-status'
(setq magit-last-seen-setup-instructions "1.4.0") ; Hide message
(autoload 'magit-status "magit" nil t)

;; Auto Complete menus
(helm-mode 1)
(helm-autoresize-mode 1)

;; Auto Complete for text
(ac-config-default)

;; Auto match parens (highlight)
(show-smartparens-global-mode)

;; Line numbers
(global-linum-mode)
;; Fringe style for graphical mode
(set-fringe-style 0)
(setq linum-format "%d ")

;; 4 spaces for c languages
(setq c-basic-offset 4
      c-default-style "java")
(push '("\\.h\\'" . c++-mode) auto-mode-alist) ;header files as c++ headers

;; Haskell indentation
(add-hook 'haskell-mode-hook 'turn-on-hi2)

;; Yasnippet
;; (yas-global-mode 1)

;; Rainbow delimeters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Highlight current line
(highlight-current-line-on t)

;; Highlight quoted
(add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)

;; Chrome edit server
(when (daemonp)
  (edit-server-start)
  (message "Edit Server for Chrome up"))

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(provide 'init-packages)
