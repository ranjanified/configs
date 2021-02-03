(load-theme 'wombat)
;; (setq debug-on-error t)

(let ((default-directory "/usr/src/packages/emacs/"))
  (normal-top-level-add-subdirs-to-load-path))

;; (load "~/.emacs.d/package.archives")
;; (package-initialize)

(load "~/.emacs.d/frame.settings")
(load "~/.emacs.d/neotree")
(load "~/.emacs.d/ssh")
(load "~/.emacs.d/erlang")
(load "~/.emacs.d/gas-mode/gas-mode")
(load "~/.emacs.d/lisp")
(load "~/.emacs.d/lfe")
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(edts-inhibit-package-check t)
;;  '(edts-man-root "/usr/src/erlang/otp/erts/man/23.1"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
