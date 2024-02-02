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
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; When you want to add multiple cursors not based on continuous lines, but based on
;; keywords in the buffer, use:
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; (autoload 'yasnippet "yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; enable repeat-mode
(repeat-mode 1)

;; enable flymake-mode (minor)
;; goal here is to convert this to use-package
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
;; (flymake-mode 1)
;; (define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
;; (define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)

;; this still works -- still pretty unsure about requires
;; (require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'er/contract-region)

;; enable repeat-mode
(keycast-mode-line-mode 1)

;; double check this
(use-package lorem-ipsum
  :bind (("C-c C-l s" . lorem-ipsum-insert-sentences)
         ("C-c C-l p" . lorem-ipsum-insert-paragraphs)
         ("C-c C-l l" . lorem-ipsum-insert-list)))
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
   '(go-mode flycheck yaml-mode py-autopep8 lorem-ipsum keycast elpy multiple-cursors company paredit restclient expand-region exec-path-from-shell helpful magit auto-complete use-package typescript-mode))
 '(virtualenv-root "~"))

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
  (forward-word)
  (backward-word)
  (set-mark-command nil)
  (search-forward ")")
  (set-mark-command nil)
  (search-backward "(")
  (forward-word)
  (backward-word)
  (set-mark-command nil)
  (search-forward ",")
  (set-mark-command nil)
  (transpose-regions 0)
  )

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
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(defalias 'testingmacroooooo
  (kmacro "d o SPC n o t h i n g"))
(defalias 'format-arrays
  (kmacro "M-% : <return> SPC = SPC <return> ! M-{ M-% SPC 0 . <return> , SPC 0 . <return> ! M-{ M-% SPC - . <backspace> 0 . <return> , SPC 0 <backspace> - 1 <backspace> 0 . <return> ! M-{ M-% ] <return> ] , <return> !"))

(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file "~/.emacs.d/init.el")))
(defalias 'change-names
  (kmacro "C-s m u M-b M-l C-s v a r M-b M-l C-s p M-b M-l C-s o u t M-b C-x C-; M-f _ c o r r e c t C-s l l M-b C-k C-y C-y C-p M-f C-<backspace> l _ c o r r e c t"))
(defalias 'convert-to-np
  (kmacro "C-s K <return> C-p C-e <backspace> <return> X SPC = SPC X . <backspace> <backspace> n p . a s a r r a y ( X ) <return> C-n C-e <return> C-s v a r <return> C-p C-e <backspace> <return> m u SPC = SPC n p . a s a r r a y ( m u ) <return> C-s p <return> C-p C-e <backspace> <return> v a r SPC = SPC v a r . <backspace> <backspace> <backspace> <backspace> n p . a s a r r a y ( ) <backspace> v a r ) C-x C-s C-s p o s t C-p C-p C-e <backspace> <return> p SPC = SPC p <backspace> n p . a r a r r a y <backspace> <backspace> <backspace> <backspace> <backspace> <backspace> s a r r a y ( p ) <return> C-s l l C-p C-e <backspace> <return> p o M-/ SPC = SPC p o s M-/ C-<backspace> C-<backspace> n p . a s a r r a y ( ) C-b p o M-/ C-x C-s C-e <return> C-x C-s"))

(add-hook 'text-mode-hook 'whitespace-mode)

(global-set-key (kbd "C-x p") #'other-other-window)

(defun other-other-window ()
  "Run `negative-argument' and `other-window' in sequence."
  (interactive)
  (other-window -1))


(defun my-python-shell-run ()
  (interactive)
  (python-shell-send-buffer))

(defun my-python-shell-rerun ()
  (interactive)
  (set-buffer python-target)
  (my-python-shell-run))

(eval-after-load "python"
  '(progn
     (print "evaluating python mode")
     (define-key python-mode-map (kbd "C-c C-c") 'my-python-shell-run)
     (define-key python-mode-map (kbd "C-c C-r") 'my-python-shell-rerun)))

(defun my-python-shell-run ()
  (interactive)
  (progn
    (python-shell-restart)
    (sleep-for 0.5)
    (python-shell-send-buffer))
  (setq python-target (current-buffer)))

(defun after-run-python (&rest _)
  "Switch windows after running python."
  (other-window 1))

;; stay on current window
(advice-add 'run-python :after 'after-run-python)

;; install use-package if not installed
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; idk
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; untested
(add-hook 'company-mode 'python-mode )

;; untested i believe
(use-package company
  :ensure t
  :pin gnu
  :hook python-mode)

;; hook saving file here
(defun aiden/repeat-last-shell-command (&rest r)
  "Search and repeat last shell command."
  (interactive)
  (shell-command (cadr (assoc 'shell-command command-history))))

(global-set-key (kbd "C-c r") 'aiden/repeat-last-shell-command)

(advice-add 'aiden/repeat-last-shell-command :before 'save-buffer)

(use-package py-autopep8
  :hook ((python-mode) . py-autopep8-mode))

;; (add-hook
;;  'python-mode
;;  '(lambda () (setq python-interpreter "python3")))
