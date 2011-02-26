(defun dont-kill-emacs () ;; why would i close it?
  (interactive)
  (error (substitute-command-keys "i can never die.")))

(defun go-to-hell-bars ()
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)))

(defun could-eat-a-horse-kill (&optional arg)
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
        (fancified-kill)
        (back-to-indentation)))
  (progn
    (delete-region (point) (progn (skip-chars-forward " \t") (point)))
    (indent-according-to-mode)))

(defun could-eat-a-horse-kill-whole-line (&optional arg)
  (interactive)
  (beginning-of-line)
  (could-eat-a-horse-kill arg))

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

;; (defun move-line-and-indent (line-command &optional arg try-vscroll)
;;   "Move to the next line and indent according to mode."
;;   (interactive)
;;   (if (not buffer-read-only)
;;       (progn (indent-according-to-mode)
;;              (apply line-command arg try-vscroll)
;;              (indent-according-to-mode))
;;     (apply line-command arg try-vscroll)))

(defun indent-buffer ()
  "Fix indentation on the entire buffer."
  (interactive)
  (save-excursion)
  (indent-region (point-min) (point-max)))

(defun my-auto-indent ()
  "indent all the gosh darned time."
  (indent-according-to-mode))

;;(add-hook 'pre-command-hook 'my-auto-indent)
;;(add-hook 'post-command-hook 'my-auto-indent)
;; (remove-hook 'pre-command-hook 'my-auto-indent)
;; (remove-hook 'post-command-hook 'my-auto-indent)

(defun disable-auto-indent ()
  "disable my-auto-indent in cases where it screws
stuff up"
  (interactive)
  (remove-hook 'pre-command-hook 'my-auto-indent)
  (remove-hook 'post-command-hook 'my-auto-indent))

(add-hook 'haml-mode-hook 'disable-auto-indent)
(add-hook 'yaml-mode-hook 'disable-auto-indent)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(defun yank-and-indent ()
  "Yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (indent-according-to-mode))
