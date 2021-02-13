
;; Settings
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(require 'package)
; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
; (add-to-list 'package-archives '("gnu"       . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)  ; Unless it is already installed
  (package-refresh-contents)                ; Update packages archive
  (package-install 'use-package))           ; Install latest use-package
(require 'use-package)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
;; Evil
(use-package evil :ensure t
  :init (evil-mode 1)
  :config
  (setq evil-emacs-state-cursor '("red" box)
        evil-normal-state-cursor '("green" box)
        evil-visual-state-cursor '("orange" box)
        evil-insert-state-cursor '("blue" bar)
        evil-replace-state-cursor '("red" bar)
        evil-operator-state-cursor '("red" hollow)

        evil-cross-lines t)
  )


;; All the icons
(use-package all-the-icons :ensure t
  :config (setq inhibit-compacting-font-caches t))
; (use-package all-the-icons)

; (use-package doom-modeline
;     :init (doom-modeline-mode 1)
;     :custom ((doom-modeline-height 15)))

; (require 'powerline)
; (powerline-vim-theme)
; (use-package doom-themes
;     :init (load-theme 'doom-dracula t))

;; Theme settings
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(use-package gruvbox-theme :ensure t
  :init
  ;; Disable old theme before loading
  (defadvice load-theme
      (before theme-dont-propagate activate)
    (mapc #'disable-theme custom-enabled-themes))
  :config (load-theme 'gruvbox-dark-medium t)
  )

; (add-to-list 'default-frame-alist '(font .   "Source Code Pro 11" ))
; (set-fontset-font "fontset-default" nil
;                   (font-spec :size 15 :name "Dejavu Sans Mono"))

(setq sml/name-width 20)
(setq sml/theme 'dark)
(require 'smart-mode-line)
(sml/setup)
