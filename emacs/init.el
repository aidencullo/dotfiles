;; enable line numbers mode
(global-display-line-numbers-mode 1)

;; save history in mini-buffer prompts
(setq history-length 25)
(savehist-mode 1)

;; refresh buffers if file changes on disk
(global-auto-revert-mode 1)

;; maybe move this somewhere else?
(require 'multiple-cursors)

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

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'er/contract-region)

;; show last key-binding used
(keycast-mode-line-mode 1)

;; insert lorem ipsum
(use-package lorem-ipsum
  :bind (("C-c C-l s" . lorem-ipsum-insert-sentences)
         ("C-c C-l p" . lorem-ipsum-insert-paragraphs)
         ("C-c C-l l" . lorem-ipsum-insert-list)))

;; full screen on start-up
(add-hook 'after-init-hook 'toggle-frame-fullscreen)

;; to re-run specs in dire
;; (add-hook 'dired-mode-hook 'rspec-mode)

;; inhibit tutorial screen upon opening emacs
;; (setq inhibit-startup-screen t)

;; stop asking before following symlink
(setq vc-follow-symlinks t)

;; flash when bell rings
(setq visible-bell t)

;; C-k kills entire line if at the beginning
(setq kill-whole-line t)

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

(load-theme 'modus-vivendi t)

(global-set-key (kbd "C-x m") 'toggle-frame-fullscreen)
(global-set-key (kbd "M-<backspace>") 'backward-kill-word-or-chars)

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

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; melpa
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
   '(marginalia vertico go-mode flycheck yaml-mode py-autopep8 lorem-ipsum keycast elpy multiple-cursors company paredit restclient expand-region exec-path-from-shell helpful magit auto-complete use-package typescript-mode))
 '(virtualenv-root "~"))

;; manually installing packages
(add-to-list 'load-path (concat user-emacs-directory "packages/" ))
(load "rspec-mode")

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

;; open emacs source file
(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file
                                                     "~/.emacs.d/init.el")))

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

;; hook saving file here
(defun aiden/repeat-last-shell-command (&rest r)
  "Search and repeat last shell command."
  (interactive)
  (shell-command (cadr (assoc 'shell-command command-history))))

(global-set-key (kbd "C-c r") 'aiden/repeat-last-shell-command)

(advice-add 'aiden/repeat-last-shell-command :before 'save-buffer)

(add-hook 'dired-mode-hook #'dired-hide-details-mode)

;; vertico
(vertico-mode 1)
;; marginalia
(marginalia-mode 1)

;; move file to trash on delete instead of permanent delete
(setq delete-by-moving-to-trash t)
