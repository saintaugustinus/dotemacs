(eval-after-load 'lisp-mode
  '(progn
     (use-package slime
       :quelpa
       
       :init
       (setq inferior-lisp-program "/usr/bin/sbcl")
       ;; package.el compiles the contrib subdir, but the compilation order
       ;; causes problems, so we remove the .elc files there. See
       ;; http://lists.common-lisp.net/pipermail/slime-devel/2012-February/018470.html
       ;; (mapc #'delete-file
       ;;       (file-expand-wildcards (concat user-emacs-directory "elpa/slime-2*/contrib/*.elc")))
       (setq slime-protocol-version 'ignore)
       (setq slime-net-coding-system 'utf-8-unix)
       (setq slime-complete-symbol*-fancy t)
       (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

       :config
       (slime-setup '(slime-repl slime-fuzzy))
       )
     )
  )

(provide 'init-slime)
