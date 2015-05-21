(defun ediff-git-timemachine ()
  (interactive)
  (let ((git-root
         (replace-regexp-in-string
          (rx (* (any " \t\n")) eos)
          ""
          (shell-command-to-string "git rev-parse --show-toplevel")))
        (file-revisions
         (split-string
          (shell-command-to-string
           (concat
            "git --no-pager log --pretty=format:%t "
            (buffer-file-name))))))
    (let ((revision-file-slug
           (concat (car file-revisions)
                   ":"
                   (replace-regexp-in-string
                    (concat git-root "/") "" (buffer-file-name)))))
      (shell-command
       (concat
        "git --no-pager show "
        revision-file-slug)
       revision-file-slug)
      (with-current-buffer revision-file-slug
        (set-visited-file-name (concat "/tmp/" revision-file-slug))
        (save-buffer))
      (ediff-merge (buffer-file-name) (concat "/tmp/" revision-file-slug))
      )))
