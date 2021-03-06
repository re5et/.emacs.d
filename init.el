(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(mapc
 'require
 '(
   ;; magit
   ;; auto-complete
   ;; dired
   dired-efap
   emux-session
   ;; expand-region
   ;; org-tree-slide
   ;; ido
;;   ido-vertical-mode
   ido-completing-read+
   isearch-symbol-at-point
   ;; itail
   ;; js2-mode
   ;; rjsx-mode
   ;; yaml-mode
   ;; kill-ring-search
   ;; midnight
   ;; misc
   ;; move-dup
   ;; multiple-cursors
   add-node-modules-path
   powerline
   flycheck
   flycheck-color-mode-line
   flycheck-popup-tip
   simp
   nvm
   ruby-test-mode
   ;; slime
   ;; smart-indent-rigidly
   ;; smartparens
   smex
   ;; flow-minor-mode
   ;; stumpwm-mode
   ;; visible-mark
   ;; winner
   ;; wgrep
   my-env
   ;; my-yas
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
   my-initializers
   my-exwm))


(setq flycheck-popup-tip-error-prefix "* ")
(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode)
(my-exwm-config)
