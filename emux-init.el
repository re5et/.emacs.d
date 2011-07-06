(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))

(setq custom-file "~/.emacs.d/emux-custom.el"
      tramp-default-method "ssh"
      ido-enable-flex-matching t
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
      font-lock-maximum-decoration t)

(setq-default indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(load "my-functions.el")
(load custom-file 'noerror)

(transient-mark-mode t)
(go-to-hell-bars)
(auto-compression-mode 1) ; Lets emacs uncompress .gz files before opening them
(define-key key-translation-map "\C-j" "\C-x")

(setq frame-title-format "emux")
(setq ansi-term-color-vector [unspecified "black" "red" "green" "yellow" "royal blue" "magenta" "cyan" "white"])

(require 'ido)
(ido-mode t)

(require 'smex)
(smex-initialize)

(require 'highline)
(highline-mode)

(require 'winner)
(winner-mode t)

(require 'emux)

;(emux-create-terminal)

(global-set-key (kbd "M-x")     'smex)
(global-set-key (kbd "M-X")     'smex-major-mode-commands)
(global-set-key (kbd "C-x K")   'kill-focused-buffer)
(global-set-key (kbd "C-?")     'winner-undo)
(global-set-key (kbd "M-?")     'winner-redo)
(global-set-key (kbd "C-x c")   'emux-create-terminal)
(global-set-key (kbd "C-x -")   'emux-vsplit)
(global-set-key (kbd "C-x |")   'emux-hsplit)
(global-set-key (kbd "C-x C")   'emux-create-screen)
(global-set-key (kbd "C-x r")   'emux-rename-terminal)
(global-set-key (kbd "C-x R")   'emux-rename-screen)
(global-set-key (kbd "M-l")     'next-multiframe-window)
(global-set-key (kbd "M-h")     'previous-multiframe-window)
(global-set-key (kbd "M-L")     'elscreen-next)
(global-set-key (kbd "M-H")     'elscreen-previous)
(global-set-key (kbd "C-x n")   'elscreen-next)
(global-set-key (kbd "C-x p")   'elscreen-previous)
(global-set-key (kbd "C-x s")   'emux-switch-screen)
(global-set-key (kbd "C-x M-s")   'emux-jump-to-screen)
(global-set-key (kbd "C-x S")   'emux-switch-session)
(global-set-key (kbd "C-x b") 'emux-jump-to-buffer)
(global-set-key (kbd "C-x M-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x K")   'emux-kill-remove-split)
(global-set-key (kbd "C-x f")   'emux-toggle-full-window)
(global-set-key (kbd "C-x P")   'emux-load-session-template)
(global-set-key (kbd "C-S-y")   'emux-yank)
(global-set-key (kbd "C-x C-S-k") 'emux-destroy-session)

(emux-initialize)
