(ido-mode t)

(use-package ido-vertical-mode
  :quelpa

  :init
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
  (setq ido-auto-merge-delay-time 99999)

  (evil-leader/set-key
    "f" 'ido-find-file)

  :config
  (setq ido-use-faces t)
  (set-face-attribute 'ido-vertical-only-match-face nil
                      :background "#e52b50"
                      :foreground "white")
  (set-face-attribute 'ido-vertical-match-face nil
                      :foreground "#b00000")

  (ido-vertical-mode t)
  )

(use-package ido-ubiquitous
  :quelpa
  
  :config
  (ido-ubiquitous-mode t)
  )

(provide 'init-ido)
