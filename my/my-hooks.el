;; HOOKS
(add-hook 'find-file-hook 'delete-trailing-whitespace)
(add-hook 'find-file-hook 'untabify-all)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'untabify-all)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'before-save-hook 'auto-make-directory)
(add-hook 'emms-player-started-hook 'emms-show)

(add-hook
 'ruby-mode-hook
 (lambda ()
   (autopair-mode)
   (set-newline-and-indent)
   (rvm-use-default)
   (linum-mode)
   (flymake-ruby-load)))

(add-hook
 'js-mode-hook
 (lambda ()
   (autopair-mode)
   (linum-mode)
   (set-newline-and-indent)))

(add-hook
 'css-mode-hook
 (lambda ()
   (autopair-mode)
   (linum-mode)
   (set-newline-and-indent)))

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
   (paredit-mode +1)))

(add-hook
 'slime-repl-mode-hook
 (lambda ()
   (paredit-mode +1)))

(provide 'my-hooks)
