;; HOOKS
(add-hook 'find-file-hook 'delete-trailing-whitespace)
(add-hook 'find-file-hook 'untabify-all)
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; go to hell trailing whitespace
(add-hook 'before-save-hook 'untabify-all)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p) ;; make it executable if it should be (starts with #!)
(add-hook 'before-save-hook 'auto-make-directory)
(add-hook 'emms-player-started-hook 'emms-show)

(add-hook
 'ruby-mode-hook
 (lambda ()
   (linum-mode)
   (autopair-mode)
   (rvm-use-default)
   (flymake-ruby-load)))

(add-hook
 'javascript-mode-hook
 (lambda ()
   (linum-mode)
   (autopair-mode)))

(add-hook
 'css-mode-hook
 (lambda ()
   (linum-mode)
   (autopair-mode)))

(add-hook
 'magit-log-edit-mode-hook
 (lambda ()
   (flyspell-mode)))

(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   (linum-mode)
   (paredit-mode +1)))

(add-hook
 'lisp-mode-hook
 (lambda ()
   (linum-mode)
   (paredit-mode +1)))

(add-hook
 'lisp-interaction-mode-hook
 (lambda ()
   (linum-mode)
   (paredit-mode +1)))

(add-hook
 'slime-repl-mode-hook
 (lambda ()
   (linum-mode)
   (paredit-mode +1)))
