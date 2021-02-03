 ;; LFE mode.
  ;; Set lfe-dir to point to where the lfe emacs files are.
(defvar lfe-dir "/usr/src/erlang/lfe/emacs")
(setq load-path (cons lfe-dir load-path))

;; (defun override-slime-del-key ()
;;   (define-key slime-repl-mode-map
;;     (read-kbd-macro paredit-backward-delete-key) nil))

(defun lfe-init-hook ()
  (require 'lfe-start))


(add-hook 'after-init-hook 'lfe-init-hook)

(defun on-loading-lfe-hook ()
  (message "%s" (propertize "On Loading LFE Hook..." 'face '(:foreground "red")))

  ;; Enable Paredit.
(add-hook 'lfe-mode-hook 'enable-paredit-mode)
(add-hook 'lfe-interaction-mode-hook 'enable-paredit-mode)
;; (add-hook 'slime-repl-mode-hook 'override-slime-del-key)

;; Enable Rainbow Delimiters.
(add-hook 'lfe-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lfe-interaction-mode-hook 'rainbow-delimiters-mode)
(define-key lfe-mode-map "\C-c\C-k" 'lfe-run)
(define-key lfe-mode-map "\C-c\C-c" 'lfe-compile)
)

(setq lfe-load-hook 'on-loading-lfe-hook)

(defun lfe-compile ()
  "LFE Compile"
  (interactive)
  (invoke-inferior-lfe "c" (buffer-file-name)))

(defun lfe-run ()
  "LFE Run"
  (interactive)
  (invoke-inferior-lfe "run" (buffer-file-name)))


(defun invoke-inferior-lfe (command-text buffer-name)
  "Invoke Inferior LFE"
  (message "Emitted Command...%s" (propertize (concatenate 'string "(" command-text  " \"" buffer-name "\")\n") 'face '(:foreground "red")))
  (call-interactively 'inferior-lfe)
  (comint-send-string (inferior-lfe-proc) (concatenate 'string "(" command-text  " \"" buffer-name "\")\n")))
