;; compile packages asynchronously
(async-bytecomp-package-mode 1)

(defun play-bell-sound ()
  (ignore-errors
    (sound-wav-play "/home/czipperz/.emacs.d/sounds/bell.wav")))

(defadvice yes-or-no-p (before ring-bell activate)
  (play-bell-sound))
(defadvice y-or-n-p (before ring-bell activate)
  (play-bell-sound))
(defadvice package-menu-execute (after ring-bell activate)
  (play-bell-sound))
(defadvice list-packages (after ring-bell activate)
  (play-bell-sound))

(setq source-directory "/home/czipperz/Code/emacs/src/")
(setq mail-host-address "gmail.com")

(set-frame-font "Meslo LG S DZ-11")

;; save edit place
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")

;; tramp
(setq tramp-default-method "ssh")

;; Instant gratification for key strokes
(set 'echo-keystrokes -1)

;; Whitespace highlighting
(set 'whitespace-style '(trailing tab-mark face))
(global-whitespace-mode 1)

;; Magit - Git inside emacs is awesome -> `C-z s' or `M-x magit-status'
;; (setq magit-last-seen-setup-instructions "1.4.0") ; Hide message
;; (autoload 'magit-status "magit" nil t)

;; Auto Complete menus
(helm-mode 1)
(helm-autoresize-mode 1)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)
(setq company-tooltip-align-annotations t)

;; Auto Complete for text
;(ac-config-default)

;; Auto match parens (highlight)
(show-smartparens-global-mode)

;; Line numbers
(global-linum-mode)
;; Fringe style for graphical mode
(set-fringe-style 0)
(setq linum-format "%d")

;; 4 spaces for c languages
(setq c-basic-offset 4
      c-default-style "stroustrup")

;; Default to c++11
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))

;; Auto include for `*.cc' and `*.c' files, auto insert main function
;; for `main.c' or `main.cc'
(add-hook 'find-file-hook 'auto-include-header-cc)
(add-hook 'find-file-hook 'auto-include-header-c)

;; Auto insert header guard for `*.hh' files.
(add-hook 'find-file-hook 'auto-insert-header-guard-hh)
(add-hook 'find-file-hook 'auto-insert-header-guard-h)

;; Auto Markdown header
(add-hook 'find-file-hook 'auto-insert-README.md-header)

;; globally enable multiple cursors
(global-evil-mc-mode 1)

(c-set-offset 'case-label '+)
(c-set-offset 'innamespace 0)
;; cwarn to check for errors
(add-hook 'c-mode-hook 'cwarn-mode)
(add-hook 'c++-mode-hook 'cwarn-mode)
;; Preprocessor highlighting
(add-hook 'c-mode-hook 'preproc-font-lock-mode)
(add-hook 'c++-mode-hook 'preproc-font-lock-mode)
;; Disassemble c/c++ code
(define-key c-mode-base-map (kbd "C-c d") 'disaster)
(add-hook 'llvm-mode-hook 'demangle-mode)

;; Comment auto fill
(add-hook 'prog-mode-hook 'turn-on-auto-fill-comments)

;; Forth files
(autoload 'forth-mode "gforth.el")
(setq auto-mode-alist (cons '("\\.fs\\'" . forth-mode) auto-mode-alist))
(autoload 'forth-block-mode "gforth.el")
(setq auto-mode-alist (cons '("\\.fb\\'" . forth-block-mode) auto-mode-alist))
(add-hook 'forth-mode-hook (function (lambda () (setq forth-indent-level 4))))

;; elisp-format
(set 'elisp-format-column fill-column)

;; Haskell indentation
(add-hook 'haskell-mode-hook 'turn-on-hi2)

;; paredit for haskell
(add-hook 'haskell-mode-hook
          '(lambda ()
             (interactive)
             (paredit-mode 1)
             (evil-paredit-mode 1)
             (haskell-indent-mode nil)
             (evil-local-set-key 'insert (kbd "\\")
                                 '(lambda ()
                                    (interactive)
                                    (insert "\\")))))

;; begin/end of defun for haskell
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)

;; Haskell remove company mode
(add-hook 'haskell-mode-hook '(lambda () (interactive) (company-mode -1)))

;; Auto insert module declaration for new Haskell files
(add-hook 'find-file-hook 'auto-insert-module-hs)

;; Rust
(add-hook 'rust-mode-hook
          '(lambda ()
             (racer-mode 1)
             ;; (eldoc-mode 1)
             (company-mode 1)
             (local-set-key (kbd "C-,") 'racer-find-definition)))
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; Yasnippet
;; (yas-global-mode 1)

(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))
            (ibuffer-do-sort-by-vc-status)))

(setq ibuffer-formats '((mark modified read-only vc-status-mini
                              " "
                              (name 18 18 :left :elide)
                              " "
                              (size 9 -1 :right)
                              " "
                              (mode 16 16 :left :elide)
                              " "
                              (vc-status 16 16 :left)
                              " "
                              filename-and-process)))

;; Fill-Column Indicator for all files
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode)
(set 'fci-rule-width 2)
(set 'fci-rule-color "red")
(set 'fci-handle-truncate-lines nil)
;; disable for certain modes
(add-hook 'text-mode-hook 'turn-off-fci-mode)
(add-hook 'haskell-mode-hook 'turn-off-fci-mode)
(add-hook 'help-mode-hook 'turn-off-fci-mode)

;; Fill code
(add-hook 'c-mode-common-hook 'fillcode-mode)
(add-hook 'perl-mode-hook 'fillcode-mode)
(add-hook 'shell-script-mode-hook 'fillcode-mode)

;; Rainbow delimeters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Highlight current line
(highlight-current-line-on t)

;; Highlight quoted
(add-hook 'lisp-mode-hook       'highlight-quoted-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)

;; Interactive displaying of arguments to function at point
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;; Paredit
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'toggle-word-wrap)

;; Markdown config
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; zsh scripts are shell scripts
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

;; Use nxml-mode instead of associated ml modes as it is rediculously
;; better.
(mapc (lambda (pair) (if (or (eq (cdr pair) 'xml-mode)
                             (eq (cdr pair) 'sgml-mode)
                             (eq (cdr pair) 'html-mode))
                         (setcdr pair 'nxml-mode)))
      magic-mode-alist)

;; Chrome edit server
(when (daemonp)
  (edit-server-start)
  (message "Edit Server for Chrome up"))

;; Enable extra emacs features
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(add-hook 'after-init-hook 'global-flycheck-mode)

(projectile-global-mode)
(setq projectile-keymap-prefix (kbd "C-c p"))

(global-ede-mode)

(provide 'init-packages)
