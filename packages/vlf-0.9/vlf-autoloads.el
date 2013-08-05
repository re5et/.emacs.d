;;; vlf-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (vlf-if-file-too-large dired-vlf vlf) "vlf" "vlf.el"
;;;;;;  (20992 1496 841257 939000))
;;; Generated autoloads from vlf.el

(autoload 'vlf "vlf" "\
View Large FILE.
Batches of the file data from FILE will be displayed in a read-only
buffer.  You can customize number of bytes displayed by customizing
`vlf-batch-size'.

\(fn FILE)" t nil)

(autoload 'dired-vlf "vlf" "\
In Dired, visit the file on this line in VLF mode.

\(fn)" t nil)

(eval-after-load "dired" '(define-key dired-mode-map "V" 'dired-vlf))

(autoload 'vlf-if-file-too-large "vlf" "\
If file SIZE larger than `large-file-warning-threshold', allow user to view file with `vlf', open it normally, or abort.
OP-TYPE specifies the file operation being performed over FILENAME.

\(fn SIZE OP-TYPE &optional FILENAME)" nil nil)

(fset 'abort-if-file-too-large 'vlf-if-file-too-large)

;;;***

;;;### (autoloads nil nil ("vlf-pkg.el") (20992 1496 853547 71000))

;;;***

(provide 'vlf-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vlf-autoloads.el ends here
