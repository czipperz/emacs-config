(require 'rust-mode)

(defun rust-mode-test-command ()
  (setq-local compile-command "RUST_BACKTRACE=1 cargo test"))

(add-hook 'rust-mode-hook #'rust-mode-test-command)