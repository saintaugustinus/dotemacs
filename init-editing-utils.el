(setq-default
 major-mode 'text-mode)

(show-paren-mode t)
(setq how-paren-style 'parentheses)

(mouse-avoidance-mode 'animate)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require-package 'anzu)
(require 'anzu)
(add-hook 'after-init-hook #'global-anzu-mode)
(diminish 'anzu-mode)

(require-package 'ace-jump-mode)
(evil-leader/set-key
  "ac" 'ace-jump-char-mode
  "aw" 'ace-jump-word-mode
  "al" 'ace-jump-line-mode)

(require-package 'iedit)
(require 'iedit)

(provide 'init-editing-utils)
