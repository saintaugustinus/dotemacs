;; Smartparens Settings
(require-package 'smartparens)
(require 'smartparens-config)

(setq sp-autoskip-closing-pair 'always)
(setq sp-navigate-close-if-unbalanced t)
(smartparens-global-mode t)

(diminish 'smartparens-mode)

(defun ext/sp-create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (previous-line)
  (indent-according-to-mode)
  (forward-line)
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(sp-with-modes '(c-mode c++-mode java-mode js2-mode sh-mode)
  (sp-local-pair "{" nil :post-handlers '((ext/sp-create-newline-and-enter-sexp "RET"))))

(provide 'init-smartparens)
