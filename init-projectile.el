(use-package projectile
  :init
  (setq projectile-enable-caching t
        projectile-completion-system 'helm)
  :config
  (projectile-global-mode)
  )

(use-package helm-projectile
  :commands (helm-projectile-switch-to-buffer
             helm-projectile-find-dir
             helm-projectile-dired-find-dir
             helm-projectile-recentf
             helm-projectile-find-file
             helm-projectile-find-other-file
             helm-projectile-grep
             helm-projectile
             helm-projectile-switch-project)
  :defer t
  :init
  (evil-leader/set-key
    "pa"  'helm-projectile-find-other-file
    "pb"  'helm-projectile-switch-to-buffer
    "pd"  'helm-projectile-find-dir
    "pf"  'helm-projectile-find-file
    "ph"  'helm-projectile
    "pp"  'helm-projectile-switch-project
    "pr"  'helm-projectile-recentf
    "pv"  'projectile-vc
    "sgp" 'helm-projectile-grep)
  )

(provide 'init-projectile)
