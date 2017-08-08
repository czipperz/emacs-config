(require 'ivy)
(require 'swiper)
(require 'counsel)

(ivy-mode 1)
(global-set-key (kbd "C-s") #'swiper)
(global-set-key (kbd "C-r") #'swiper)
(global-set-key (kbd "C-c C-r") #'ivy-resume)
(global-set-key (kbd "<f1> u") #'counsel-unicode-char)
(global-set-key (kbd "C-c S") #'counsel-ag)
(global-set-key (kbd "C-M-j") #'counsel-company)
(global-set-key [remap execute-extended-command] #'counsel-M-x)
(global-set-key [remap find-file] #'counsel-find-file)
(global-set-key [remap describe-function] #'counsel-describe-function)
(global-set-key [remap describe-variable] #'counsel-describe-variable)
(global-set-key [remap find-library] #'counsel-find-library)
(global-set-key [remap info] #'counsel-info-lookup-symbol)

(define-key read-expression-map (kbd "C-r") #'counsel-expression-history)

(defvar counsel-up-directory-level t
  "Control whether `counsel-up-directory' goes up a level or always a directory.

If non-nil, then `counsel-up-directory' will remove the final level of the path.
For example: /a/long/path/file.jpg => /a/long/path/
             /a/long/path/     =>     /a/long/

If nil, then `counsel-up-directory' will go up a directory.
For example: /a/long/path/file.jpg => /a/long/
             /a/long/path/     =>     /a/long/")

(defun counsel-up-directory ()
  "Go to the parent directory preselecting the current one.

See variable `counsel-up-directory-level'."
  (interactive)
  (if (and counsel-up-directory-level (not (string-empty-p ivy-text)))
      (delete-region (line-beginning-position) (line-end-position))
    (let ((dir-file-name
           (directory-file-name (expand-file-name ivy--directory))))
      (ivy--cd (file-name-directory dir-file-name))
      (setf (ivy-state-preselect ivy-last)
            (file-name-as-directory (file-name-nondirectory dir-file-name))))))
