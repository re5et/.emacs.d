(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(mapc
 'require
 '(
   ;; magit
   ;; auto-complete
   ;; dired
   ;; dired-efap
   emux-session
   ;; expand-region
   ;; org-tree-slide
   ;; ido
   ido-ubiquitous
   ;; isearch-symbol-at-point
   ;; itail
   ;; js2-mode
   ;; rjsx-mode
   ;; yaml-mode
   ;; kill-ring-search
   ;; midnight
   ;; misc
   ;; move-dup
   ;; multiple-cursors
   powerline
   simp
   ;; slime
   ;; smart-indent-rigidly
   ;; smartparens
   smex
   ;; stumpwm-mode
   ;; visible-mark
   ;; winner
   ;; wgrep
   my-yas
   my-erc
   my-isearch
   my-advice
   my-backup
   ;; my-package
   my-emms
   my-autoloads
   my-add-to-lists
   my-project-defenitions
   my-functions
   my-keybindings
   my-hooks
   my-settings
   my-emux-templates
   my-initializers))
