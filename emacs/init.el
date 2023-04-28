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
   '(auto-complete magit-section expand-region magit ##))
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

;; adding absolute line numbers
(global-linum-mode)

;; adding relative line numbers
(setq-default display-line-numbers 'relative)

;; inhibit tutorial screen upon opening emacs
(setq inhibit-startup-screen t)

;; pretty startup screen
(fancy-startup-screen)
(put 'erase-buffer 'disabled nil)

;; stop asking before following symlink
(setq vc-follow-symlinks t)

;;
;; Key Bindings
;;

;; f1 fullscreen toggle
(global-set-key (kbd "C-x m") 'toggle-frame-fullscreen)

;; open in fullscreen mode
(toggle-frame-fullscreen)

;; Enable transient mark mode
(transient-mark-mode 1)

;; expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; autocomplete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
   ))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
