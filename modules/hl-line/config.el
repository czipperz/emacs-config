(require 'hl-line)

(defface my/hl-line
  '((t :underline t))
  "Face for highlighting current line.")
(setq hl-line-face 'my/hl-line)
(add-hook 'prog-mode-hook #'hl-line-mode)
