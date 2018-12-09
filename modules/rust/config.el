(require 'rust-mode)

(defun rust-mode-test-command ()
  (setq-local compile-command "RUST_BACKTRACE=1 cargo test"))

(add-hook 'rust-mode-hook #'rust-mode-test-command)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'rust-mode-hook #'turn-off-flycheck-mode)

(defun turn-off-flycheck-mode () (flycheck-mode 0))
