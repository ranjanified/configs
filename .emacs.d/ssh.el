(add-to-list 'load-path "/usr/src/packages/emacs/ssh-el")

(add-hook 'ssh-mode-hook
          (lambda ()
            (setq ssh-directory-tracking-mode t)
            (shell-dirtrack-mode t)
            (setq dirtrackp nil))
	  (require 'ssh))
