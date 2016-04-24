(use-package magit
  :defer t
  :init
  (setq magit-push-always-verify nil
        git-commit-finish-query-functions nil
        magit-save-some-buffers nil
        magit-set-upstream-on-push t
        magit-diff-refine-hunk t
        )
  ;; (add-hook 'after-init-hook #'magit-mode)
  )

(use-package git-gutter
  :diminish git-gutter-mode
  :commands global-git-gutter-mode
  :init
  (add-hook 'after-init-hook #'global-git-gutter-mode)
  )

(provide 'init-git)
