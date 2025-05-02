;;; init-const.el --- Define constants.	-*- lexical-binding: t -*-
;; evi1_f4iry self use
;;; Commentary:
;;
;; Define constants.
;; 定义常量
;;; Code:

;; 编码
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(define-coding-system-alias 'UTF-8 'utf-8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-const)
;;; init-const.el ends here
