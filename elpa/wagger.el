(defvar wagger-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c c") 'wagger-clear)
    (define-key map (kbd "C-c f") 'wagger-toggle-filter)
    (define-key map (kbd "C-c g") 'wagger-add-grep)
    (define-key map (kbd "C-c -") 'wagger-remove-last-filter)
    (define-key map (kbd "C-c s") 'wagger-show-filters)
    (define-key map (kbd "C-c r") 'wagger-remove-all-filters)
    (define-key map (kbd "C-c h") 'wagger-highlight)
    (define-key map (kbd "C-c u") 'wagger-unhighlight)
    map)
  "The keymap used in `wagger-mode' buffers.")

(defvar wagger-filters ()
  "List of filters to process the output through. Should be
an sh compatible shell command like 'grep ERROR'")
(make-variable-buffer-local 'wagger-filters)

(defvar wagger-file nil
  "List of filters to process the output through. Should be
an sh compatible shell command like 'grep ERROR'")
(make-variable-buffer-local 'wagger-filters)

(defvar wagger-highlight-list '(("Error" . hi-red-b)
                                ("Completed" . font-lock-builtin-face)
                                ("GET\\|POST\\|DELETE\\|PUT" . hi-green-b)
                                ("[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}" . font-lock-comment-delimiter-face)))

(defvar wagger-original-mode-line-format mode-line-format)

(defcustom wagger-fancy-mode-line
  nil
  "The completing read command simp-completing-read will use."
  :group 'wagger)

(define-minor-mode wagger-mode
  "Tail a local or remote (using tramp) file with
nice bindings for interacting with a tail like
clearing and filtering"
  nil
  " wagger"
  :keymap wagger-keymap)

(defun wagger (file)
  "Tail file FILE in wagger mode.  Supports remote tailing through tramp "
  (interactive "ftail file: ")
  (let* ((buffer-name (concat "tail " file))
         (remote-match (string-match "\\(.*:\\)\\(.*\\)" file))
         (default-directory (if remote-match (match-string 1 file) default-directory))
         (file (if remote-match (match-string 2 file) file)))
    (make-comint buffer-name "tail" nil "-f" file)
    (pop-to-buffer (concat "*" buffer-name "*")))
  (add-hook 'comint-preoutput-filter-functions 'wagger-output-filter)
  (set (make-local-variable 'comint-output-filter-functions)
       '(comint-truncate-buffer comint-postoutput-scroll-to-bottom))
  (set (make-local-variable 'comint-buffer-maximum-size) 5000)
  (set (make-local-variable 'comint-scroll-show-maximum-output) t)
  (setq wagger-file file)
  (setq wagger-filters ())
  (wagger-mode-line)
  (wagger-mode))

(defun wagger-clear ()
  "Clear out the tail buffer"
  (interactive)
  (mark-whole-buffer)
  (delete-region (point-min) (point-max)))

(defun wagger-toggle-filter (filter)
  "Add or remove FILTER to filter pipeline. For example, a filter of
'grep ERROR' will only show lines that contain the string ERROR.
Filters the result of the tail is piped to each filter in sequence."
  (interactive (list (read-string "toggle filter: ")))
  (if (member filter wagger-filters)
      (wagger-remove-filter filter)
    (wagger-add-filter filter)))

(defun wagger-add-grep (grep-args)
  "Convenience method to add a grep filter.  A filter will be added
in the format: 'grep GREP-ARGS'."
  (interactive (list (read-string "add grep: ")))
  (wagger-add-filter (concat "grep " grep-args)))

(defun wagger-add-filter (filter)
  "Add specified FILTER to the filter pipeline."
  (interactive (list (read-string "add filter: ")))
  (add-to-list 'wagger-filters filter)
  (message (concat "added filter: " filter))
  (wagger-mode-line))

(defun wagger-remove-filter (filter)
  "Remove specified FILTER from the filter pipeline if it exists."
  (interactive (list (read-string "remove filter: ")))
  (setq wagger-filters (delete filter wagger-filters))
  (message (concat "removed filter: " filter))
  (wagger-mode-line))

(defun wagger-remove-last-filter ()
  "Pop the last filter off of the end of the filter pipeline."
  (interactive)
  (wagger-remove-filter (car wagger-filters)))

(defun wagger-show-filters ()
  "Show the current filter pipeline"
  (interactive)
  (if wagger-filters
      (message
       (concat
        "current filters: "
        (wagger-filter-pipeline)))
    (message "There are currently no filters.")))

(defun wagger-highlight ()
  "Turn on wagger highlighting. Relys on wagger-highlight-list
for specification on what matches to highlight what color."
  (interactive)
  (dolist (pair wagger-highlight-list)
    (highlight-phrase (car pair) (cdr pair))))

(defun wagger-unhighlight ()
  "Turns off wagger highlighting."
  (interactive)
  (dolist (pair wagger-highlight-list)
    (unhighlight-regexp (car pair))))

(defun wagger-remove-all-filters ()
  "Remove all filters from the filter pipeline."
  (interactive)
  (setq wagger-filters ())
  (wagger-mode-line)
  (message "all filters removed."))

(defun wagger-filter-pipeline ()
  "Internal use, returns a generated filter pipeline"
  (if wagger-filters
      (mapconcat 'identity (reverse wagger-filters) " | ")))

(defun wagger-output-filter (output)
  "Comint output filter for wagger-mode. Applies ansi color, and
filters output through the filter pipeline."
  (let ((shell-file-name "sh")
        (output (ansi-color-apply output)))
    (if wagger-filters
        (shell-command-to-string
         (format "echo %s | %s"
                 (shell-quote-argument output)
                 (wagger-filter-pipeline)))
      output)))

(defun wagger-mode-line ()
  "Mode line to show the tail command in use including the filters."
  (if wagger-fancy-mode-line
      (setq
       mode-line-format
       `(" tail -f "
         ,wagger-file
         ,(if (wagger-filter-pipeline)
              (concat " | " (wagger-filter-pipeline)))))))

(provide 'wagger)
