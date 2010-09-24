(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(css-indent-level 4)
 '(display-time-mode t)
 '(elscreen-display-tab nil)
 '(fringe-mode nil nil (fringe))
 '(global-linum-mode t)
 '(highline-selected-window t)
 '(highline-vertical nil)
 '(ido-everywhere t)
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t)
 '(iswitchb-use-virtual-buffers t nil (recentf))
 '(linum-delay t)
 '(linum-eager t)
 '(mumamo-chunk-coloring 10)
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(save-place t nil (saveplace))
 '(sgml-basic-offset 4)
 '(size-indication-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :foreground "#00ff00" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 74 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(fringe ((t (:background "#111" :foreground "#ff0"))))
 '(highline-face ((t (:background "#003"))))
 '(highline-vertical-face ((t (:background "#111"))))
 '(linum ((t (:inherit (shadow default) :foreground "#f60" :underline "#111"))))
 '(magit-item-highlight ((((class color) (background dark)) (:background "#100"))))
 '(mode-line ((t (:foreground "#FFFF00"))))
 '(mode-line-buffer-id ((t (:background "gray16" :foreground "#FFFF00"))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:foreground "#FFFF00" :box (:line-width 2 :color "grey40" :style released-button)))))
 '(mode-line-inactive ((default (:inherit mode-line)) (((class color) (min-colors 88) (background dark)) (:background "grey10" :foreground "grey30" :box (:line-width -1 :color "grey40") :weight light))))
 '(show-paren-match ((((class color) (background dark)) (:background "yellow" :foreground "black"))))
 '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white")))))
