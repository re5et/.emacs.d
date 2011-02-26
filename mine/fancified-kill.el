(defun fancified-kill (&optional arg)
  "Kills line as normal, but if the line is emtpy then get rid of the
line, then delete any space forward to the next non-whitespace
character, then if the line has been deleted, move back to indentation
and then indent according to mode."
  (interactive "P")
  (kill-line)
  (delete-horizontal-space)
  (if (= (line-beginning-position) (line-end-position))
      (progn
        (delete-region (save-excursion
                         (forward-line 0)
                         (point))
                       (save-excursion
                         (forward-line 1)
                         (point)))
        (message "in here")
        (back-to-indentation)))
  (progn
    (delete-region (point) (progn (skip-chars-forward " \t") (point)))
    (indent-according-to-mode)))

;; from http://emacsblog.org/2009/05/18/copying-lines-not-killing/
(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting kill-read-only-ok to t."
  (interactive "P")
  (toggle-read-only 1)
  (kill-line arg)
  (toggle-read-only 0))

(defun move-line-and-indent (line-command &optional arg try-vscroll)
  "Move to the next line and indent according to mode."
  (interactive)
  (if (not buffer-read-only)
      (progn (indent-according-to-mode)
             (apply line-command arg try-vscroll)
             (indent-according-to-mode))
    (apply line-command arg try-vscroll)))

(defun indent-buffer ()
  "Fix indentation on the entire buffer."
  (interactive)
  (save-excursion)
  (indent-region (point-min) (point-max)))
