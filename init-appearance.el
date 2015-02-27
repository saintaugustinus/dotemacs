(setq-default
 display-time-24hr-format t
 column-number-mode t
 inhibit-startup-message t
 visible-bell t
 frame-title-format "emacs@%b")

(display-time-mode t)
(tool-bar-mode 0)
(global-linum-mode t)

(require-package 'moe-theme)
(require 'moe-theme)
(moe-light)

;; Make tabbar looks nice 
(require-package 'tabbar)
(require 'tabbar)

(set-face-attribute 'tabbar-default nil
		    :inherit nil
		    :weight 'normal
		    :width 'normal
		    :slant 'normal
		    :underline nil
		    :strike-through nil
		    :stipple nil
		    :background "gray80"
		    :foreground "black"
		    :box nil
		    :family "Consolas"
		    )
(set-face-attribute 'tabbar-selected nil
                    :background "gray95"
                    :foreground "gray20"
                    :inherit 'tabbar-default
                    :box '(:line-width 3 :color "grey95" :style nil))
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :background "gray80"
                    :box '(:line-width 3 :color "grey80" :style nil))
(defface tabbar-selected-highlight '((t
                                      :foreground "black"
                                      :background "gray95"))
  "Face for selected, highlighted tabs."
  :group 'tabbar)
(defface tabbar-unselected-highlight '((t
                                        :foreground "black"
                                        :background "grey75"
                                        :box (:line-width 3 :color "grey75" :style nil)))
  "Face for unselected, highlighted tabs."
  :group 'tabbar)
(set-face-attribute 'tabbar-button nil
                    :inherit 'tabbar-default
                    :box nil)
(set-face-attribute 'tabbar-separator nil
                    :background "grey50"
                    :foreground "grey50"
                    :height 1.0)

;; Keyboard setting for Tabbar
(global-set-key (kbd "<M-up>") 'tabbar-backward-group)
(global-set-key (kbd "<M-down>") 'tabbar-forward-group)
(global-set-key (kbd "<M-left>") 'tabbar-backward)
(global-set-key (kbd "<M-right>") 'tabbar-forward)

(tabbar-mode t)

(require-package 'pretty-mode)
(add-hook 'prog-hook 'pretty-mode)

(provide 'init-appearance)
