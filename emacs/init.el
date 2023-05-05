;; 
;; Loading Packages
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules"))
 '(ido-mode 'both nil (ido))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(yaml-mode magit-section expand-region magit ##))
 '(uniquify-buffer-name-style 'post-forward nil (uniquify)))

;; install indicated packages
(package-initialize) ;; what is this doing exactly?

;; loading packages if they haven't already been loaded
(require 'use-package)
(require 'expand-region)

;;
;; Autosaves
;;

;; store backups and autosaves in .emacs.d
;; ~/.emacs.d/.autosaves needs to exist
(setq backup-directory-alist `(("." . "~/.emacs.d/.backups"))
      auto-save-file-name-transforms `((".*", "~/.emacs.d/.autosaves/\\1" t)))

;;
;; Configurations
;;

;; disable toolbar mode
(tool-bar-mode -1)

;; enable line numbers mode
(global-display-line-numbers-mode 1)

;; highlight current line
(hl-line-mode 1)

;; turn blinking cursor off
(blink-cursor-mode -1)

;; save history in mini-buffer prompts
(setq history-length 25)
(savehist-mode 1)

;; save place in file
(save-place-mode 1)

;; refresh buffers if file changes on disk
(global-auto-revert-mode 1)

;; refresh buffers if file changes on disk
(setq global-auto-revert-non-file-buffers t)

;; pretty startup screen
(fancy-startup-screen)

;; adding relative line numbers
(setq-default display-line-numbers 'relative)

;; inhibit tutorial screen upon opening emacs
(setq inhibit-startup-screen t)

;; stop asking before following symlink
(setq vc-follow-symlinks t)

;; flash when bell rings
(setq visible-bell t)

;; style

;; load Modus Vivendi dark theme
(load-theme 'modus-vivendi t)

;;
;; Key Bindings
;;

;; f1 fullscreen toggle
(global-set-key (kbd "C-x m") 'toggle-frame-fullscreen)

;; expand region
(global-set-key (kbd "C-=") 'er/expand-region)
