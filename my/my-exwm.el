(require 'exwm)
(require 'exwm-config)
;; (require 'exwm-edit)

(defvar my-exwm-workspace-map
  '((0 . "emacs")
    (1 . "applications")
    (2 . "terminals")
    (3 . "media")))

(defvar my-exwm-last-workspace nil)

(defun my-exwm-get-workspace-number (name)
  (car (rassoc name my-exwm-workspace-map)))

(defun my-exwm-get-workspace-name (number)
  (cdr (assoc number my-exwm-workspace-map)))

(defun my-exwm-switch-to-last-workspace ()
  (interactive)
  (my-exwm-switch-to-workspace (my-exwm-get-workspace-name
                                my-exwm-last-workspace)))

(exwm-input-set-local-simulation-keys '(([?\C-g] . [f6 escape])))

(defun my-exwm-set-generic-simulation-keys ()
  (interactive)
  (exwm-input-set-local-simulation-keys '(
                                          ;; basic stuff
                                          ([?\C-b] . [left])
                                          ([?\C-f] . [right])
                                          ([?\C-p] . [up])
                                          ([?\C-n] . [down])
                                          ([?\C-a] . [home])
                                          ([?\C-e] . [end])
                                          ([?\C-d] . [delete])
                                          ([?\C-i] . [tab])
                                          ([?\C-m] . [return])
                                          ([?\M-b] . [C-left])
                                          ([?\M-f] . [C-right])
                                          ([?\M-v] . [prior])
                                          ([?\M-d] . [C-delete])
                                          ([?\M-w] . [C-c])
                                          ([?\C-y] . [C-v])
                                          ([?\C-s] . [C-f])
                                          ([?\C-v] . [next])
                                          ([?\C-g] . [escape])
                                          ([?\C-/] . [C-z])
                                          ([?\C-k] . [S-end delete])
                                          ;; fancy stuff
                                          ([?\C-c ? ?a] . [M-1])
                                          ([?\C-c ? ?s] . [M-2])
                                          ([?\C-c ? ?d] . [M-3])
                                          ([?\C-c ? ?f] . [M-4])
                                          ([?\C-c ? ?g] . [M-5])
                                          ([?\C-c ? ?z] . [M-6])
                                          ([?\C-c ? ?x] . [M-7])
                                          ([?\C-c ? ?c] . [M-8])
                                          ([?\C-c ? ?v] . [M-9])
                                          ([?\C-c ? ?b] . [M-9])
                                          ([?\C-c ? ?l] . [C-tab])
                                          ([?\C-x ?\C-t] . [C-l * SPC t l m C-i C-m])
                                          ([?\C-c ? ?h] . [C-S-iso-lefttab])
                                          ([?\C-c ? ?\C-k] . [M-6 C-S-k])
                                          ([?\C-c ? ?\C-h] . [C-S-prior])
                                          ([?\C-c ? ?\C-l] . [C-S-next])
                                          )))

(defun my-exwm-generic-simulation-hook (class-name)
  (interactive)
  (when (and exwm-class-name
             (string= exwm-class-name class-name))
    (exwm-layout-hide-mode-line)
    (my-exwm-set-generic-simulation-keys)))

(add-hook 'exwm-manage-finish-hook (lambda ()
                                     (my-exwm-generic-simulation-hook "firefox")))

(add-hook 'exwm-manage-finish-hook (lambda ()
                                     (my-exwm-generic-simulation-hook "Google-chrome")))

(add-hook 'exwm-manage-finish-hook (lambda ()
                                     (my-exwm-generic-simulation-hook "discord")))

(add-hook 'exwm-manage-finish-hook (lambda ()
                                     (my-exwm-generic-simulation-hook "Kodi")))

(add-hook 'exwm-manage-finish-hook (lambda ()
                                     (my-exwm-generic-simulation-hook "zoom")))

(defun my-exwm-run-gui-program (command)
  (interactive)
  (start-process-shell-command command nil command))

(defun my-exwm-switch-to-workspace (name)
  (let ((switching-from (my-exwm-get-workspace-name
                         exwm-workspace-current-index))
        (switching-to name))
    (when (not (string-equal switching-from switching-to))
      (message (concat switching-from " => " switching-to)))
    (my-exwm-switch-to-workspace-number (my-exwm-get-workspace-number name))))

(defun my-exwm-switch-to-workspace-number (number)
  (when (and (not (eq exwm-workspace-current-index number))
             (not (eq my-exwm-last-workspace exwm-workspace-current-index)))
    (setq my-exwm-last-workspace exwm-workspace-current-index))
  (exwm-workspace-switch-create number))

(defun my-exwm-cycle-application-windows-get-buffer (buffer-name)
  (let ((application-windows (seq-filter (lambda (x)
                                           (string-match-p (concat "^" buffer-name "\\(<[0-9]+>\\)?$")
                                                           (buffer-name x)))
                                         (buffer-list))))
    (if (> (length application-windows) 1)
        (let ((current-buffer-index (seq-position application-windows
                                                  (current-buffer))))
          (if current-buffer-index (if (eq (+ 1 current-buffer-index)
                                           (length application-windows))
                                       (seq-elt application-windows 0)
                                     (seq-elt application-windows (+ 1
                                                                     current-buffer-index)))
            (get-buffer buffer-name)))
      (get-buffer buffer-name))))

