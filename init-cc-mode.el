(defun ext/cc-mode-settings ()

  (setq c-default-style '((java-mode . "java")
			  (awk-mode . "awk")
			  (other . "linux")))

  (setq c-basic-offset 6))

(add-hook 'c-mode-common-hook 'ext/cc-mode-settings)

;;irony-mode
(require-package 'company)
(require-package 'irony)
(require-package 'company-irony)

(defun ext/use-company-instead ()
  (auto-complete-mode 0)
  (company-mode)
  (irony-mode))

(add-hook 'c-mode-hook 'ext/use-company-instead)
(add-hook 'c++-mode-hook 'ext/use-company-instead)

(eval-after-load 'company
  '(progn
     (setq company-idle-delay 0.2)
     (setq company-minimum-prefix-length 2)
     (setq company-backends (delete 'company-eclim company-backends))
     (setq company-backends (delete 'company-bbdb company-backends))
     (setq company-backends (delete 'company-oddmuse company-backends))
     (setq company-backends (delete 'company-xcode company-backends))
     (setq company-backends (delete 'company-clang company-backends))
     (setq company-backends (delete 'company-semantic company-backends))))

(eval-after-load 'irony
  `(progn
     (add-to-list 'irony-additional-clang-options "-I/usr/include")
     (add-to-list 'company-backends 'company-irony)))

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(provide 'init-cc-mode)
