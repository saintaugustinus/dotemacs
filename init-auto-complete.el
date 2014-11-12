(require-package 'auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)

;; make auto-complete work well with linum-mode
(ac-linum-workaround)


(eval-after-load 'auto-complete-mode
  (setq ac-sources
	(append
	 '(ac-source-yasnippet
	   ac-source-filename
	   ac-source-files-in-current-dir
	   ac-source-words-in-same-mode-buffers
	   ac-source-words-in-buffer) ac-sources)))

(ac-config-default)

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode
                text-mode haml-mode sass-mode yaml-mode csv-mode
                espresso-mode haskell-mode html-mode web-mode
                sh-mode smarty-mode clojure-mode lisp-mode
                textile-mode markdown-mode tuareg-mode js2-mode
                css-mode less-css-mode cc-mode))
  (add-to-list 'ac-modes mode))

; hook AC into completion-at-point
(defun ext/auto-complete-at-point ()
 (when (and (not (minibufferp))
            (fboundp 'auto-complete-mode)
            auto-complete-mode)
   (auto-complete)))

(defun ext/set-auto-complete-as-completion-at-point-function ()
 (setq completion-at-point-functions
       (cons 'ext/auto-complete-at-point
             (remove 'ext/auto-complete-at-point completion-at-point-functions))))

(add-hook 'auto-complete-mode-hook 'ext/set-auto-complete-as-completion-at-point-function)

(provide 'init-auto-complete)
