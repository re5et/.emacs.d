;;; rvm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (rvm-use rvm-activate-corresponding-ruby rvm-use-default)
;;;;;;  "rvm" "../../../../.emacs.d/elpa/rvm-1.1/rvm.el" (19800 19394))
;;; Generated autoloads from ../../../../.emacs.d/elpa/rvm-1.1/rvm.el

(autoload 'rvm-use-default "rvm" "\
use the rvm-default ruby as the current ruby version

\(fn)" t nil)

(autoload 'rvm-activate-corresponding-ruby "rvm" "\
activate the corresponding ruby version for the file in the current buffer.
This function searches for an .rvmrc file and actiavtes the configured ruby.
If no .rvmrc file is found, the default ruby is used insted.

\(fn)" t nil)

(autoload 'rvm-use "rvm" "\
switch the current ruby version to any ruby, which is installed with rvm

\(fn NEW-RUBY NEW-GEMSET)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/rvm-1.1/rvm-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/rvm-1.1/rvm.el") (19800 19394
;;;;;;  786879))

;;;***

(provide 'rvm-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; rvm-autoloads.el ends here
