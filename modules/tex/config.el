(require 'tex)

(define-key TeX-mode-map (kbd "C-c C-m") #'tex-command-show-pdf)

(defun tex-command-show-pdf ()
  "Show a compiled pdf of this document in the right pane"
  (interactive)
  (let ((fname (concat (file-name-sans-extension (buffer-file-name)) ".pdf")))
    (TeX-command "LaTeX" 'TeX-master-file)
    (delete-other-windows)
    (split-window-right)
    (other-window 1)
    (condition-case nil
        (switch-to-buffer (concat (file-name-sans-extension (buffer-name)) ".pdf"))
      (error (find-file fname)))
    (revert-buffer t t t)
    (other-window -1)))
