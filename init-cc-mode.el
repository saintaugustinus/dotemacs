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

(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)

(eval-after-load "irony"
  '(progn
     (add-to-list 'company-backends 'company-irony)
     (add-to-list 'company-backends 'company-c-headers)))

(add-hook 'irony-mode-hook 'irony-eldoc)

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(add-to-list 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(provide 'init-cc-mode)
