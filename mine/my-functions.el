(defun dont-kill-emacs () ;; why would i close it?
  (interactive)
  (error (substitute-command-keys "i can never be killed.")))

(defun go-to-hell-bars ()
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)))

(defun hungry-kill (&optional arg)
  (interactive "P")
  (let ((next-line-empty
         (save-excursion
           (next-line)
           (eq
            (line-beginning-position)
            (line-end-position))))
        (at-end-of-line
         (eq (point) (line-end-position))))
    (progn
      (kill-line arg)
      (indent-according-to-mode)
      (if (or next-line-empty at-end-of-line)
          (progn
            (delete-region (point) (next-non-white))
            (indent-according-to-mode))))))

(defun hungry-kill-whole-line (&optional arg)
  (interactive "P")
  (beginning-of-line)
  (hungry-kill arg)
  (indent-according-to-mode))

(defun backwards-kill ()
  (interactive)
  (delete-region (point) (line-beginning-position))
  (indent-according-to-mode))

(defun jump-to-string (char)
  (interactive "cjump to char:")
  (search-forward (char-to-string char)))

(defun next-non-white ()
  (interactive)
  (save-excursion
    (skip-chars-forward " \t
")
    (point)))

(defun into-and-indent ()
  (interactive)
  (let ((goto (next-non-white)))
    (goto-char goto)
    (end-of-line)
    (newline)
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

(defun disable-auto-indent ()
  "disable my-auto-indent in cases where it screws
stuff up"
  (interactive)
  (remove-hook 'pre-command-hook 'my-auto-indent)
  (remove-hook 'post-command-hook 'my-auto-indent))

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

(defun untabify-all ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun flymake-goto-next-error-and-show ()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line))

(defun clone-line (dir)
  "Copies current line up or down based on DIR, leaves cursor where it is"
  (let ((line (buffer-substring (line-beginning-position) (line-end-position))))
    (save-excursion
      (if (equal dir "up")
          (progn
            (previous-line)))
      (end-of-line)
      (open-line 1)
      (next-line)
      (insert line))))

(defun clone-line-up ()
  (interactive)
  (clone-line "up"))

(defun clone-line-down ()
  (interactive)
  (clone-line "down"))

(defun quick-rgrep-path-depth (shallowness)
  (interactive)
  (rgrep
   (thing-at-point 'symbol)
   "*"
   (mapconcat 'identity
              (reverse (last (reverse (split-string (buffer-file-name) "/")) shallowness)) "/")))

(defun quick-rgrep ()
  (interactive)
  (quick-rgrep-path-depth 5))

(defun quick-rgrep-path (dir)
  (interactive "D")
  (rgrep
   (thing-at-point 'symbol)
   (concat "*" (file-name-extension (buffer-file-name)))
   dir))

;; (defun reb-query-replace (to-string)
;;   "Replace current RE from point with `query-replace-regexp'."
;;   (interactive
;;    (progn (barf-if-buffer-read-only)
;;           (list (query-replace-read-to (reb-target-binding reb-regexp)
;;                                        "Query replace"  t))))
;;   (with-current-buffer reb-target-buffer
;;     (query-replace-regexp (reb-target-binding reb-regexp) to-string)))

;; (defun re-builder-query-replace-perl (&optional begin end pattern replace)
;;   (interactive "r")
;;   (let ((replace
;;          (read-from-minibuffer
;;           (format "replace %s in region with pattern: " pattern) nil)))
;;         (shell-command-on-region (format "perl -pe s/%s/%s/g" pattern replace))))

;; (defun replace-perl-regexp (&optional begin end pattern replace)
;;   (interactive "r")
;;   (let ((backto (point)))p
;;        (shell-command-on-region
;;         begin end
;;         (format "perl -pe 's/%s/%s/g'" pattern replace)
;;         nil t)
;;        (goto-char backto)))

;; (defun region-replace-perl-regexp (pattern replace)
;;   (replace-perl-regexp (region-beginning) (region-end) pattern replace))

;; (defun buffer-replace-perl-regexp (pattern replace)
;;   (replace-perl-regexp (point-min) (point-max) pattern replace))

;; (defun reb-execute-perl-regexp (pattern begin end)
;;   (let ((replace (read-from-minibuffer "replacement: " nil)))
;;     (replace-perl-regexp begin end pattern replace)))

;; (defun reb-execute-perl-regexp-on-buffer ()
;;   (interactive)
;;   (let ((pattern (substring (buffer-string) 1 (- (length (buffer-string)) 1))))
;;     (set-buffer reb-target-buffer)
;;     (reb-execute-perl-regexp pattern (point-min) (point-max))))

;; (defun reb-execute-perl-regexp-on-region ()
;;   (interactive)
;;   (set-buffer reb-target-buffer)
;;   (reb-execute-perl-regexp (region-beginning) (region-end)))

;; (defun reb-execute-perl-regexp (begin end)
;;    (interactive)
;;    (let ((pattern (buffer-string))
;;          (replace (read-from-minibuffer "replace with: " nil))
;;          (old-buffer current-buffer))
;;      (set-buffer reb-target-buffer)
;;      (replace-perl-regexp (region-beginning) (region-end) pattern replace)
;;      (set-buffer current-buffer)))


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
    (require 'emux)
    (emux-initialize))
  (unless (member
           "emux"
           (mapcar
            (lambda (frame) (frame-parameter frame 'name))
            (frame-list)))
    (modify-frame-parameters nil (list (cons 'name "emacs")))
    (modify-frame-parameters (make-frame) (list (cons 'name "emux")))))

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
