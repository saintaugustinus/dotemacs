(defun ext/cc-mode-settings ()

  (setq c-default-style '((java-mode . "java")
			  (awk-mode . "awk")
			  (other . "linux")))

  (setq c-basic-offset 4))

(add-hook 'c-mode-common-hook 'ext/cc-mode-settings)

;;irony-mode
(require-package 'irony)
(require-package 'company-irony)
(require-package 'irony-eldoc)
(require-package 'company-c-headers)
(require-package 'flycheck-irony)

(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)

(eval-after-load "irony"
  '(progn
     (add-to-list 'company-backends 'company-irony)
     (add-to-list 'company-backends 'company-c-headers)
     (add-hook 'flycheck-mode-hook 'flycheck-irony-setup)))

(add-hook 'irony-mode-hook 'irony-eldoc)

;; (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(defun ext/irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'ext/irony-mode-hook)
(add-to-list 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(provide 'init-cc-mode)
