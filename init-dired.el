(use-package dired+
  :quelpa

  :init
  (setq diredp-hide-details-initially-flag nil)
  (setq dired-dwim-target t)
  (setq dired-recursive-deletes 'top)
  )

(provide 'init-dired)
