(defadvice magit-log-edit-commit (around magit-commit-babysitter)
  "Make sure we have a nice commit message."
  (let ((bad-commit-message nil)
        (case-fold-search nil))
    (save-excursion
      (beginning-of-buffer)
      (unless (string-match "[A-Z]" (string (char-after (point-min))))
        (setq bad-commit-message "Commit message does not begin with a capital letter."))
      (end-of-line)
      (if (> (current-column) 50)
          (setq bad-commit-message "First line is too long (> 50 characters)."))
      (goto-line 2)
      (if (and
           (not (string-match "-- End of Magit header --") (buffer-string))
           (= (line-number-at-pos) 2)
           (not (equal (point-at-bol) (point-at-eol)))
           (setq bad-commit-message "The second line is not blank and there are more than one line.")))
      (while (not (equal (point) (point-max)))
        (forward-line)
        (end-of-line)
        (if (> (current-column) 72)
            (setq bad-commit-message "There are lines that are too long (> 72 characters)")))
      (if bad-commit-message
          (if (yes-or-no-p (concat "WARNING: " bad-commit-message " still commit?"))
              ad-do-it)))))

(ad-activate 'magit-log-edit-commit)

(provide 'my-advice)
