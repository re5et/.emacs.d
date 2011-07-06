(defvar emux-default-session-name "default")
(defvar emux-completing-read-command 'ido-completing-read)

(require 'emux-sessions)
(require 'emux-screens)
(require 'emux-term)
(require 'emux-utils)
(provide 'emux)

(defun emux-completing-read (prompt list)
  (funcall emux-completing-read-command prompt list))

(defun emux-initialize ()
  (let ((session (intern emux-default-session-name)))
    (emux-create-session session t)
    (emux-add-screen-to-session (elscreen-get-current-screen) session)
    (emux-add-buffer-to-session (current-buffer) session)))
