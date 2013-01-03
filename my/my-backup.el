(setq backup-directory-alist
      '((".*" . "~/.emacs.d/.backups")))
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/.backups" t)))
(setq tramp-backup-directory-alist backup-directory-alist)
(provide 'my-backup)
