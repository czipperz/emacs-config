; Custom scripts `require`
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; Requirements
(require 'init-packages)
(require 'init-powerline)
(require 'init-mappings)
(require 'darcula-theme)
(require 'magit)
(require 'helm-config)

(custom-set-variables ;; Your init file should only contain one of these
 '(custom-safe-themes (quote ("ea489f6710a3da0738e7dbdfc124df06a4e3ae82f191ce66c2af3e0a15e99b90"
			      "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0"
			      "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4"
			      default)))
 )
(custom-set-faces ;; Your init file should only contain one of these
 )

;(load-theme 'solarized-dark) ; load theme here

(set-frame-font "Meslo LG S DZ")

;; Magit
; Hide message
(setq magit-last-seen-setup-instructions "1.4.0")
(autoload 'magit-status "magit" nil t)

;; Helm - auto complete ftw
(helm-mode 1)

