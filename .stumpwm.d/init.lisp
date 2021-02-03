;;; init.lisp

(in-package :stumpwm)

(defvar battery-status-command-text "upower -i $(upower -e | tail -n2 | head -n1) | grep 'state:\\|percentage:' | sed -e 's/^[[:space:]]*//' | tr -s '[:blank:]' | awk '{gsub(\"state: \",\"\"); gsub(\"percentage\",\"Battery\"); print $0 | \"tail -n2 | tac\"}' | tr -s '\\\n' ' '")

(defun battery-status ()
  (eval (run-shell-command battery-status-command-text t)))

(defun date-status ()
  (eval (run-shell-command "date \"+%h%_d, %_H:%M:%S\"" t)))

(defun mode-line-format()
  (concatenate 'string (battery-status) "|" (date-status)))

(setf *window-format* "%n%s(%5c)%10t|")

(setf *mode-line-border-width* 3)
(setf *mode-line-pad-x* 5)
(setf *mode-line-pad-y* 5)

(setf *mode-line-border-color* "DarkTurquoise")
(setf *mode-line-background-color* "#242424")
(setf *mode-line-foreground-color* "DarkSeaGreen")

(setf *screen-mode-line-format* (list
				 '(:eval (mode-line-format))
				 "%v"))
;; The following toggles visibility of mode line, so it should be invoked in the very last
;; after all configuration has been setup already.
(if (not (head-mode-line (current-head)))
    (toggle-mode-line (current-screen)
                      (current-head)))
