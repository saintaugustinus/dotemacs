(use-package anaconda-mode
  :commands anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)

  :config
  (use-package company-anaconda
    :init
    (add-to-list 'company-backends 'company-anaconda))
  )

(provide 'init-python)
