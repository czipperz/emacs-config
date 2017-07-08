(require 'multiple-cursors)

(global-set-key (kbd "C-M-p") #'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-n") #'mc/mark-next-like-this)
(when (require 'phi-search nil t)
  (define-key mc/keymap (kbd "C-s") #'phi-search)
  (define-key mc/keymap (kbd "C-r") #'phi-search-backward))
