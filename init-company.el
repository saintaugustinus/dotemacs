(require-package 'company)
(add-hook 'after-init-hook 'global-company-mode)

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

(provide 'init-company)
