;;; ivy-xref.el --- Ivy interface for xref results -*- lexical-binding: t -*-

;; Copyright (C) 2017  Alex Murray <murray.alex@gmail.com>

;; Author: Alex Murray <murray.alex@gmail.com>
;; URL: https://github.com/alexmurray/ivy-xref
;; Version: 0.1
;; Package-Requires: ((emacs "25.1") (ivy "0.10.0"))

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This packages provides ivy as the interface for selection from xref results.

;;;; Setup

;; (require 'ivy-xref) ; unless installed from a package
;; (setq xref-show-xrefs-function 'ivy-xref-show-xrefs)

;;; Code:
(require 'xref)
(require 'ivy)

(defun ivy-xref-make-collection (xrefs)
  "Transform XREFS into a collection for display via `ivy-read'."
  (let ((collection nil))
    (dolist (xref xrefs)
      (with-slots (summary location) xref
        (let ((line (xref-location-line location))
              (file (xref-location-group location))
              (candidate nil))
          (setq candidate (concat
                           ;; use file name only
                           (car (reverse (split-string file "\\/")))
                                  (when (string= "integer" (type-of line))
                                    (concat ":" (int-to-string line) ": "))
                                  summary))
          (push `(,candidate . ,location) collection))))
    collection))

;;;###autoload
(defun ivy-xref-show-xrefs (xrefs _alist)
  "Show the list of XREFS via ivy."
  (ivy-read "xref: " (ivy-xref-make-collection xrefs)
            :require-match t
            :sort t
            :action #'(lambda (candidate)
                        (xref--show-location (cdr candidate) t))))

(provide 'ivy-xref)
;;; ivy-xref.el ends here
