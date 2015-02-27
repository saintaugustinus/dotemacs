(require-package 'dired+)
(require-package 'dired-sort)

(setq-default diredp-hide-details-initially-flag nil
	      dired-dwim-target t)

(eval-after-load "dired"
  '(progn
     (require 'dired+)
     (require 'dired-sort)
       (setq dired-recursive-deletes 'top)))

(provide 'init-dired)