(defun my-exwm-run-or-raise
    (buffer command &optional workspace)
  (interactive)
  (my-exwm-switch-to-workspace (or workspace "applications"))
  (unless (get-buffer buffer)
    (my-exwm-run-gui-program command))
  ;; (let ((retry-attempts 0))
  ;;   (while (and (not (get-buffer buffer))
  ;;               (< retry-attempts 100))
  ;;     (sleep-for 0 50)
  ;;     (setf retry-attempts (+ retry-attempts 1))))
  ;; (if (get-buffer buffer)
  ;;     (progn (switch-to-buffer (my-exwm-cycle-application-windows-get-buffer
  ;;                               buffer)))
  ;;   (message (concat "Timed out waiting for " command " to start!"))))
  (when (get-buffer buffer)
    (progn
      (switch-to-buffer
       (my-exwm-cycle-application-windows-get-buffer
        buffer)))))

(defun my-exwm-emacs-primary ()
  (interactive)
  (my-exwm-switch-to-workspace "emacs"))

(defun my-exwm-terminals ()
  (interactive)
  (my-exwm-switch-to-workspace "terminals")
  (unless (emux-session-get :buffers)
    (emux-term-create)))

(defun my-exwm-hard-kill ()
  (interactive)
  (print (get-buffer-process (current-buffer))))

(defun my-exwm-async-shell-command-sentinel (process event)
  (when (string-match-p "finished" event)
    (message (replace-regexp-in-string "\n$" "" (replace-regexp-in-string "%"
                                                                          "%%"
                                                                          (with-current-buffer
                                                                              (process-buffer
                                                                               process)
                                                                            (buffer-string)))))
    (exwm-layout--refresh)))

