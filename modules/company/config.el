(require 'company)
(require 'company-cmake)

(global-company-mode)
(defun my/setup-company ()
  "Bind `C-j' to `company-complete'."
  (local-set-key (kbd "C-j") #'company-complete))
(add-hook 'prog-mode-hook #'my/setup-company)
