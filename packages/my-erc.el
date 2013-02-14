(require 'tls)
(require 'erc)
(setq erc-current-nick-highlight-type 'nick)
(setq erc-keywords '("@atom" "@all" "@everyone"))
(setq erc-track-use-faces t)
(setq erc-track-faces-priority-list
      '(erc-current-nick-face erc-keyword-face))
(setq erc-track-priority-faces-only 'all)
(erc-tls :server "irc.flowdock.com" :port 6697
         :nick "atom" :full-name "atom")

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

(provide 'my-erc)
