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
   (auto-indent-mode)
   (linum-mode)
   (ruby-block-mode)
   (rvm-activate-corresponding-ruby)
   (flymake-ruby-load)))

(add-hook
 'js-mode-hook
 (lambda ()
   (auto-indent-mode)
   (linum-mode)))

(add-hook
 'coffee-mode-hook
 (lambda ()
   (linum-mode)
   (smart-rigid-indent-local-bindings)))

(add-hook
 'sass-mode-hook
 (lambda ()
   (linum-mode)
   (smart-rigid-indent-local-bindings)))

(add-hook
 'haml-mode-hook
 (lambda ()
   (linum-mode)
   (smart-rigid-indent-local-bindings)))

(add-hook
 'css-mode-hook
 (lambda ()
   (auto-indent-mode)
   (linum-mode)))

(add-hook
 'magit-log-edit-mode-hook
 (lambda ()
   (flyspell-mode)
   (set-fill-column 72)))

(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   (linum-mode)
   (paredit-mode +1)))

(add-hook
 'lisp-mode-hook
 (lambda ()
   (linum-mode)
   (paredit-mode +1)
   (if (string-match "stumpwmrc$" buffer-file-name)
       (stumpwm-mode))))

(add-hook
 'lisp-interaction-mode-hook
 (lambda ()
   (paredit-mode +1)))

(add-hook
 'slime-repl-mode-hook
 (lambda ()
   (paredit-mode +1)))

(provide 'my-hooks)
