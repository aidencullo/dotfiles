(package-initialize)

(require 'grep-a-lot)
(grep-a-lot-setup-keys)


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
   '(expand-region yasnippet floobits monokai-theme grep-a-lot paredit magit company ##))
 '(uniquify-buffer-name-style 'post-forward nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;
;; Setting Values
;;

;; adding absolute line numbers
(global-linum-mode)
;; adding relative line numbers
(setq-default display-line-numbers 'relative)

;;
;; Key Mappings
;;

;; inhibit tutorial screen upon opening emacs
(setq inhibit-startup-screen t)


;; store backups and autosaves in .emacs.d
;; ~/.emacs.d/.autosaves needs to exist
(setq backup-directory-alist `(("." . "~/.emacs.d/.backups"))
      auto-save-file-name-transforms `((".*", "~/.emacs.d/.autosaves/\\1" t)))

;; pretty startup screen
(fancy-startup-screen)
(put 'erase-buffer 'disabled nil)

;; f1 fullscreen toggle
(global-set-key (kbd "C-x m") 'toggle-frame-fullscreen)

;; autofill hool on text mode
(add-hook 'text-mode-hook 'auto-fill-mode)

;;set monokai theme
(load-theme 'monokai t)


;;manual installed packages
(add-to-list 'load-path (concat user-emacs-directory "packages/" ))
(load "iy-go-to-char")

;;This variable determines whether the debugger is called when an error is signaled and not handled
(setq debug-on-error t)

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

(global-set-key "\C-m" 'newline-and-indent)
