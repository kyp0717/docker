;; source for these config ...
;; https://github.com/sho-87/dotfiles/blob/master/emacs/init.el


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)


;; Download Evil
; (unless (package-installed-p 'evil)
; (package-install 'evil ))
(package-install 'use-package)
; (package-install 'mood-line)
; (package-install 'counsel)
; (package-install 'command-log-mode)
; (package-install 'spaceline)
; (package-install 'beacon)
; (package-install 'doom-modeline)
; (package-install 'spaceline-all-the-icons)
; (package-install 'ivy)
; (package-install 'swiper)
; (package-install 'smart-mode-line)
; (package-install 'powerline)
(package-install 'org)
; (package-install 'ido)
; (package-install 'tuareg)
; (package-install 'projectile)
; (package-install 'company)
(package-install 'org-bullets)
(package-install 'org-superstar)
; (package-install 'evil-org)
; (package-install 'smartparens)
; (package-install 'evil-commentary)
; (package-install 'evil-collection)
; (package-install 'fzf)
; (package-install 'merlin)
; (package-install 'auto-complete)
; (package-install 'windresize)
; (package-install 'eval-in-repl)
; (package-install 'ivy-posframe)
; (package-install 'ivy-rich)
; (package-install 'ivy-prescient)
(package-install 'expand-region)
(package-install 'embark)
(package-install 'marginalia)
(package-install 'consult)
(package-install 'which-key)
(package-install 'async)
(package-install 'orderless)
(package-install 'embark-consult)
(package-install 'visual-regexp)
(package-install 'wgrep)
(package-install 'dired-subtree)
(package-install 'trashed)
(package-install 'scratch)
