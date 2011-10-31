(defvar projects nil)
(defvar buffer-project nil)
(make-variable-buffer-local 'buffer-project)

(defun project-has-paths (paths &optional dir)
  (let ((dir (or dir default-directory)))
    (if (member
         nil
         (mapcar
          (lambda (path)
            (file-exists-p (expand-file-name (symbol-name path) dir)))
          paths))
        (unless (string= dir "/")
          (project-has-paths paths (expand-file-name ".." dir)))
      dir)))

(defun project-for-current-buffer ()
  (or buffer-project
      (dolist (project projects)
        (let* ((paths (plist-get project :has))
               (found-project (project-has-paths paths)))
          (if found-project
              (progn
                (plist-put project :root (directory-file-name found-project))
                (return (setq buffer-project project))))))))

(defun project-get (member)
  (plist-get
   (project-for-current-buffer)
   member))

(defun project-root ()
  (project-get :root))

(defun project-ignored ()
  (project-get :ignore))

(defun project-type ()
  (project-get :type))

(defun project-buffer-rgrep (fn)
  (let* ((original-ignored grep-find-ignored-directories)
         (grep-find-ignored-directories
          (append original-ignored
                  (mapcar
                   (lambda (dir)
                     (symbol-name dir))
                   (project-ignored)))))
    (funcall fn)))

(defun project-rgrep ()
  (interactive)
  (project-buffer-rgrep
   (lambda ()
     (call-interactively 'rgrep))))

(defun project-rgrep-thing-at-point ()
  (interactive)
  (project-buffer-rgrep
   (lambda ()
     (let ((search-for (if (region-active-p)
                           (buffer-substring (region-beginning) (region-end))
                         (thing-at-point 'symbol))))
       (rgrep search-for "*" (project-root))))))

(defun project-find-file ()
  (interactive)
  (find-file
   (format "%s/%s"
           (project-root)
           (ido-completing-read
            "file: "
            (project-files)))))

(defun project-files ()
  (message (project-root))
  (split-string
   (shell-command-to-string
    (mapconcat
     'identity
     `("find"
       ,(project-root)
       "\\("
       ,(format "-path \\*/%s" (car (project-ignored)))
       ,(mapconcat (lambda (dir)
                     (format "-o -path \\*/%s" (symbol-name dir)))
                   (cdr (project-ignored)) " ")
       "\\)"
       "-prune -o -type f"
       ,(format "| sed -E s:'%s/'::" (project-root))
       ) " "))))

(defun project-define (project)
  (push project projects))
