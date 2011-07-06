(require 'elscreen)

(defun emux-create-screen (&optional name terminal-name command)
  (interactive)
  (elscreen-create)
  (if name
      (emux-rename-screen name))
  (emux-create-terminal terminal-name command))

(defun emux-rename-screen (name)
  (interactive "snew screen name: ")
  (elscreen-screen-nickname name))

(defun emux-jump-to-buffer ()
  "Use ido to find specific buffer and jump to its elscreen"
  (interactive)
  (elscreen-find-and-goto-by-buffer
   (emux-completing-read
    "jump to buffer: " (mapcar 'buffer-name (buffer-list)))))

(defun emux-jump-to-screen ()
  (interactive)
  (elscreen-goto
   (car
    (rassoc
     (emux-completing-read
      "jump to screen: "
      (mapcar 'cdr (elscreen-get-screen-to-name-alist)))
     (elscreen-get-screen-to-name-alist)))))

(defun emux-switchable-session-screens ()
  (remove nil (mapcar (lambda (screen)
                        (if (member
                             (car screen)
                             (emux-get-session-screens emux-current-session))
                            screen))
                      (elscreen-get-screen-to-name-alist))))

(defun emux-switch-screen ()
  (interactive)
  (let* ((screens (emux-switchable-session-screens))
         (name-pairs (mapcar (lambda (screen)
                               (emux-stripped-session-name-pair (cdr screen))
                               ) screens))
         (selected (emux-completing-read "go to screen: " (mapcar 'cdr name-pairs))))
    (elscreen-goto (car (rassoc (car (rassoc selected name-pairs)) screens)))))

(defun emux-strip-session-prefix (string)
  (replace-regexp-in-string
   (concat
    "\\("
    (mapconcat (lambda (session)
                 (symbol-name (car session)))
               emux-sessions "\\|")
    "\\)/")
   ""
   string))

(defun emux-stripped-session-name-pair (string)
  (cons string (emux-strip-session-prefix string)))

(provide 'emux-screens)
