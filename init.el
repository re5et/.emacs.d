;;; DOT EMACS

;; never close emacs.
(defun dont-kill-emacs ()
      (interactive)
      (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))

(global-set-key "\C-x\C-c" 'dont-kill-emacs)
(global-set-key "\C-x\C-a" 'mark-whole-buffer)

(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;'Musician' is not a very respected title. I'm not a musician. - Lydia Lunch
(setq frame-title-format (concat "%b %+%+ %f (>^(>O_o)>"))

;;I modelled my looks on the town tramp. - dolly parton
(setq tramp-default-method "ssh")

;;I do not seek. I find. - picasso
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;;Go to Heaven for the climate, Hell for the company. - twain
(add-to-list 'load-path "~/.emacs.d/company")
(autoload 'company-mode "company" nil t)

(load "~/.emacs.d/nxhtml/autostart.el")

;;A mouse does not rely on just one hole. - Plautus
(mouse-avoidance-mode 'cat-and-mouse)

;; there is no color in this world that is not intended to make us rejoice. - John Calvin
(require 'color-theme)
(color-theme-initialize)
(color-theme-euphoria)

(require 'elscreen)
(global-set-key (kbd "<C-tab>")  'elscreen-next)
(global-set-key (kbd "<C-S-iso-lefttab>") 'elscreen-previous)
(global-set-key (kbd "<C-return>") 'execute-extended-command)
(global-set-key (kbd "<C-\\>") 'previous-multiframe-window)
;; (global-set-key (kbd "<C-;") 'previous-multiframe-window)
;; (global-set-key (kbd "<C-'") 'next-multiframe-window)

;; It is necessary for me to establish a winner image. Therefore, I have to beat somebody. - Nixon
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; go to hell trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; shell pop
(require 'shell-pop)
(shell-pop-set-internal-mode "ansi-term")
(shell-pop-set-internal-mode-shell "/bin/bash")
(shell-pop-set-window-height 50) ;the number for the percentage of the selected window. if 100, shell-pop use the whole of selected window, not spliting.
(shell-pop-set-window-position "top") ;shell-pop-up position. You can choose "top" or "bottom".
(global-set-key (kbd "<C-menu>") 'shell-pop)

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

(yas/load-directory "~/.emacs.d/snippets")

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
