(defun kill-ring-save-isearch-match ()
  "Kill the current isearch match string and continue searching."
  (interactive)
  (kill-ring-save isearch-other-end (point))
  (message "killed: %s" (buffer-substring isearch-other-end (point))))

(define-key isearch-mode-map [(control k)] 'kill-ring-save-isearch-match)

(provide 'my-isearch)
