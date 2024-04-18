;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; 当发生错误时取消注释此行用于debug
(setq debug-on-error t)

;; 版本检查
(when (version< emacs-version "29.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; 定义路径
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; 挂载启动时间计算
;; (require 'init-benchmarking)

;; 拼写检查
(defconst *spell-check-support-enabled* t)

;; 进程性能调整
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

;; 引导配置
;; 为emacs在图形界面中利用点击所产生的配置使用单独的文件保存
(setq custom-file (locate-user-emacs-file "custom.el"))
;; 0-常量配置
(require 'init-const)
;; 1-包管理
(require 'init-package)

;; 3-外观配置
(require 'init-ui)

;; 4-功能配置
(require 'init-features)
(require 'init-prog)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init)
;;; init.el ends here
