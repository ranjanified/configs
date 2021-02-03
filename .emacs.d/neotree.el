(add-to-list 'load-path "/usr/src/packages/emacs/neotree")

(defun neotree-init-hook ()
  (require 'neotree))
(add-hook 'after-init-hook 'neotree-init-hook)

(global-set-key (kbd "C-M-l") 'neotree-show)
(global-set-key (kbd "<escape>") 'neotree-hide)
(setq neo-smart-open t)
