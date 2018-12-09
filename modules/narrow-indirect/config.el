(require 'narrow-indirect)

(defun ni-narrow-to-region-indirect (start end here &optional full-name text msgp)
  "."
  (interactive
   (list (region-beginning) (region-end) (point) (and current-prefix-arg (read-string "Buffer name: ")) nil 'MSGP))
  (split-window-below)
  (ni-narrow-to-region-indirect-other-window
   start end here full-name text msgp)
  (other-window -1)
  (delete-window))

(defun ni-narrow-to-defun-indirect (&optional full-name text)
  "."
  (interactive
   (list (and current-prefix-arg (read-string "Buffer name: ")) nil))
  (split-window-below)
  (ni-narrow-to-defun-indirect-other-window
   full-name text)
  (other-window -1)
  (delete-window))

(defun ni-narrow-to-page-indirect (&optional arg)
  "."
  (interactive)
  (split-window-below)
  (ni-narrow-to-page-indirect-other-window arg)
  (other-window -1)
  (delete-window))

(defun ni-widen-indirect ()
  "."
  (interactive)
  ())

(global-set-key (kbd "C-x n n") #'ni-narrow-to-region-indirect)
(global-set-key (kbd "C-x n d") #'ni-narrow-to-defun-indirect)
(global-set-key (kbd "C-x n p") #'ni-narrow-to-page-indirect)
;; (global-set-key (kbd "C-x n w") #'ni-widen-indirect)
