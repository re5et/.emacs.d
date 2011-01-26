;; mpd.el
;; quick playing or queuing of music with mpc/d
;;;; goes great with ido
;;;; requires mpd and mpc setup correctly.

(defvar mpd-default-music-dir "/home/atom/music/") ; mpd music dir FULL PATH (no ~/ crap)

(defun mpc-find-dir (dir)
  "Finds a directory for mpd playing or queueing"
  (interactive "D")
  (replace-regexp-in-string
   mpd-default-music-dir "" (substring
                           dir 0 -1)))

(defun mpc-play-or-queue-dir (&optional clear-and-play)
  "Plays or queues a directory with mpd"
  (interactive)
  (let ((default-directory mpd-default-music-dir)
        (cmd "mpc add '%s';"))
    (if clear-and-play
        (setq cmd (concat "mpc clear;" cmd "mpc play;")))
    (shell-command (format cmd (call-interactively 'mpc-find-dir)))))

(defun mpc-play-dir ()
  (interactive)
  (mpc-play-or-queue-dir t))

(defun mpc-queue-dir ()
  (interactive)
  (mpc-play-or-queue-dir))

(defun mpc-clear-playlist ()
  (interactive)
  (shell-command "mpc clear"))
