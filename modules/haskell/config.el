(require 'haskell-mode)
(require 'hi2)
(require 'paredit)

(add-hook 'haskell-mode-hook #'haskell-decl-scan-mode)
(add-hook 'haskell-mode-hook #'interactive-haskell-mode)
(add-hook 'haskell-mode-hook #'paredit-mode)
