(setq-default
 major-mode 'text-mode)

(show-paren-mode t)
(setq how-paren-style 'parentheses)

(mouse-avoidance-mode 'animate)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(provide 'init-editing-utils)
