

;;; Import the package
(require 'outline-magic)

;;; Outline-minor-mode key map
 (define-prefix-command 'cm-map nil "Outline-")

;;; Outline HIDE
 (define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
 (define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines)
 (define-key cm-map "o" 'hide-other)        ; Hide other branches
 (define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
 (define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
 (define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries

;;; Outline SHOW
 (define-key cm-map "a" 'show-all)          ; Show (expand) everything
 (define-key cm-map "e" 'show-entry)        ; Show this heading's body
 (define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
 (define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
 (define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below

;;; Outline MOVE
 (define-key cm-map "u" 'outline-up-heading)                ; Up
 (define-key cm-map "n" 'outline-next-visible-heading)      ; Next
 (define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
 (define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
 (define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
 (global-set-key "\M-o" cm-map)

;;; Custom Test  
;;;; depracated code
(provide 'ky-outline)
(require 'outshine)
(add-hook 'emacs-lisp-mode-hook 'outshine-mode)
(defvar outline-minor-mode-prefix "\s-o")

;;;;
(set-selective-display nil)

;;; Look into bicycle (tarsius)
(use-package bicycle
  :after outline
  :bind (:map outline-minor-mode-map
              ([C-tab] . bicycle-cycle)
              ([s-tab] . bicycle-cycle-global)))

(use-package prog-mode
  :config
  (add-hook 'prog-mode-hook 'outline-minor-mode)
  (add-hook 'prog-mode-hook 'hs-minor-mode))

;;; imenu setup
(setq imenu-auto-rescan-maxout 10000000) ; set max bytes to 10M
(setq imenu-auto-rescan t)
;; (imenu-default-create-index-function)
(buffer-substring 7 13)
(line-number-at-pos nil t)
