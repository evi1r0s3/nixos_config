;;; init-font.el --- the entry of emacs config -*- lexical-binding: t -*-
;; Author: evi1_f4iry
;; Github: https://github.com/evi1r0s3
;;; Commentary:
;;
;;; Code:

(when nil
  ;; 等宽测试区域
  |aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|
  |你你你你你你你你你你你你你你你你你你你你|
  |,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,|
  |。。。。。。。。。。。。。。。。。。。。|
  |1111111111111111111111111111111111111111|
  |東東東東東東東東東東東東東東東東東東東東|
  |ここここここここここここここここここここ|
  |ｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺ|
  |까까까까까까까까까까까까까까까까까까까까|
  |SS高gg低aa平II宽;;；::：SS深SS深SS深SS深|
  |1IiLoO0.,，。|

  )

;;(setq modus-themes-mixed-fonts t)

(when nil
;; 方法一，使用等宽等高字体，如Iosevka，更纱黑等
;; 缺点：
;; 1.字体不好看
;; 2.不能自由选择字体
(defun font/set-font-by-mono (FONT-NAME FONT-SIZE)
  (if (find-font (font-spec :name FONT-NAME))
    (set-face-attribute 'default nil :font (font-spec :name FONT-NAME :size FONT-SIZE))
    (error (format "找不到%s字体" FONT-NAME))))
(font/set-font-by-mono "Iosevka NFM" 24)
)

(when nil
;; 方法二，按比例配置中英文字体
;; 缺点：
;; 1.需要修改上下行距，否则输入英文后再输入中文，行高度会变化视觉上会有抖动，修改后显得不紧凑
;; 2.中英文高度差距较大，并不美观
;; 3.不同字体组合，放大系数和行距都需要根据字体调整
(defun font/set-font-by-scale (FONT-NAME CN-FONT-NAME &optional INITIAL-SIZE CN-FONT-RESCALE-RATIO)
  "Set different font-family for Latin and Chinese charactors."
  (let* ((size (or INITIAL-SIZE 14))
         (ratio (or CN-FONT-RESCALE-RATIO 0.0))
         (main (font-spec :name FONT-NAME :size size))
         (cn (font-spec :name CN-FONT-NAME)))
    (set-face-attribute 'default nil :font main)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font t charset cn))
    (setq face-font-rescale-alist (if (/= ratio 0.0) `((,CN-FONT-NAME . ,ratio)) nil))))
(font/set-font-by-scale "IntoneMono NFM" "Microsoft Yahei" 24 1.25)
;; 设置上下行距，从而保持中英文混合的行不会抖动，根据字体调节一下
(setq default-text-properties '(line-spacing 0.15 line-height 1.15))
)

;;(when nil
;; 方法三，使用已知配对效果好的中英文字体组合
;; 缺点：
;; 1.有些字体组合需要修改行距
;; 2.没有特别满意的字体组合，ubuntu+yahei虽然还行，但一股子ubuntu味
(defun font/set-font-no-scale (FONT-NAME CN-FONT-NAME FONT-SIZE)
  (set-face-attribute 'default nil :font (font-spec :name FONT-NAME :size FONT-SIZE))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font t charset (font-spec :name CN-FONT-NAME))))
(font/set-font-no-scale "UbuntuMono Nerd Font Mono" "Microsoft Yahei" 28)
;; 设置上下行距，从而保持中英文混合的行不会抖动，根据字体调节一下
(setq default-text-properties '(line-spacing 0.11 line-height 1.225))
;;)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-font)

;;; init-font.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; END:
