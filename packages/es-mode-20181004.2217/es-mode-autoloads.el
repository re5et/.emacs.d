;;; es-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "es-cc" "es-cc.el" (23598 46512 515771 222000))
;;; Generated autoloads from es-cc.el

(autoload 'es-command-center "es-cc" "\
Open the Elasticsearch Command Center

\(fn)" t nil)

;;;***

;;;### (autoloads nil "es-copyas" "es-copyas.el" (23598 46512 495770
;;;;;;  621000))
;;; Generated autoloads from es-copyas.el

(autoload 'es-copy-as "es-copyas" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "es-mode" "es-mode.el" (23598 46512 507770
;;;;;;  982000))
;;; Generated autoloads from es-mode.el

(autoload 'es-mode "es-mode" "\
Major mode for editing Elasticsearch queries.
\\{es-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.es\\'" . es-mode))

(autoload 'es-mode-snippets-initialize "es-mode" "\


\(fn)" nil nil)

(eval-after-load 'yasnippet '(es-mode-snippets-initialize))

;;;***

;;;### (autoloads nil nil ("es-mode-pkg.el" "es-parse.el" "ob-elasticsearch.el")
;;;;;;  (23598 46512 579773 142000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; es-mode-autoloads.el ends here
