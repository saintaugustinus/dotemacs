(defun ext/cc-mode-settings ()

  (setq c-default-style '((java-mode . "java")
			  (awk-mode . "awk")
			  (other . "linux")))

  (setq c-basic-offset 6))

(add-hook 'c-mode-common-hook 'ext/cc-mode-settings)

;;irony-mode
(require-package 'irony)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(require-package 'company-irony)
(eval-after-load 'irony
  `(progn
    (add-to-list 'irony-additional-clang-options "-I/usr/include")
    (add-to-list 'company-backends 'company-irony)))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(provide 'init-cc-mode)
