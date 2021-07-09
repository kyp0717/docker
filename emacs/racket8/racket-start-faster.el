(defun racket-mode-start-faster ()
  "Compile Racket Mode's .rkt files for faster startup.

Racket Mode is implemented as an Emacs Lisp \"front end\" that
talks to a Racket process \"back end\". Because Racket Mode is
delivered as an Emacs package instead of a Racket package,
installing it does not do the `raco setup` that is normally done
for Racket packages.

This command will do a `raco make` of Racket Mode's .rkt files,
creating bytecode files in `compiled/` subdirectories. As a
result, when a command must start the Racket process, it will
start somewhat faster.

On many computers, the resulting speed up is negligible, and
might not be worth the complication.

If you run this command, ever, you will need to run it again
after:

- Installing an updated version of Racket Mode. Otherwise, you
  might lose some of the speed-up.

- Installing a new version of Racket and/or changing the value of
  the variable `racket-program'. Otherwise, you might get an
  error message due to the bytecode being different versions.

`racket-mode-start-slower'. "
  (interactive)
  (let* ((racket  (executable-find racket-program))
         (rkts0   (expand-file-name "*.rkt" racket--rkt-source-dir) )
         (rkts1   (expand-file-name "commands/*.rkt" racket--rkt-source-dir))
         (command (format "%s -l raco make -v %s %s"
                          (shell-quote-wildcard-pattern racket)
                          (shell-quote-wildcard-pattern rkts0)
                          (shell-quote-wildcard-pattern rkts1)))
         (prompt (format "Do `%s` " command)))
    (when (y-or-n-p prompt)
      (racket-stop-back-end)
      (async-shell-command command))))
