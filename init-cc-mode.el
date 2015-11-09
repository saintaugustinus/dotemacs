(eval-after-load 'cc-mode
  '(progn
     (defun ext/cc-mode-settings ()
       (setq c-default-style '((java-mode . "java")
                               (awk-mode . "awk")
                               (other . "linux")))
       (setq c-basic-offset 4)
       )
     (add-hook 'c-mode-common-hook 'ext/cc-mode-settings)

     ;;irony-mode
     (use-package irony
       :quelpa

       :init
       (add-hook 'c-mode-hook 'irony-mode)
       (add-hook 'c++-mode-hook 'irony-mode)

       :config
       (defun ext/irony-mode-hook ()
         (define-key irony-mode-map [remap completion-at-point]
           'irony-completion-at-point-async)
         (define-key irony-mode-map [remap complete-symbol]
           'irony-completion-at-point-async))
       (add-hook 'irony-mode-hook 'ext/irony-mode-hook)
       (add-to-list 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

       (use-package company-irony
         :quelpa

         :config
         (eval-after-load 'irony-mode
           (add-to-list 'company-backends 'company-irony)
           )
         )

       (use-package company-irony-c-headers
         :quelpa

         :config
         (eval-after-load 'irony-mode
           (add-to-list 'company-backends 'company-irony-c-headers)
           )
         )

       (use-package irony-eldoc
         :quelpa

         :config
         (eval-after-load 'irony-mode
           (add-hook 'irony-mode-hook 'irony-eldoc))
         )

       (use-package flycheck-irony
         :quelpa

         :config
         (eval-after-load 'irony-mode
           (add-hook 'flycheck-mode-hook 'flycheck-irony-setup))
         )
       )
     ;; Here comes big guy
     (load-file
      (concat user-emacs-directory "lisp/misc/cedet/cedet-devel-load.el"))
     (load-file
      (concat user-emacs-directory "lisp/misc/cedet/contrib/cedet-contrib-load.el"))

     (require 'semantic)
     
     (add-to-list 'semantic-inhibit-functions
                  (lambda () (not (member major-mode '(c-mode c++-mode)))))

     (global-semanticdb-minor-mode t)
     (global-semantic-idle-scheduler-mode t)
     (global-semantic-decoration-mode t)
     (global-semantic-stickyfunc-mode t)

     (semantic-mode 1)

     (use-package function-args
       :quelpa

       :config
       (require 'function-args)
       (fa-config-default)
       )

     (use-package srefactor
       :quelpa

       :init
       (dolist (mode '(c-mode c++-mode))
         (evil-leader/set-key-for-mode mode
           "mr" 'srefactor-refactor-at-point)
         )
       )
     
     (use-package disaster
       :quelpa

       :config
       (evil-leader/set-key
         "cc" 'disaster)
       )

     (use-package dummy-h-mode
       :quelpa

       :mode ("\\.h\\'" . dummy-h-mode)
       )

     )
  )

(provide 'init-cc-mode)
