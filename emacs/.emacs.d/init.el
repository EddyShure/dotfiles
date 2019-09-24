(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Sets up package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Installs use-package, if not already installed
(unless (or (package-installed-p 'use-package)
            (package-installed-p 'diminish))
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'diminish))

;; 
(eval-when-compile
  (require 'use-package))
; (require 'diminish)
(require 'bind-key)

;; Loads conifguration .org file
(require 'org)
(org-babel-load-file (expand-file-name (concat user-emacs-directory "configuration.org")))
(org-babel-load-file (expand-file-name "~/dotfiles/private/emacs/mu4e-contexts.org"))
(org-babel-load-file (expand-file-name "~/dotfiles/private/emacs/rss-feeds.org"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   (quote
    ("2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(deft-directory "~/org/zettelkasten")
 '(deft-extensions (quote ("org" "md" "txt")))
 '(org-agenda-files
   (quote
    ("~/uni/canvas.org" "~/org/wallpen.org" "~/org/birthdays.org" "~/org/gtd.org" "~/uni/index.org")))
 '(package-selected-packages
   (quote
    (bbdb gruvbox-theme company lispy company-mode evil-surround evil use-package diminish)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#282828"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:foreground "#586e75" :weight bold))))
 '(org-level-1 ((t (:inherit variable-pitch :foreground "#cb4b16")))))
