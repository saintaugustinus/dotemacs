(use-package projectile
  :quelpa
  
  :init
  (setq projectile-enable-caching t)

  :config
  (add-hook 'after-init-hook #'projectile-global-mode)
  )

(use-package helm-projectile
  :quelpa
  
  :init
  (evil-leader/set-key
    "pf" 'helm-projectile-find-file
    "ph" 'helm-projectile)

  :config
  (helm-projectile-on)
  )

(provide 'init-projectile)