(defun my-exwm-async-shell-command (command)
  (interactive)
  (let ((buffer-name (concat "*^" command "^*")))
    (when (get-buffer buffer-name)
      (kill-buffer (get-buffer buffer-name)))
    (message command)
    (let ((process (apply #'start-process command buffer-name (split-string
                                                               command))))
      (set-process-sentinel process 'my-exwm-async-shell-command-sentinel))))

(defun my-exwm-volume-up ()
  (interactive)
  (shell-command "amixer -c 0 set Master 4dB+"))

(defun my-exwm-volume-down ()
  (interactive)
  (shell-command "amixer -c 0 set Master 4dB-"))

(defun my-exwm-lock-screen ()
  (interactive)
  (shell-command "xscreensaver-command -lock"))

(setq exwm-input-global-keys
      '(([C-up] . my-exwm-volume-up)
        ([C-down] . my-exwm-volume-down)
        ([C-M-return] . my-exwm-lock-screen)
        ([C-return] . embiggen-toggle)
        ([C-S-q] . my-exwm-toggle-screen-config)))

(global-set-key (kbd "C-h") nil)

(global-set-key (kbd "C-h h") 'help)

(global-set-key (kbd "C-h e") 'my-exwm-emacs-primary)

(global-set-key (kbd "C-h f")
                (lambda ()
                  (interactive)
                  (my-exwm-run-or-raise "firefox" "firefox")))

(global-set-key (kbd "C-h m")
                (lambda ()
                  (interactive)
                  (my-exwm-run-or-raise "Spotify" "spotify" "media")))

(global-set-key (kbd "C-h z")
                (lambda ()
                  (interactive)
                  (my-exwm-run-or-raise "zoom" "zoom" "media")))

(global-set-key (kbd "C-h c")
                (lambda ()
                  (interactive)
                  (my-exwm-run-or-raise "Google-chrome" "google-chrome")))

(global-set-key (kbd "C-h d")
                (lambda ()
                  (interactive)
                  (my-exwm-run-or-raise "discord" "discord")))

(global-set-key (kbd "C-h x")
                (lambda ()
                  (interactive)
                  (my-exwm-run-or-raise "Kodi" "kodi" "media")))

(global-set-key (kbd "C-h t") 'my-exwm-terminals)

(global-set-key (kbd "C-h p")
                (lambda ()
                  (interactive)
                  (my-exwm-async-shell-command "media-center-pause-play")))

(global-set-key (kbd "C-h k") 'kill-focused-buffer)

(global-set-key (kbd "C-h K") 'my-exwm-hard-kill)

(global-set-key (kbd "C-h a")
                (lambda ()
                  (interactive)
                  (message (current-time-string))))

(global-set-key (kbd "C-h g") 'my-exwm-screen-config-picker)

(global-set-key (kbd "C-h C-a")
                (lambda ()
                  (interactive)
                  (message (current-time-string nil t))))

(global-set-key (kbd "C-h A d")
                (lambda ()
                  (interactive)
                  (shell-command "ssh arcana 'DETACH=1 ~/bin/s d'")))

(global-set-key (kbd "C-h A b")
                (lambda ()
                  (interactive)
                  (shell-command "ssh arcana 'DETACH=1 ~/bin/s b'")))

(global-set-key (kbd "C-h b")
                (lambda ()
                  (interactive)
                  (shell-command "acpi")))

(global-set-key (kbd "C-h s")
                (lambda ()
                  (interactive)
                  (shell-command "toggle-mute")))

(global-set-key (kbd "C-h S") 'proced)

(global-set-key (kbd "C-h l") 'my-exwm-lock-screen)

(global-set-key (kbd "C-h T")
                (lambda ()
                  (interactive)
                  (my-exwm-async-shell-command "torrents-to-sb")))

(global-set-key (kbd "C-h r") 'my-exwm-fix-minibuffer)


;; (global-set-key (kbd "C-h C-h") 'my-exwm-switch-to-last-workspace)
(global-set-key (kbd "C-h C-h") 'switch-to-previous-buffer)

(defun my-exwm-quit ()
  (recentf-save-list)
  (kill-emacs))

(defun my-exwm-config ()
  (add-hook 'exwm-update-class-hook (lambda ()
                                      (exwm-workspace-rename-buffer
                                       exwm-class-name)))
  (exwm-enable)
  (exwm-config-ido)
  )

(defun my-exwm-fix-minibuffer ()
  (interactive)
  (exwm-layout--refresh))

(defun my-exwm-screen-sharing-screen-config ()
  (interactive)
  (setq
   exwm-randr-workspace-output-plist '(0 "HDMI-1" 1 "HDMI-1" 2 "HDMI-1" 3 "HDMI-1")
   my-exwm-screen-config 'my-exwm-screen-sharing-screen-config)
  (exwm-randr-refresh))

(defun my-exwm-normal-screen-config ()
  (interactive)
  (setq
   exwm-randr-workspace-output-plist '(0 "DVI-I-2" 1 "DVI-I-3" 2 "DVI-I-2" 3 "DVI-I-3")
   my-exwm-screen-config 'my-exwm-normal-screen-config)
  (exwm-randr-refresh))

(defun my-exwm-media-screen-config ()
  (interactive)
  (setq
   exwm-randr-workspace-output-plist '(0 "DVI-I-1" 1 "DVI-I-1" 2 "DVI-I-1" 3 "DVI-I-2")
   my-exwm-screen-config 'my-exwm-normal-screen-config)
  (exwm-randr-refresh))

(defun my-exwm-toggle-screen-config ()
  (interactive)
  (if (and (boundp 'my-exwm-screen-config)
           (eq (symbol-value 'my-exwm-screen-config)
               'my-exwm-normal-screen-config))
      (my-exwm-screen-sharing-screen-config)
    (my-exwm-normal-screen-config)))

(defun my-exwm-screen-config-picker ()
  (interactive)
  (let ((choice (completing-read "config: " '("normal" "share" "media"))))
    (cond
     ((string-equal choice "normal") (my-exwm-normal-screen-config))
     ((string-equal choice "media") (my-exwm-media-screen-config))
     ((string-equal choice "share") (my-exwm-screen-sharing-screen-config)))))

(defun my-exwm-move-to-screen ()
  (interactive)
  (let ((workspace (completing-read "screen: "
                                    (mapcar (lambda (x) (cdr x)) my-exwm-workspace-map))))
    (exwm-workspace-move-window
     (my-exwm-get-workspace-number
      workspace
      (get-buffer-window)))))

(start-process-shell-command
 "xrandr" nil "xrandr --output DVI-I-2 --mode 1920x1080 --scale 1x1 --pos 0x0 --primary --output DVI-I-1 --mode 1920x1080 --scale 1x1 --pos 1920x0")

(require 'exwm-randr)
;; (add-hook 'exwm-randr-screen-change-hook
;;           (lambda ()
;;             (if (eq 0 (shell-command "is-docked"))
;;                 (progn
;;                   (setq exwm-randr-workspace-output-plist '(0 "DP-2" 1 "HDMI-1" 2 "DP-2"))
;;                   (start-process-shell-command
;;                    "xrandr" nil "xrandr --output HDMI-1 --mode 1920x1080 --scale 1.6x1.6 --pos 0x0 --primary --output DP-2 --mode 1920x1080 --scale 1.6x1.6 --pos 3264x0  --output eDP-1 --off")
;;                   )
;;               (progn
;;                 (setq exwm-randr-workspace-output-plist '())
;;                 (start-process-shell-command
;;                  "xrandr" nil "xrandr --output eDP-1 --scale 1.25x1.25")))))

(exwm-randr-enable)

(start-process-shell-command "xmodmap" nil "xmodmap ~/.xmodmap")

(setq exwm-manage-configurations
      '(((and (equal exwm-class-name nil) (equal (buffer-name) "*EXWM*"))
         floating t
         floating-mode-line nil
         width 0.3
         height 0.3)))

(provide 'my-exwm)
