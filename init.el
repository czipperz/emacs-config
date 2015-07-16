;; Custom scripts `require`
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Hide menubar
(menu-bar-mode -1)
(tool-bar-mode -1)

(dolist (i '(;; Init scripts
	     init-packages
	     ;; darcula-theme		;Minimize white time
	     init-markdown
	     init-powerline
	     init-mappings
	     init-functions
	     ;; Other requires
	     magit			;Git
	     hi2			;haskell indent
	     tuareg			;Ocaml
	     helm-config		;completion for menus
	     auto-complete		;completion for text
	     smartparens-config	        ;matching grouping symbols highlighted with cursor
	     dired-details
	     ;; yasnippet
	     rainbow-delimiters		;matching grouping symbols colored specially based on level
	     edit-server		;chrome edit server
	     ;; scroll-bar-mode		;remove scrollbar
	     ;; ace-window
	     highlight-quoted
	     highlight-current-line
	     )) (require i))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("ea489f6710a3da0738e7dbdfc124df06a4e3ae82f191ce66c2af3e0a15e99b90" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(savehist-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-current-line-face ((t (:background "gray0")))))

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
