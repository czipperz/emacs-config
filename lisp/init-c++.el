(add-hook 'c++-mode 'malinka-mode)

(malinka-define-project
 :name "vick"
 :root-directory "/home/czipperz/vick"
 :build-directory "/home/czipperz/vick"
 :configure-cmd "make regen"
 :compile-cmd "make -j5"
 :test-cmd "make test -j5")
