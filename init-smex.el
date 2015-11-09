(use-package smex
  :quelpa
  
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)
   )
  
  :init
  (evil-leader/set-key
    "x" 'smex)
  )

(provide 'init-smex)
