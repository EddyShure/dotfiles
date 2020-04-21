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

;; Requires use-package
(eval-when-compile (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Loads configuration .org file
(require 'org)
(org-babel-load-file 
  (expand-file-name (concat user-emacs-directory "configuration.org")))

;; Loads private configuration files
(org-babel-load-file
 (expand-file-name "~/dotfiles/private/emacs/mu4e-contexts.org"))
(org-babel-load-file
 (expand-file-name "~/dotfiles/private/emacs/rss-feeds.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" default)))
 '(org-agenda-files (quote ("~/org/wallpen.org" "~/org/gtd.org")))
 '(package-selected-packages
   (quote
    (request-deferred request evil use-package diminish))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
