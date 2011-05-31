(require 'elscreen)
(require 'multi-term)
(require 'ido)
(ido-mode t)

(defun emux-toggle-full-window ()
  (interactive)
  (if (one-window-p)
      (if emux-toggle-full-window
          (set-window-configuration emux-toggle-full-window))
    (progn
      (setq emux-toggle-full-window (current-window-configuration))
      (delete-other-windows))))

(defun emux-previous-screen ()
  (interactive)
  (elscreen-previous))

(defun emux-next-screen ()
  (interactive)
  (elscreen-next))

(defun emux-create-screen (&optional name pwd terminal-name command)
  (interactive)
  (elscreen-create)
  (if name
      (emux-rename-screen name))
  (if pwd
      (emux-set-pwd pwd))
  (emux-create-terminal terminal-name command))

(defun emux-create-terminal (&optional name command)
  (interactive)
  (multi-term)
  (if name
      (emux-rename-terminal name))
  (if command
      (emux-terminal-command command)))

(defun emux-rename-terminal (name)
  (interactive "snew terminal name: ")
  (rename-buffer name))

(defun emux-rename-screen (name)
  (interactive "snew screen name: ")
  (elscreen-screen-nickname name))

(defun emux-split-and-create-terminal (split-command &optional name command)
  "split and creat a new multi-term"
  (funcall split-command)
  (other-window 1)
  (emux-create-terminal name command))

(defun emux-vsplit (&optional name command)
  "Split vertically and create new multi-term"
  (interactive)
  (emux-split-and-create-terminal 'split-window-vertically name command))

(defun emux-hsplit (&optional name command)
  "Split horizontally and create new multi-term"
  (interactive)
  (emux-split-and-create-terminal 'split-window-horizontally name command))

(defun emux-jump-to-buffer ()
  "Use ido to find specific buffer and jump to its elscreen"
  (interactive)
  (elscreen-find-and-goto-by-buffer
   (get-buffer (ido-completing-read "goto buffer: "
                                    (mapcar (function buffer-name) (buffer-list))))))

(defun emux-send-to-terminal (string &optional buffer)
  (interactive "sSend string to terminal: ")
  (let ((buf (if buffer
                 buffer
               (current-buffer))))
    (term-send-raw-string string)))

(defun emux-terminal-command (command &optional buffer)
  (emux-send-to-terminal (concat command "\C-m") buffer))

(defun emux-goto-screen ()
  (interactive)
  (let* ((screens (elscreen-get-screen-to-name-alist))
         (names (mapcar 'cdr screens))
         (selected (ido-completing-read "go to screen: " names)))
    (elscreen-goto (car (rassoc selected screens)))))

(defun emux-next-multiframe-window ()
  (interactive)
  (next-multiframe-window))

(defun emux-previous-multiframe-window ()
  (interactive)
  (previous-multiframe-window))

(defun emux-set-pwd (path)
  (interactive "Dset pwd: ")
  (cd path))

(defun emux-kill-remove-split (&optional buffer)
  (interactive)
  (let ((buf (if buffer
                 buffer
               (current-buffer))))
    (kill-buffer buffer)
    (delete-window)))

(defun emux-load-template ()
  (interactive)
  (load-file
   (concat "~/.emacs.d/emux-templates/"
           (ido-completing-read "load emux template: "
                                (directory-files "~/.emacs.d/emux-templates" nil ".*\.el")))))

(defun emux-refocus-prompt ()
  "Go into term-char-mode and put the cursor in the right spot"
  (if (equal major-mode 'term-mode)
      (progn
        (term-char-mode)
        (emux-send-to-terminal ""))))

(defun emux-enter-term-line-mode ()
  "Go into term-line-mode when moving"
  (if (equal major-mode 'term-mode)
      (term-line-mode)))

(defun emux-yank ()
  (interactive)
  (emux-refocus-prompt)
  (emux-send-to-terminal (car kill-ring)))

(defadvice scroll-down (before emux-scroll-down)
  "Jump into line mode on scroll-down"
  (emux-enter-term-line-mode))
(ad-activate 'scroll-down)

(defadvice previous-line (before emux-previous-line)
  "Jump into line mode on previous-line"
  (emux-enter-term-line-mode))
(ad-activate 'previous-line)

(defadvice beginning-of-buffer (before emux-beginning-of-buffer)
  "Go into term-line-mode when moving to beginning of buffer"
  (emux-enter-term-line-mode))
(ad-activate 'beginning-of-buffer)

(defadvice term-previous-input (before emux-previous-input)
  "Go to term-char-mode when attemting to use previous command"
    (emux-refocus-prompt))
(ad-activate 'term-previous-input)

(defadvice end-of-buffer (before emux-end-of-buffer)
  "refocus prompt on end of buffer"
  (emux-refocus-prompt))
(ad-activate 'end-of-buffer)

(defadvice term-interrupt-subjob (before emux-term-interrupt-subjob)
  "Make sure that before keyboard quitting go back to term-char-mode"
  (emux-refocus-prompt))
(ad-activate 'term-interrupt-subjob)

(defadvice keyboard-quit (before emux-keyboard-quit)
  "Make sure that before keyboard quitting go back to term-char-mode"
  (emux-refocus-prompt))
(ad-activate 'keyboard-quit)

(emux-create-terminal)

(global-set-key (kbd "C-x c")   'emux-create-terminal)
(global-set-key (kbd "C-x -")   'emux-vsplit)
(global-set-key (kbd "C-x |")   'emux-hsplit)
(global-set-key (kbd "C-x C")   'emux-create-screen)
(global-set-key (kbd "C-x r")   'emux-rename-terminal)
(global-set-key (kbd "C-x R")   'emux-rename-screen)
(global-set-key (kbd "M-l")     'emux-next-multiframe-window)
(global-set-key (kbd "M-h")     'emux-previous-multiframe-window)
(global-set-key (kbd "M-L")     'emux-next-screen)
(global-set-key (kbd "M-H")     'emux-previous-screen)
(global-set-key (kbd "C-x n")   'emux-next-screen)
(global-set-key (kbd "C-x p")   'emux-previous-screen)
(global-set-key (kbd "C-x s")   'emux-goto-screen)
(global-set-key (kbd "C-x M-b") 'emux-jump-to-buffer)
(global-set-key (kbd "C-x K")   'emux-kill-remove-split)
(global-set-key (kbd "C-x f")   'emux-toggle-full-window)
(global-set-key (kbd "C-x P")   'emux-load-template)
(global-set-key (kbd "C-S-y")   'emux-yank)

(provide 'emux)
