(eval-after-load 'python
  '(progn
     (use-package anaconda-mode
       :quelpa
       
       :init
       (add-hook 'python-mode-hook 'anaconda-mode)

       :config
       (use-package company-anaconda
         :quelpa
         
         :init
         (add-to-list 'company-backends 'company-anaconda)
         )
       )
     )
  )

(provide 'init-python)
