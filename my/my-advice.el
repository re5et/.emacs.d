(defadvice magit-log-edit-commit (around magit-commit-babysitter)
  "Make sure we have a nice commit message."
  (let ((bad-commit-message nil)
        (case-fold-search nil))
    (save-excursion
      (beginning-of-buffer)
      (unless (string-match "[A-Z]" (string (char-after (point-min))))
        (setq bad-commit-message "Commit message should begin with a capital letter."))
      (end-of-line)
      (if (> (current-column) 50)
          (setq bad-commit-message "First line is too long, keep it to under 50"))
      (goto-line 2)
      (if (and
           (= (line-number-at-pos) 2)
           (not (equal (point-at-bol) (point-at-eol)))
           (setq bad-commit-message "The second line should be blank if there is more than one line.")))
      (while (not (equal (point) (point-max)))
        (forward-line)
        (end-of-line)
        (if (> (current-column) 72)
            (setq bad-commit-message "You have lines that are too long, keep them under 72.")))
      (if bad-commit-message
          (message bad-commit-message)
        ad-do-it))))
(ad-activate 'magit-log-edit-commit)

(provide 'my-advice)
