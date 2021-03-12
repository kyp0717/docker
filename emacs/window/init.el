
(add-to-list 'load-path' "~/.emacs/prot-lisp/")
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

