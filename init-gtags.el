(use-package helm-gtags
  :defer t
  :init
  (dolist (mode '(c-mode-hook c++-mode-hook))
    (add-hook mode 'helm-gtags-mode))
  (dolist (mode '(c-mode c++-mode))
    (evil-leader/set-key-for-mode mode
      "mgc" 'helm-gtags-create-tags
      "mgd" 'helm-gtags-find-tag
      "mgf" 'helm-gtags-select-path
      "mgg" 'helm-gtags-dwim
      "mgG" 'helm-gtags-dwim-other-window
      "mgi" 'helm-gtags-tags-in-this-function
      "mgl" 'helm-gtags-parse-file
      "mgn" 'helm-gtags-next-history
      "mgp" 'helm-gtags-previous-history
      "mgr" 'helm-gtags-find-rtag
      "mgR" 'helm-gtags-resume
      "mgs" 'helm-gtags-select
      "mgS" 'helm-gtags-show-stack
      "mgu" 'helm-gtags-update-tags))
  )

(provide 'init-gtags)
