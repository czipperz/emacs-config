;; (byte-recompile-directory (expand-file-name "~/.emacs.d/lisp") 0)

;; Custom scripts `require`
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(blink-matching-paren nil)
 '(custom-safe-themes
   (quote
    ("ea489f6710a3da0738e7dbdfc124df06a4e3ae82f191ce66c2af3e0a15e99b90" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-current-line-face ((t (:background "gray0")))))

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)
(package-initialize)

(load-theme 'solarized-dark) ; load theme here

;; Hide menubar
(menu-bar-mode -1)
(tool-bar-mode -1)

(dolist (i '(;; darcula-theme		;Minimize white time
             evil
             init-evil
             powerline
             init-extra-cedit-functions
             init-powerline
             init-mappings
             init-functions
             highlight-quoted-vars
             init-c++

             init-magit-evil-rebase

             ;;; Other requires
             tramp                      ;ssh
             ;; doxymacs
             expand-region
             haskell-mode
             hi2                        ;haskell indent
             ;; shm                        ;paredit for haskell
             helm-config                ;completion for menus
             smartparens-config         ;matching grouping symbols
                                        ;highlighted with cursor
             dired-details
             yaml-mode                  ;https://github.com/yoshiki/yaml-mode
             clang-format               ;formats c/c++ code
             elisp-format               ;http://www.emacswiki.org/emacs/download/elisp-format.el
             ;; yasnippet
             rainbow-delimiters         ;matching grouping symbols
                                        ;colored specially based on
                                        ;level

             evil-mc                    ;multiple cursors
             preproc-font-lock          ;highlights all preprocessor lines (and continuations!)
             malinka                    ;links rtags, flycheck, projectile, and irony together
             projectile                 ;project manager
             flycheck                   ;syntax checker
             irony                      ;c/c++ completions

             forth-mode                 ;gforth

             edit-server                ;chrome edit server
             ;; scroll-bar-mode         ;remove scrollbar
             ace-window
             highlight-quoted
             highlight-current-line

             org
             evil-org

             paredit
             evil-paredit

             string-inflection          ;allows for changes between camel case and snake
                                        ;and different types of both

             init-packages              ;init scripts
             )) (require i))

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
