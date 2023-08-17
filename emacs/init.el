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

;; turn on auto-fill mode for all text buffers
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
;; turn on auto-fill mode in all major modes
(setq-default auto-fill-function 'do-auto-fill)

;; hooks

;; hook embedded ruby into web-mode
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;;
;; Settings
;;

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

;; set javascript indent to 2 spaces
(setq js-indent-level 2)

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
;; packages
;;

;; manual

;; i don't have any manual packages currently -- so i commented this out
;; (add-to-list 'load-path (concat user-emacs-directory "packages/" ))
;; need to reinstall this manually
;; customize dired presentation
;; (add-to-list 'load-path "~/.emacs.d/packages/dired-details")
;; (require 'dired-details)
;; (setq-default dired-details-hidden-string "------")
;; (dired-details-install)

;; system

;; expand/contract marked region
;; (require 'expand-region)
;; (global-set-key (kbd "C-=") 'er/expand-region)
;; (global-set-key (kbd "C--") 'er/contract-region)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (use-package auto-complete
;;   :ensure t
;;   :init
;;   (progn
;;     (ac-config-default)
;;     (global-auto-complete-mode t)
;;     ))

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(multiple-cursors lsp-mode magit auto-complete vue-mode use-package typescript-mode)))

;; save backups in a special dir
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

;; idk if works
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; untested
;; When you want to add multiple cursors not based on continuous lines, but based on
;; keywords in the buffer, use:

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; autosaves
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/autosaves/" t)))

;; kill all buffers in a session
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  ;; (load-file "~/.emacs.d/init.el")
  (about-emacs)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  )

;; full screen on start-up
(add-hook 'after-init-hook 'toggle-frame-fullscreen)
