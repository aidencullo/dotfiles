;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Major/Minor modes
;;

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

;; do i need this tho??? the require -- how to check if it is already loaded?
;; (require 'rspec-mode)
;; use current shell env variables (needed for ruby version)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; maybe move this somewhere else?
;; (require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; When you want to add multiple cursors not based on continuous lines, but based on
;; keywords in the buffer, use:
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; (autoload 'yasnippet "yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; this still works -- still pretty unsure about requires
;; (require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Hooks
;;

;; hook embedded ruby into web-mode
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;; full screen on start-up
(add-hook 'after-init-hook 'toggle-frame-fullscreen)

;; to re-run specs in dired
(add-hook 'dired-mode-hook 'rspec-mode)
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Settings
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

;; don't prompt when following symlinks
(setq vc-follow-symlinks t)

;; autosaves
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/autosaves/" t)))

;; save backups in a special dir
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

;; for python inferior process
(setq python-shell-completion-native-disabled-interpreters
      '("python3"))

;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Style
;;

;; load Modus Vivendi dark theme
(load-theme 'modus-vivendi t)

;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Key Bindings
;;

;; f1 fullscreen toggle
(global-set-key (kbd "C-x m") 'toggle-frame-fullscreen)

;; kill all current buffers
(global-set-key (kbd "C-c z") 'kill-other-buffers)

;; re-assign backward-delete-word to delete non-word chars up to next
;; word or just a word
(global-set-key (kbd "M-DEL") 'backward-kill-word-or-chars)

;; indent file
;; (global-set-key (kbd "C-M-/") (lambda () (interactive) (mark-whole-buffer) (indent-region)))

;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Custom
;;

;; kill all buffers in a session
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  ;; (load-file "~/.emacs.d/init.el")
  (mapc 'kill-buffer (delq () (buffer-list)))
  (about-emacs)
  )

(defun backward-kill-word-or-chars ()
  "Delete the character or word before point."
  (interactive)
  (if (looking-back "\\w" 1)
      (backward-kill-word 1)
    (backward-kill-all-char)))

(defun backward-kill-all-char ()
  "Delete the character or word before point."
  (interactive)
  (while (not (looking-back "\\w" 1))
    (backward-delete-char 1)))

;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Packages
;;

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
;; (require 'package)
(
 add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do his.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company paredit restclient expand-region exec-path-from-shell helpful magit auto-complete use-package typescript-mode)))

;; manually installing packages
(add-to-list 'load-path (concat user-emacs-directory "packages/" ))
(load "iy-go-to-char")
(load "rspec-mode")

;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun save-line ()
  "comment then copy current line."
  (interactive)
  (kill-line)
  (yank)
  (previous-line)
  (comment-line 1)
  (yank)
  (previous-line))

(defun transpose-arguments ()
  "transpose arguments in function signature."
  (interactive)
  (search-forward "thing"))

(defun copy-line ()
  "transpose arguments in function signature."
  (interactive)
  (kill-line)
  (yank))

;; Make dired less verbose
;; (require 'dired-details)
;; (setq-default dired-details-hidden-string "--- ")
;; (dired-details-install)

(global-set-key (kbd "C-x 4 o") 'window-swap-states)
(global-set-key (kbd "C-c k") 'save-line)
(global-set-key (kbd "C-c l") 'copy-line)

;; helpful package
;; Note that the built-in `describe-function' includes both functions
;; and macros. `helpful-function' is functions only, so we provide
;; `helpful-callable' as a drop-in replacement.
(global-set-key (kbd "C-h f") #'helpful-callable)

(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-h x") #'helpful-command)
;; Lookup the current symbol at point. C-c C-d is a common keybinding
;; for this in lisp modes.
(global-set-key (kbd "C-c C-d") #'helpful-at-point)

;; Look up *F*unctions (excludes macros).
;;
;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
;; already links to the manual, if a function is referenced there.
(global-set-key (kbd "C-h F") #'helpful-function)

;; paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; (defun python-shell-resend-buffer ()
;;   "resend last buffer to python shell"
;;   (interactive)
;;   ;; (python-shell-restart)
;;   (python-shell-send-file "~/6.86/unit4/proj4/netflix/main.py"))

;; (add-hook 'python-mode
;;           (lambda () (local-set-key (kbd "C-c C-r") #'python-shell-resend-buffer)))

(defalias 'testingmacroooooo
   (kmacro "d o SPC n o t h i n g"))
(defalias 'format-arrays
   (kmacro "M-% : <return> SPC = SPC <return> ! M-{ M-% SPC 0 . <return> , SPC 0 . <return> ! M-{ M-% SPC - . <backspace> 0 . <return> , SPC 0 <backspace> - 1 <backspace> 0 . <return> ! M-{ M-% ] <return> ] , <return> !"))

(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file "~/.emacs.d/init.el")))
