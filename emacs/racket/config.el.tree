
;;; Geneneral Setting

;;;; Tree-sitter
(add-to-list 'load-path "/home/emacs/.emacs.d/emacs-tree-sitter/lisp")
(add-to-list 'load-path "/home/emacs/.emacs.d/emacs-tree-sitter/langs")
(add-to-list 'load-path "~/.emacs.d/emacs-tree-sitter/core")
(require 'tree-sitter)
(require 'tree-sitter-hl)
(require 'tree-sitter-langs)
(require 'tree-sitter-debug)
(require 'tree-sitter-query)


;;;; modus theme
(add-to-list 'load-path "~/.emacs.d/modus-themes")
(add-to-list 'load-path "~/.emacs.d/custom")
(require 'modus-themes)
;; Load the theme files before enabling a theme (else you get an error).
(modus-themes-load-themes)
(modus-themes-load-vivendi)             ; Dark theme

;; Theme settings
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; (use-package spaceline :ensure t
;;   :config
;;   (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

;; (use-package spaceline-config :ensure spaceline
;;   :config
;;   (spaceline-helm-mode 1)
;;   (spaceline-emacs-theme))

;;;; expand region
(require 'expand-region)
(global-set-key (kbd "s-=") 'er/expand-region)
;;;; font size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "M-=") 'text-scale-decrease)
            
;;;; line num
(require 'display-line-numbers)
(defcustom display-line-numbers-exempt-modes '(vterm-mode eshell-mode shell-mode term-mode ansi-term-mode)
  "Major modes on which to disable the linum mode, exempts them from global requirement"
  :group 'display-line-numbers
  :type 'list
  :version "green")

(defun display-line-numbers--turn-on ()
  "turn on line numbers but excempting certain majore modes defined in `display-line-numbers-exempt-modes'"
  (if (and
       (not (member major-mode display-line-numbers-exempt-modes))
       (not (minibufferp)))
      (display-line-numbers-mode)))

(global-display-line-numbers-mode)

;;;; start up msg repress
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq inhibit-startup-screen t)  
(setq make-backup-files nil) ; stop creating ~ files
(setq warning-minimum-level :error)

;;;; line effects
(global-hl-line-mode t) ;; This highlights the current line in the buffer
(use-package beacon ;; This applies a beacon effect to the highlighted line
  :ensure t
  :config
  (beacon-mode 1))
; (global-hl-mode +1)
;;;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;;; projectile 
(require 'projectile)
(projectile-mode +1)

;;; Outline Mode
;; (use-package bicycle
;;   :after outline
;;   :bind (:map outline-minor-mode-map
;; 	      ;; ("<C-tab>" . bicycle-cycle)
;; 	      ("<C-tab>" . bicycle-cycle-global)))


(use-package prog-mode
  :config
 (add-hook 'prog-mode-hook 'outline-minor-mode)
 (add-hook 'prog-mode-hook 'hs-minor-mode))

(use-package outline-minor-faces
  :after outline
  :config (add-hook 'outline-minor-mode-hook
                    'outline-minor-faces-add-font-lock-keywords))

;;;; outline within dockerfile
(add-hook 'dockerfile-mode-hook
  (lambda ()
    (setq outline-regexp "###\\(#*\\)")))
;;";;;\\(;* [^]\\|###autoload\\)\\|("
; note that the "^" is *implicit* at the beginning of the regexp



;;; Evil Mode
;;;; evil main deprecated
;; (use-package evil 
;;   :init
;;   (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
;;   (setq evil-want-keybinding nil)
;;   :config
;;   (evil-mode 1)
;;   (setq evil-emacs-state-cursor '("red" box)
;; 	evil-normal-state-cursor '("green" box)
;; 	evil-visual-state-cursor '("orange" box)
;; 	evil-insert-state-cursor '("yellow" bar)
;; 	evil-replace-state-cursor '("red" bar)
;; 	evil-operator-state-cursor '("red" hollow)
;; 	evil-cross-lines t)
;;   )
;;;; evil main
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(require 'evil)

(evil-mode 1)

(setq evil-emacs-state-cursor '("red" box)
      evil-normal-state-cursor '("green" box)
      evil-visual-state-cursor '("orange" box)
      evil-insert-state-cursor '("yellow" bar)
      evil-replace-state-cursor '("red" bar)
      evil-operator-state-cursor '("red" hollow)
      evil-cross-lines t)
(define-key evil-normal-state-map "=" 'er/expand-region)
(define-key evil-normal-state-map (kbd "C-r") 'undo-redo)

;;
;; (add-hook 'outline-minor-mode-hook #'ky/outline-hide-all)
;; (add-hook 'outline-mode-hook 'ky/outline-hide-all)
;; (add-hook 'evil-collection-setup-hook #'ky/outline-hide-all)

;; (eval-after-load 'evil
;; (define-key outline-mode-map [C-tab] 'outline-hide-sublevels))
;;(global-set-key [C-tab] 'outline-hide-sublevels)


;;;; evil collection

;;(with-eval-after-load 'outline (evil-collection-outline-setup))

;; (defun ky/outline-hide-all ()
;;   (local-set-key (kbd "C-TAB") 'outline-hide-sublevel))


;; (setq evil-collection-outline-bind-tab-p t)
;; (setq evil-collection-outline-enable-in-minor-mode-p t)
;; (setq outline-blank-line t)
;; (setq evil-collection-mode-list nil)
;; (push 'ky-outline evil-collection-mode-list)
;; (when (require 'evil-collection nil t)
;;    (evil-collection-init 'outline))


(use-package evil-collection
;;   :bind (:map outline-minor-mode-map
;; 	    ([C-tab] . outline-hide-sublevels))
   :after evil
   ;; :ensure t
   :init
   (setq evil-collection-outline-bind-tab-p t)
   (setq evil-collection-outline-enable-in-minor-mode-p t)
   (setq outline-blank-line t)
   :config
   ;; (evil-collection-init 'outline)
   (evil-collection-init)
   )

(evil-collection-define-key 'normal 'outline-mode-map
    ;; folding
    ;; Evil default keys:
    ;; zO: Show recursively for current branch only.
    ;; za: Toggle first level like outline-toggle-children.
    ;; zc: Hide complete subtree.
    ;; "zc" 'outline-hide-sublevels ; Hide all bodies, Emacs has "C-c C-t".
    "z]" 'outline-hide-sublevels ; Hide all bodies, Emacs has "C-c C-t".
    ;; zm: Show only root notes.
    ;; zo: Show current node like "za".
    ;; zr: Show everything.
    ;; "ze" 'outline-hide-entry
    ;; "zE" 'outline-show-entry
    ;; "zl" 'outline-hide-leaves
    ;; "zb" 'outline-show-branches
    ;; "zo" 'outline-hide-other
    ) ; Hide all bodies, Emacs has "C-c C-t".

;; (add-hook 'outline-mode-hook
;; 	  (lambda () (local-set-key [C-tab] 'outline-hide-sublevels)))

;; (eval-after-load 'outline
;;     (define-key evil-normal-state-map [C-tab] 'outline-hide-sublevels))





;;;; comments
(require 'evil-commentary)
(evil-commentary-mode)
;; (evil-collection-init)




;;; Auto complete
;; enable globally    
(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0)
(setq company-dabbrev-downcase 0)
(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas-minor-mode)
	    (null (do-yas-expand)))
	(if (check-expansion)
	    (company-complete-common)
	  (indent-for-tab-command)))))

(global-set-key [backtab] 'tab-indent-or-complete)

;;; Orderless
(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless)))

(selectrum-mode +1)
;; (selectrum-prescient-mode +1)


;;; Consult
;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c h" . consult-history)
         ("C-c m" . consult-mode-command)
         ("C-c b" . consult-bookmark)
         ("C-c k" . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complet-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ("<help> a" . consult-apropos)            ;; orig. apropos-command
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-project-imenu)
         ;; M-s bindings (search-map)
         ("M-s f" . consult-find)
         ("M-s L" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch)
         ;; ("C-s" . consult-isearch)
         :map isearch-mode-map
         ("M-e" . consult-isearch)                 ;; orig. isearch-edit-string
         ;; ("C-s" . consult-isearch)                 ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch)               ;; orig. isearch-edit-string
         ("M-s l" . consult-line))                 ;; required by consult-line to detect isearch

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. Note that the preview-key can also be
  ;; configured on a per-command basis via `consult-config'. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key (kbd "M-p"))
  ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; Optionally make narrowing help available in the minibuffer.
  ;; Probably not needed if you are using which-key.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; Optionally configure a function which returns the project root directory.
  ;; There are multiple reasonable alternatives to chose from:
  ;; * projectile-project-root
  ;; * vc-root-dir
  ;; * project-roots
  ;; * locate-dominating-file
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-root-function #'projectile-project-root)
  ;; (setq consult-project-root-function
  ;;       (lambda ()
  ;;         (when-let (project (project-current))
  ;;           (car (project-roots project)))))
  ;; (setq consult-project-root-function #'vc-root-dir)
  ;; (setq consult-project-root-function
  ;;       (lambda () (locate-dominating-file "." ".git")))
)

;;; Lispy / Paredit
;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
  return.")
(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
	(save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

;; Using local-set-key in a mode-hook is a better idea.
;; (global-set-key (kbd "RET") 'electrify-return-if-match)

;; (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

;; hook lispyville to lispy (require lispy to run first)
;; (add-hook 'lispy-mode-hook #'lispyville-mode)
;; (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
;; (add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))
;; (add-hook 'clojure-mode-hook (lambda () (lispy-mode 1)))


;; running lispyville without lispy
(add-hook 'emacs-lisp-mode-hook #'lispyville-mode)
(add-hook 'lisp-mode-hook #'lispyville-mode)
(add-hook 'clojure-mode-hook #'lispyville-mode)



(with-eval-after-load 'lispyville
  (lispyville-set-key-theme
   '(operators
     c-w
     (escape insert)
     (additional-movement normal visual motion))))


;;; Embark

(require 'marginalia)
(marginalia-mode)

(advice-add #'marginalia-cycle :after
	    (lambda () (when (bound-and-true-p selectru-mode)
			     (selectrum-exhibit 'keep-selected))))

(require 'embark)
(bind-key "C-S-a" embark-act)

(require 'embark-consult)
(add-hook 'embark-collect-mode 'embark-consult-preview-minor-mode)


;;; Test space
;; (defun test ()
;;   (progn)
;;   :message "hello"
  




;; (with-current-buffer "Dockerfile"
;;   (setq outline-regexp "###\\(#*\\)"))
