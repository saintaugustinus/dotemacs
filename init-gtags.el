(require-package 'ggtags)

(dolist (mode '(c-mode-hook c++-mode-hook))
   (add-hook mode 'ggtags-mode))


(eval-after-load "ggtags"
  '(progn
     (setq imenu-create-index-function
		 'ggtags-build-imenu-index)
     (evil-leader/set-key
       "gt" 'ggtags-find-tag-dwim
       "gr" 'ggtags-find-reference)))

(provide 'init-gtags)
