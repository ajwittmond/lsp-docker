(setq package-selected-packages
      '(lsp-mode lsp-ui company-lsp yasnippet lsp-java lsp-python-ms lsp-haskell helm-lsp lsp-treemacs dap-mode lsp-origami helm-lsp
                 rust-mode php-mode typescript-mode kotlin-mode scala-mode
                 flycheck))

                                        ; list the repositories containing them
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(package-install-selected-packages)

(with-eval-after-load 'lsp-mode
  (require 'yasnippet)
  (require 'lsp-java)

  ;; otherwise kotlin language server won't work
  (setq lsp-kotlin-compiler-jvm-target "1.8"
        ;; comment if you prefer flymake
        lsp-prefer-flymake nil))

(add-hook 'prog-mode-hook 'lsp)

;; non lsp related stuff
(ido-mode)

(with-eval-after-load 'cc-mode
  (define-key java-mode-map (kbd ";") nil)
  (define-key java-mode-map (kbd "(") nil))

(custom-set-faces
 '(lsp-ui-sideline-code-action ((t (:foreground "orange")))))