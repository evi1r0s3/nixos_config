;;; init-package.el --- Package Configuration.	-*- lexical-binding: t -*-
;; evi1_f4iry
;;; Commentary:
;;
;; Define constants.
;;
;;; Code:

;; ------------  源的配置  ------------
;; 软件源换成国内源
(setq package-archives '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
      ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
      ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
;; ------------------------------------

;; ------------包管理器配置------------
;; 个别包更新会出现签名失败，配置为不检查签名
(setq package-check-signature nil)
;; 引入包管理器
(require 'package)
;; 包管理器初始化，除非包管理器已经初始化，否则对包管理器进行初始化
(unless (bound-and-true-p package--initialized)
  (package-initialize))
;; 刷新软件源索引，除非已经刷新到最新到索引，否则进行索引刷新
(unless package-archive-contents
  (package-refresh-contents))
;; ------------------------------------

;; ----------use-package 配置----------
;; emacs < 29.1
;; use-package宏提供了更简洁的方法来设置包自动加载、键绑定和各种模式配置。 重点是通过自动加载包而不是在启动时加载它们来减少启动时间
;; 除非已经安装use-package，否则刷新索引，并安装use-package
;; use-package 已经在emacs 29.1开始内置，所以不再需要判断是否安装
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))
;; 全局use-package配置，需要在use-package之前
;; (eval-and-compile
;;   (setq use-package-always-ensure t)	; 全部包需要确认安装，不需要单独填写此配置
;;   (setq use-package-always-defer t)	; 全部延迟加载
;;   (setq use-package-always-demand nil)
;;   (setq use-package-expand-minimally t)
;;   (setq use-package-verbose t))
;; (eval-when-compile
;;   (require 'use-package))
;; ------------------------------------
;; emacs >=29.1
;; 全居包自动安装
(require 'use-package-ensure)
(setq use-package-always-ensure t)
;; 全部延迟加载
(setq use-package-always-defer t)
(setq use-package-always-demand nil)
;; nil（默认值），use-package 将尝试捕获并报告在 init 文件中扩展 use-package 声明期间发生的错误。将 use-package-expand-minimally 设置为 t 会完全禁用此检查
(setq use-package-expand-minimally t)
(setq use-package-verbose t)
;; ------------------------------------

;; ----------- 补充功能配置 -----------
;; 包自动升级
(use-package auto-package-update
  :init
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results t)
  (defalias 'upgrade-packages #'auto-package-update-now))
;; ------------------------------------


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-package)
;;; init-package.el ends here
