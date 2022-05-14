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
(package-install 'evil )
(package-install 'use-package)
(package-install 'beacon)
(package-install 'doom-modeline)
(package-install 'spaceline-all-the-icons)
(package-install 'org)
(package-install 'projectile)
(package-install 'org-bullets)
(package-install 'org-superstar)
(package-install 'evil-org)
(package-install 'smartparens)
(package-install 'paredit)
(package-install 'evil-paredit)
(package-install 'evil-commentary)
(package-install 'evil-collection)
(package-install 'fzf)
(package-install 'auto-complete)
(package-install 'company)
(package-install 'windresize)
(package-install 'eval-in-repl)
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
(package-install 'bicycle)
(package-install 'selectrum)
(package-install 'docker)
(package-install 'dockerfile-mode)
;; (package-install 'outline-minor-faces)
(package-install 'undo-tree)
(package-install 'rainbow-delimiters)
(package-install 'buffer-move)
(package-install 'magit)
(package-install 'sql)
(package-install 'dash)
;; (package-install 'outshine)
;; (package-install 'outorg)
(package-install 'outline-magic)
(package-install 'rainbow-mode)
(package-install 'all-the-icons)
(package-install 'perspective)
(package-install 'vterm)
(package-install 'docker-tramp)
(package-install 'centaur-tabs)
(package-install 'go-mode)
(all-the-icons-install-fonts t)