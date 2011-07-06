(require 'multi-term)

(defun emux-create-terminal (&optional name command)
  (interactive)
  (let ((new-term (multi-term)))
    (if name
        (emux-rename-terminal name))
    (if command
        (emux-terminal-command command))
  new-term))

(defun emux-rename-terminal (name)
  (interactive "snew terminal name: ")
  (rename-buffer name))

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

(defun emux-send-to-terminal (string &optional buffer)
  (interactive "sSend string to terminal: ")
  (let ((buf (if buffer
                 buffer
               (current-buffer))))
    (term-send-raw-string string)))

(defun emux-terminal-command (command &optional buffer)
  (emux-send-to-terminal (concat command "\C-m") buffer))

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
  (emux-send-to-terminal (current-kill 0 t)))

(defun emux-shell-command-on-region-to-string (command)
  (interactive)
  (with-output-to-string
    (shell-command-on-region (point-min) (point-max) command standard-output)))

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

(defadvice isearch-backward (before emux-isearch-backward)
  "Go into term-line-mode when moving to beginning of buffer"
  (emux-enter-term-line-mode))
(ad-activate 'isearch-backward)

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

(provide 'emux-term)
