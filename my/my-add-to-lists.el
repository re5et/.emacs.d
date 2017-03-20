(add-to-list 'auto-mode-alist '("\\.scss" . css-mode))
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.stumpwmrc'" . stumpwm-mode))
(add-to-list 'auto-mode-alist '("\\.hamlbars'" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.hamlc'" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(provide 'my-add-to-lists)
