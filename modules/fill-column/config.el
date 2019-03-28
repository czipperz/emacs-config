(require 'fill-column-indicator)

(add-hook 'prog-mode-hook 'turn-on-fci-mode)
(setq fci-rule-width 1)
(setq fci-rule-color "dim gray")
