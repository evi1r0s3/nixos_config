;;; init-ui.el --- the UI of emacs -*- lexical-binding: t -*-
;; Author: evi1_f4iry
;; Github: https://github.com/evi1r0s3
;;; Commentary:
;;
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 启动窗口

;;（可选）设定启动图形界面时的初始 Frame 宽/高（字符数）
;; (add-to-list 'default-frame-alist '(width . 90))
;; (add-to-list 'default-frame-alist '(height . 55))
;; 初始启动位置调整，根据界面宽度
;; (set-frame-position (selected-frame) (- (/ (display-pixel-width) 3) 190) (- (/ (display-pixel-height) 2) 110))
;; 使用全屏
;; (set-frame-parameter nil 'fullscreen 'fullboth)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 欢迎界面

;; 关闭启动 Emacs 时的欢迎界面
(setq inhibit-startup-message t)
;; 使用 dashboard 启动界面
(use-package dashboard
  :demand t
  :config
  (dashboard-setup-startup-hook))
;; 在使用守护进程的模式下同样启用
(setq initial-buffer-choice
  (lambda () (get-buffer "*dashboard*")))
;; title
(setq dashboard-banner-logo-title "Be obsessed, or be average.")
(setq dashboard-footer-messages '("帝力于我何有哉; 不疯魔，不成活。 "))
;; banner
(setq dashboard-startup-banner
  (expand-file-name
    (if (display-graphic-p) "./elements/logo.png" "./elements/banner.txt") user-emacs-directory))
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt"
;; which displays whatever gif/image/text you would prefer
;; 横向居中
(setq dashboard-center-content t)
;; 垂直居中
(setq dashboard-vertically-center-content t)
;; 不显示快速跳转提示
(setq dashboard-show-shortcuts nil)
;; 显示的类别数量
(setq dashboard-items '((recents  . 5)
  (bookmarks . 5)
  (projects . 5)
  (agenda . 5)
  (registers . 5)))
;; 其他选项见github

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 基础界面

;; 标题栏显示绝对路径
;; (setq frame-title-format '("" "%b <%f> @ Emacs " emacs-version))
;; 标题栏显示版本及自定义信息
(setq frame-title-format '("evi1_f4iry @ Emacs " emacs-version))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 光标

;; 非当前选中的窗口不显示光标
(setq cursor-in-non-selected-windows t)
;; 光标改为竖线
(setq-default cursor-type '(bar . 5))
;; 全局光标所在行高亮
(global-hl-line-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 行列

;; display-line-numbers-type的行号实现方法
;; relative相对，visual绝对，设置为相对行号，因为光标所在处会显示绝对行号，
;; 其他行则为相对，方便跳转
(setq display-line-numbers-type 'relative)
;; 在全局显示行号
(global-display-line-numbers-mode 1)
;; linum的实现方式，可以改行号的格式
;; 显示行号
;; (global-linum-mode 1)
;; 设置行号的显示格式
;; (defun linum-format-func (line)
;;   (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
;;      (propertize (format (format "%%%dd \u250a " w) line) 'face 'linum)))
;; (setq linum-format 'linum-format-func)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 符号及标识处理

;; 编程模式下，光标在括号上时高亮另一个括号
(add-hook 'prog-mode-hook #'show-paren-mode)
;; 彩虹括号
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; 所有图标支持
;;(use-package all-the-icons
;;  :config
;;  (set-fontset-font t 'symbol "Apple Color Emoji")
;;  (set-fontset-font t 'symbol "Noto Color Emoji" nil 'append)
;;  (set-fontset-font t 'symbol "Segoe UI Emoji" nil 'append)
;;  (set-fontset-font t 'symbol "Symbola" nil 'append))
;; org-mode 下获得更好的标识符号
;;(use-package org-bullets
;;  :config
;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;; 相同字符串高亮，选择之后使用F3切换高亮
;;(use-package highlight-symbol
;;  :init (highlight-symbol-mode)
;;  :bind ("<f3>" . highlight-symbol))
;; 高亮转义
;;(use-package highlight-escape-sequences)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; modeline

;; modeline 显示时间
(display-time-mode 1)
;; modeline 上时间24h时间格式
(setq display-time-24hr-format t)
;; modeline 显示日期、星期
(setq display-time-day-and-date t)
;; 在 Modeline 上显示列号
(column-number-mode t)
;; modeline 主题配置
(use-package powerline
  :init
  (powerline-center-theme))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; tab栏

;; 显示tab栏
(global-tab-line-mode t)
;; 关闭tab的新建按钮
(setq tab-line-new-button-show nil)
;; 关闭tab的关闭按钮
(setq tab-line-close-button-show nil)
;; tab分隔符号设定
(setq tab-line-separator "| |")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 主题与配色
;; 德古拉主题
(use-package dracula-theme
  :init (load-theme 'dracula t))
;; 对括号识别进行配置，此配置需要在德古拉主题之后，因为主题会改变括号加粗，导致行抖动
;; 默认情况下，在显示匹配的括号之前会有一个小的延迟，设置为0
;; (setq show-paren-delay 0)
;; (show-paren-mode 1)
;; ;; 需要paren才能配置
;; (require 'paren)
;; ;; 前景色
;; (set-face-foreground 'show-paren-match "red")
;; ;; 不对括号匹配加粗
;; (set-face-bold 'show-paren-match nil)
;; ;; 背景色
;; (set-face-background 'show-paren-match "white")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-ui)

;;; init-ui.el ends here
;;; Local Variables:
;; coding: utf-8
;; byte-compile-warnings: (not unresolved obsolete)
;; End:
