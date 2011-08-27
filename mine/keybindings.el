(global-set-key (kbd "C-x C-c") 'dont-kill-emacs)
(global-set-key (kbd "M-i") 'idomenu)
(global-set-key (kbd "C-#") 'comment-region)
(global-set-key (kbd "M-#") 'uncomment-region)
(global-set-key (kbd "M-l")  'next-in-frame-window)
(global-set-key (kbd "M-h") 'previous-in-frame-window)
(global-set-key (kbd "C-c r") 'rgrep)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c f") 'flyspell-correct-word-before-point)
(global-set-key (kbd "M-n") 'smart-symbol-go-forward)
(global-set-key (kbd "M-p") 'smart-symbol-go-backward)
(global-set-key (kbd "C-c m p") 'mpc-play-dir)
(global-set-key (kbd "C-c m q") 'mpc-queue-dir)
(global-set-key (kbd "C-c m c") 'mpc-clear-playlist)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "C-c C-a") 'beginning-of-line)
(global-set-key (kbd "C-k") 'could-eat-a-horse-kill)
(global-set-key (kbd "C-c C-k") 'could-eat-a-horse-kill-whole-line)
(global-set-key (kbd "C-y") 'yank-and-indent)
(global-set-key (kbd "C-S-p") 'clone-line-up)
(global-set-key (kbd "C-S-n") 'clone-line-down)
(global-set-key (kbd "C-,") 'indent-buffer)
(global-set-key (kbd "M-s s") 'replace-string)
(global-set-key (kbd "M-s S") 'replace-regexp)
(global-set-key (kbd "C-c C-e") 'eshell)
(global-set-key (kbd "C-c C-d") 'c-hungry-delete-forward)
(global-set-key (kbd "C-c <backspace>") 'c-hungry-delete-backwards)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(global-set-key (kbd "C-x M-f") 'find-file-in-git-repo)
(global-set-key (kbd "C-c i f") 'insert-file-name)
(global-set-key (kbd "C-c i d") 'insert-dir-name)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-?") 'comint-dynamic-complete-filename)
(global-set-key (kbd "C-c e") 'flymake-goto-next-error-and-show)
(global-set-key (kbd "C-x :") 'execute-extended-command)
(global-set-key (kbd "C-c M-v") 'scroll-other-window-down)
(global-set-key (kbd "C-c C-v") 'scroll-other-window)
(global-set-key (kbd "C-o") 'loccur-current)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-x M-f") 'find-file-in-git-repo)
(global-set-key (kbd "C-x K") 'kill-focused-buffer)

(global-set-key (kbd "C-<return>") 'embiggen-toggler)
(global-set-key (kbd "C-x ;") 'scratch-toggler)
(global-set-key (kbd "C-x d") 'dired-toggler)
(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-x m") 'music-toggler)
(global-set-key (kbd "C-c m q") 'emms-add-directory)
(global-set-key (kbd "C-c m A") 'emms-play-directory)
(global-set-key (kbd "C-c m n") 'emms-next)
(global-set-key (kbd "C-c m p") 'emms-previous)

(define-key dired-mode-map (kbd "q") 'dired-toggler)
(define-key emms-playlist-mode-map (kbd "q") 'music-toggler)
(define-key dired-mode-map (kbd "<backspace>") 'dired-up-directory)
