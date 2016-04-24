(require 'init-elpa)
(require 'benchmark)
(benchmark-init/activate)
(require 'init-evil)
(require 'init-core)
(if window-system
    (require 'init-fonts))
(require 'init-dired)

(require 'init-company)
(require 'init-hippie-expand)
(require 'init-yasnippet)
(require 'init-smartparens)
(require 'init-helm)
(require 'init-projectile)
(require 'init-git)

(require 'init-flycheck)
(require 'init-gtags)
(require 'init-cc-mode)
(require 'init-python)

(require 'init-extmodes)

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)
