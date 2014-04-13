(defun ext/cc-mode-settings ()

  (setq c-default-style '((java-mode . "java")
			  (awk-mode . "awk")
			  (other . "linux")))

  (setq c-basic-offset 6))

(add-hook 'c-mode-common-hook 'ext/cc-mode-settings)

;; Auto-Complete-Clang-Async
(require 'auto-complete-clang-async)

(defun ext/ac-c-cpp-autocomplete ()
  (setq ac-clang-complete-executable
	"~/.emacs.d/lisp/misc/clang-complete")
  (setq ac-sources
	'(ac-source-clang-async
	  ac-source-yasnippet))
  (ac-clang-launch-completion-process))

(add-hook 'c-mode-hook 'ext/ac-c-cpp-autocomplete)
(add-hook 'c++-mode-hook 'ext/ac-c-cpp-autocomplete)

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/misc/irony-mode/elisp"))
;; (require 'irony) ;Note: hit `C-c C-b' to open build menu

;; ;; the ac plugin will be activated in each buffer using irony-mode
;; (irony-enable 'ac)             ; hit C-RET to trigger completion

;; (defun my-c++-hooks ()
;;   "Enable the hooks in the preferred order: 'yas -> auto-complete -> irony'."
;;   ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
;;   (when (member major-mode irony-known-modes)
;;     (irony-mode 1)))

;; (add-hook 'c++-mode-hook 'my-c++-hooks)
;; (add-hook 'c-mode-hook 'my-c++-hooks)

(add-hook 'c-mode-common-hook 'which-func-mode)

(provide 'init-cc-mode)
