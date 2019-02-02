(require 'company)
(require 'company-cmake)

(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.05)

(global-company-mode)
(defun my/setup-company ()
  "Bind `C-j' to `company-complete'."
  (local-set-key (kbd "C-j") #'company-complete))
(add-hook 'prog-mode-hook #'my/setup-company)
