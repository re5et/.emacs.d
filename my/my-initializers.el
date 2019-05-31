(smex-initialize)
(icomplete-mode)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(winner-mode)
(go-to-hell-bars)
(recentf-mode t)
(show-paren-mode t)
(auto-compression-mode 1)
(powerline-default-theme)
(exec-path-from-shell-initialize)

(with-eval-after-load 'compile
  ;; hyperlink generic file URI in a compilation buffer
  (add-to-list 'compilation-error-regexp-alist 'generic-file-link)
  (add-to-list 'compilation-error-regexp-alist-alist '(generic-file-link "file://?\\(\/.*\\)$" 1 2)))

(provide 'my-initializers)
