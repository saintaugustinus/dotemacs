(use-package helm
  :ensure nil
  :quelpa

  :init
  (setq helm-command-prefix-key "C-x C-a")

  (evil-leader/set-key
    "hf" 'helm-for-files
    "hl" 'helm-locate
    "y" 'helm-show-kill-ring
    "ht" 'helm-top
    "hm" 'helm-man-woman
    "ho" 'helm-occur
    "hx" 'helm-M-x
    "B" 'helm-buffers-list)

  :config
  (helm-mode t)

  (setq helm-ff-auto-update-initial-value t)

  (global-set-key (kbd "C-x r b") 'helm-bookmarks)

  ;; (setq helm-su-or-sudo "sudo")

  (setq helm-locate-command "locate -e -b %s -r %s")

  ;; Don't save history information to file
  (remove-hook 'kill-emacs-hook 'helm-adaptive-save-history)

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
  :quelpa
  )

(use-package helm-ag
  :quelpa
  )

(provide 'init-helm)
