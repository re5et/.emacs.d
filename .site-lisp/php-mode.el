;; http://sachachua.com/wp/2008/07/emacs-and-php-tutorial-php-mode/
(add-hook 'php-mode-hook
	  (lambda ()
	    (c-set-offset 'substatement-open 0)
	    (c-set-offset 'arglist-intro '+)
	    (c-set-offset 'arglist-cont 0)
	    (c-set-offset 'arglist-close 0)
	    (define-key php-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))
