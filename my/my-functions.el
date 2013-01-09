(defun dont-kill-emacs () ;; why would i close it?
  (interactive)
  (error (substitute-command-keys "i can never be killed.")))

(defun go-to-hell-bars ()
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)))

(defun hungry-kill (&optional arg)
  (interactive "P")
  (kill-line)
  (delete-region (point) (1- (next-non-white))))

(defun backwards-kill ()
  (interactive)
  (delete-region (point) (line-beginning-position))
  (indent-according-to-mode))

(defun next-non-white ()
  (interactive)
  (save-excursion
    (skip-chars-forward " \t
")
    (point)))

(defun previous-non-white ()
  (interactive)
  (save-excursion
    (skip-chars-backward " \t
")
    (point)))

(defun next-newline (arg)
  (interactive "P")
  (let ((goto (next-non-white)))
    (goto-char goto)
    (end-of-line)
    (reindent-then-newline-and-indent)))

(defun previous-newline (arg)
  (interactive "P")
  (let ((goto (previous-non-white)))
    (goto-char goto)
    (beginning-of-line)
    (reindent-then-newline-and-indent)
    (previous-line)
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

(defun indent-buffer ()
  "Fix indentation on the entire buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max))))

(defun untabify-all ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun flymake-goto-next-error-and-show ()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line))

(defun clone-text (direction)
  (interactive)
  (let* ((text
          (progn
            (unless (region-active-p)
              (set-mark (line-beginning-position))
              (goto-char (line-end-position)))
            (buffer-substring (region-beginning) (region-end))))
         (end (region-end)))
    (goto-char (region-end))
    (unless (eq (point) (line-beginning-position))
      (open-line 1)
      (next-line))
    (insert text)
    (if (eq direction 'up)
        (goto-char end))))

(defun clone-text-up ()
  (interactive)
  (clone-text 'up))

(defun clone-text-down ()
  (interactive)
  (clone-text 'down))

(defun kill-focused-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun next-in-frame-window ()
  (interactive)
  (select-window (next-window)))

(defun previous-in-frame-window ()
  (interactive)
  (select-window (previous-window)))

(defun auto-make-directory ()
  (let ((dir (file-name-directory (buffer-file-name))))
    (unless (file-readable-p dir)
      (make-directory dir t))))

(defun start-emux ()
  (unless (featurep 'emux-session)
    (require 'emux-session))
  (unless
      (member
       "emux"
       (mapcar
        (lambda (frame) (frame-parameter frame 'name))
        (frame-list)))
    (modify-frame-parameters nil (list (cons 'name "emacs")))
    (modify-frame-parameters (make-frame) (list (cons 'name "emux")))))

(defun rotate-frame-window-buffers ()
  (interactive)
  (let ((map
         (mapcar
          (lambda (window)
            `(,window
              ,(window-buffer
                (next-window window))))
          (window-list))))
    (mapcar
     (lambda (window-to-buffer)
       (let ((window (car window-to-buffer))
             (buffer (cadr window-to-buffer)))
         (select-window window)
         (switch-to-buffer buffer))) map)))

(defun dired-default ()
  (interactive)
  (dired default-directory))

(defmacro toggler (toggler-name &optional fn full)
  (let ((name
         (intern
          (mapconcat
           'symbol-name
           `(,toggler-name toggler)
           "-"))))
    `(defun ,name ()
       (interactive)
       (message (format "%s %s" ',toggler-name "toggled"))
       (if (and (boundp ',name) (car ,name))
           (progn
             (set-window-configuration (cadr ,name))
             (setq ,name '(nil nil)))
         (progn
           (setq ,name `(t ,(current-window-configuration)))
           (and ,full (delete-other-windows))
           (and ,fn (funcall ,fn)))))))

(toggler embiggen nil t)

(defun space-out ()
  (interactive)
  (newline)
  (newline)
  (previous-line))

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun rename-current-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " default-directory filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun google-this ()
  (interactive)
  (let ((search-phrase
         (if (region-active-p)
             (buffer-substring (region-beginning) (region-end))
           (thing-at-point 'symbol))))
    (browse-url (concat "https://www.google.com/search?&q=" search-phrase))))


(defmacro with-directory-from-bookmark (body)
  "Run body with default-directory set to
to the location of the selected bookmark."
  `(let ((bookmark (list
                    (bookmark-completing-read
                     "bookmark"
                     bookmark-current-bookmark))))
     (let ((default-directory (bookmark-location (car bookmark))))
       ,body)))

(defun call-interactively-with-directory-from-bookmark (fn)
  (interactive "afunction: ")
  (with-directory-from-bookmark
   (call-interactively fn)))

(defun magit-status-from-bookmark ()
  "Magit status for bookmark"
  (interactive)
  (call-interactively-with-directory-from-bookmark
   'magit-status))

(provide 'my-functions)
