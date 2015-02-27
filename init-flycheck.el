(require-package 'flycheck)

;; (add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load "flycheck"
  '(progn
     (setq flycheck-standard-error-navigation nil)
     (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp))))

(provide 'init-flycheck)
