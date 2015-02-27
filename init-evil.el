(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-surround)

(global-evil-leader-mode) ;; This line should behind the evil-mode

(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "bb" 'switch-to-buffer
  "bf" 'beginning-of-defun
  "bu" 'backward-up-list
  "ef" 'end-of-defun
  "mf" 'mark-defun
  "eb" 'eval-buffer
  "ee" 'eval-expression
  "sc" 'shell-command
  "dj" 'dired-jump
  "ff" 'toggle-frame-fullscreen
  "W" 'save-some-buffers
  "k" 'kill-buffer
  "K" 'kill-buffer-and-window
  "0" 'delete-window
  "1" 'delete-other-windows
  "2" 'split-window-below
  "3" 'split-window-right)


(evil-mode 1)

(global-evil-surround-mode)

;; change mode-line color by evil state
(lexical-let ((default-color (cons (face-background 'mode-line)
				   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
	    (lambda ()
	      (let ((color (cond ((minibufferp) default-color)
				 ((evil-insert-state-p) '("#e80000" . "#ffffff"))
				 ((evil-emacs-state-p) '("#444488" . "#ffffff"))
				 ((buffer-modified-p) '("#006fa0" . "#ffffff"))
				 (t default-color))))
		(set-face-background 'mode-line (car color))
		(set-face-foreground 'mode-line (cdr color))))))

(loop for (mode . state) in
      '(
	(minibuffer-inactive-mode . emacs)
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
	)
      do (evil-set-initial-state mode state))

(provide 'init-evil)
