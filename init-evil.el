(use-package evil
  :diminish undo-tree-mode
  :init

  :config
  (use-package evil-leader
    :config
    (global-evil-leader-mode t)
    (evil-leader/set-leader "<SPC>")

    (evil-leader/set-key
      "bf" 'beginning-of-defun
      "bu" 'backward-up-list
      "ef" 'end-of-defun
      "mf" 'mark-defun
      "eb" 'eval-buffer
      "ee" 'eval-expression
      "sc" 'shell-command
      "dj" 'dired-jump
      "W" 'save-some-buffers
      "k" 'kill-buffer
      "K" 'kill-buffer-and-window
      "0" 'delete-window
      "1" 'delete-other-windows
      "2" 'split-window-below
      "3" 'split-window-right)
    )
  (require 'cl)
  (loop for (mode . state) in
        '((minibuffer-inactive-mode . emacs)
          (grep-mode . emacs)
          (Info-mode . emacs)
          (term-mode . emacs)
          (log-edit-mode . emacs)
          (vc-log-edit-mode . emacs)
          (magit-log-edit-mode . emacs)
          (direx:direx-mode . emacs)
          (erc-mode . emacs)
          (w3m-mode . emacs)
          (gud-mode . emacs)
          (help-mode . emacs)
          (eshell-mode . emacs)
          (shell-mode . emacs)
          (fundamental-mode . emacs)
          (dired-mode . emacs)
          (compilation-mode . emacs)
          (speedbar-mode . emacs)
          (magit-commit-mode . normal)
          (magit-diff-mode . normal)
          (flycheck-error-list-mode . emacs)
          )
        do (evil-set-initial-state mode state))

  (evil-mode t)
  )

(use-package evil-visualstar
  :config
  (global-evil-visualstar-mode))

(use-package evil-exchange
  :config
  (evil-exchange-install))

(use-package evil-surround
  :config
  (global-evil-surround-mode t))

(provide 'init-evil)
