;;; DOT EMACS

;;; LOAD PATH
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;;; REQUIRE
(require 'slime)
(require 'smex)
(require 'ido)
(require 'ido-ubiquitous)
(require 'autopair)
(require 'visible-mark)
(require 'recentf)
(require 'highline)
(require 'rinari)
(require 'regex-tool)
(require 'backup-dir)
(require 'dired)
(require 'dired-efap)
(require 'emms-setup)
(require 'emms-player-simple)
(require 'emms-source-file)
(require 'emms-source-playlist)
(require 'yasnippet)
(require 'package)
(require 'misc)

(emms-all)
(emms-default-players)
(setq emms-show-format "now playing: %s"
      emms-source-file-default-directory "~/music/"
      emms-player-mpg321-parameters '("-o" "alsa")
      emms-info-asynchronously nil
      emms-playlist-buffer-name "*Music*"
      emms-player-list '(emms-player-mpg321
                         emms-player-ogg123
                         emms-player-mplayer))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))

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
      recentf-max-saved-items 999
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
(load "move-text.el")
(load "project.el")
(load "feature-mode/feature-mode.el")
(load "my-functions.el")
(load "rinari/rinari.el")
(load "keybindings.el")
(load "stumpwm-mode.el")
(load "hooks.el")
(load custom-file 'noerror)

;; AUTOLOADS
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)
(autoload 'idomenu "idomenu" nil t)
(autoload 'comint-dynamic-complete-filename "comint" nil t)


;;; CALL STUFF
(smex-initialize)
(ido-mode t)
(go-to-hell-bars)
(recentf-mode t)
(show-paren-mode t)
(highline-mode)
(auto-compression-mode 1) ; Lets emacs uncompress .gz files before opening them
(yas/initialize)
(yas/load-directory "~/.emacs.d/mine/yasnippet-0.6.1c/snippets/")

;;; AUTO-MODE
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode)) ;; turn on css-mode for sass
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode)) ;; turn on ruby-mode for rakefiles
(add-to-list 'auto-mode-alist '("\\.stumpwmrc\\'" . stumpwm-mode))

;; wtf am i doing
(define-key key-translation-map "\C-j" "\C-x")

(add-project '(:has
               (config.ru app/views app/models app/controllers)
               :ignore
               (tmp coverage log vendor .git public/system public/assets)))
