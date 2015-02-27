(require-package 'company)
(require-package 'company-quickhelp)
(require-package 'company-statistics)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'company-mode-hook 'company-quickhelp-mode)

(eval-after-load "company"
  '(progn
     (setq company-idle-delay 0.2)
     (setq company-minimum-prefix-length 2)
     (setq company-show-numbers t)
     (setq company-require-match nil)
     (setq company-backends (delete 'company-eclim company-backends))
     (setq company-backends (delete 'company-bbdb company-backends))
     (setq company-backends (delete 'company-oddmuse company-backends))
     (setq company-backends (delete 'company-xcode company-backends))
     (setq company-backends (delete 'company-clang company-backends))
     (setq company-backends (delete 'company-semantic company-backends))))

(global-set-key (kbd "C-c y") 'company-yasnippet)

(provide 'init-company)
