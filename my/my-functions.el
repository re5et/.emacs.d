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
  (save-excursion)
  (indent-region (point-min) (point-max)))

(defun my-auto-indent ()
  "indent all the gosh darned time."
  (indent-according-to-mode))

(defun enable-auto-indent ()
  (interactive)
  (add-hook 'pre-command-hook 'my-auto-indent)
  (add-hook 'post-command-hook 'my-auto-indent))

(defun disable-auto-indent ()
  "disable my-auto-indent in cases where it screws
stuff up"
  (interactive)
  (remove-hook 'pre-command-hook 'my-auto-indent)
  (remove-hook 'post-command-hook 'my-auto-indent))

(defun yank-and-indent ()
  "Yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (indent-according-to-mode))

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

(defun set-newline-and-indent ()
  (interactive)
  (local-unset-key (kbd "RET"))
  (local-set-key (kbd "RET") 'newline-and-indent))

(defun start-emux ()
  (unless (featurep 'emux)
    (require 'emux))
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

(defun buffer-history-next ()
  (interactive)
  (switch-to-buffer (next-buffer)))

(defun buffer-history-previous ()
  (interactive)
  (switch-to-buffer (previous-buffer)))

(defun dired-default ()
  (interactive)
  (dired default-directory))

(defun replace-thing-at-point-with-last-kill ()
  (interactive)
  (save-excursion
    (replace-string
     (current-kill 0)
     (thing-at-point 'symbol) t (point-min) (point-max))))

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

(toggler scratch (lambda () (switch-to-buffer "*scratch*")) t)
(toggler dired (lambda () (dired default-directory)) t)
(toggler music (lambda () (emms-smart-browse)) t)
(toggler term (lambda () (term "/bin/zsh")) t)
(toggler embiggen nil t)

;; I-search with initial contents
(defvar isearch-initial-string nil)

(defun isearch-set-initial-string ()
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string)
  (isearch-search-and-update))

(defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the symbol at point."
  (interactive "P\np")
  (if regexp-p (isearch-forward regexp-p no-recursive-edit)
    (let* ((end (progn (skip-syntax-forward "w_") (point)))
           (begin (progn (skip-syntax-backward "w_") (point))))
      (if (eq begin end)
          (isearch-forward regexp-p no-recursive-edit)
        (setq isearch-initial-string (buffer-substring begin end))
        (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
        (isearch-forward regexp-p no-recursive-edit)))))

(defun space-out ()
  (interactive)
  (newline)
  (newline)
  (previous-line))

(provide 'my-functions)
