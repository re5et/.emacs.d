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
   rinari
   backup-dir
   dired
   dired-efap
   yasnippet
   feature-mode
   stumpwm-mode
   misc
   simp
   auto-indent-mode
   ruby-end
   ruby-block
   move-text
   emux
   winner
   midnight
   my-advice
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

(midnight-delay-set 'midnight-delay "1:00am")
(setq clean-buffer-list-delay-general 1)
