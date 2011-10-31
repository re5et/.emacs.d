(smex-initialize)
(ido-mode t)
(go-to-hell-bars)
(recentf-mode t)
(show-paren-mode t)
(highline-mode)
(auto-compression-mode 1) ; Lets emacs uncompress .gz files before opening them
(yas/initialize)
(yas/load-directory "~/.emacs.d/mine/yasnippet-0.6.1c/snippets/")

(provide 'my-initializers)
