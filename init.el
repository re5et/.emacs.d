;;; DOT EMACS

;;; LOAD PATH
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;;; REQUIRE
(require 'slime)
(require 'smex)
(require 'ido)
(require 'autopair)
(require 'recentf)
(require 'highline)
(require 'rinari)
(require 'regex-tool)
(require 'find-file-in-git-repo)
(require 'backup-dir)
(require 'dired)
(require 'emms-setup)
(require 'emms-player-simple)
(require 'emms-source-file)
(require 'emms-source-playlist)
(require 'package)

(emms-all)
(emms-default-players)
(add-hook 'emms-player-started-hook 'emms-show)
(setq emms-show-format "now playing: %s"
      emms-source-file-default-directory "~/music/"
      emms-player-mpg321-parameters '("-o" "alsa")
      emms-info-asynchronously nil
      emms-playlist-buffer-name "*Music*"
      emms-player-list '(emms-player-mpg321
                         emms-player-ogg123
                         emms-player-mplayer))

(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;;; SET STUFF
(setq custom-file "~/.emacs.d/custom.el"
      bkup-backup-directory-info '((t "~/.emackups" ok-create full-path prepend-name))
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
      recentf-max-saved-items 50
      column-number-mode t
      ido-max-directory-size 100000
      magit-completing-read 'ido-completing-read
      font-lock-maximum-decoration t)
(setq-default kill-read-only-ok t)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; LOAD
(load "smartscan.el")
(load "mpd.el")
(load "feature-mode/feature-mode.el")
(load "my-functions.el")
(load "rinari/rinari.el")
(load "hooks.el")
(load "keybindings.el")
(load "stumpwm-mode.el")
(load custom-file 'noerror)

;; AUTOLOADS
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(autoload 'js2-mode "js2-mode" nil t)
(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)
(autoload 'idomenu "idomenu" nil t)
(autoload 'comint-dynamic-complete-filename "comint" nil t)


;;; CALL STUFF
(smex-initialize)
(ido-mode t)
(transient-mark-mode t)
(go-to-hell-bars)
(recentf-mode t)
(show-paren-mode t)
(highline-mode)
(auto-compression-mode 1) ; Lets emacs uncompress .gz files before opening them

;;; AUTO-MODE
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode)) ;; turn on css-mode for sass
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode)) ;; turn on ruby-mode for rakefiles

;; wtf am i doing
(define-key key-translation-map "\C-j" "\C-x")
