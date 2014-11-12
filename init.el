;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-elpa)

(require-package 'diminish)

;; For a better appearance
(require 'init-appearance)
(require 'init-fonts)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require 'init-yasnippet)
(require 'init-smartparens)
(require 'init-auto-complete)
(require 'init-ido)
(require 'init-helm)
(require 'init-isearch)
(require 'init-evil)

(require 'init-editing-utils)

(require 'init-cc-mode)
(require 'init-slime)
(require 'init-markdown)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)
