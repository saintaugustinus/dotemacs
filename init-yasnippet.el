(use-package yasnippet
  :quelpa
  
  :diminish yas-minor-mode
  
  :init
  (setq yas-snippet-dirs
        '("~/.emacs.d/lisp/misc/snippets/"))

  :config
  (yas-global-mode t)
  )

(provide 'init-yasnippet)
