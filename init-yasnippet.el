;; Yasnippet Settings
(require-package 'yasnippet)
(require 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/lisp/misc/snippets/"
	))

(yas-global-mode 1)

(provide 'init-yasnippet)
