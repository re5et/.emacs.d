(setq window-face-focus-face 'default)
(setq window-face-focus-active-properties '(:foreground  "#FFF"))
(setq window-face-focus-inactive-properties '(:foreground  "#666"))

(defun window-face-focus ()
  (interactive)
  (let ((current-window (get-buffer-window (current-buffer))))
    (dolist (window (window-list))
      (select-window window)
      (setq cookie
            (face-remap-add-relative
             window-face-focus-face
             window-face-focus-inactive-properties)))
    (select-window current-window)
    (face-remap-remove-relative cookie)
    (face-remap-add-relative
     window-face-focus-face
     window-face-focus-active-properties)))

(defadvice other-window (after change-window-default-font-color activate)
  (window-face-focus))

(defadvice next-window (after change-window-default-font-color activate)
  (window-face-focus))

(defadvice previous-window (after change-window-default-font-color activate)
  (window-face-focus))

(defadvice next-in-frame-window (after change-window-default-font-color activate)
  (window-face-focus))

(defadvice previous-in-frame-window (after change-window-default-font-color activate)
  (window-face-focus))

(defadvice next-multiframe-window (after change-window-default-font-color activate)
  (window-face-focus))

(defadvice previous-multiframe-window (after change-window-default-font-color activate)
  (window-face-focus))

(add-hook 'window-configuration-change-hook 'window-face-focus)
