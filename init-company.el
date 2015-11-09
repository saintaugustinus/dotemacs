(use-package company
  :quelpa

  :diminish company-mode " ⓐ"
  
  :init
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-show-numbers t
        company-require-match nil)

  :config
  (add-hook 'after-init-hook 'global-company-mode)

  (add-to-list 'company-backends 'company-ispell t)
  (add-to-list 'company-backends 'company-files t)
  (add-to-list 'company-begin-commands 'outshine-self-insert-command)

  (setq company-backends (delete 'company-eclim company-backends)
        company-backends (delete 'company-bbdb company-backends)
        company-backends (delete 'company-oddmuse company-backends)
        company-backends (delete 'company-xcode company-backends)
        company-backends (delete 'company-clang company-backends)
        company-backends (delete 'company-semantic company-backends)
        )

  (use-package company-quickhelp
    :quelpa

    :config
    (company-quickhelp-mode t)
    )
  
  (use-package company-statistics
    :pin gnu
    
    :config
    (company-statistics-mode t))
  )

(provide 'init-company)
