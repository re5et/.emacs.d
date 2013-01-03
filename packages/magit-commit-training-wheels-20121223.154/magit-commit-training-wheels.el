;;; magit-commit-training-wheels.el --- Advice for magit-log-edit-commit

;; Copyright (C) 2012 @re5et

;; Author: atom smith
;; URL: https://github.com/re5et/magit-commit-training-wheels
;; Created: 23 Dec 2012
;; Version: 0.0.1
;; Keywords: magit

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

;;; Commentary

;; Helps you craft well formed commit messages with magit's log edit
;; commit. Directives for what makes a well formed commit come from
;; tpope: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

;;; Usage

;; (require 'magit-commit-training-wheels)
;; (ad-activate 'magit-log-edit-commit)

(defadvice magit-log-edit-commit (around magit-commit-training-wheels)
  "Make sure we have a nice commit message."
  (let ((ok-to-commit t)
        (commit-problems nil)
        (case-fold-search nil)
        (special-case (string-match "-- End of Magit header --" (buffer-string))))
    (save-excursion
      (beginning-of-buffer)
      (if special-case (goto-line 3))
      (unless (string-match "[A-Z]" (string (char-after (point-min))))
        (if (yes-or-no-p "Doesn't start with a capital letter, fix?")
            (progn
              (beginning-of-line)
              (capitalize-word 1))))
      (end-of-line)
      (if (> (current-column) 50)
          (add-to-list 'commit-problems "First line is too long (> 50 characters)."))
      (if (> (count-lines (point) (point-max)) 0)
          (progn
            (forward-line)
            (if (not (equal (point-at-bol) (point-at-eol)))
                (if (yes-or-no-p "Doesn't have a blank line after the first, fix?")
                    (progn
                      (beginning-of-line)
                      (newline))))
            (while (not (equal (point) (point-max)))
              (forward-line)
              (end-of-line)
              (if (> (current-column) 72)
                  (add-to-list 'commit-problems "There are lines that are too long (> 72 characters)")))))
      (if commit-problems
          (catch 'break
            (dolist (problem commit-problems)
              (unless (yes-or-no-p (concat "WARNING: " problem " still commit?"))
                (progn
                  (setq ok-to-commit nil)
                  (throw 'break nil)))))))
    (if ok-to-commit ad-do-it)))

(provide 'magit-commit-training-wheels)
