(require 'avy)

(global-set-key (kbd "C-\"") #'avy-goto-char-timer)
(global-set-key [remap goto-line] #'avy-goto-line)
(global-set-key (kbd "C-'") #'avy-goto-char-in-line)
(global-set-key (kbd "M-'") #'avy-resume)
