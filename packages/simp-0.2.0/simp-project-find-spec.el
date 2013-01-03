;;; simp-project-files.el --- Find files in a simp project

;; Copyright (C) 2011-2012 @re5et

;; Author: atom smith
;; URL: https://github.com/re5et/simp
;; Created: 22 Dec 2011
;; Version: 0.2.0
;; Keywords: project grep find

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

;; Bind simp-project-find-file to something so you can quickly narrow down
;; files in a project without having to traverse directories. I use:

;; (global-set-key (kbd "C-x M-f") 'simp-project-find-file)

;; You should also customize the variable simp-completing-read if you
;; want to use ido or something else to manage the completion

(require 'simp-project-files)

()

(defun simp-project-find-spec ()
  (interactive)
  (dolist (file (simp-project-files))
    (if (string-match (simp-project-find-spec-regexp) file)
        (return (find-file (concat (file-name-as-directory (simp-project-root)) file)))))
  (message "Found no spec file."))

(defun simp-project-find-spec-basename ()
  (file-name-nondirectory
   (file-name-sans-extension
    (buffer-file-name))))

(defun simp-project-find-spec-extension ()
  (file-name-extension (buffer-file-name)))

(defun simp-project-find-spec-regexp ()
  (concat
   (simp-project-find-spec-basename)
   "\\("
   (mapconcat 'identity (simp-project-get :spec-suffix)'("_spec") "\\|")
   "\\)\."
   (simp-project-find-spec-extension)))

(simp-project-find-spec)

(simp-project-find-spec-extension)
