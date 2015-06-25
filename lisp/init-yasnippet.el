(require 'yasnippet)

(yas-global-mode 1)

(cond (window-system
       (global-set-key (kbd "<return>") 'newline)
       (global-set-key (kbd "C-m") 'yas-next-field-or-maybe-expand)
       (global-set-key (kbd "C-S-m") 'yas-prev-field)))

(provide 'init-yasnippet)
