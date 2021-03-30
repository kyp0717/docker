
;;; Geneneral Setting
;;;; modus theme
(add-to-list 'load-path "~/.emacs.d/modus-themes")
(require 'modus-themes)
;; Load the theme files before enabling a theme (else you get an error).
(modus-themes-load-themes)
(modus-themes-load-vivendi)             ; Dark theme

;; Theme settings
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(use-package spaceline :ensure t
  :config
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

(use-package spaceline-config :ensure spaceline
  :config
  (spaceline-helm-mode 1)
  (spaceline-emacs-theme))


;;;; expand region
(require 'expand-region)
(global-set-key (kbd "s-=") 'er/expand-region)
;;;; font size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
            
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

(global-hl-line-mode t) ;; This highlights the current line in the buffer

(use-package beacon ;; This applies a beacon effect to the highlighted line
  :ensure t
  :config
  (beacon-mode 1))
; (global-hl-mode +1)


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

;;; Evil Mode
(use-package evil 
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (setq evil-emacs-state-cursor '("red" box)
	evil-normal-state-cursor '("green" box)
	evil-visual-state-cursor '("orange" box)
	evil-insert-state-cursor '("yellow" bar)
	evil-replace-state-cursor '("red" bar)
	evil-operator-state-cursor '("red" hollow)
	evil-cross-lines t)
  )



(use-package evil-collection
  :after evil
  ;; :ensure t
  :init
  (setq evil-collection-outline-bind-tab-p t)
  (setq evil-collection-outline-enable-in-minor-mode-p t)
  (setq outline-blank-line t)
  :config
  (evil-collection-init 'outline)
  )

;;;; Comments
(require 'evil-commentary)
(evil-commentary-mode)
;; (evil-collection-init)




;;; Auto complete

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
	 ;; C-x bindings (ctl-x-map)
	 ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complet-command
	 ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
	 ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
	 ("C-x 5 b" . consult-buffer-other-frame))  ;; orig. switch-to-buffer-other-frame
	 ;; The :init configuration is always executed (Not lazy)
	 :init)

