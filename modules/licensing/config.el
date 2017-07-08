(defun license/public-domain-header ()
  "Insert CC0 public domain license header at top of file"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (insert "/* Any copyright is dedicated to the Public Domain.
 * http://creativecommons.org/publicdomain/zero/1.0/ */\n\n")))

(defun license/mpl-header ()
  "Insert MPL license header at top of file"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((year (format-time-string "%Y" (current-time))))
      (if (and (looking-at-p (concat "/\\* This Source Code Form is "
                                     "subject to the terms of the "
                                     "Mozilla Public"))
               (progn
                 (forward-line 2)
                 (end-of-line)
                 (left-char 3)
                 (looking-at-p " \\*/")))
          ;; insert copyright notice
          (insert "\n *\n * Copyright (c) " year
                  " Chris Gregory czipperz@gmail.com\n")
        (goto-char (point-min))
        (forward-line 5)
        (unless (looking-at-p " \\*/")
          ;; insert license
          (goto-char (point-min))
          (insert (format
                   "/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright (c) %s Chris Gregory czipperz@gmail.com
 */\n\n"
                   year)))))))

(global-set-key (kbd "C-c l p") #'license/public-domain-header)
(global-set-key (kbd "C-c l m") #'license/mpl-header)
