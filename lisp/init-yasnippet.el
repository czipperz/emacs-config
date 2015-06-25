(require 'yasnippet)

(yas-global-mode 1)

(global-set-key (kbd "C-<") 'yas-prev-field)
(global-set-key (kbd "C->") 'yas-next-field-or-maybe-expand)

(provide 'init-yasnippet)
