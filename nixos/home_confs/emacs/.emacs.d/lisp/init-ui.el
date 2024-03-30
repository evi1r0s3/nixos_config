;;; init-ui.el --- UI Configuration.	-*- lexical-binding: t -*-
;; evi1_f4iry
;;; Commentary:
;;
;; Define UI.
;;
;;; Code:

;;; 原生配置项
;; 编程模式下，光标在括号上时高亮另一个括号
(add-hook 'prog-mode-hook #'show-paren-mode)
;; 在 Mode line 上显示列号
(column-number-mode t) 
;; 关闭启动 Emacs 时的欢迎界面
(setq inhibit-startup-message t)
;; 在 Window 显示行号
(global-display-line-numbers-mode 1) 
;; 关闭 Tool bar
(tool-bar-mode -1)
;; 图形界面时关闭滚动条
(when (display-graphic-p) (toggle-scroll-bar -1))
;; 显示相对行号
(setq display-line-numbers-type 'relative)
;;（可选）设定启动图形界面时的初始 Frame 宽/高（字符数）
;; (add-to-list 'default-frame-alist '(width . 90))
;; (add-to-list 'default-frame-alist '(height . 55))
;; 初始启动位置调整，根据界面宽度
;; (set-frame-position (selected-frame) (- (/ (display-pixel-width) 3) 190) (- (/ (display-pixel-height) 2) 110))
;; 使用全屏
;; (set-frame-parameter nil 'fullscreen 'fullboth)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-ui)
;;; init-ui.el ends here
