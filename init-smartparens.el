;; Smartparens Settings
(require 'smartparens-config)

(smartparens-global-mode 1)

(defun ext/sp-create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '((ext/sp-create-newline-and-enter-sexp "RET"))))

(provide 'init-smartparens)
