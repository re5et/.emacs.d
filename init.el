;;; DOT EMACS

(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;;; SET STUFF
(setq custom-file "~/.emacs.d/custom.el"
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
      font-lock-maximum-decoration t)

(setq-default kill-read-only-ok t)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
;;; LOAD PATH
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; LOAD
(load "smartscan.el")
(load "mpd.el")
(load "feature-mode/feature-mode.el")
(load "my-functions.el")
(load "rinari/rinari.el")
(load custom-file 'noerror)
(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)
(autoload 'idomenu "idomenu" nil t)
(autoload 'comint-dynamic-complete-filename "comint" nil t)

;;; REQUIRE
(require 'ido)
(require 'autopair)
(require 'recentf)
(require 'highline)
(require 'rinari)
(require 'regex-tool)
(require 'find-file-in-git-repo)
(require 'all)
;; (require 'auto-complete)
;; (setq ac-sources '(ac-source-symbols
;;                     ac-source-abbrev
;;                     ac-source-filename
;;                     ac-source-imenu
;;                     ac-source-words-in-all-buffer
;;                     ac-source-words-in-same-mode-buffers))
;;(require 'moccur-color)
;;(require 'moccur-edit)
;;(require 'elscreen)
;;(require 'paren)
;;(require 'smarttabs)
;;(require 'yasnippet)

(setq rsense-home "/usr/bin/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;;; CALL STUFF
(ido-mode t)
(transient-mark-mode 0)
(go-to-hell-bars)
(recentf-mode t)
(autopair-global-mode t)
(show-paren-mode t)
(highline-mode)
(auto-compression-mode 1) ; Lets emacs uncompress .gz files before opening them
;;(yas/initialize)
;;(yas/load-directory "~/.emacs.d/snippets")
(server-start)

;; ;;; HOKS
(add-hook 'find-file-hook 'delete-trailing-whitespace) ;; "
(add-hook 'find-file-hook 'untabify-all)
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; go to hell trailing whitespace
(add-hook 'before-save-hook 'untabify-all)

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p) ;; make it executable if it should be (starts with #!)

(add-hook 'ruby-mode-hook (lambda ()
                            (rvm-use-default)
                            (flymake-ruby-load)))


;;; AUTO-MODE
;;(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode)) ;; haml-mode isn't autoing for some reason.
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode)) ;; turn on css-mode for sass
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode)) ;; turn on ruby-mode for rakefiles

;;; KEYBINDINGS
(global-set-key (kbd "C-x C-c") 'dont-kill-emacs)
(global-set-key (kbd "M-i") 'idomenu)
(global-set-key (kbd "C-#") 'comment-region)
(global-set-key (kbd "M-#") 'uncomment-region)
(global-set-key (kbd "M-l")  'next-multiframe-window)
(global-set-key (kbd "M-h") 'previous-multiframe-window)
(global-set-key (kbd "C-c r") 'rgrep)
(global-set-key (kbd "C-c d") 'make-directory)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-n") 'smart-symbol-go-forward)
(global-set-key (kbd "M-p") 'smart-symbol-go-backward)
(global-set-key (kbd "C-c b") 'moccur)
(global-set-key (kbd "C-c m p") 'mpc-play-dir)
(global-set-key (kbd "C-c m q") 'mpc-queue-dir)
(global-set-key (kbd "C-c m c") 'mpc-clear-playlist)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "C-c C-a") 'beginning-of-line)
(global-set-key (kbd "C-k") 'could-eat-a-horse-kill)
(global-set-key (kbd "C-c C-k") 'could-eat-a-horse-kill-whole-line)
(global-set-key (kbd "C-y") 'yank-and-indent)
(global-set-key (kbd "C-S-p") 'clone-line-up)
(global-set-key (kbd "C-S-n") 'clone-line-down)
(global-set-key (kbd "C-,") 'indent-buffer)
(global-set-key (kbd "M-s s") 'replace-string)
(global-set-key (kbd "M-s S") 'replace-regexp)
(global-set-key (kbd "C-c C-e") 'eshell)
(global-set-key (kbd "C-c C-d") 'c-hungry-delete-forward)
(global-set-key (kbd "C-c <backspace>") 'c-hungry-delete-backwards)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(global-set-key (kbd "C-x M-f") 'find-file-in-git-repo)
(global-set-key (kbd "C-c i f") 'insert-file-name)
(global-set-key (kbd "C-c i d") 'insert-dir-name)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-?") 'comint-dynamic-complete-filename)
(global-set-key (kbd "C-c e") 'flymake-goto-next-error-and-show)
(global-set-key (kbd "C-x :") 'execute-extended-command)
(global-set-key (kbd "C-c M-v") 'scroll-other-window-down)
(global-set-key (kbd "C-c C-v") 'scroll-other-window)
(global-set-key (kbd "C-o") 'loccur-current)

;; wtf am i doing
(define-key key-translation-map "\C-j" "\C-x")

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)


(defun jslint-thisfile ()
  (interactive)
  (compile (format "jsl -process %s" (buffer-file-name))))

(add-hook 'javascript-mode-hook
          '(lambda ()
             (local-set-key [f8] 'jslint-thisfile)))

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-x M-f") 'find-file-in-git-repo)
(global-set-key (kbd "C-x K") 'kill-focused-buffer)

(defun kill-focused-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
