(defadvice magit-log-edit-commit (around magit-commit-babysitter)
  "Make sure we have a nice commit message."
  (let ((ok-to-commit t)
        (commit-problems nil)
        (case-fold-search nil)
        (special-case (string-match "-- End of Magit header --" (buffer-string))))
    (save-excursion
      (beginning-of-buffer)
      (if special-case (goto-line 3))
      (unless (string-match "[A-Z]" (string (char-after (point-min))))
        (if (yes-or-no-p "Doesn't start with a capital letter, fix?")
            (progn
              (beginning-of-line)
              (capitalize-word 1))))
      (end-of-line)
      (if (> (current-column) 50)
          (add-to-list 'commit-problems "First line is too long (> 50 characters)."))
      (if (> (count-lines (point) (point-max)) 0)
          (progn
            (forward-line)
            (if (not (equal (point-at-bol) (point-at-eol)))
                (if (yes-or-no-p "Doesn't have a blank line after the first, fix?")
                    (progn
                      (beginning-of-line)
                      (newline))))
            (while (not (equal (point) (point-max)))
              (forward-line)
              (end-of-line)
              (if (> (current-column) 72)
                  (add-to-list 'commit-problems "There are lines that are too long (> 72 characters)")))))
      (if commit-problems
          (catch 'break
            (dolist (problem commit-problems)
              (unless (yes-or-no-p (concat "WARNING: " problem " still commit?"))
                (progn
                  (setq ok-to-commit nil)
                  (throw 'break nil)))))))
    (if ok-to-commit ad-do-it)))

(ad-activate 'magit-log-edit-commit)

(provide 'my-advice)
