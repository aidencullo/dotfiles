;;
;; Configurations
;;

;; Modes

;; disable toolbar mode
(tool-bar-mode -1)

;; enable line numbers mode
(global-display-line-numbers-mode 1)

;; highlight current line
(global-hl-line-mode 1)

;; save history in mini-buffer prompts
(setq history-length 25)
(savehist-mode 1)

;; save place in file
(save-place-mode 1)

;; refresh buffers if file changes on disk
(global-auto-revert-mode 1)

;; setup ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; use spaces for indentation
(setq-default indent-tabs-mode nil)

;; set javascript indent to 2 spaces
(setq js-indent-level 2)

;; Settings

;; refresh non-file buffer if change on disk
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

;; set tab-width across modes
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; C-k kills entire line if at the beginning
(setq kill-whole-line t)

;;
;; Style
;;

;; load Modus Vivendi dark theme
(load-theme 'modus-vivendi t)

;;
;; Key binding
;;

;; f1 fullscreen toggle
(global-set-key (kbd "C-x m") 'toggle-frame-fullscreen)


;;
;; stuff i set in the customize gui
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules"))
 '(package-selected-packages
   '(yasnippet yaml-mode vue-mode use-package typescript-mode swift-mode spinner paredit monokai-theme modus-themes markdown-mode magit lv ht grep-a-lot f expand-region company auto-complete)))

;;
;; packages
;;

;; customize dired presentation
(add-to-list 'load-path "~/.emacs.d/packages/dired-details")
(require 'dired-details)
(setq-default dired-details-hidden-string "------")
(dired-details-install)

;; expand/contract marked region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)
