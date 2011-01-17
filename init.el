;;; DOT EMACS

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; why would i close it?
(defun dont-kill-emacs ()
  (interactive)
  (error (substitute-command-keys "i can never die.")))

(defun go-to-hell-bars ()
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)))

;;; SETQ
(setq custom-file "~/.emacs.d/custom.el")
(setq frame-title-format (concat "%b %+%+ %f (>^(>O_o)>")) ;;'Musician' is not a very respected title. I'm not a musician. - Lydia Lunch
(setq tramp-default-method "ssh") ;;I modelled my looks on the town tramp. - dolly parton
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(setq org-agenda-files (list "~/org/todo.org"))
(setq org-log-done t)
(setq multi-term-program "/bin/zsh") ;; or use zsh...
(setq require-trailing-newline t)
(setq x-select-enable-clipboard t)
(setq inhibit-startup-message t)
(setq backup-directory-alist '(("." . "~/.emacs-backups")))
(setq echo-keystrokes 0.1)
(setq next-line-add-newlines nil)
(setq autopair-autowrap t)
(setq font-lock-maximum-decoration t)
(fset 'yes-or-no-p 'y-or-n-p)

;;; LOAD PATH
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/elisp/feature-mode")

;;; LOAD
(load "~/.emacs.d/nxhtml/autostart.el")
(load "~/.emacs.d/site-lisp/smartscan.el")
(load "~/.emacs.d/site-lisp/rename-file-and-buffer.el")
(load "~/.emacs.d/site-lisp/php-mode.el")
(load custom-file 'noerror)
(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)
(autoload 'idomenu "idomenu" nil t)

;;; REQUIRE
(require 'ido)
(require 'color-theme)
(require 'elscreen)
(require 'paren)
(require 'smarttabs)
(require 'autopair)
(require 'yasnippet)

;;; CALL STUFF
(ido-mode t)
(color-theme-select)
(color-theme-euphoria)
(show-paren-mode t)
(add-hook 'term-mode-hook ;; only needed if you use autopair
  #'(lambda () (setq autopair-dont-activate t)))
(highline-mode-on)
(autopair-global-mode) ;; enable autopair in all buffers
(auto-compression-mode 1) ; Lets emacs uncompress .gz files before opening them
(global-font-lock-mode t t)
(go-to-hell-bars)
(server-start)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

;;; HOOKS
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; go to hell trailing whitespace
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p) ;; make it executable if it should be (starts with #!)
(add-hook 'find-file-hooks 'goto-address-prog-mode)

;;; AUTO-MODE
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode)) ;; haml-mode isn't autoing for some reason.

;;; KEYBINDINGS
(global-set-key (kbd "C-x C-c") 'dont-kill-emacs)
(global-set-key (kbd "M-i") 'idomenu)
(global-set-key (kbd "C-#") 'comment-region)
(global-set-key (kbd "M-#") 'uncomment-region)
(global-set-key (kbd "<C-tab>")  'previous-multiframe-window)
(global-set-key (kbd "<C-S-iso-lefttab>") 'next-multiframe-window)
(global-set-key (kbd "C-c r") 'rgrep)
(global-set-key (kbd "<C-return>") 'newline-and-indent)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one
(global-set-key (kbd "C-M-g") 'magit-status)

