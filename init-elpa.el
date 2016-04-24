(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(if (package-installed-p 'use-package)
    t
  (package-installed 'use-package))

(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(provide 'init-elpa)
