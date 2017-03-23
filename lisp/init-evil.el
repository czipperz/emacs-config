(evil-mode)

;;; Visual mode end exclusive (rather than inclusive)

;; Make evil visual commands exclusive.  This makes C-x r t work,
;; FINALLY!  It basically makes evil-visual-commands equate to C-SPC
;; and C-x SPC this makes using the builtin Emacs commands much
;; easier.
;;
;; Ex: `v C-M-f y` won't grab trailing parenthesis.
(setq evil-visual-block 'exclusive)
(setq evil-visual-char 'exclusive)

;; go one farther on forward-word so that visual mode works correctly.
(defun my/evil-forward-word-end (&optional count bigword)
  (interactive)
  (left-char)
  (evil-forward-word-end count bigword)
  (right-char))

(defun my/evil-forward-WORD-end (&optional count)
  (interactive)
  (left-char)
  (evil-forward-WORD-end count)
  (right-char))

(define-key evil-normal-state-map "e" 'my/evil-forward-word-end)
(define-key evil-visual-state-map "e" 'my/evil-forward-word-end)
(define-key evil-normal-state-map "E" 'my/evil-forward-WORD-end)
(define-key evil-visual-state-map "E" 'my/evil-forward-WORD-end)

;; go one farther on backward-word so that visual mode works correctly.
(defun my/evil-backward-word-end (&optional count bigword)
  (interactive)
  (left-char)
  (evil-backward-word-end count bigword)
  (right-char))

(defun my/evil-backward-WORD-end (&optional count)
  (interactive)
  (left-char)
  (evil-backward-WORD-end count)
  (right-char))

(define-key evil-normal-state-map "ge" 'my/evil-backward-word-end)
(define-key evil-visual-state-map "ge" 'my/evil-backward-word-end)
(define-key evil-normal-state-map "gE" 'my/evil-backward-WORD-end)
(define-key evil-visual-state-map "gE" 'my/evil-backward-WORD-end)

;;; Key bindings

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

(set 'evil-global-keymaps-alist '((evil-normal-state-minor-mode . evil-normal-state-map)
                                  (evil-insert-state-minor-mode . evil-insert-state-map)
                                  (evil-visual-state-minor-mode . evil-visual-state-map)
                                  (evil-operator-state-minor-mode . evil-operator-state-map)
                                  (evil-replace-state-minor-mode . evil-replace-state-map)
                                  (evil-motion-state-minor-mode . evil-motion-state-map)))

;;; Package Menu evil keybinds
(defun package-menu-evil ()
  (interactive)
  (local-set-key (kbd "j") 'backward-char)
  (local-set-key (kbd "k") 'forward-line)
  (local-set-key (kbd "l") 'previous-line)
  (local-set-key (kbd ";") 'forward-char)
  (local-set-key (kbd "/") 'evil-search-forward)
  (local-set-key (kbd "?") 'evil-search-backward))
(add-hook 'package-menu-mode-hook 'package-menu-evil)

(provide 'init-evil)
