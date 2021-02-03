;; (let ((default-directory "/usr/src/packages/emacs/"))
;;   (normal-top-level-add-subdirs-to-load-path))

(setq load-path (cons "/usr/src/erlang/otp/lib/tools/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))

(defun erlang-after-init-hook ()
  (require 'edts-start))
(add-hook 'after-init-hook 'erlang-after-init-hook)

(setq edts-inhibit-package-check t)
(setq edts-man-root "/usr/src/erlang/otp/erts/man/23.1")

;; (custom-set-variables
;;  '(edts-inhibit-package-check t)
;;  '(edts-man-root "/usr/src/erlang/otp/erts/man/23.1"))
;; (custom-set-faces)
