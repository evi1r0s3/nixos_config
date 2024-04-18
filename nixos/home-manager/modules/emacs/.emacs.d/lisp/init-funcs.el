;;; init-funcs.el --- the coustom functions -*- lexical-binding: t -*-
;; Author: evi1_f4iry
;; Github: https://github.com/evi1r0s3
;;; Commentary:
;;
;;; Code:

;; ------------  文档格式  ------------
;; Dos 格式转 unix 格式
(defun dos2unix ()
  "Convert the current buffer to UNIX file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix nil))
;; unix 转 dos 格式
(defun unix2dos ()
  "Convert the current buffer to DOS file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos nil))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-funcs)

;;; init-funcs.el ends here
;;; Local Variables:
;; coding: utf-8
;; byte-compile-warnings: (not unresolved obsolete)
;; End:
