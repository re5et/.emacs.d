;;; lastpass-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "lastpass" "lastpass.el" (0 0 0 0))
;;; Generated autoloads from lastpass.el

(autoload 'lastpass-version "lastpass" "\
Show lastpass command line interface version.
If run interactively PRINT-MESSAGE gets set and version is printed to minibuffer.

\(fn &optional PRINT-MESSAGE)" t nil)

(autoload 'lastpass-login "lastpass" "\
Prompts user for password if not logged in.

\(fn)" t nil)

(autoload 'lastpass-status "lastpass" "\
Check LastPass status, if user is logged in or not.

\(fn)" t nil)

(autoload 'lastpass-logout "lastpass" "\
Log out lpass.  Does not ask for confirmation.

\(fn)" t nil)

(autoload 'lastpass-getuser "lastpass" "\
Get username associated with ACCOUNT.
If run interactively PRINT-MESSAGE gets set and username is printed to minibuffer.

\(fn ACCOUNT &optional PRINT-MESSAGE)" t nil)

(autoload 'lastpass-getpass "lastpass" "\
Get password associated with ACCOUNT.
If run interactively PRINT-MESSAGE gets set and password is printed to minibuffer.

\(fn ACCOUNT &optional PRINT-MESSAGE)" t nil)

(autoload 'lastpass-getfield "lastpass" "\
Get custom FIELD associated with ACCOUNT.
If run interactively PRINT-MESSAGE gets set and custom field is printed to minibuffer.

\(fn FIELD ACCOUNT &optional PRINT-MESSAGE)" t nil)

(autoload 'lastpass-visit-url "lastpass" "\
Visit url associated with ACCOUNT, which can be account name of unique id.

\(fn ACCOUNT)" t nil)

(autoload 'lastpass-create-auth-source-account "lastpass" "\
Copy ACCOUNT, change name to HOSTNAME and move to auth-source group.
Simplyfies the process of creating a valid auth-source entry from lastpass account.

\(fn ACCOUNT HOSTNAME)" t nil)

(autoload 'lastpass-addpass "lastpass" "\
Add account ACCOUNT with USER and PASSWORD to LastPass.
Optionally URL and GROUP can be set to nil.

\(fn ACCOUNT USER PASSWORD URL GROUP)" t nil)

(autoload 'lastpass-list-all "lastpass" "\
Show a dialog, listing all entries associated with `lastpass-user'.
If optional argument GROUP is given, only entries in GROUP will be listed.

\(fn &optional GROUP)" t nil)

(autoload 'lastpass-auth-source-enable "lastpass" "\
Enable lastpass auth-source by adding it to `auth-sources'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lastpass" '("lastpass-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lastpass-autoloads.el ends here
