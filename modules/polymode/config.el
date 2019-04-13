(require 'polymode)
(require 'poly-markdown)
(require 'poly-org)

(add-hook 'markdown-mode-hook #'poly-markdown-mode)
(add-hook 'org-mode-hook #'poly-org-mode)
