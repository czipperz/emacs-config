;; Custom scripts `require`
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)
(push '("gnu-elpa" . "http://elpa.gnu.org/packages/") package-archives)
(package-initialize)

;; Hide menubar
(menu-bar-mode -1)
(tool-bar-mode -1)

(dolist (i '(;; darcula-theme		;Minimize white time
	     init-markdown
	     init-powerline
	     init-mappings
	     init-functions
             init-mode-font
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
             ;; Init scripts
	     init-packages
	     )) (require i))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("ea489f6710a3da0738e7dbdfc124df06a4e3ae82f191ce66c2af3e0a15e99b90" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(indent-tabs-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-current-line-face ((t (:background "gray0")))))
