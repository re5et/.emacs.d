(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(mapc
 'require
 '(slime
   smex
   ido
   ido-ubiquitous
   autopair
   visible-mark
   highline
   dired
   dired-efap
   yasnippet
   stumpwm-mode
   misc
   simp
   auto-indent-mode
   move-text
   emux
   expand-region
   winner
   midnight
   isearch-symbol-at-point
   multiple-cursors
   magit-commit-training-wheels
   itail
   my-advice
   my-backup
   my-package
   my-settings
   my-emms
   my-autoloads
   my-add-to-lists
   my-project-defenitions
   my-functions
   my-keybindings
   my-hooks
   my-initializers))


;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
