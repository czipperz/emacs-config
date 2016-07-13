(defun elisp-package-init ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.el\\'" buffer-file-name)
             (equal (buffer-size) 0))
    (let* ((buf (file-name-nondirectory buffer-file-name))
           (year (format-time-string "%Y" (current-time)))
           (buf-no-el (file-name-sans-extension buf)))
      (insert ";;; " buf " ---

;; Copyright (C) " year " Chris Gregory czipperz@gmail.com

"
                        ;; default licensing is GPLv3
                        ";; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; Author: Chris Gregory \"czipperz\"
;; Email: czipperz@gmail.com
;; Version: 0.0.1

;;; Commentary:
;;; Code:

"
                        "(provide '" buf-no-el ")
;;; " buf " ends here")
      (forward-line -2))))

(add-hook 'find-file-hook 'elisp-package-init)

(provide 'init-elisp)
