(use-package dired+
  :init
  (setq diredp-hide-details-initially-flag nil
        dired-dwim-target t
        dired-recursive-deletes 'top)
  )

(provide 'init-dired)
