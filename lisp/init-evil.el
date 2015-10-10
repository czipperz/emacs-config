(require 'evil)

(evil-mode)

(define-key evil-normal-state-map "j" 'evil-backward-char)
(define-key evil-normal-state-map "k" 'next-line)
(define-key evil-normal-state-map "l" 'previous-line)
(define-key evil-normal-state-map ";" 'evil-forward-char)

(define-key evil-visual-state-map "j" 'evil-backward-char)
(define-key evil-visual-state-map "k" 'next-line)
(define-key evil-visual-state-map "l" 'previous-line)
(define-key evil-visual-state-map ";" 'evil-forward-char)

(define-key evil-normal-state-map "h" 'evil-repeat-find-char)
(define-key evil-visual-state-map "h" 'evil-repeat-find-char)

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

(provide 'init-evil)
