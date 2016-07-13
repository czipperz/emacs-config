(evil-mode)

(setq evil-move-beyond-eol t)

(define-key evil-normal-state-map "h" 'evil-repeat-find-char)
(define-key evil-visual-state-map "h" 'evil-repeat-find-char)
(define-key evil-normal-state-map "j" 'evil-backward-char)
(define-key evil-visual-state-map "j" 'evil-backward-char)
(define-key evil-normal-state-map "k" 'next-line)
(define-key evil-visual-state-map "k" 'next-line)
(define-key evil-normal-state-map "l" 'previous-line)
(define-key evil-visual-state-map "l" 'previous-line)
(define-key evil-normal-state-map ";" 'evil-forward-char)
(define-key evil-visual-state-map ";" 'evil-forward-char)

;; Fix consistency issues with upper case keys
(define-key evil-normal-state-map "H" 'evil-lookup)
(define-key evil-visual-state-map "H" 'evil-lookup)
(define-key evil-normal-state-map "L" 'evil-window-top)
(define-key evil-visual-state-map "L" 'evil-window-top)
(define-key evil-normal-state-map "K" 'evil-window-bottom)
(define-key evil-visual-state-map "K" 'evil-window-bottom)

(global-set-key (kbd "M-r") (lambda () (interactive) (message "Use `M', `L', or `K' instead")))
(global-set-key (kbd "C-l") (lambda () (interactive) (message "Use `zz', `zt', or `zb' instead")))

(define-key evil-insert-state-map (kbd "C-,") 'find-tag)
(define-key evil-visual-state-map (kbd "C-,") 'find-tag)
(define-key evil-normal-state-map (kbd "C-,") 'find-tag)

(define-key evil-insert-state-map (kbd "M-A") 'evil-append-line)
(define-key evil-insert-state-map (kbd "M-I") 'evil-insert-line)

(set 'evil-global-keymaps-alist '((evil-normal-state-minor-mode . evil-normal-state-map)
                                  (evil-insert-state-minor-mode . evil-insert-state-map)
                                  (evil-visual-state-minor-mode . evil-visual-state-map)
                                  (evil-operator-state-minor-mode . evil-operator-state-map)
                                  (evil-replace-state-minor-mode . evil-replace-state-map)
                                  (evil-motion-state-minor-mode . evil-motion-state-map)))

;; Package Menu evil keybinds
(add-hook 'package-menu-mode-hook (lambda () (interactive)
                                    (local-set-key (kbd "j") 'backward-char)
                                    (local-set-key (kbd "k") 'forward-line)
                                    (local-set-key (kbd "l") 'previous-line)
                                    (local-set-key (kbd ";") 'forward-char)))

(provide 'init-evil)
