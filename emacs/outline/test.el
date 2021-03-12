
;;;; head1
(defun f1 ()
  (message "hello"))

;;;; head12
(defun f2 ()
  (message "goodbye"))


;;;; pulse
(require 'pulse)

(defun pulse-line (&rest _)
  "Pulse the current line."
  (pulse-momentary-highlight-one-line (point)))

(dolist (command '(scroll-up-command scroll-down-command
		   recenter-top-bottom other-window))
  (advice-add command :after #'pulse-line))

(scroll-up-command 4)
(set-selective-display 2)
