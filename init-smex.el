(require-package 'smex)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(evil-leader/set-key
  "x" 'smex)

(provide 'init-smex)
