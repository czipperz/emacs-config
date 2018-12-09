(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(load-theme 'wombat)

(unless (require 'kfg nil t)
  (package-refresh-contents)
  (package-install 'kfg))

(push (concat (getenv "HOME") "/.emacs.d/modules/narrow-indirect") load-path)
(kfg-find-and-activate-modules "~/.emacs.d/modules")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (narrow-indirect graphviz-dot-mode rust-mode ivy counsel counsel-projectile swiper "evil" "kfg" kfg magit ag fill-column-indicator undo-tree paredit helm-projectile git-commit flycheck edit-server company-cmake cmake-mode cmake-ide clang-format ace-window)))
 '(safe-local-variable-values
   (quote
    ((c-noise-macro-names "UNINIT")
     (eval let
           ((dl
             (dir-locals-find-file buffer-file-name)))
           (setq dl
                 (if
                     (consp dl)
                     (car dl)
                   (file-name-directory dl)))
           (setq cmake-ide-build-dir
                 (expand-file-name "out" dl)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
