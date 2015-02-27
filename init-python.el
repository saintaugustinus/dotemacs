(require-package 'elpy)

(eval-after-load "elpy"
  '(progn
     (setq elpy-rpc-python-command "python2") ;;Python2 is my choice
     (setq elpy-rpc-backend "jedi")
     (setq python-indent-offset 4)
     (elpy-use-ipython)
     (dolist (elpy-disable-mode '(elpy-module-flymake elpy-module-highlight-indentation))
       (setq elpy-modules (delete elpy-disable-mode elpy-modules)))))

(add-hook 'python-mode-hook 'elpy-mode)

(provide 'init-python)
