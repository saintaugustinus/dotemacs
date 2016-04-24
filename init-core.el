(setq-default
 display-time-24hr-format t
 column-number-mode t
 inhibit-startup-message t
 visible-bell t
 frame-title-format "emacs@%b"
 major-mode 'text-mode
 indent-tabs-mode nil
 make-backup-files nil
 )

(show-paren-mode t)
(setq how-paren-style 'parentheses)
(display-time-mode t)
(tool-bar-mode 0)
(global-linum-mode t)
(global-hl-line-mode t)

(use-package spacemacs-theme
  :init
  (load-theme 'spacemacs-dark t))

(use-package hideshowvis
  :diminish hideshowvis-minor-mode
  :init
  (add-hook 'prog-mode-hook #'hideshowvis-enable))

(use-package which-key
  :diminish which-key-mode
  :init
  (setq which-key-idle-delay 0.5)
  :config
  (which-key-mode t))

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package anzu
  :diminish anzu-mode 
  :init
  (add-hook 'after-init-hook #'global-anzu-mode))

(use-package ace-jump-mode
  :defer t
  :init
  (evil-leader/set-key
    "ac" 'ace-jump-char-mode
    "aw" 'ace-jump-word-mode
    "al" 'ace-jump-line-mode))

(use-package iedit
  :defer t
  )

(use-package aggressive-indent
  :diminish aggressive-indent-mode " Ⓘ" 
  :init
  (add-hook 'prog-mode-hook 'aggressive-indent-mode))

(use-package whitespace-cleanup-mode
  :diminish whitespace-cleanup-mode
  :init
  (add-hook 'prog-mode-hook 'whitespace-cleanup-mode))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(provide 'init-core)
