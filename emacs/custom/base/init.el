(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("gnu"       . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)  ; Unless it is already installed
  (package-refresh-contents)                ; Update packages archive
  (package-install 'use-package))           ; Install latest use-package
(require 'use-package)

(org-babel-load-file (expand-file-name "~/.emacs.d/settings.org"))
;; Enable company in all buffers
;; (add-hook 'after-init-hook 'global-company-mode)

;; All the icons
(use-package all-the-icons 
  :config (setq inhibit-compacting-font-caches t))
; (use-package all-the-icons)

;;; DO NOT CHANGE BELOW --- emacs generated code -- DO NOT CHANGE
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
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(org-bullets ido org powerline use-package tuareg smart-mode-line projectile gruvbox-theme evil company all-the-icons airline-themes))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#282828")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
