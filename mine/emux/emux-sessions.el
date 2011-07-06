(require 'elscreen)

(setf emux-sessions nil
      emux-session-pwds nil
      emux-session-buffers nil)

(defun emux-create-session (session-name &optional current)
  (interactive)
  (push (list session-name) emux-sessions)
  (push (list session-name) emux-session-pwds)
  (push (list session-name) emux-session-buffers)
  (if current
      (emux-set-current-session session-name)))

(defun emux-destroy-session (&optional session-name)
  (interactive)
  (let ((kill-buffer-query-functions
         (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
        (session-name
         (or session-name
             emux-current-session)))
    (when (yes-or-no-p
           (format "really destroy session %s, it's screens and buffers?" session-name))
      (mapc
       (lambda (screen)
         (elscreen-kill screen)
         (mapc
          (lambda (buffer)
            (if (buffer-live-p buffer)
                (kill-buffer buffer)))
          (emux-get-session-buffers session-name)))
       (emux-get-session-screens session-name))
      (delq (assoc session-name emux-session-buffers) emux-session-buffers)
      (delq (assoc session-name emux-session-pwds) emux-session-pwds)
      (delq (assoc session-name emux-sessions) emux-sessions)
      (emux-set-current-session))))

(defun emux-set-session-pwd (path &optional session)
  (let ((session (or session emux-current-session)))
    (setcdr (assoc session emux-session-pwds) path)))

(defun emux-add-screen-to-session (screen session)
  (push screen (cdr (assoc session emux-sessions))))

(defun emux-add-buffer-to-session (buffer session)
  (push buffer (cdr (assoc session emux-session-buffers))))

(defun emux-set-current-session (&optional session)
  (let ((session (cond
                  ((not session) (emux-find-session-by-screen))
                  ((symbolp session) session)
                  (t (intern session)))))
    (when (not (eq (and (boundp 'emux-current-session) emux-current-session) session))
      (setf emux-current-session session)
      (message "switched to session %s" emux-current-session))))

(defun emux-get-session-screens (&optional session)
  (cdr (assoc (or session emux-current-session) emux-sessions)))

(defun emux-get-session-buffers (&optional session)
  (cdr (assoc (or session emux-current-session) emux-session-buffers)))

(defun emux-find-session-by-buffer (&optional buffer)
  (let ((buffer (or buffer (current-buffer))))
    (if (buffer-live-p buffer)
        (emux-find-session-by buffer)
      (message "specified buffer does not exist"))))

(defun emux-find-session-by-screen (&optional screen)
  (let ((screen (or screen (elscreen-get-current-screen))))
    (if (member screen (apply 'append (mapcar 'cdr emux-sessions)))
        (emux-find-session-by screen)
      (message "screen does not exist."))))

(defun emux-find-session-by (screen-or-buffer)
  (let ((search (if (bufferp screen-or-buffer)
                    emux-session-buffers
                  emux-sessions))
        (found nil))
    (while (not (member screen-or-buffer (cdar search)))
      (setf search (cdr search)))
    (caar search)))

(defun emux-switch-session (&optional session-name)
  (interactive)
  (emux-set-current-session
   (emux-completing-read "session: "
                         (mapcar (lambda (sess)
                                   (symbol-name (car sess)))
                                 emux-sessions)))
  (let ((screen (car (cdr (assoc emux-current-session emux-sessions)))))
    (elscreen-goto (or screen 0))))

(defadvice emux-jump-to-buffer (after emux-set-current-session-after-jump)
  (emux-set-current-session (emux-find-session-by-screen (elscreen-get-current-screen))))
(ad-activate 'emux-jump-to-buffer)

(defadvice emux-jump-to-screen (after emux-set-current-session-after-jump)
  (emux-set-current-session (emux-find-session-by-screen (elscreen-get-current-screen))))
(ad-activate 'emux-jump-to-screen)

(defadvice elscreen-create (around emux-session-store-screen)
  (emux-add-screen-to-session ad-do-it emux-current-session))
(ad-activate 'elscreen-create)

(defadvice emux-create-terminal (around emux-store-session-buffer)
  (let ((buffer ad-do-it))
    (rename-buffer (format "%s/%s" emux-current-session (buffer-name buffer)))
    (emux-add-buffer-to-session buffer emux-current-session)))

(defadvice emux-create-terminal (around emux-session-pwd-default-directory)
  (let ((default-directory (cdr (assoc emux-current-session emux-session-pwds))))
    ad-do-it))
(ad-activate 'emux-create-terminal)

(provide 'emux-sessions)
