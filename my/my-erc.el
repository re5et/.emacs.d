(require 'tls)
(require 'erc)

(setq erc-current-nick-highlight-type 'nick)
(setq erc-keywords '("@atom" "@all" "@everyone"))
(setq erc-track-use-faces t)
(setq erc-track-faces-priority-list
      '(erc-current-nick-face erc-keyword-face))
(setq erc-track-priority-faces-only 'all)

(defun erc-pop-mention (&rest ignore)
  (let ((buffer (erc-track-get-active-buffer 1)))
    (if buffer
        (progn
          (if (>= 10 (window-height))
              (window-resize (get-buffer-window) 10))
          (split-window-below -10)
          (other-window 1)
          (erc-track-switch-buffer 1)
          (other-window -1)))))
(add-hook 'erc-track-list-changed-hook 'erc-pop-mention)

(defun flowdock-identify (email)
  (interactive "Mflowdock email address: ")
  (erc-load-irc-script-lines
   (list (concat
          "/msg NickServ identify "
          email
          " "
          (read-passwd "password: ")))))


(defun my-flowdock-identify (host nick)
  (if (equal host "irc.flowdock.com")
      (progn
        (setq erc-hide-list '("NickServ"))
        (sit-for 5)
        (flowdock-identify "smith@substantial.com")
        ;; clear out the buffer, don't leave the
        ;; password sitting out
        (let ((inhibit-read-only t))
          (buffer-disable-undo)
          (erase-buffer)
          (buffer-enable-undo)))))

(add-hook 'erc-after-connect 'my-flowdock-identify)

(defun flowdock ()
  (interactive)
  (erc-tls :server "irc.flowdock.com" :port 6697))

(provide 'my-erc)
