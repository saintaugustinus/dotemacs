(use-package cmake-mode
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode))
  )

(use-package markdown-mode
  :mode(("\\.markdown\\'" . markdown-mode)
        ("\\.md\\'" . markdown-mode))
  )

(provide 'init-extmodes)
