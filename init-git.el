(require-package 'magit)
(require-package 'git-blame)
(require-package 'git-commit-mode)
(require-package 'git-rebase-mode)
(require-package 'gitignore-mode)
(require-package 'gitconfig-mode)
(require-package 'git-messenger)
(require-package 'git-timemachine)


(setq-default magit-save-some-buffers nil
	      magit-process-popup-time 10
	      magit-diff-refine-hunk t
	      magit-completing-read-function 'magit-ido-completing-read)

(global-set-key [(meta f12)] 'magit-status)

(require-package 'git-gutter)

(add-hook 'after-init-hook #'global-git-gutter-mode)

(provide 'init-git)
