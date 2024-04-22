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
  (defun font/mono-font-by-font (FONT-NAME FONT-SIZE)
    (if (find-font (font-spec :name FONT-NAME))
      (set-face-attribute 'default nil :font (font-spec :name FONT-NAME :size FONT-SIZE))
      (error (format "找不到%s字体" FONT-NAME))))
  (font/mono-font-by-font "Iosevka NFM" 24)
  )

(when nil
  ;; 方法二，按比例配置中英文字体
  ;; 缺点：
  ;; 1.需要修改上下行距，否则输入英文后再输入中文，行高度会变化视觉上会有抖动，修改后显得不紧凑
  ;; 2.中英文高度差距较大，并不美观
  ;; 3.不同字体组合，放大系数和行距都需要根据字体调整
  (defun font/mono-font-by-scale (FONT-NAME CN-FONT-NAME &optional INITIAL-SIZE CN-FONT-RESCALE-RATIO)
    "Set different font-family for Latin and Chinese charactors."
    (let* ((size (or INITIAL-SIZE 14))
           (ratio (or CN-FONT-RESCALE-RATIO 0.0))
           (main (font-spec :name FONT-NAME :size size))
           (cn (font-spec :name CN-FONT-NAME)))
      (set-face-attribute 'default nil :font main)
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font t charset cn))
      (setq face-font-rescale-alist (if (/= ratio 0.0) `((,CN-FONT-NAME . ,ratio)) nil))))
  (font/mono-font-by-scale "IntoneMono NFM" "Microsoft Yahei" 24 1.25)
  ;; 设置上下行距，从而保持中英文混合的行不会抖动，根据字体调节一下
  (setq default-text-properties '(line-spacing 0.15 line-height 1.15))
  )

(when nil
  ;; 方法三，使用已知配对效果好的中英文字体组合
  ;; 缺点：
  ;; 1.有些字体组合需要修改行距，修改行距会看上去不紧凑
  ;; 2.没有特别满意的字体组合，ubuntu+yahei虽然还行，但一股子ubuntu味
  (defun font/mono-font-without-scale (FONT-NAME CN-FONT-NAME FONT-SIZE)
    (set-face-attribute 'default nil :font (font-spec :name FONT-NAME :size FONT-SIZE))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font t charset (font-spec :name CN-FONT-NAME))))
  (font/mono-font-without-scale "UbuntuMono Nerd Font Mono" "Microsoft Yahei" 28)
  ;; 设置上下行距，从而保持中英文混合的行不会抖动，根据字体调节一下
  (setq default-text-properties '(line-spacing 0.11 line-height 1.225))
  )

;; 方法四
;; 我的方法，同样设置系数缩放，但不调整行距，而是通过修改行号字体（见init-ui#行列）预先渲染
;; 单行的高度，从而保证在中英混合字体时不会因为先输入英文再输入中文而发生行高变化，导致抖动
;; 缺点：
;; 1.如果中英字体差距大，仍然会看上去不协调美观，但是这是已知方法中的通病
;; 优点：
;; 1.调整行号更美观一些，而且不会导致由于调整行高行距导致的其他一系列问题
;; -- evi1_f4iry 2022
(defun font/mono-font-by-linum (FONT-NAME CN-FONT-NAME &optional INITIAL-SIZE CN-FONT-RESCALE-RATIO)
  "Set different font-family for Latin and Chinese charactors."
  (let* ((size (or INITIAL-SIZE 14))
         (ratio (or CN-FONT-RESCALE-RATIO 0.0))
         (main (font-spec :name FONT-NAME :size size))
         (cn (font-spec :name CN-FONT-NAME)))
    (set-face-attribute 'default nil :font main)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font t charset cn))
    (setq face-font-rescale-alist (if (/= ratio 0.0) `((,CN-FONT-NAME . ,ratio)) nil))))
(font/mono-font-by-linum "IntoneMono NFM" "Microsoft Yahei" 24 1.25)
;; 行号的配置实际在init-ui，不过写在下面。方便参考，目前不打算将两段代码结合称一个函数，
;; 因为我始终认为，调整cjk字符横向间距才是最合理的解决方案，当前只是临时解决方案。
;; 字符间距这部分取决于上游代码，我始终认为这是可以被修改的代码，不过暂时没精力做贡献，
;; 留下这个有瑕疵的解决方案，提醒自己有空去贡献点力量
(when nil
  (use-package display-line-numbers                                                                                                                                          
               :custom                                                                                                                                                       
               (display-line-numbers-grow-only t)                                                                                                                            
               (display-line-numbers-width 3)                                                                                                                                
               (display-line-numbers-type 'relative)                                                                                                                         
               (display-line-numbers-major-tick t)                                                                                                                           
               :hook                                                                                                                                                         
               (conf-mode . display-line-numbers-mode)                                                                                                                       
               (prog-mode . display-line-numbers-mode)                                                                                                                       
               (text-mode . display-line-numbers-mode)                                                                                                                       
               :after                                                                                                                                                        
               ;; 因为主题会修改行号一栏，所以行号的face设置应在主题之后                                                                                                                  
               (dracula-theme)                                                                                                                                               
               :config                                                                                                                                                       
               ;; 所有行号的高度，和汉字一个尺寸，这样就能避免由于中英字体尺寸配置缩放系数                                                                                   
               ;; 等宽而导致行高输入抖动，使用height限制高度而不是直接设置字体字号是因为可以                                                                                 
               ;; 更精细的配置，尽量减少行距                                                                                                                                 
               (set-face-attribute 'line-number nil :height 138))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-font)

;;; init-font.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; END:
