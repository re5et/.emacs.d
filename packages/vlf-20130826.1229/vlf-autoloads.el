;;; vlf-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (dired-vlf vlf) "vlf" "vlf.el" (21056 43524 914603
;;;;;;  577000))
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

(defadvice abort-if-file-too-large (around vlf-if-file-too-large (size op-type &optional filename) compile activate) "\
If file SIZE larger than `large-file-warning-threshold', allow user to view file with `vlf', open it normally, or abort.
OP-TYPE specifies the file operation being performed over FILENAME." (and large-file-warning-threshold size (> size large-file-warning-threshold) (let ((char nil)) (while (not (memq (setq char (read-event (propertize (format "File %s is large (%s): %s normally (o), %s with vlf (v) or abort (a)" (if filename (file-name-nondirectory filename) "") (file-size-human-readable size) op-type op-type) (quote face) (quote minibuffer-prompt)))) (quote (111 79 118 86 97 65))))) (cond ((memq char (quote (111 79)))) ((memq char (quote (118 86))) (vlf filename) (error "")) ((memq char (quote (97 65))) (error "Aborted"))))))

(unless (fboundp 'file-size-human-readable) (defun file-size-human-readable (file-size) "Print FILE-SIZE in MB." (format "%.1fMB" (/ file-size 1048576.0))))

;;;***

;;;### (autoloads nil nil ("vlf-pkg.el") (21056 43524 938450 174000))

;;;***

(provide 'vlf-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vlf-autoloads.el ends here
