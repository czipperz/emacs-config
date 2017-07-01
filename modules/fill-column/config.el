(require 'fill-column-indicator)

(setq-default fill-column 70)
(add-hook 'prog-mode-hook 'turn-on-fci-mode)
(setq fci-rule-width 1)
(setq fci-rule-color "dim gray")
