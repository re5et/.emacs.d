(defun cok ()
  (interactive)
  (cucumber-runner "cok"))

(defun cwip ()
  (interactive)
  (cucumber-runner "cwip"))

(defun cucumber-runner (type)
  (let ((dir (format "%sfeatures/" default-directory))
        (command (format "%s FEATURE=" type)))
    (emux-terminal-command
     (format
      "%s%s%s"
      command
      dir
      (ido-completing-read command (directory-files dir))))))

(defun cucumber-goto-last-failing-scenario ()
  (interactive)
  (goto-char (point-max))
  (search-backward "Failing Scenarios:")
  (re-search-forward "cucumber \\(.*\\) #")
  (let* ((match (split-string (match-string-no-properties 1) ":")))
    (find-file-other-window (car match))
    (other-window)
    (goto-line (cadr match))
    (select-other-window)))

(provide 'cucumber-emux-helpers)
