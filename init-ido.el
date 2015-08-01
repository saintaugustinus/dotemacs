(require-package 'ido-vertical-mode)
(require 'ido-vertical-mode)
(ido-mode t)
(ido-vertical-mode t)

(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
(setq ido-auto-merge-delay-time 99999)

(evil-leader/set-key
  "f" 'ido-find-file)

(provide 'init-ido)
