(eval-after-load 'cc-mode
  '(progn
     (use-package ggtags
       :quelpa
       
       :init
       (dolist (mode '(c-mode-hook c++-mode-hook))
         (add-hook mode 'ggtags-mode)
         )

       :config
       (dolist (mode '(c-mode c++-mode))
         (evil-leader/set-key-for-mode mode
           "gt" 'ggtags-find-tag-dwim
           "gr" 'ggtags-find-reference)
         )
       
       (setq imenu-create-index-function
             'ggtags-build-imenu-index)
       )
     )
  )

(provide 'init-gtags)
