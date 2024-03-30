;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; 当发生错误时取消注释此行用于debug
;; (setq debug-on-error t)

;; 版本检查
(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "28.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; 定义路径
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; 挂载启动时间计算
(require 'init-benchmarking)

;; 拼写检查
(defconst *spell-check-support-enabled* t)

;; 调整早期启动的垃圾收集阈值（请参阅下面的 gcmh 的使用）
(setq gc-cons-threshold (* 128 1024 1024))

;; 进程性能调整
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

;; 引导配置
;; 为emacs在图形界面中的点点点所产生的配置使用单独的文件
(setq custom-file (locate-user-emacs-file "custom.el"))

;; 外观配置
(require 'init-ui)

;; 功能配置
(require 'init-features)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init)
;;; init.el ends here
