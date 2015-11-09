(require 'init-elpa)

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(require 'init-core)
(if window-system
    (require 'init-fonts))
(require 'init-dired)

(require 'init-company)
(require 'init-hippie-expand)
(require 'init-yasnippet)
(require 'init-smartparens)
(require 'init-evil)
(require 'init-smex)
(require 'init-ido)
(require 'init-helm)
(require 'init-projectile)
(require 'init-git)

(require 'init-flycheck)
(require 'init-gtags)
(require 'init-cc-mode)
(require 'init-python)
;; (require 'init-slime)
(require 'init-markdown)

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)
