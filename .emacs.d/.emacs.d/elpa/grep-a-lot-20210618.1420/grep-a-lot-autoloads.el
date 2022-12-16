;;; grep-a-lot-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "grep-a-lot" "grep-a-lot.el" (0 0 0 0))
;;; Generated autoloads from grep-a-lot.el

(autoload 'grep-a-lot-advise "grep-a-lot" "\
Advise a grep-like function FUNC with an around-type advice,
so as to enable multiple search results buffers.

\(fn FUNC)" nil t)

(autoload 'grep-a-lot-setup-keys "grep-a-lot" "\
Define some key bindings for navigating multiple
grep search results buffers." t nil)

(register-definition-prefixes "grep-a-lot" '("grep-a-lot-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; grep-a-lot-autoloads.el ends here
