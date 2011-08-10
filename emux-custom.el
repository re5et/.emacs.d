(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes (quote ("3eee0bad3a4c13e0b5a03c19f67ee6e9029e332d" "0c12561b2fa0462c6c77bc9039a13f1be477c24b" default)))
 '(elscreen-display-tab nil)
 '(fringe-mode (quote (1 . 1)) nil (fringe))
 '(highline-selected-window t)
 '(ido-auto-merge-delay-time 3)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries (quote left))
 '(kill-ring-max 200)
 '(kill-whole-line t)
 '(menu-bar-mode nil)
 '(multi-term-program "/bin/zsh")
 '(multi-term-scroll-show-maximum-output nil)
 '(save-interprogram-paste-before-kill t)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(term-bind-key-alist (quote (("C-c C-c" . term-interrupt-subjob) ("C-S-p" . previous-line) ("C-S-s" . isearch-forward) ("C-S-r" . isearch-backward) ("C-m" . term-send-raw) ("M-f" . term-send-forward-word) ("M-b" . term-send-backward-word) ("M-o" . term-send-backspace) ("M-d" . term-send-forward-kill-word) ("M-DEL" . term-send-backward-kill-word) ("M-," . term-send-input) ("M-." . comint-dynamic-complete))))
 '(term-buffer-maximum-size 16384)
 '(term-default-bg-color "#000000")
 '(term-unbind-key-list (quote ("C-z" "C-x" "C-c" "C-h" "C-l" "<ESC>")))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(yank-pop-change-selection t))

(deftheme selwyn
  "my theme")
(custom-theme-set-faces
 'selwyn
 '(default ((t (:background "#000000" :foreground "#AAA" :height 100 :width normal :foundry "unknown" :family "dejavu sans mono"))))
 '(cursor ((t (:background "#FF0" :foreground "#F00"))))
 '(mode-line ((t (:background "#111" :foreground "#888888"))))
 '(mode-line-inactive ((t (:background "#262626" :foreground "#888888"))))
 '(fringe ((t (:background "#111"))))
 '(minibuffer-prompt ((t (:foreground "#09F" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "#F0F"))))
 '(font-lock-comment-face ((t (:foreground "#af5f00"))))
 '(font-lock-constant-face ((t (:foreground "#0F0"))))
 '(font-lock-keyword-face ((t (:foreground "#00afff" :weight bold))))
 '(font-lock-string-face ((t (:foreground "#090"))))
 '(font-lock-type-face ((t (:foreground "#ff5fff" :weight bold))))
 '(font-lock-warning-face ((t (:background "#ff0000" :foreground "#ffffff"))))
 '(isearch ((t (:background "#ffaf5f" :foreground "#000000"))))
 '(link ((t (:foreground "#00afff" :underline t))))
 '(link-visited ((t (:foreground "#ff5fff" :underline t))))
 '(button ((t (:underline t))))
 '(header-line ((t (:background "#262626" :foreground "#888888")))))
(provide-theme 'selwyn)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#000" :foreground "#BBB" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face :foreground "#f90"))))
 '(font-lock-comment-face ((t (:foreground "#444"))))
 '(font-lock-function-name-face ((t (:foreground "#F90" :weight bold))))
 '(font-lock-string-face ((t (:foreground "#c00"))))
 '(font-lock-variable-name-face ((t (:foreground "#FF0" :weight bold))))
 '(highline-face ((t (:background "#202"))))
 '(isearch ((t (:background "#220022" :foreground "#FF00FF"))))
 '(mode-line ((t (:background "#111" :foreground "#0F0")))))
