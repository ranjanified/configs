;;; https://github.com/susam/emacs4cl/blob/master/.emacs
;;; Emacs4CL 0.1.0 <https://git.io/emacs4cl>

;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)

;; Workaround for https://debbugs.gnu.org/34341 in GNU Emacs <= 26.3.
(when (and (version< emacs-version "26.3") (>= libgnutls-version 30603))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; Write customizations to ~/.emacs.d/custom.el instead of this file.
(setq custom-file (concat user-emacs-directory "custom.el"))

;; Load packages.
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;; (defun slime-init-hook ()
;;   (message "%s" (propertize "Loading slime-autoloads..." 'face '(:foreground "red")))
;;   (require 'slime-autoloads))
;; (add-hook 'after-init-hook 'slime-init-hook)

(defun paredit-init-hook ()
  (message "%s" (propertize "Loading paredit..." 'face '(:foreground "red")))
  (require 'paredit))
(add-hook 'after-init-hook 'paredit-init-hook)

(defun rainbow-delimiters-init-hook ()
  (message "%s" (propertize "Loading rainbow-delimiters..." 'face '(:foreground "red")))
  (require 'rainbow-delimiters))
(add-hook 'after-init-hook 'rainbow-delimiters-init-hook)


;; Enable Paredit.
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;; (add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
;; (defun override-slime-del-key ()
;;   (define-key slime-repl-mode-map
;;     (read-kbd-macro paredit-backward-delete-key) nil))
;; (add-hook 'slime-repl-mode-hook 'override-slime-del-key)

;; Enable Rainbow Delimiters.
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ielm-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
;; (add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode)
