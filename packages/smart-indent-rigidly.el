;;; smart-indent-rigidly.el --- Smart rigid indenting

;; Copyright (C) 2012 @re5et

;; Author: atom smith
;; URL: https://github.com/re5et/...
;; Created: 04 Jan 2013
;; Version: 0.0.1
;; Keywords: indenting coffee-mode haml-mode sass-mode

;; This file is NOT part of GNU Emacs.

;; This is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 3, or (at your option) any later
;; version.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with Emacs; see the file COPYING, or type `C-h C-c'. If not,
;; write to the Free Software Foundation at this address:

;; Free Software Foundation
;; 51 Franklin Street, Fifth Floor
;; Boston, MA 02110-1301
;; USA

(defgroup smart-indent-rigidly nil
  "Smart rigid indentation."
  :group 'editing)

(defcustom smart-indent-indent-key
  "<C-tab>"
  "the key binding for indent"
  :type 'string
  :group 'smart-indent-rigidly)

(defcustom smart-indent-unindent-key
  "<C-S-iso-lefttab>"
  "the key binding for unindent"
  :type 'string
  :group 'smart-indent-rigidly)

(defvar smart-indent-rigidly-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (read-kbd-macro smart-indent-indent-key) 'smart-rigid-indent)
    (define-key map (read-kbd-macro smart-indent-unindent-key) 'smart-rigid-unindent)
    map)
  "The keymap used in `smart-indent-rigidly-keymap' buffers.")

(define-minor-mode smart-indent-rigidly-mode
  "Un/Indent region if active or current line

\\{smart-indent-rigidly-keymap}"
  nil
  " sir"
  :keymap smart-indent-rigidly-keymap)

(defun smart-rigid-indent ()
  "Indent active region or current line by tab-width"
  (interactive)
  (smart-indent-rigidly tab-width))

(defun smart-rigid-unindent ()
  "Unindent active region or current line by tab-width"
  (interactive)
  (smart-indent-rigidly (* -1 tab-width)))

(defun smart-indent-rigidly (count)
  (if (and
       (string-match
        ;; if the line is empty just use whatever
        ;; indent does for current mode
        "^[ \t]*$"
        (buffer-substring-no-properties
         (line-beginning-position)
         (line-end-position)))
       (not (region-active-p)))
      (indent-for-tab-command)
    ;; otherwise decide what to indent
    (let ((deactivate-mark nil)
          (beginning-position
           ;; if there is an active region
           (if (region-active-p)
               (save-excursion
                 ;; indent every line in the region
                 (goto-line
                  (line-number-at-pos
                   (region-beginning)))
                 (line-beginning-position))
             ;; otherwise just indent the line
             (line-beginning-position)))
          (end-position
           (if (region-active-p)
               (region-end)
             (line-end-position))))
      (indent-rigidly
       beginning-position
       end-position
       count))))

(provide 'smart-indent-rigidly)
