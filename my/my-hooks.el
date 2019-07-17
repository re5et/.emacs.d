;; HOOKS

(defmacro hook-if (hook predicate &rest body)
  `(add-hook ,hook (lambda ()
                     (if ,predicate
                         (progn
                           ,@body)))))

(defmacro hook-unless (hook predicate &rest body)
  `(hook-if ,hook (not ,predicate) ,@body))

(defun major-mode-match-p (mode)
  (string-match mode (symbol-name major-mode)))

(defun load-shell-env (command)
  (interactive)
  (set
   (make-local-variable 'process-environment)
   (split-string
    (shell-command-to-string
     command)
    "\n")))

(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(add-hook
 'find-file-hook
 (lambda ()
   (when (not (executable-find "direnv"))
     (error "CAN'T FIND DIRENV! MUST HAVE IT!"))
   (load-shell-env
    "bash -lc 'direnv exec . env 2> /dev/null'")))

(add-hook 'find-file-hook 'ctags-setup-buffer-tags-table)
(add-hook 'after-save-hook 'ctags-generate-tags)

(defun balance-after (&rest args)
  (balance-windows))

(advice-add 'split-window :after 'balance-after)
(advice-add 'delete-window :after 'balance-after)

(defun cleanup-buffer-p ()
  (not
   (or
    buffer-read-only
    (major-mode-match-p "image")
    (major-mode-match-p "makefile"))))

(hook-if
 'find-file-hook
 (and (not (major-mode-match-p "go-"))
      (cleanup-buffer-p))
 (untabify-all))

(hook-if
 'find-file-hook
 (cleanup-buffer-p)
 (delete-trailing-whitespace))

(hook-if
 'before-save-hook
 (and (not (major-mode-match-p "go-"))
      (cleanup-buffer-p))
 (untabify-all))

(hook-if
 'before-save-hook
 (cleanup-buffer-p)
 (delete-trailing-whitespace))

(add-hook 'before-save-hook 'auto-make-directory)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'emms-player-started-hook 'emms-show)

(add-hook
 'magit-status-mode-hook
 (lambda ()
   (define-key magit-mode-map (kbd "Z") 'magit-quick-stash)))

(add-hook
 'shell-script-mode
 (lambda ()
   (flycheck-mode 1)
   ))

(add-hook
 'js2-init-hook
 (lambda ()
   (local-unset-key (kbd "M-j"))
   ;; (add-node-modules-path)
   ;; (prettier-js-mode 1)
   ;; (set-eslint-executable)
   (set-eslint-executable)
   (set-prettier-executable)
   (prettier-js-mode)
   ;; (set-eslintd-fix-executable)
   ;; (eslintd-fix-mode 1)
   ;; (set-flow-executable)
   ;; (flow-minor-enable-automatically)
   (flycheck-mode 1)
   ))

;; (add-hook
;;  'rjsx-mode-hook
;;  (lambda ()
;;    (set-prettier-executable)
;;    (set-eslint-executable)
;;    (prettier-js-mode)
;;    ))

(add-hook
 'typescript-mode-hook
 (lambda ()
   (tide-setup)
   (set-tslint-executable)
   (set-prettier-executable)
   (set-eslint-executable)
   (prettier-js-mode 1)
   (flycheck-add-mode 'javascript-eslint 'typescript-mode)
   (flycheck-mode 1)
   (eldoc-mode 1)
   ))

(add-hook
 'typescript-tsx-mode-hook
 (lambda ()
   (flycheck-add-mode 'typescript-tslint 'typescript-tsx-mode)
   (flycheck-add-mode 'typescript-tide 'typescript-tsx-mode)
   (flycheck-add-mode 'javascript-eslint 'typescript-tsx-mode)
   (tide-setup)
   (set-eslint-executable)
   (set-tslint-executable)
   (set-prettier-executable)
   (prettier-js-mode 1)
   (flycheck-mode 1)
   (eldoc-mode 1)))

(add-hook
 'typescript-mode-hook
 (lambda ()
   (set-prettier-command)
   (flycheck-mode 1)
   (tide-mode 1)
   ))

(add-hook
 'typescript-tsx-mode
 (lambda ()
   (set-prettier-command)
   (prettier-js-mode 1)
   (tide-mode 1)
   ))

(add-hook
 'dired-mode-hook
 (lambda ()
   (define-key dired-mode-map (kbd "<backspace>") 'dired-up-directory)
   (define-key dired-mode-map (kbd "w") 'dired-copy-whole-filename-as-kill)
   (define-key dired-mode-map (kbd "e") 'dired-efap)
   (define-key dired-mode-map (kbd "c") 'dired-clean-file-name)
   (define-key dired-mode-map (kbd "r") 'move-movie)
   (define-key dired-mode-map (kbd "j") 'move-movie-go-up-and-delete)
   (put 'dired-do-rename 'ido 'find-file)
   ))

(add-hook
 'enh-ruby-mode-hook
 (lambda ()
   (rubocopfmt-mode 1)
   (auto-indent-mode)
   (linum-mode)
   (flycheck-mode 1)
   (rubocop-set-flycheck-executable)))

(add-hook
 'js-mode-hook
 (lambda ()
   (auto-indent-mode)
   ))

(add-hook
 'coffee-mode-hook
 (lambda ()
   (smart-indent-rigidly-mode)))

(add-hook
 'sass-mode-hook
 (lambda ()
   (smart-indent-rigidly-mode)))

(add-hook
 'haml-mode-hook
 (lambda ()
   (smart-indent-rigidly-mode)))

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
   (paredit-mode +1)))

(add-hook
 'lisp-mode-hook
 (lambda ()
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

(hook-if  'before-save-hook
          (major-mode-match-p "go-")
          (gofmt-before-save))
(add-hook
 'go-mode-hook
 (lambda ()
   (local-set-key (kbd "M-.") #'godef-jump)))

(add-hook 'inf-mongo-mode-hook 'mongo-work-setup)

(add-hook 'org-tree-slide-mode-hook
          (lambda ()
            (define-key org-tree-slide-mode-map (kbd "<right>") 'org-tree-slide-move-next-tree)
            (define-key org-tree-slide-mode-map (kbd "<left>") 'org-tree-slide-move-previous-tree)))

(add-hook 'term-mode-hook
          (lambda ()
            (setq bidi-paragraph-direction 'left-to-right)))

(provide 'my-hooks)
