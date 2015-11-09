(use-package flycheck
  :quelpa
  
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (setq flycheck-standard-error-navigation nil)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp))
  )

(provide 'init-flycheck)
