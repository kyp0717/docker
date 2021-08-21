;;; Geneneral Setting
;;;; esc to quit everthing
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
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
(defcustom display-line-numbers-exempt-modes '(vterm-mode eshell-mode shell-mode term-mode ansi-term-mode racket-repl-mode)
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

(global-display-line-numbers-mode t)
;;;; start up msg repress
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1)

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
;; (setq projectile-project-search-path '("~/projects/" "~/work/" "~/tmp"))
(setq projectile-project-search-path '("~/tmp"))
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;;; move buffer to frame
(defun ky-switch-current-window-into-frame ()
  (interactive)
  (let ((buffer (current-buffer)))
    (unless (one-window-p)
      (delete-window))
    (display-buffer-pop-up-frame buffer nil)))
;;;; display “lambda” as “λ”
(global-prettify-symbols-mode 1)
(setq prettify-symbols-alist '(("lambda" . 955)))
;;;; enable drag and drop
(setq mouse-drag-and-drop-region t)
(setq mouse-drag-and-drop-region-cut-when-buffers-differ t)
;;;; remap buffer, window, frame
(global-set-key (kbd "s-k") 'kill-buffer)
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-3") 'split-window-right)
(global-set-key (kbd "s-2") 'split-window-below)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "s-o") 'other-window)
;;;; highlighting and region
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)
;; (set-face-attribute 'region nil :background "#666" :foreground "#ffffff")
(setq my-black "#1b1b1e")
(set-face-attribute 'region nil :background "#ffd700" :foreground my-black)
;;;; increase minibuffer font size
;; (defun increase-minibuffer-font-size ()
;;        (set (make-local-variable 'face-remapping-alist)
;;           '((default :height 1.35))))

;; (add-hook 'minibuffer-setup-hook 'increase-minibuffer-font-size)

;;; Outline Mode
;;;; main

(use-package ky-outline-minor-faces
  :after outline
  :config (add-hook 'outline-minor-mode-hook
                    'outline-minor-faces-add-font-lock-keywords))

;;Enables outline-minor-mode for *ALL* programming buffers
(add-hook 'prog-mode-hook 'outline-minor-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
;; (add-hook 'outline-minor-mode-hook 'ky-outline-minor-faces-add-font-lock-keywords)

;; ;; (setq my-black "#1b1b1e")
;; ;; (custom-theme-set-faces
;; ;;  'modus-vivendi
;; ;;  `(outline-1 ((t (:height 1.15 :background "#0000cd" ))))
;; ;;  `(outline-2 ((t (:height 1.05 :foreground "#b58900" :weight bold)))))
;; ;; (custom-theme-set-faces
;; ;;  'modus-vivendi
;; ;;  `(outline-1 ((t (:height 1.25 :background "#268bd2"
;; ;;                           :foreground ,my-black :weight bold))))
;; ;;  `(outline-2 ((t (:height 1.15 :background "#2aa198"
;; ;;                           :foreground ,my-black :weight bold))))
;; ;;  `(outline-3 ((t (:height 1.05 :background "#b58900"
;; ;;                           :foreground ,my-black :weight bold)))))


;;;; experiment1
;; (defun -add-font-lock-kwds (FONT-LOCK-ALIST)
;;   (font-lock-add-keywords
;;    nil (--map (-let (((rgx uni-point) it))
;;                 `(,rgx (0 (progn
;;                             (compose-region (match-beginning 1) (match-end 1)
;;                                             ,(concat "\t" (list uni-point)))
;;                             nil))))
;;               FONT-LOCK-ALIST)))

;; (defmacro add-font-locks (FONT-LOCK-HOOKS-ALIST)
;;   `(--each ,FONT-LOCK-HOOKS-ALIST
;;      (-let (((font-locks . mode-hooks) it))
;;        (--each mode-hooks
;;          (add-hook it (-partial '-add-font-lock-kwds
;;                                 (symbol-value font-locks)))))))

;; (defconst emacs-outlines-font-lock-alist
;;   ;; Outlines
;;   '(("\\(^;;;\\) "          ?■)
;;     ("\\(^;;;;\\) "         ?○)
;;     ("\\(^;;;;;\\) "        ?✸)
;;     ("\\(^;;;;;;\\) "       ?✿)))



;;;; experiment2
;; not working
;; (require 'dash)
;; (require 'outshine)
;; (add-hook 'prog-mode-hook 'outline-minor-mode)
;; (add-hook 'prog-mode-hook 'hs-minor-mode)
;; (add-hook 'emacs-lisp-mode-hook 'outshine-mode)
;; (add-hook 'racket-mode-hook 'outshine-mode)
;; (add-hook 'docker-mode-hook 'outshine-mode)

;; Narrowing now works within the headline rather than requiring to be on it
;; (advice-add 'outshine-narrow-to-subtree :before
;;             (lambda (&rest args) (unless (outline-on-heading-p t)
;;                                    (outline-previous-visible-heading 1))))



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
;; Enable hybrid mode (emacs binding in insert state)
;;;; preset evil variable
(setq evil-disable-insert-state-bindings t)
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(setq evil-emacs-state-cursor '("red" box)
      evil-normal-state-cursor '("green" box)
      evil-visual-state-cursor '("orange" box)
      evil-insert-state-cursor '("yellow" bar)
      evil-replace-state-cursor '("red" bar)
      evil-operator-state-cursor '("red" hollow)
      evil-cross-lines t)
;;;; evil main
(require 'evil)
(evil-mode 1)
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

;; (setq evil-collection-outline-bind-tab-p t)
;; (setq evil-collection-outline-enable-in-minor-mode-p t)
;; (setq outline-blank-line t)
;; (setq evil-collection-mode-list nil)
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
    "zc" 'outline-hide-sublevels ; Hide all bodies, Emacs has "C-c C-t".
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
;;;; outline evil
;; (let ((kmap outline-minor-mode-map))
;;   (define-key kmap (kbd "M-RET") 'outshine-insert-heading)
;;   (define-key kmap (kbd "<backtab>") 'outshine-cycle-buffer)

;;   ;; Evil outline navigation keybindings
;;   (evil-define-key '(normal visual motion) kmap
;;     "gh" 'outline-up-heading
;;     "gj" 'outline-forward-same-level
;;     "gk" 'outline-backward-same-level
;;     "gl" 'outline-next-visible-heading
;;     "gu" 'outline-previous-visible-heading))


;;; Auto complete
;; enable globally    
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "<C-tab>") 'company-complete)

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

;; backtab is equivalent to Shift+Tab
;; (global-set-key [backtab] 'tab-indent-or-complete)

;;; Orderless
(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless)))

(selectrum-mode +1)
;; (selectrum-prescient-mode +1)


;;; Consult
;; Example configuration for Consult
;; s key is "super key" which is also the window key
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c h" . consult-history)
         ("C-c m" . consult-mode-command)
         ("C-c b" . consult-bookmark)
         ("C-c k" . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ("s-y" . consult-yank-pop)                ;; orig. yank-pop
         ("<help> a" . consult-apropos)            ;; orig. apropos-command
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-project-imenu)
         ;; M-s bindings (search-map)
         ("s-f" . consult-find)
         ("M-s L" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("s-r" . consult-ripgrep)
         ("s-l" . consult-line)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("s-e" . consult-isearch)
         :map isearch-mode-map
         ("M-e" . consult-isearch)                 ;; orig. isearch-edit-string
         ("s-e" . consult-isearch)               ;; orig. isearch-edit-string
         ("s-l" . consult-line))                 ;; needed by consult-line to detect isearch

  ;; Enable automatic preview at point in the *Completions* buffer.
  ;; This is relevant when you use the default completion UI,
  ;; and not necessary for Vertico, Selectrum, etc.
  :hook (completion-list-mode . consult-preview-at-point-mode)

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

  ;; Optionally replace `completing-read-multiple' with an enhanced version.
  (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key (kbd "M-."))
  ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-file consult--source-project-file consult--source-bookmark
   :preview-key (kbd "M-."))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; Optionally configure a function which returns the project root directory.
  ;; There are multiple reasonable alternatives to chose from.
  ;;;; 1. project.el (project-roots)
  (setq consult-project-root-function
        (lambda ()
          (when-let (project (project-current))
            (car (project-roots project)))))
  ;;;; 2. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-root-function #'projectile-project-root)
  ;;;; 3. vc.el (vc-root-dir)
  ;; (setq consult-project-root-function #'vc-root-dir)
  ;;;; 4. locate-dominating-file
  ;; (setq consult-project-root-function (lambda () (locate-dominating-file "." ".git")))
)

;;; Paranthesis Setup 
;;;; main racket setup
;;(show-paren-mode 1)
(setq show-paren-delay 0)
;; (require 'racket-mode)


(use-package rainbow-delimiters
             :ensure t
             :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; Allows moving through wrapped lines as they appear
;; (add-hook 'racket-mode-hook #'racket-unicode-input-method-enable)
;; (add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable)
;; (define-key racket-mode-map (kbd "S-<return>") 'racket-send-definition)
;; (define-key racket-mode-map (kbd "C-S-<return>") 'racket-send-region)
;; (define-key racket-mode-map (kbd "C-\\") 'racket-insert-lambda)


;;; Golang Setup

(require 'go-mode)


;;; Embark

(require 'marginalia)
(marginalia-mode)

(advice-add #'marginalia-cycle :after
	    (lambda () (when (bound-and-true-p selectru-mode)
			     (selectrum-exhibit 'keep-selected))))

;;(require 'embark)
;;(bind-key "C-S-a" 'embark-act)

(require 'embark-consult)
(add-hook 'embark-collect-mode 'embark-consult-preview-minor-mode)





;;; SQL
;; (require 'sql)

;;; modeline config
(require 'doom-modeline)
(doom-modeline-mode 1)

;;; vterm
;; (require 'vterm)

;;; perspective
;; (require 'perspective)
;; (persp-mode 1)
(setq persp-initial-frame-name "startup")
(use-package perspective
  :bind (("C-x k" . persp-kill-buffer*))
  :init (persp-mode))

;; (persp-switch "config")
;; (persp-switch "paca")

(global-set-key (kbd "M-p l") 'persp-switch-to-buffer*)
(global-set-key (kbd "M-p p") 'persp-switch)
(global-set-key (kbd "M-p =") 'persp-add-buffer)
(global-set-key (kbd "M-p s") 'persp-set-buffer)
(global-set-key (kbd "M-p f") 'persp-next)
(global-set-key (kbd "M-p b") 'persp-prev)

;;; centaur tab

(setq centaur-tabs-set-icons t)
(setq centaur-tabs-gray-out-icons 'buffer)
(setq centaur-tabs-set-bar 'under)
;; Note: If you're not using Spacmeacs, in order for the underline to display
;; correctly you must add the following line:
(setq x-underline-at-descent-line t)
;; (setq centaur-tabs-set-modified-marker t)
(setq centaur-tabs-modified-marker "*")
;; (setq centaur-tabs-close-button "X")
(setq centaur-tabs-height 32)


(require 'centaur-tabs)
(centaur-tabs-mode t)
(global-set-key (kbd "S-<left>")  'centaur-tabs-backward)
(global-set-key (kbd "S-<right>") 'centaur-tabs-forward)

(defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (string-prefix-p "*epc" name)
     (string-prefix-p "*helm" name)
     (string-prefix-p "*Helm" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*lsp" name)
     (string-prefix-p "*company" name)
     (string-prefix-p "*Flycheck" name)
     (string-prefix-p "*tramp" name)
     (string-prefix-p " *Mini" name)
     (string-prefix-p "*help" name)
     (string-prefix-p "*straight" name)
     (string-prefix-p " *temp" name)
     (string-prefix-p "*Help" name)
     (string-prefix-p "*mybuf" name)
     (string-prefix-p "*Warnings" name)
     (string-prefix-p "*Async-native" name)
     (string-prefix-p "*Native-compile" name)
     (string-prefix-p "*Messages" name)

     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
	  (not (file-name-extension name)))
     )))

(defun centaur-tabs-buffer-groups ()
  "`centaur-tabs-buffer-groups' control buffers' group rules.

    Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
    All buffer name start with * will group to \"Emacs\".
    Other buffer group by `centaur-tabs-get-group-name' with project name."
  (list
   (cond
    ((or (string-equal "*" (substring (buffer-name) 0 1))
	 (memq major-mode '(magit-process-mode
			    magit-status-mode
			    magit-diff-mode
			    magit-log-mode
			    magit-file-mode
			    magit-blob-mode
			    magit-blame-mode
			    )))
     "Emacs")
    ;; ((derived-mode-p 'prog-mode)
    ;;  "Editing")

    ((derived-mode-p 'racket-mode)
     "Racket")
    ((derived-mode-p 'python-mode)
     "Python")
    ((derived-mode-p 'dired-mode)
     "Dired")
    ((memq major-mode '(helpful-mode
			help-mode))
     "Help")
    ((memq major-mode '(org-mode
			org-agenda-clockreport-mode
			org-src-mode
			org-agenda-mode
			org-beamer-mode
			org-indent-mode
			org-bullets-mode
			org-cdlatex-mode
			org-agenda-log-mode
			diary-mode))
     "OrgMode")
    (t
     (centaur-tabs-get-group-name (current-buffer))))))

;;; which key
(require 'which-key)

;; Allow C-h to trigger which-key before it is done automatically
(setq which-key-show-early-on-C-h t)
(setq which-key-popup-type 'minibuffer)

;; make sure which-key doesn't show normally but refreshes quickly after it is
;; triggered.
(setq which-key-idle-delay 10000)
(setq which-key-idle-secondary-delay 0.05)
(which-key-mode)

(which-key-setup-minibuffer)
