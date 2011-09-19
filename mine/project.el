(defvar projects nil)
(defvar buffer-project nil)
(make-variable-buffer-local 'buffer-project)

(defun has-paths (paths &optional dir)
  (let ((dir (or dir default-directory)))
    (if (member
         nil
         (mapcar
          (lambda (path)
            (file-exists-p (expand-file-name (symbol-name path) dir)))
          paths))
        (unless (string= dir "/")
          (has-paths paths (expand-file-name ".." dir)))
      dir)))

(defun get-buffer-project ()
  (or buffer-project
      (car (mapcar
            (lambda (project)
              (let* ((paths (cadr (member :has project)))
                     (ignore (cadr (member :ignore project)))
                     (found-project (has-paths paths (buffer-file-name))))
                (if found-project
                    `(,found-project . ,ignore))))
            projects))))

(defun buffer-project-root ()
  (car (get-buffer-project)))

(defun buffer-project-ignored ()
  (cdr (get-buffer-project)))

(defun set-buffer-project ()
  (setq buffer-project (get-buffer-project)))

(defun buffer-project-rgrep (fn)
  (let* ((original-ignored grep-find-ignored-directories)
         (grep-find-ignored-directories
          (append original-ignored
                  (mapcar
                   (lambda (dir)
                     (symbol-name dir))
                   '(.git tmp log coverage public/system doc vendor)))))
    (funcall fn)))

(defun rgrep-project ()
  (interactive)
  (buffer-project-rgrep
   (lambda ()
     (call-interactively 'rgrep))))

(defun rgrep-project-thing-at-point ()
  (interactive)
  (buffer-project-rgrep
   (lambda ()
     (rgrep (thing-at-point 'symbol) "*" (buffer-project-root)))))

(defun project-find-file ()
  (interactive)
  (find-file
   (format "%s/%s"
           (buffer-project-root)
           (ido-completing-read
            "file: "
            (project-get-files)))))

(defun project-get-files ()
  (split-string
   (shell-command-to-string
    (mapconcat
     'identity
     `("find"
       ,(buffer-project-root)
       "\\("
       ,(format "-path \\*/%s" (car (buffer-project-ignored)))
       ,(mapconcat (lambda (dir)
                     (format "-o -path \\*/%s" (symbol-name dir)))
                   (cdr (buffer-project-ignored)) " ")
       "\\)"
       "-prune -o -type f"
       ,(format "| sed s:'%s/'::" (buffer-project-root))
       ) " "))))

(defun add-project (project)
  (push project projects))
