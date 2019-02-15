(require 'cc-mode)
(require 'clang-format)
;; (require 'cmake-ide)
(require 'cmake-mode)
(require 'cpputils-cmake)

(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(setq c-default-style '((awk-mode . "awk")
			(other . "java")))
(c-set-offset 'innamespace 0)
(c-set-offset 'label (vector 0))
(c-set-offset 'inextern-lang 0)
(c-set-offset 'topmost-intro-cont 0)
(setq-default c-offsets-alist c-offsets-alist)
;; (require 'rtags)
;; (cmake-ide-setup)
(add-hook 'c-mode-common-hook
          (lambda ()
            (if (derived-mode-p 'c-mode 'c++-mode)
                (cppcm-reload-all))))
(setq cppcm-write-flymake-makefile nil)

(require 'counsel-etags)
(define-key c-mode-map (kbd "M-.") #'counsel-etags-find-tag-at-point)
(define-key c++-mode-map (kbd "M-.") #'counsel-etags-find-tag-at-point)
(define-key c-mode-map (kbd "C-.") #'counsel-etags-find-tag)
(define-key c++-mode-map (kbd "C-.") #'counsel-etags-find-tag)

(define-key c-mode-map (kbd "C-c C-f") #'clang-format-buffer)
(define-key c++-mode-map (kbd "C-c C-f") #'clang-format-buffer)

(defun auto-insert-main-c ()
  "Auto insert main function for c/c++."
  (interactive)
  (insert "int main(int argc, char** argv) {\n\n}\n")
  (forward-line -2)
  (indent-for-tab-command))

(defun auto-include-header-cc ()
  "Auto include header for `*.cc' files."
  (when (and (stringp buffer-file-name)
             (string-match "\\.cc\\'" buffer-file-name)
             (equal (buffer-size) 0))
    (let ((buf (file-name-nondirectory buffer-file-name)))
      (if (string= buf "main.cc")
          (auto-insert-main-c)
        (insert "#include \""
                (substring buf 0 (- (length buf) 3))
                ".hh\"\n\n")))))

(defun auto-include-header-c ()
  "Auto include header for `*.c' files."
  (when (and (stringp buffer-file-name)
             (string-match "\\.c\\'" buffer-file-name)
             (equal (buffer-size) 0))
    (let ((buf (file-name-nondirectory buffer-file-name)))
      (if (string= buf "main.c")
          (auto-insert-main-c)
        (insert "#include \""
                (substring buf 0 (- (length buf) 2))
                ".h\"\n\n")))))

(defun auto-insert-header-guard-hh ()
  "Auto insert header guard for `*.hh' files."
  (interactive)
  (when (and (stringp buffer-file-name)
             (string-match "\\.hh\\'" buffer-file-name)
             (equal (buffer-size) 0))
    (let ((buf (file-name-nondirectory buffer-file-name)))
      (let ((i (concat (substring (upcase buf) 0
                                  (- (length buf) 3))
                       "_H")))
        (insert (format "#pragma once

#ifndef HEADER_GUARD_%s
#define HEADER_GUARD_%s



#endif
"
                        i i))
        (forward-line -3)))))

(defun auto-insert-header-guard-h ()
  "Auto insert header guard for `*.h' files."
  (interactive)
  (when (and (stringp buffer-file-name)
             (string-match "\\.h\\'" buffer-file-name)
             (equal (buffer-size) 0))
    (let ((buf (file-name-nondirectory buffer-file-name)))
      (let ((i (concat (substring (upcase buf) 0
                                  (- (length buf) 2))
                       "_H")))
        (insert (format "#pragma once

#ifndef HEADER_GUARD_%s
#define HEADER_GUARD_%s

#ifdef __cplusplus
extern \"C\" {
#endif



#ifdef __cplusplus
}
#endif

#endif
"
                        i i))
        (forward-line -7)))))
