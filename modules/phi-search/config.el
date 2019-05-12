(require 'phi-search)

(global-set-key (kbd "M-%") 'phi-replace-query)
(global-set-key (kbd "C-M-%") 'phi-replace-query)
(global-set-key (kbd "C-M-s") 'phi-search)
(global-set-key (kbd "C-M-r") 'phi-search-backward)

(define-key phi-search-default-map (kbd "M-p") #'ivy-previous-history-element)
(define-key phi-search-default-map (kbd "M-n") #'ivy-next-history-element)
