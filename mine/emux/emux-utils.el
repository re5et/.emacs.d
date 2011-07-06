(defun emux-toggle-full-window ()
  (interactive)
  (if (one-window-p)
      (if emux-toggle-full-window
          (set-window-configuration emux-toggle-full-window))
    (progn
      (setq emux-toggle-full-window (current-window-configuration))
      (delete-other-windows))))

(defun emux-set-pwd (path)
  (interactive "Dset pwd: ")
  (cd path))

(defun emux-kill-remove-split (&optional buffer)
  (interactive)
  (let ((buf (if buffer
                 buffer
               (current-buffer))))
    (kill-buffer buffer)
    (delete-window)))

(defun emux-load-session-template ()
  (interactive)
  (let ((template
         (ido-completing-read
          "load emux template: "
          (mapcar (lambda (filename)
                    (substring filename 0 -3))
                  (directory-files
                   "~/.emacs.d/emux-templates" nil "^[^#].*\.el")))))
    (if (cond
         ((not (assoc (intern template) emux-sessions)) t)
         (t (yes-or-no-p (format "session %s already exists, really load?" template))))
        (progn
          (emux-create-session (intern template) t)
          (load-file
           (concat "~/.emacs.d/emux-templates/"
                   template
                   ".el"))
          (message "%s template loaded" template)))))

(provide 'emux-utils)
