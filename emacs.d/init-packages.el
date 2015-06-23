;;; Install packages
(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)
(push '("melpa" . "http://elpa.gnu.org/packages/") package-archives)
(package-initialize)

(provide 'init-packages)
