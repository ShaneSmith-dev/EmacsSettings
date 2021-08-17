;; basic UI setup
(menu-bar-mode -1)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Set up packages
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
;; do this on some sort of daily or weekly time point?
;; such that melpa and stuff could still be reachable if not used in a long time
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-verbose t)
(setq inhibit-startup-message t)
(setq inhibit-startup-buffer-menu t)
(setq inhibit-startup-screen t)

(require 'use-package)
(setq use-package-always-ensure t)

;; Set up ivy mode
(use-package ivy
  :ensure t)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

;; Setting up Magit
(use-package magit)
(global-set-key (kbd "C-x g") 'magit-status)

(global-display-line-numbers-mode) ; Set up line numbers

;; Projectile, a project manager for emacs
(use-package projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
(setq projectile-indexing-method 'alien)
(setq projectile-project-search-path '("~/.emacs.d" "~/ControlRepos" "~/agenda"))

;; Load from additional files
(load-file "~/.emacs.d/themes.el")
(load-file "~/.emacs.d/org-settings.el")

;; Py-Jira setup
(load "~/ControlRepos/py_jira/init-jira.el")

;; Custom Key Bindings TODO: Split this up among the other files, or its own file?
;; TODO: Group all key bindings spread throughout this file
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda) ; TODO: Is this a conflict with the F12 key?
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture) ; I use C-c c to start capture mode
(global-set-key (kbd "<f9> I") 'bh/punch-in) ; This is a specific punch in function
(global-set-key (kbd "<f9> O") 'bh/punch-out) ; This is a specific punch out function
(global-set-key (kbd "<f11>") 'org-clock-goto) ; Goto running clock

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode projectile org-id magit counsel all-the-icons-ivy neotree doom-themes org modus-vivendi-theme helm gnu-elpa))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
