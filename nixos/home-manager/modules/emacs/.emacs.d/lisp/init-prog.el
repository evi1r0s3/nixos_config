;;; init-prog.el --- the LSP & prog env config -*- lexical-binding: t -*-
;; Author: evi1_f4iry
;; Github: https://github.com/evi1r0s3
;;; Commentary:
;;
;;; Code:

;; Language Server (eglot - emacs.v29 起内置)
(use-package eglot
             :bind ("C-c e f" . eglot-format)
             :init
             (advice-add 'eglot-code-action-organize-imports :before #'eglot-format-buffer)
             (add-hook 'eglot-managed-mode-hook (lambda () (add-hook 'before-save-hook #'eglot-format-buffer)))
             (add-hook 'prog-mode-hook
                       (lambda () (unless (member major-mode '(emacs-lisp-mode))
                                    (eglot-ensure)))))

(use-package treesit-auto
             :hook (after-init . global-treesit-auto-mode)
             :custom (treesit-auto-install 'prompt)
             :config (treesit-auto-add-to-auto-mode-alist 'all))

(when nil
  ;; Tree-sitter (treesit - emacs.v29起内置)
  (use-package treesit
               :when (and (fboundp 'treesit-available-p) (treesit-available-p))
               :commands treesit-install-language-grammar
               :mode (("\\(?:Dockerfile\\(?:\\..*\\)?\\|\\.[Dd]ockerfile\\)\\'" . dockerfile-ts-mode)
                      ("\\.go\\'" . go-ts-mode)
                      ("/go\\.mod\\'" . go-mod-ts-mode)
                      ("\\.rs\\'" . rust-ts-mode)
                      ("\\.ts\\'" . typescript-ts-mode)
                      ("\\.y[a]?ml\\'" . yaml-ts-mode))
               :config (setq treesit-font-lock-level 4)
               :init
               (setq major-mode-remap-alist
                     '((sh-mode         . bash-ts-mode)
                       (c-mode          . c-ts-mode)
                       (c++-mode        . c++-ts-mode)
                       (c-or-c++-mode   . c-or-c++-ts-mode)
                       (css-mode        . css-ts-mode)
                       (js-mode         . js-ts-mode)
                       (java-mode       . java-ts-mode)
                       (js-json-mode    . json-ts-mode)
                       (makefile-mode   . cmake-ts-mode)
                       (python-mode     . python-ts-mode)
                       (ruby-mode       . ruby-ts-mode)
                       (conf-toml-mode  . toml-ts-mode)))
               (setq treesit-language-source-alist
                     '((bash       . ("https://github.com/tree-sitter/tree-sitter-bash"))
                       (c          . ("https://github.com/tree-sitter/tree-sitter-c"))
                       (cpp        . ("https://github.com/tree-sitter/tree-sitter-cpp"))
                       (css        . ("https://github.com/tree-sitter/tree-sitter-css"))
                       (cmake      . ("https://github.com/uyha/tree-sitter-cmake"))
                       (csharp     . ("https://github.com/tree-sitter/tree-sitter-c-sharp.git"))
                       (dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile"))
                       (elisp      . ("https://github.com/Wilfred/tree-sitter-elisp"))
                       (go         . ("https://github.com/tree-sitter/tree-sitter-go"))
                       (gomod      . ("https://github.com/camdencheek/tree-sitter-go-mod.git"))
                       (html       . ("https://github.com/tree-sitter/tree-sitter-html"))
                       (java       . ("https://github.com/tree-sitter/tree-sitter-java.git"))
                       (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
                       (json       . ("https://github.com/tree-sitter/tree-sitter-json"))
                       (lua        . ("https://github.com/Azganoth/tree-sitter-lua"))
                       (make       . ("https://github.com/alemuller/tree-sitter-make"))
                       (markdown   . ("https://github.com/MDeiml/tree-sitter-markdown" nil "tree-sitter-markdown/src"))
                       (ocaml      . ("https://github.com/tree-sitter/tree-sitter-ocaml" nil "ocaml/src"))
                       (org        . ("https://github.com/milisims/tree-sitter-org"))
                       (python     . ("https://github.com/tree-sitter/tree-sitter-python"))
                       (php        . ("https://github.com/tree-sitter/tree-sitter-php"))
                       (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src"))
                       (tsx        . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src"))
                       (ruby       . ("https://github.com/tree-sitter/tree-sitter-ruby"))
                       (rust       . ("https://github.com/tree-sitter/tree-sitter-rust"))
                       (sql        . ("https://github.com/m-novikov/tree-sitter-sql"))
                       (vue        . ("https://github.com/merico-dev/tree-sitter-vue"))
                       (yaml       . ("https://github.com/ikatyang/tree-sitter-yaml"))
                       (toml       . ("https://github.com/tree-sitter/tree-sitter-toml"))
                       (zig        . ("https://github.com/GrayJack/tree-sitter-zig")))))
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-prog)

;;; init-prog.el ends here
;;; Local Variables:
;; coding: utf-8
;; byte-compile-warnings: (not unresolved obsolete)
;; End:
