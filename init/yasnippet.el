;--------YASNIPPET-------- 
(add-to-list 'load-path
             "~/.emacs.d/snippets/latex")
(use-package yasnippet)
(yas-reload-all)
(yas-global-mode 1)
(require 'popup) ; use popup menu for yas-choose-value
; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

(setq yas-prompt-functions '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))
(setq yas/indent-line 'auto)
(setq yas-also-auto-indent-first-line t)
(require 'warnings)
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))

;; ;the next three lines are for using yasnippet in the minibuffer
;; (add-hook 'minibuffer-setup-hook 'yas-minor-mode)
;; (yas--define-parents 'minibuffer-inactive-mode '(org-mode))
;; (define-key minibuffer-local-map (kbd "C-c y") 'yas-maybe-expand)
