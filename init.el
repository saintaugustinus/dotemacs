;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-elpa)

(require-package 'diminish)

;; For a better appearance
(require 'init-appearance)
(require 'init-fonts)
(require 'init-dired)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
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

(require 'init-editing-utils)

(require 'init-flycheck)
(require 'init-gtags)
(require 'init-cc-mode)
(require 'init-python)
(require 'init-slime)
(require 'init-markdown)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)
