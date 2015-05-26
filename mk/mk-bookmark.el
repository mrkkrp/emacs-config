;;; mk-bookmark.el --- Bookmark related changes.  -*- lexical-binding: t; -*-
;;;
;;; Copyright © 2015 Mark Karpov <markkarpov@opmbx.org>
;;;
;;; This file is not part of GNU Emacs.
;;;
;;; This program is free software: you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by the
;;; Free Software Foundation, either version 3 of the License, or (at your
;;; option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
;;; Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License along
;;; with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Some settings related to usage of bookmarks.

;;; Code:

(require 'mk-utils)

(add-to-list 'major-mode-alias '(bookmark-bmenu-mode . "→"))

(add-hook 'bookmark-bmenu-mode-hook #'hl-line-mode)

(provide 'mk-bookmark)

;;; mk-bookmark.el ends here