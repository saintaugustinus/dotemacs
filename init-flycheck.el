(use-package flycheck
  :commands global-flycheck-mode
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (evil-leader/set-key
    "ec" 'flycheck-clear
    "en" 'flycheck-next-error
    "ep" 'flycheck-previous-error
    "el" 'flycheck-list-errors)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp))
  )

(provide 'init-flycheck)
