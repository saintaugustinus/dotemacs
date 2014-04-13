(setq-default
 major-mode 'text-mode)

(show-paren-mode t)
(setq how-paren-style 'parentheses)

(mouse-avoidance-mode 'animate)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(provide 'init-editing-utils)
