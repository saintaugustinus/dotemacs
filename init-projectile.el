(require-package 'projectile)
(require-package 'helm-projectile)

(add-hook 'after-init-hook #'projectile-global-mode)
(setq projectile-enable-caching t)

(helm-projectile-on)
(global-set-key (kbd "C-x c h") 'helm-projectile)

(evil-leader/set-key
  "pf" 'helm-projectile-find-file
  "ph" 'helm-projectile)

(provide 'init-projectile)
