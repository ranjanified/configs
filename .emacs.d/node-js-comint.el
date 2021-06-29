(add-to-list 'load-path "/usr/src/packages/emacs/js-comint")

(require 'js-comint)


(setq js-comint-buffer "Node REPL")

(add-hook 'js-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
            (local-set-key (kbd "C-c b") 'js-send-buffer)
            (local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go)))
