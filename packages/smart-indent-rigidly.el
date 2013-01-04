;;; smart-indent-rigidly.el --- Smart rigid indenting

;; Copyright (C) 2012 @re5et

;; Author: atom smith
;; URL: https://github.com/re5et/itail
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

(defvar smart-indent-rigidly-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<tab>") 'smart-rigid-indent)
    (define-key map (kbd "<backtab>") 'smart-rigid-unindent)
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
  (let ((deactivate-mark nil)
        (beginning-position
         (if (region-active-p)
             (save-excursion
               (goto-line (line-number-at-pos (region-beginning)))
               (line-beginning-position))
           (line-beginning-position)))
        (end-position
         (if (region-active-p)
             (region-end)
           (line-end-position))))
    (indent-rigidly beginning-position end-position count)))

(provide 'smart-indent-rigidly)
