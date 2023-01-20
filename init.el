;; package installation

(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-mode 'both nil (ido))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(auto-complete compat git-commit magit-section transient with-editor expand-region yasnippet monokai-theme grep-a-lot paredit magit company ##))
 '(uniquify-buffer-name-style 'post-forward nil (uniquify)))

;; install indicated packages
(package-install-selected-packages)

(require 'use-package)

;;
;; Setting Values
;;

;;This variable determines whether the debugger is called when an error is signaled and not handled
(setq debug-on-error t)

;; initialize grep-a-lot
(grep-a-lot-setup-keys)

;; adding absolute line numbers
(global-linum-mode)
;; adding relative line numbers
(setq-default display-line-numbers 'relative)

;; inhibit tutorial screen upon opening emacs
(setq inhibit-startup-screen t)

;; store backups and autosaves in .emacs.d
;; ~/.emacs.d/.autosaves needs to exist
(setq backup-directory-alist `(("." . "~/.emacs.d/.backups"))
      auto-save-file-name-transforms `((".*", "~/.emacs.d/.autosaves/\\1" t)))

;; pretty startup screen
(fancy-startup-screen)
(put 'erase-buffer 'disabled nil)

;;set monokai theme
(load-theme 'monokai t)

;;
;; Key Bindings
;;

;; f1 fullscreen toggle
(global-set-key (kbd "C-x m") 'toggle-frame-fullscreen)

;;
;; Hooks
;;

;; autofill hool on text mode
(add-hook 'text-mode-hook 'auto-fill-mode)

;;manual installed packages
(add-to-list 'load-path (concat user-emacs-directory "packages/" ))
(load "iy-go-to-char")

;; reload buffers updated on the disk by another program
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; loading snippets
(require 'yasnippet)
(setq yas-snipper-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;; on macOS, ls doesn't support the --dired 
(when (string= system-type "darwin")       
  (setq dired-use-ls-dired nil))

;; open in fullscreen mode
(toggle-frame-fullscreen)

;; binding list-packages to C-x p
(global-set-key (kbd "C-x p") 'list-packages)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; newline automatically indents
(global-set-key "\C-m" 'newline-and-indent)

(global-set-key (kbd "C-x C-r") 'replace-line)

;;
;; MACROS
;;

(fset 'replace-line
      (kmacro-lambda-form [?\C-y ?\C-k ?\C-k ?\C-p] 0 "%d"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; typescript setup
;; check for nativejson support
(if (functionp 'json-serialize)
    (message "Native JSON is available")
  (message "Native JSON is *not* available"))

;; install of tide

(use-package tide :ensure t)
(use-package company :ensure t)
(use-package flycheck :ensure t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; enable typescript - tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; autocomplete

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))
