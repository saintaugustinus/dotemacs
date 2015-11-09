(package-initialize)

(setq quelpa-update-melpa-p nil)
(if (require 'quelpa nil t)
    t
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

(quelpa
 '(quelpa-use-package
   :fetcher github
   :repo "quelpa/quelpa-use-package"))
(require 'quelpa-use-package)

(provide 'init-elpa)
