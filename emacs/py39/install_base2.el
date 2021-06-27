;; source for these config ...
;; https://github.com/sho-87/dotfiles/blob/master/emacs/init.el


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(package-install 'exec-path-from-shell)
(package-install 'elpy )
(package-install 'pyenv-mode )
(package-install 'ein)  ;; integrate Ipython notebook instead of python repl
(package-install 'blacken) ;; blck formatting on save
(package-install 'py-autopep8) ;; run autopep8 on save
(package-install 'flycheck) ;; on the fly syntax checking

;; Download Evil
