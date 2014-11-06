;; Add melpa
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defun require-package (package &optional min-version)
  (if (package-installed-p package min-version)
      t
    (package-install package)))

(provide 'init-elpa)
