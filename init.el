;;; DOT EMACS

;; never accidentally close emacs.
(defun dont-kill-emacs ()
  (interactive)
  (error (substitute-command-keys "i can never die.")))

(global-set-key "\C-x\C-c" 'dont-kill-emacs)

(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;'Musician' is not a very respected title. I'm not a musician. - Lydia Lunch
(setq frame-title-format (concat "%b %+%+ %f (>^(>O_o)>"))

;;I modelled my looks on the town tramp. - dolly parton
(setq tramp-default-method "ssh")

;;I do not seek. I find. - picasso
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(autoload 'idomenu "idomenu" nil t)
(global-set-key (kbd "M-i") 'idomenu)

(load "~/.emacs.d/nxhtml/autostart.el")
(load "~/.emacs.d/site-lisp/smartscan.el")
(load "~/.emacs.d/site-lisp/rename-file-and-buffer.el")


;; there is no color in this world that is not intended to make us rejoice. - John Calvin
(require 'color-theme)
(color-theme-euphoria)

(require 'elscreen)

(global-set-key (kbd "C-#") 'comment-region)
(global-set-key (kbd "M-#") 'uncomment-region)

(global-set-key (kbd "<C-tab>")  'previous-multiframe-window)
(global-set-key (kbd "<C-S-iso-lefttab>") 'next-multiframe-window)

(global-set-key (kbd "C-c r") 'rgrep)

(global-set-key (kbd "<C-return>") 'newline-and-indent)

;; org-mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org/todo.org"))
(setq org-log-done t)

;;; multi-term
(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)

(setq multi-term-program "/bin/zsh") ;; or use zsh...

;; only needed if you use autopair
(add-hook 'term-mode-hook
  #'(lambda () (setq autopair-dont-activate t)))


(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one


;; It is necessary for me to establish a winner image. Therefore, I have to beat somebody. - Nixon
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; go to hell trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Just because you like my stuff doesn't mean I owe you anything. - Bob Dylan
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(fset 'yes-or-no-p 'y-or-n-p)
(setq require-trailing-newline t)
(setq x-select-enable-clipboard t)
(setq inhibit-startup-message t)
(setq backup-directory-alist '(("." . "~/.emacs-backups")))
(setq echo-keystrokes 0.1)
(add-hook 'find-file-hooks 'goto-address-prog-mode)
(setq next-line-add-newlines nil)
(global-font-lock-mode t t)
(setq font-lock-maximum-decoration t)

;; http://sachachua.com/wp/2008/07/emacs-and-php-tutorial-php-mode/
(add-hook 'php-mode-hook
	  (lambda ()
	    (c-set-offset 'substatement-open 0)
	    (c-set-offset 'arglist-intro '+)
	    (c-set-offset 'arglist-cont 0)
	    (c-set-offset 'arglist-close 0)
	    (define-key php-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))

(require 'paren) (show-paren-mode t)

;;; autopair stuff
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers
(setq autopair-autowrap t)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(highline-mode-on)

(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(server-start)

(put 'narrow-to-region 'disabled nil)
