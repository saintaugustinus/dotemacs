(use-package helm
  :bind
  ("C-x C-f" . helm-find-files)
  ("M-x" . helm-M-x)
  ("C-x r b" . helm-bookmarks)
  :init
  (setq helm-command-prefix-key "C-x C-a")
  (evil-leader/set-key
    "f"  'helm-find-files
    "hf" 'helm-for-files
    "y"  'helm-show-kill-ring
    "ht" 'helm-top
    "hm" 'helm-man-woman
    "ho" 'helm-occur
    "x"  'helm-M-x
    "bb" 'helm-buffers-list)
  (setq helm-ff-auto-update-initial-value nil
        helm-ff-file-name-history-use-recentf t
        helm-M-x-always-save-history t
        helm-M-x-fuzzy-match t
        helm-recentf-fuzzy-match t
        helm-buffers-fuzzy-matching t)
  :config
  (helm-mode t)
  (helm-adaptive-mode t)
  (helm-push-mark-mode t)

  (use-package helm-flx
    :config
    (helm-flx-mode t))
  
  ;; Don't save history information to file
  ;; (remove-hook 'kill-emacs-hook 'helm-adaptive-save-history)

  ;; Make `helm-for-files-preferred-list' dynamic
  (defun ext/helm-for-files-update-list ()
    `(helm-source-buffers-list
      helm-source-recentf
      helm-source-bookmarks
      helm-source-file-cache
      helm-source-files-in-current-dir
      helm-source-locate))

  (defadvice helm-for-files (around update-helm-list activate)
    (let ((helm-for-files-preferred-list
           (ext/helm-for-files-update-list)))
      ad-do-it))
  )

(use-package helm-swoop
  :commands helm-swoop
  :init
  (evil-leader/set-key
    "hs" 'helm-swoop))

(use-package helm-gitignore
  :defer t)

(provide 'init-helm)
