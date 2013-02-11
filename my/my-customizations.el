(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.01)
 '(ac-delay 0.01)
 '(ac-modes (quote (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode coffee-mode sass-mode haml-mode)))
 '(ac-use-fuzzy t)
 '(ansi-term-color-vector [unspecified "white" "red" "green" "yellow" "royal blue" "magenta" "cyan" "white"] t)
 '(auto-indent-engine (quote keys))
 '(auto-indent-kill-line-at-eol nil)
 '(auto-indent-next-pair-timer-geo-mean (quote ((default 0.0005 0))))
 '(auto-revert-verbose t)
 '(bookmark-default-file "~/.emacs.d/my/my-bookmarks.el")
 '(clean-buffer-list-delay-general 1)
 '(column-highlight-mode t)
 '(column-number-mode t)
 '(compilation-ask-about-save nil)
 '(crosshairs-overlay-priority 100)
 '(css-indent-level 2)
 '(css-indent-offset 2)
 '(delete-selection-mode t)
 '(display-time-mode t)
 '(electric-pair-mode nil)
 '(electric-pair-skip-self nil)
 '(elscreen-display-tab nil)
 '(emms-playlist-default-major-mode (quote emms-playlist-mode))
 '(emms-source-file-default-directory "~/music/")
 '(emux-completing-read-command (quote ido-completing-read))
 '(eshell-cd-shows-directory nil)
 '(eshell-cmpl-cycle-completions t)
 '(eshell-cmpl-cycle-cutoff-length 10)
 '(eshell-cmpl-expand-before-complete t)
 '(fringe-mode (quote (1 . 1)) nil (fringe))
 '(global-auto-complete-mode t)
 '(global-auto-revert-mode t)
 '(global-auto-revert-non-file-buffers t)
 '(global-highline-mode t)
 '(global-linum-mode nil)
 '(global-visible-mark-mode t)
 '(global-whitespace-mode nil)
 '(grep-command "grep -nH -e ")
 '(grep-find-command nil)
 '(grep-find-ignored-files (quote (".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "#*")))
 '(grep-find-template "find . <X> -type f <F> -exec grep <C> -nHI -e <R> {} +")
 '(grep-highlight-matches (quote auto))
 '(grep-template "grep <X> <C> -nH -e <R> <F>")
 '(grep-use-null-device nil)
 '(highlight-indentation-offset 2)
 '(highline-selected-window t)
 '(hippie-expand-try-functions-list (quote (yas/hippie-try-expand try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(ido-auto-merge-delay-time 5)
 '(ido-decorations (quote ("
>> " "" "
   " "
   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-max-directory-size 100000)
 '(ido-mode (quote both) nil (ido))
 '(ido-ubiquitous-mode t)
 '(ido-use-virtual-buffers t)
 '(indent-tabs-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t)
 '(inferior-lisp-program "sbcl")
 '(iswitchb-use-virtual-buffers t nil (recentf))
 '(itail-fancy-mode-line t)
 '(js-indent-level 2)
 '(js2-auto-indent-p nil)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-mirror-mode nil)
 '(kill-ring-max 1000)
 '(kill-whole-line t)
 '(linum-delay t)
 '(linum-eager t)
 '(magit-commit-all-when-nothing-staged (quote ask-stage))
 '(magit-completing-read-function (quote ido-completing-read))
 '(magit-default-tracking-name-function (quote magit-tracking-name-unfucked-with))
 '(magit-save-some-buffers nil)
 '(midnight-delay "1:00am")
 '(midnight-mode t nil (midnight))
 '(multi-term-program "/bin/zsh" t)
 '(multi-term-scroll-show-maximum-output t)
 '(mumamo-chunk-coloring 10)
 '(nxml-child-indent 2)
 '(nxml-outline-child-indent 2)
 '(package-user-dir "~/.emacs.d/packages")
 '(proced-auto-update-flag t)
 '(proced-auto-update-interval 1)
 '(proced-format (quote long))
 '(ruby-block-delay 0.1)
 '(ruby-block-highlight-toggle t)
 '(ruby-electric-expand-delimiters-list nil)
 '(ruby-end-insert-newline nil)
 '(save-interprogram-paste-before-kill t)
 '(save-place t nil (saveplace))
 '(sgml-basic-offset 2)
 '(show-paren-mode nil)
 '(show-smartparens-global-mode t)
 '(simp-completing-read-command (quote ido-completing-read))
 '(size-indication-mode t)
 '(smartparens-global-mode t)
 '(sp-ignore-modes-list (quote (calc-mode dired-mode gnus-article-mode gnus-group-mode gnus-summary-mode ibuffer-mode magit-branch-manager-mode magit-commit-mode magit-diff-mode magit-key-mode magit-log-mode magit-reflog-mode magit-stash-mode magit-status-mode magit-wazzup-mode minibuffer-inactive-mode monky-mode sr-mode term-mode)))
 '(tab-width 2)
 '(term-buffer-maximum-size 100000)
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#FFFFFF")
 '(term-unbind-key-list (quote ("C-z" "C-x" "C-c" "C-h" "C-l" "<ESC>")))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(vc-handled-backends (quote (RCS CVS SVN SCCS Bzr Hg Mtn Arch)))
 '(visible-mark-inhibit-trailing-overlay t)
 '(visible-mark-max 1)
 '(vlf-batch-size 102400)
 '(wgrep-auto-save-buffer t)
 '(whitespace-global-modes t)
 '(whitespace-line-column 800)
 '(yank-pop-change-selection t)
 '(yas-global-mode t nil (yasnippet)))

