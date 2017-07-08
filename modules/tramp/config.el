(defun replace-tramp-username (filename &optional username)
  "Replace USER with USERNAME in `/SERVICE:USER@MACHINE:' preceding FILENAME.

Order of operation goes top to bottom, breaking when finding an
appropriate action:

If USERNAME is nil, instead remove the prefix completely, doing
nothing if there is no prefix.

If USERNAME works as a prefix, replace the prefix with it.

If FILENAME has a prefix, replace the `USER' in the prefix with USERNAME.

If the prefix on FILENAME doesn't exist, prefix `/USERNAME::' to
the result (which will translate to `/sudo:USERNAME@localhost:')."
  (let (action)
    (setq action
          (if (or (null username) (string-empty-p username))
              1
            ;; USERNAME is not nil
            (with-temp-buffer (insert username)
                                (goto-char (point-min))
                                (if (or (looking-at-p "/.*:.*@.*:")
                                        (looking-at-p "/.*::"))
                                    ;; USERNAME has prefix
                                    2
                                  ;; USERNAME has no prefix
                                  3))))
    (with-temp-buffer
      (insert filename)
      (goto-char (point-min))
      (save-match-data (if (looking-at "/.*:\\(.*\\)@.*:")
                           ;; prefix does exist
                           (case action
                             ;; remove prefix and exit
                             ((1)
                              (delete-region (match-beginning 0)
                                             (match-end 0)))
                             ;; remove prefix and add USERNAME as one
                             ((2)
                              (delete-region (match-beginning 0)
                                             (match-end 0))
                              (goto-char (point-min))
                              (insert username))
                             ;; substitute USER with USERNAME in
                             ;; `/SERVICE:USER@MACHINE:'
                             ((3)
                              (delete-region (match-beginning 1)
                                             (match-end 1))
                              (goto-char (match-beginning 1))
                              (insert username)))
                         ;; prefix doesn't exist
                         (case action
                           ;; do nothing
                           ((1))
                           ;; add USERNAME as a prefix
                           ((2)
                            (insert username))
                           ;; /USERNAME::
                           ((3)
                            (insert "/" username "::")))))
      (buffer-substring-no-properties (point-min) (point-max)))))

(defun write-file-as-user (filename user)
  "Write current buffer into file FILENAME as USER via TRAMP.

This will transfer into the new file, just like `write-file', and
future saves will also use USER."
  (interactive "FWrite file: \nsUser to save as: ")
  (write-file (replace-tramp-username filename user)))

(defun write-file-as-sudo (filename)
  "Write current buffer into file FILENAME as root via TRAMP.

This will transfer into the new file, just like `write-file', and
future saves will also use root."
  (interactive "FWrite file: ")
  (write-file-as-user filename "sudo"))
