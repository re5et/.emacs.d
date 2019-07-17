(setq custom-file "~/.emacs.d/my/my-customizations.el"
      inferior-lisp-program "clisp -K full"
      tramp-default-method "ssh"
      ido-enable-flex-matching t
      org-agenda-files (list "~/org/todo.org")
      org-log-done t
      multi-term-program "/bin/zsh"
      require-trailing-newline t
      x-select-enable-clipboard t
      inhibit-startup-message t
      backup-directory-alist '(("." . "~/.emacs.d/.backups"))
      echo-keystrokes 0.1
      next-line-add-newlines nil
      recentf-max-saved-items 999
      column-number-mode t
      ido-max-directory-size 100000
      magit-completing-read 'ido-completing-read
      font-lock-maximum-decoration t
      sh-basic-offset 2
      )

(setq emms-show-format "now playing: %s"
      emms-source-file-default-directory "~/music/"
      emms-player-mpg321-parameters '("-o" "alsa")
      emms-info-asynchronously nil
      emms-playlist-buffer-name "*Music*"
      emms-player-list '(emms-player-mpg321
                         emms-player-ogg123
                         emms-player-mplayer))

(setq-default kill-read-only-ok t
              indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(load custom-file)

(provide 'my-settings)
