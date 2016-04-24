(use-package dummy-h-mode
  :mode ("\\.h\\'" . dummy-h-mode)
  )

(use-package google-c-style
  :commands google-set-c-style
  :defer t
  :init
  (add-hook 'c-mode-hook 'google-set-c-style)
  (add-hook 'c++-mode-hook 'google-set-c-style)
  )

;;irony-mode
(use-package irony
  :commands irony-mode
  :defer t
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
    :init
    (add-to-list 'company-backends 'company-irony)
    (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))

  (use-package company-irony-c-headers
    :init
    (add-to-list 'company-backends 'company-irony-c-headers)
    (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))

  (use-package irony-eldoc
    :init
    (add-hook 'irony-mode-hook 'irony-eldoc))

  (use-package flycheck-irony
    :init
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
    :config
    (use-package flycheck-google-cpplint
      :init
      (setq flycheck-c/c++-googlelint-executable (executable-find "cpplint")
            flycheck-googlelint-verbose "3"
            flycheck-googlelint-filter
            "-whitespace,+whitespace/braces,-build/include_what_you_use,-legal/copyright"
            flycheck-googlelint-linelength "80")
      :config
      (flycheck-add-next-checker 'irony
                                 '(warning . c/c++-googlelint)))
    )
  )

(use-package disaster
  :commands disaster
  :init
  (dolist (mode '(c-mode c++-mode))
    (evil-leader/set-key-for-mode mode
      "cc" 'disaster))
  )

;; Here comes big guy
(eval-after-load 'cc-mode
  '(progn
     (load-file
      (concat user-emacs-directory "lisp/misc/cedet/cedet-devel-load.el"))
     (load-file
      (concat user-emacs-directory "lisp/misc/cedet/contrib/cedet-contrib-load.el"))

     (require 'semantic)

     (add-to-list 'semantic-inhibit-functions
                  (lambda () (not (member major-mode '(c-mode c++-mode)))))

     (global-semanticdb-minor-mode t)
     (global-semantic-idle-scheduler-mode t)
     (global-semantic-stickyfunc-mode t)

     (semantic-mode 1)
     ))

(use-package srefactor
  :commands srefactor-refactor-at-point
  :init
  (dolist (mode '(c-mode c++-mode))
    (evil-leader/set-key-for-mode mode
      "mr" 'srefactor-refactor-at-point))
  )

(provide 'init-cc-mode)
