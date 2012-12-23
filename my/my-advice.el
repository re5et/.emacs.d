(defadvice magit-log-edit-commit (around magit-commit-babysitter)
  "Make sure we have a nice commit message."
  (let ((ok-to-commit nil)
        (bad-commit-message nil)
        (case-fold-search nil)
        (special-case (string-match "-- End of Magit header --" (buffer-string))))
    (save-excursion
      (beginning-of-buffer)
      (print "special case:" special-case)
      (if special-case (goto-line 3))
      (if special-case (print "penis"))
      (unless (string-match "[A-Z]" (string (char-after (point-min))))
        (if (yes-or-no-p "Doesn't start with a capital letter, fix?")
            (progn
              (beginning-of-line)
              (capitalize-word 1))))
      (end-of-line)
      (if (> (current-column) 50)
          (setq bad-commit-message "First line is too long (> 50 characters)."))
      (next-line)
      (if (and
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
              (setq ok-to-commit t))
        (setq ok-to-commit t)))
    (print "here" ok-to-commit)
    (if ok-to-commit ad-do-it)))

(ad-activate 'magit-log-edit-commit)

(provide 'my-advice)
