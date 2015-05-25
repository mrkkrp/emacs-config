;;; mk-minor-modes.el --- Minor modes' settings -*- lexical-binding: t; -*-
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

;;; Settings of various minor modes, their activation, etc.

;;; Code:

(require 'mk-utils)

(setq-default
 auto-fill-mode                    1       ; wrapping lines beyond limit
 auto-revert-verbose               nil     ; be quiet
 column-number-mode                t       ; display column number
 display-time-24hr-format          t       ; 24 hours format for time
 display-time-default-load-average nil     ; don't clutter my status line
 fill-column                       76      ; set fill column
 global-auto-revert-non-file-buffers t     ; mainly for Dired
 ido-auto-merge-work-directories-length -1 ; disable it
 ido-create-new-buffer             'always
 ido-decorations          '("" "" "·" "…" "" "" " ×" " ✔" " ⊥" " ⊥" " ↯")
 ido-enable-flex-matching          t
 ido-everywhere                    t)

(blink-cursor-mode                 0) ; my cursor doesn't blink, man
(delete-selection-mode             1) ; delete selection mode enabled
(display-time-mode                 1) ; display time
(global-auto-revert-mode           1) ; revert buffers automatically
(ido-mode                          1) ; ido for switch-buffer and find-file
(ido-ubiquitous-mode               1) ; use ido everywhere
(menu-bar-mode                     0) ; hide menu bar
(minibuffer-electric-default-mode  1) ; electric minibuffer
(scroll-bar-mode                   0) ; disable scroll bar
(show-paren-mode                   1) ; highlight parenthesis
(smooth-scroll-mode                1) ; smooth scroll
(tool-bar-mode                     0) ; hide tool bar
(which-function-mode               1) ; displays current function
(yas-global-mode                   1) ; enable Yasnippet

(eval-after-load 'which-func
  '(setq which-func-format  (list (cadr which-func-format))
         which-func-unknown "⊥"))

(dolist (buffer '("^\*Backtrace\*"
                  "^\*Compile-Log\*"
                  "^\*.+Completions\*"
                  "^\*Flycheck error messages\*"
                  "^\*Help\*"
                  "^\*Ibuffer\*"
                  "^\*Messages\*"
                  "^\*inferior-lisp\*"
                  "^\*scratch\*"
                  "^\*slime-compilation\*"
                  "^\*slime-description\*"
                  "^\*slime-events\*"))
  (add-to-list 'ido-ignore-buffers buffer))

(put 'dired-do-copy    'ido      nil) ; use ido there
(put 'dired-do-rename  'ido      nil) ; ^

(setq
 minor-mode-alias
 '((abbrev-mode          . "") (interactive-haskell-mode . "")
   (auto-fill-function   . "") (ispell-minor-mode        . "")
   (eldoc-mode           . "") (magit-auto-revert-mode   . "")
   (flycheck-mode        . "") (slime-mode               . "")
   (flyspell-mode        . "") (smooth-scroll-mode       . "")
   (haskell-doc-mode     . "") (subword-mode             . "")
   (haskell-indent-mode  . "") (superword-mode           . "")
   (inf-haskell-mode     . "") (yas-minor-mode           . "")))

(defun prepare-prog-mode ()
  "This function enables some minor modes for programming."
  (auto-fill-mode 1)
  (setq-local comment-auto-fill-only-comments t)
  (flyspell-prog-mode)
  (flycheck-mode))

(add-hook 'after-change-major-mode-hook (ε #'mouse-wheel-mode 0))
(add-hook 'flycheck-mode-hook           #'flycheck-haskell-setup)
(add-hook 'ibuffer-mode-hook            #'hl-line-mode)
(add-hook 'prog-mode-hook               #'prepare-prog-mode)
(add-hook 'text-mode-hook               #'auto-fill-mode)
(add-hook 'text-mode-hook               #'flyspell-mode)

(provide 'mk-minor-modes)

;;; mk-minor-modes.el ends here
