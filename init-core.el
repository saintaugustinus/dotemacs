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
(mouse-avoidance-mode 'animate)
(display-time-mode t)
(tool-bar-mode 0)
(global-linum-mode t)
(global-hl-line-mode t)

(use-package zenburn-theme
  :quelpa

  :config
  (load-theme 'zenburn t)
  )

(use-package hideshowvis
  :quelpa

  :config
  (add-hook 'prog-mode-hook #'hideshowvis-enable)
  )

(use-package which-key
  :quelpa

  :diminish which-key-mode

  :init
  (setq which-key-idle-delay 0.5)

  :config
  (which-key-mode)
  )

(use-package rainbow-delimiters
  :quelpa

  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

(use-package anzu
  :quelpa

  :diminish anzu-mode
  
  :config
  (add-hook 'after-init-hook #'global-anzu-mode)
  )

(use-package ace-jump-mode
  :quelpa

  :config
  (progn
    (evil-leader/set-key
      "ac" 'ace-jump-char-mode
      "aw" 'ace-jump-word-mode
      "al" 'ace-jump-line-mode)
    )
  )

(use-package iedit
  :quelpa
  )

(use-package aggressive-indent
  :quelpa

  :diminish aggressive-indent-mode " Ⓘ"
  
  :config
  (global-aggressive-indent-mode t)
  )


(provide 'init-core)
