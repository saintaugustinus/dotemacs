(use-package magit
  :quelpa
  
  :init
  (setq magit-push-always-verify nil
        git-commit-finish-query-functions nil
        magit-save-some-buffers nil
        magit-set-upstream-on-push t
        magit-diff-refine-hunk t
        )
  )

(use-package git-gutter
  :quelpa

  :diminish git-gutter-mode
  
  :config
  (add-hook 'after-init-hook #'global-git-gutter-mode)
  )

(provide 'init-git)