(deftheme selwyn
  "my theme")

(custom-theme-set-faces
 'selwyn
'(default ((t (:background "#050505" :foreground "#AAA" :height 100 :width normal :foundry "unknown" :family "dejavu sans mono")))))

(provide-theme 'selwyn)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#FFF" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "dejavu sans mono"))))
 '(ac-completion-face ((t (:foreground "#555" :underline "#F0F"))))
 '(button ((t (:underline t))))
 '(cursor ((t (:background "#FF0" :foreground "#F00"))))
 '(erc-prompt-face ((t (:background "lightBlue2" :foreground "green" :weight bold))))
 '(flymake-errline ((t (:background "#600"))))
 '(font-lock-builtin-face ((t (:foreground "#F0F"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face :foreground "#f90"))))
 '(font-lock-comment-face ((t (:foreground "#888"))))
 '(font-lock-constant-face ((t (:foreground "#0F0"))))
 '(font-lock-function-name-face ((t (:foreground "#F90" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "#00afff" :weight bold))))
 '(font-lock-string-face ((t (:foreground "#c00"))))
 '(font-lock-type-face ((t (:foreground "#ff5fff" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#FF0" :weight bold))))
 '(font-lock-warning-face ((t (:background "#ff0000" :foreground "#ffffff"))))
 '(fringe ((t (:background "#111" :foreground "#500"))))
 '(header-line ((t (:background "#000" :foreground "#FFF" :weight ultra-bold))))
 '(highlight ((t (:background "#330"))))
 '(highlight-indentation-face ((t (:background "#151515"))))
 '(highline-face ((t (:background "#000011"))))
 '(highline-vertical-face ((t (:background "#030303"))))
 '(ido-first-match ((t (:foreground "#FF0" :weight bold))))
 '(ido-only-match ((t (:foreground "#0F0" :weight extra-bold))))
 '(isearch ((t (:background "#220022" :foreground "#FF00FF"))))
 '(lazy-highlight ((t (:background "#222222" :foreground "#FFFF00"))))
 '(link ((t (:foreground "#00afff" :underline t))))
 '(link-visited ((t (:foreground "#ff5fff" :underline t))))
 '(linum ((t (:foreground "#444"))))
 '(magit-diff-add ((t (:foreground "#0F0"))))
 '(magit-diff-del ((t (:foreground "#F00"))))
 '(magit-item-highlight ((t (:background "#002"))))
 '(minibuffer-prompt ((t (:foreground "#09F" :weight bold))))
 '(mode-line ((t (:background "#111" :foreground "#0F0" :weight bold))))
 '(mode-line-inactive ((t (:background "#111" :foreground "#444"))))
 '(popup-face ((t (:background "#111" :foreground "#888"))))
 '(popup-menu-face ((t (:background "#111" :foreground "#0F0"))))
 '(popup-menu-selection-face ((t (:background "#111" :foreground "yellow"))))
 '(powerline-active1 ((t (:inherit mode-line :background "#1c1c1c" :foreground "#09f" :weight bold))))
 '(powerline-active2 ((t (:inherit mode-line :background "#050505" :foreground "#F0F" :weight bold))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "#090909"))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "#030303"))))
 '(regex-tool-matched-face ((t (:background "#020" :foreground "Orange" :weight bold))))
 '(region ((t (:background "#111"))))
 '(show-paren-match ((t (:background "#06F" :foreground "#000" :weight ultra-bold))))
 '(show-paren-mismatch ((t (:background "#F00" :foreground "white" :weight ultra-bold))))
 '(sp-pair-overlay-face ((t (:background "#111"))))
 '(sp-show-pair-match-face ((t (:background "#F0F"))))
 '(sp-show-pair-mismatch-face ((t (:background "red" :foreground "white"))))
 '(vertical-border ((((type x tty)) (:inherit mode-line-inactive :foreground "#333"))))
 '(visible-mark-face ((t (:foreground "#0F0" :underline "#F0F"))))
 '(visible-mark-non-trailing-face0 ((t (:foreground "#F0F"))) t)
 '(whitespace-empty ((t (:background "#100" :foreground "firebrick"))))
 '(whitespace-hspace ((t (:foreground "#222"))))
 '(whitespace-indentation ((t (:inherit nil :foreground "#400"))))
 '(whitespace-line ((t (:inherit default))))
 '(whitespace-newline ((t (:foreground "#111"))))
 '(whitespace-space ((t (:foreground "#111"))))
 '(whitespace-tab ((t (:foreground "#222"))))
 '(whitespace-trailing ((t (:foreground "#F00" :weight bold))))
 '(yas/field-highlight-face ((t (:background "#300")))))
