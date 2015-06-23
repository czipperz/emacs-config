;(setq powerline-default-separator (if (display-graphic-p) 'alternate nil))
(require 'powerline)

(defface my-pl-segment1-active
  '((t (:foreground "#3C3F41" :background "#3C3F41")))
  "Powerline first segment active face.")
(defface my-pl-segment1-inactive
  '((t (:foreground "#3C3F41" :background "#3C3F41")))
  "Powerline first segment inactive face.")

(defface my-pl-segment2-active
  '((t (:foreground "#4fddb0" :background "#4fddb0")))
  "Powerline third segment active face.")
(defface my-pl-segment2-inactive
  '((t (:foreground "#4fddb0" :background "#4fddb0")))
  "Powerline third segment inactive face.")

(defface my-pl-segment3-active
  '((t (:foreground "#3C3F41" :background "#3C3F41")))
  "Powerline second segment active face.")
(defface my-pl-segment3-inactive
  '((t (:foreground "#3C3F41" :background "#3C3F41")))
  "Powerline second segment inactive face.")

;; My custom powerline theme: see <https://github.com/milkypostman/powerline/blob/master/powerline-themes.el> to get your own.
(defun my-powerline-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'my-pl-segment1-active 'my-pl-segment1-inactive))
                          (face1 (if active 'my-pl-segment2-active 'my-pl-segment2-inactive))
                          (face2 (if active 'my-pl-segment3-active 'my-pl-segment3-inactive))
                          (separator-left (intern (format "powerline-%s-%s"
							  (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" nil 'l)
                                     (when powerline-display-buffer-size
                                       (powerline-buffer-size nil 'l))
                                     (when powerline-display-mule-info
                                       (powerline-raw mode-line-mule-info nil 'l))
                                     (powerline-buffer-id nil 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-minor-modes face1 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)
                                     (when (bound-and-true-p nyan-mode)
                                       (powerline-raw (list (nyan-create)) face2 'l))))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
				     (unless window-system
				       (powerline-raw (char-to-string #xe0a1) face1 'l))
				     (powerline-raw "%4l" face1 'l)
				     (powerline-raw ":" face1 'l)
				     (powerline-raw "%3c" face1 'r)
				     (funcall separator-right face1 mode-line)
				     (powerline-raw " ")
				     (powerline-raw "%6p" nil 'r)
                                     (when powerline-display-hud
                                       (powerline-hud face2 face1)))))
		     (concat (powerline-render lhs)
			     (powerline-fill face2 (powerline-width rhs))
			     (powerline-render rhs)))))))

(my-powerline-theme)

(provide 'init-powerline)
