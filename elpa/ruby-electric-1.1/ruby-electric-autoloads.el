;;; ruby-electric-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ruby-electric-mode) "ruby-electric" "../../../../.emacs.d/elpa/ruby-electric-1.1/ruby-electric.el"
;;;;;;  (19800 19397))
;;; Generated autoloads from ../../../../.emacs.d/elpa/ruby-electric-1.1/ruby-electric.el

(autoload 'ruby-electric-mode "ruby-electric" "\
Toggle Ruby Electric minor mode.
With no argument, this command toggles the mode.  Non-null prefix
argument turns on the mode.  Null prefix argument turns off the
mode.

When Ruby Electric mode is enabled, an indented 'end' is
heuristicaly inserted whenever typing a word like 'module',
'class', 'def', 'if', 'unless', 'case', 'until', 'for', 'begin',
'do'. Simple, double and back quotes as well as braces are paired
auto-magically. Expansion does not occur inside comments and
strings. Note that you must have Font Lock enabled.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/ruby-electric-1.1/ruby-electric-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/ruby-electric-1.1/ruby-electric.el")
;;;;;;  (19800 19397 656020))

;;;***

(provide 'ruby-electric-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ruby-electric-autoloads.el ends here
