(require 'cmuscheme)

(setq scheme-program-name "petite")
(add-hook 'scheme-mode-hook #'enable-paredit-mode)
(add-hook 'inferior-scheme-mode-hook #'enable-paredit-mode)
