;; Settings
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
; (menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("gnu"       . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (package-initialize)
; (package-refresh-contents)

(org-babel-load-file (expand-file-name "~/.emacs.d/settings.org"))
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
(use-package evil 
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

;; Enable company in all buffers
;; (add-hook 'after-init-hook 'global-company-mode)

;; All the icons
(use-package all-the-icons 
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

; (use-package gruvbox-theme 
;   :init
;   ;; Disable old theme before loading
;   (defadvice load-theme
;       (before theme-dont-propagate activate)
;     (mapc #'disable-theme custom-enabled-themes))
;   :config (load-theme 'gruvbox-dark-medium t)
;   )

(require 'powerline)
(powerline-vim-theme)
(require 'airline-themes)
(load-theme 'airline-onedark t)

; (add-to-list 'default-frame-alist '(font .   "Source Code Pro 11" ))
; (set-fontset-font "fontset-default" nil
;                   (font-spec :size 15 :name "Dejavu Sans Mono"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-enabled-themes '(gruvbox-dark-medium))
 '(custom-safe-themes
   '("7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" default))
 '(package-selected-packages
   '(org-bullets ido org powerline use-package tuareg smart-mode-line projectile gruvbox-theme evil company all-the-icons airline-themes))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#282828")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
