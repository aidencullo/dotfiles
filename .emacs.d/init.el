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
 '(package-selected-packages '(grep-a-lot paredit magit company ##))
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
(global-set-key [f1] 'toggle-frame-fullscreen)

;; autofill hool on text mode
(add-hook 'text-mode-hook 'auto-fill-mode)
