(defun ext/font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defun ext/make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s-%s" font-name font-size)))

(defvar ext/english-font-size nil)
(defun ext/set-font (english-fonts
                     english-font-size
                     chinese-fonts
                     &optional chinese-font-size)
  (require 'cl)
  (setq ext/english-font-size english-font-size)
  (let ((en-font (ext/make-font-string
                  (find-if #'ext/font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'ext/font-existsp chinese-fonts) :size chinese-font-size)))

    (set-face-attribute 'default nil :font en-font)

    ;;    (set-face-font 'italic (font-spec :family (find-if #'ext/font-existsp english-fonts) :slant 'italic :weight 'normal :size english-font-size))
    ;;    (set-face-font 'bold-italic (font-spec :family (find-if #'ext/font-existsp english-fonts) :slant 'italic :weight 'bold :size english-font-size))
    ;;    (set-face-font 'font-lock-comment-face (font-spec :family (find-if #'ext/font-existsp english-fonts) :size english-font-size :slant 'italic))
    (dolist (charset '(han cjk-misc kana bopomofo))
      (set-fontset-font t charset zh-font))))

(defvar ext/english-fonts '("Consolas" "Source Code Pro" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New"))
(defvar ext/chinese-fonts '("微软雅黑" "Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))

(ext/set-font
 ext/english-fonts 12
 ext/chinese-fonts)

(defvar ext/english-font-size-steps '(10 11 12 14 16 18 22))
(defvar ext/english-font-size-steps-dec (reverse ext/english-font-size-steps))
(defun ext/step-frame-font-size (step)
  (let ((steps ext/english-font-size-steps)
        next-size)
    (if (< step 0)
        (setq steps ext/english-font-size-steps-dec))
    (setq next-size
          (cadr (member ext/english-font-size steps)))
    (when next-size
      (message "Font size is set to %.1f" next-size)
      (ext/set-font ext/english-fonts next-size ext/chinese-fonts))))

(global-set-key (kbd "C-x M--") (lambda () (interactive) (ext/step-frame-font-size -1)))
(global-set-key (kbd "C-x M-=") (lambda () (interactive) (ext/step-frame-font-size 1)))

(provide 'init-fonts)
