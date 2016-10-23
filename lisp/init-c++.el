;; (add-hook 'c++-mode 'malinka-mode)

;; /// hi
;; (malinka-define-project
;;  :name "vick"
;;  :root-directory "/home/czipperz/vick"
;;  :build-directory "/home/czipperz/vick"
;;  :configure-cmd "make regen"
;;  :compile-cmd "make -j5"
;;  :test-cmd "make test -j5")

(defun c++-doc-font-lock-one (start end face regex &optional N)
  (goto-char start)
  (while (re-search-forward regex end t)
    (c-put-font-lock-face (match-beginning (if N N 0)) (point) face)))

(defun c++-doc-font-lock-two (start end face1 face2 regex N1 N2)
  "Font lock first regex result with `face1' and next result with `face2'"
  (goto-char start)
  (while (re-search-forward regex end t)
    (c-put-font-lock-face (match-beginning N1) (match-end N1) face1)
    (c-put-font-lock-face (match-beginning N2) (match-end N2) face2)))

(defun c++-doc-font-lock-keywords (start end)
  (c-put-font-lock-face start end 'font-lock-doc-face)
  (save-excursion
    (c++-doc-font-lock-one start end 'font-lock-keyword-face
            (concat "\\([@\\\\]\\(brief\\|li\\|\\(end\\)?code\\|sa"
                    "\\|note\\|\\(end\\)?verbatim\\|return\\|arg\\|fn"
                    "\\|hideinitializer\\|showinitializer\\|\\$"
                    ;; FIXME
                    ;; How do I get & # < > % to work?
                    ;;"\\|\\\\&\\|\\$\\|\\#\\|<\\|>\\|\\%"
                    "\\|internal\\|nosubgrouping\\|author\\|date\\|endif"
                    "\\|invariant\\|post\\|pre\\|remarks\\|since\\|test\\|version"
                    "\\|\\(end\\)?htmlonly\\|\\(end\\)?latexonly\\|f\\$\\|file"
                    "\\|\\(end\\)?xmlonly\\|\\(end\\)?manonly\\|property"
                    "\\|mainpage\\|name\\|overload\\|typedef\\|deprecated\\|par"
                    "\\|addindex\\|line\\|skip\\|skipline\\|until\\|see"
                    "\\|endlink\\|callgraph\\|endcond\\|else\\)\\)\\>"))
    (c++-doc-font-lock-one start end 'font-lock-warning-face
            "\\([@\\\\]\\(attention\\|warning\\|todo\\|bug\\)\\)\\>")
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'font-lock-variable-name-face
            (concat "\\([@\\\\]\\(param\\(?:\\s-*\\["
                    "\\(?:in\\|out\\|in,out\\)\\]\\)?"
                    "\\|namespace\\|relates\\(also\\)?"
                    "\\|var\\|def\\)\\)\\s-+\\(\\sw+\\)") 1 4)
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'font-lock-type-face
            (concat "\\([@\\\\]\\(class\\|struct\\|union\\|exception"
                    "\\|enum\\|throw\\|interface\\|protocol\\)\\)\\s-+"
                    "\\(\\(\\sw\\|:\\)+\\)") 1 3)
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'font-lock-function-name-face
            "\\([@\\\\]retval\\)\\s-+\\([^ \t\n]+\\)" 1 2)
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'bold
            "\\([@\\\\]b\\)\\s-+\\([^ \t\n]+\\)" 1 2)
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'underline
            "\\([@\\\\][cp]\\)\\s-+\\([^ \t\n]+\\)" 1 2)
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'italic
            "\\([@\\\\]\\(e[m]?\\|a\\)\\)\\s-+\\([^ \t\n]+\\)" 1 3)
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'font-lock-string-face
            "\\([@\\\\]ingroup\\)\\s-+\\(\\(\\sw+\\s-*\\)+\\)\\s-*$" 1 2)
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'font-lock-string-face
            (concat "\\([@\\\\]\\(link\\|copydoc\\|xrefitem"
                    "\\|if\\(not\\)?\\|elseif\\)\\)\\s-+"
                    "\\([^ \t\n]+\\)") 1 4)
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'font-lock-string-face
            "\\([@\\\\]\\(cond\\|dir\\)\\(\\s-+[^ \t\n]+\\)?\\)" 1 3)
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'font-lock-string-face
            "\\([@\\\\]\\(~\\)\\([^ \t\n]+\\)?\\)" 1 3)
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'font-lock-string-face
            (concat "\\([@\\\\]\\(example\\|\\(dont\\)?include\\|includelineno"
                    "\\|htmlinclude\\|verbinclude\\)\\)\\s-+"
                    "\\(\"?[~:\\/a-zA-Z0-9_. ]+\"?\\)") 1 4)
    ;; dotfile <file> ["caption"]
    (goto-char start)
    (while (re-search-forward (concat "\\([@\\\\]dotfile\\)\\s-+"
                                      "\\(\"?[~:\\/a-zA-Z0-9_. ]+\"?\\)"
                                      "\\(\\s-+\"[^\"]+\"\\)?")
                              end t)
      (c-put-font-lock-face (match-beginning 1) (match-end 1) 'font-lock-keyword-face)
      (c-put-font-lock-face (match-beginning 2) (match-end 2) 'font-lock-string-face)
      (c-put-font-lock-face (match-beginning 3) (match-end 3) 'font-lock-string-face))
    ;; image <format> <file> ["caption"] [<sizeindication>=<size>]
    (goto-char start)
    (while (re-search-forward
            (concat "\\([@\\\\]image\\)\\s-+\\(html\\|latex\\)\\s-+"
                    "\\(\"?[~:\\/a-zA-Z0-9_. ]+\"?\\)\\(\\s-+\"[^\"]+\"\\)?"
                    "\\(\\s-+\\sw+=[0-9]+\\sw+\\)?") end t)
      (c-put-font-lock-face (match-beginning 1) (match-end 1) 'font-lock-keyword-face)
      (c-put-font-lock-face (match-beginning 2) (match-end 2) 'font-lock-string-face)
      (c-put-font-lock-face (match-beginning 3) (match-end 3) 'font-lock-string-face)
      (c-put-font-lock-face (match-beginning 4) (match-end 4) 'font-lock-string-face)
      (c-put-font-lock-face (match-beginning 5) (match-end 5) 'font-lock-string-face))
    (c++-doc-font-lock-two start end 'font-lock-keyword-face 'font-lock-string-face
            (concat "\\([@\\\\]\\(addtogroup\\|defgroup\\|weakgroup"
                    "\\|page\\|anchor\\|ref\\|section\\|subsection"
                    "\\)\\)\\s-+\\(\\sw+\\)") 1 3)))

(defun c++-doc-font-lock-fun (limit)
  (save-restriction
    (widen)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "[^/]/[*][*!][^*!]" limit t)
        (let ((start-doc (- (point) 4)))
          (re-search-forward "[*]/")
          (c++-doc-font-lock-keywords start-doc (point))))
      (goto-char (point-min))
      (while (re-search-forward "[^/]//[/!][^/!]" limit t)
        ;; ensure highlight correct area for `///' lines
        (let ((distance
               (if (bolp)
                   (progn
                     (backward-char)
                     3)
                 4)))
          (c++-doc-font-lock-keywords (- (point) distance)
                                      (point-at-eol)))))))

(add-hook 'c++-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '((c++-doc-font-lock-fun (0 font-lock-doc-face prepend)))
             'add-to-end)))

;; c++11 full highlighting.
(add-hook
 'c++-mode-hook
 '(lambda ()
    ;; We could place some regexes into `c-mode-common-hook', but note
    ;; that their evaluation order matters.
    (font-lock-add-keywords
     nil '(;; complete some fundamental keywords
           ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
           ;; namespace names and tags - these are rendered as constants by cc-mode
           ("\\<\\(\\w+::\\)" . font-lock-function-name-face)
           ;;  new C++11 keywords
           ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
           ("\\<\\(char16_t\\|char32_t\\)\\>" . font-lock-keyword-face)
           ;; PREPROCESSOR_CONSTANT, PREPROCESSORCONSTANT
           ("\\<[A-Z]*_[A-Z_]+\\>" . font-lock-constant-face)
           ("\\<[A-Z]\\{3,\\}\\>"  . font-lock-constant-face)
           ;; hexadecimal numbers
           ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
           ;; integer/float/scientific numbers
           ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
           ;; c++11 string literals
           ;;       L"wide string"
           ;;       L"wide string with UNICODE codepoint: \u2018"
           ;;       u8"UTF-8 string", u"UTF-16 string", U"UTF-32 string"
           ("\\<\\([LuU8]+\\)\".*?\"" 1 font-lock-keyword-face)
           ;;       R"(user-defined literal)"
           ;;       R"( a "quot'd" string )"
           ;;       R"delimiter(The String Data" )delimiter"
           ;;       R"delimiter((a-z))delimiter" is equivalent to "(a-z)"
           ("\\(\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\)" 1 font-lock-keyword-face t) ; start delimiter
           (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\(.*?\\))[^\\s-\\\\()]\\{0,16\\}\"" 1 font-lock-string-face t)  ; actual string
           (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(.*?\\()[^\\s-\\\\()]\\{0,16\\}\"\\)" 1 font-lock-keyword-face t) ; end delimiter

           ;; user-defined types (rather project-specific)
           ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(type\\|ptr\\)\\>" . font-lock-type-face)
           ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)))) t)

(provide 'init-c++)
