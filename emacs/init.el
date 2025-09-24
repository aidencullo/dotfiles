;; Follow symlinks to version-controlled files without prompting
(setq vc-follow-symlinks t)
;; Tangle and load Emacs config from config.org in user-emacs-directory
(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))
