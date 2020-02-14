
(require 'org)

(global-set-key (kbd "<f12>") 'org-agenda)

(menu-bar-mode 1) ;; removes the file, edit, options menu bar at the top of the screen

(ido-mode t) ;; turns on auto complete when searching for file and directories using C-x C-f


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(org-agenda-files
   (quote
    ("~/agenda/work.org" "~/agenda/time_off.org" "~/agenda/refile.org" "~/agenda/prof_dev.org" "~/agenda/prod_support.org" "~/agenda/proc_imp.org" "~/agenda/notes.org" "~/agenda/meetings.org" "~/agenda/hed_od.org" "~/agenda/genesis_od.org" "~/agenda/email.org" "~/agenda/contacts.org"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; This sets compact-blocks to false, so I have the dividing lines
(setq org-agenda-compact-blocks nil)

;; This builds a custom agenda view, set up to trigger with the spacebar, " " and having REFILE
;; right below the week agenda. That is followed by tasks, then a section for notes. 
(setq org-agenda-custom-commands
      (quote ((" " "Agenda"
	       ((agenda "" nil)
		(tags "REFILE"
		      ((org-agenda-overriding-header "Task to Refile")
		       (org-tags-match-list-sublevels nil)))
		(tags-todo "-REFILE-CANCELLED-WAITING-HOLD-Notes/!"
			   ((org-agenda-overriding-header "Standalone Tasks")
			    (org-agenda-sorting-strategy 
			     '(category-keep))))
		(tags-todo "Notes"
			    ((org-agenda-overriding-header "Notes")
			     (org-agenda-sorting-strategy
			      '(category-keep))))
		nil)))))




















;; from origina .emacs within .emacs.d directory

;; (load "~/.emacs.d/bootstrap.el")
;; (setq debug-on-error t)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  ;; '(ansi-color-names-vector
;;  ;;   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
;;  ;; '(custom-safe-themes
;;  ;;   (quote
;;  ;;    ("f3d7f3fa87599c7dab9831897cb2beaf154c5004c2165d3190f75c1e437e0ac0" "f45bec95b92fd078dc02d287dce9ea1d78dfbdf8d93efc1c9c1c65329918fd69" "5123c9097bebe70b7a383b3b647d20b297658e5af1c8490fec2e23785ae5efa5" "de5df43797c4f7ea5c084cc2a347f72d8c02f40e7ec57b546c9ba2488f63b6d0" "9da1fcd675811055215aee8f895133c3796d3a1b85d8bf446abce9b206af7e7f" "ba8c9e413b8957fba2a31e2d7526757652908c09b3e52b554dcaf1e56570a790" "b569acb29cc6fd204f3bd5e83310980907eaaf60964122fc6f244b766d0654ea" "f9dcddb24150d392239832f003cacc3ea153ebae352af936d5dc3d8bb58d2d88" "37dac9ac506d73d247dfc7b85651176170c63c744a687e62bdfefc59d4151128" default)))
;; ;;  '(inhibit-default-init nil)
;; ;;  '(inhibit-startup-buffer-menu t)
;; ;;  '(inhibit-startup-screen t)
;; ;;  '(jira-url "https://controlsjira.altec.com")
;; ;;  '(package-selected-packages (quote (rudel org))))
;; ;; (custom-set-faces
;; ;;  ;; custom-set-faces was added by Custom.
;; ;;  ;; If you edit it by hand, you could mess it up, so be careful.
;; ;;  ;; Your init file should contain only one such instance.
;; ;;  ;; If there is more than one, they won't work right.
;; ;;  )

;; (setq org-agenda-files
;;       (list 
;;        (concat agenda-path "email.org")
;;        (concat agenda-path "prof_dev.org")
;;        (concat agenda-path "proc_imp.org")
;;        (concat agenda-path "time_off.org")
;;        (concat agenda-path "prod_support.org")
;;        (concat agenda-path "genesis_od.org")
;;        (concat agenda-path "hed_od.org")
;;        (concat agenda-path "refile.org")
;;        (concat agenda-path "contacts.org")
;;        (concat agenda-path "notes.org")
;;        (concat agenda-path "meetings.org")
;;        (concat agenda-path "work.org")))


;; (setq-default cursor-type 'box)
;; (set-cursor-color "#ffffff")

;; (setenv "PATH"
;;         (concat "C:\\cygwin64\\bin;" (getenv "PATH")))


;; (require 'package) ;; You might already have this line
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


;; ;(add-to-list 'package-archives
;; ;             '("melpa" . "https://melpa.org/packages/"))
;; ; (when (< emacs-major-version 24)
;; ;  ;; For important compatibility libraries like cl-lib
;; ;  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;; ;(package-initialize) ;; You might already have this line

;; ;(add-to-list 'package-archives
;; ;            '("melpa-stable" . "https://stable.melpa.org/packages/") t)



;; (defun revert-buffer-no-confirm ()
;;   "Revert buffer without a confirmation."
;;   (interactive)
;;   (revert-buffer t t))
;; (global-set-key "\C-cr" 'revert-buffer-no-confirm)

;; 

;; (setq indent-tabs-mode t)
;; (setq c-default-style "linux"
;;       c-basic-offset 2)

;; (setq tab-width 2)

;; (load (concat emacs-d-folder "org-habit.el"))
;; (load (concat emacs-d-folder "norang.el"))
;; (load (concat emacs-d-folder "tlc.el"))
;; (load (concat emacs-d-folder "blankmode.el"))
;; (setq abbrev-file-name (concat emacs-d-folder "abbrev_defs.el"))
;; (setq save-abbrevs t)

;; (defun my-tabify ()
;;   "tabify the buffer for certain file types"
;;   (interactive)
;;   (when (stringp mode-name)
;;     (cond
;;      ((or (string= (substring mode-name 0 (min 2 (length mode-name))) "C/")
;;           (string= (substring mode-name 0 (min 4 (length mode-name))) "C++/")
;;           (string= (substring mode-name 0 (min 6 (length mode-name))) "Python"))
;;       (message "tabifying buffer before save")
;;       (save-excursion
;;         (tabify (point-min) (point-max)))
;;       )
;;      ((or (string= (substring mode-name 0 (min 7 (length mode-name))) "Haskell")
;;           (string= (substring mode-name 0 (min 10 (length mode-name))) "Emacs-Lisp"))
;;       (message "untabifying buffer before save")
;;       (save-excursion
;;         (untabify (point-min) (point-max)))
;;       )
;;       ((or (string= (substring mode-name 0 (min 3 (length mode-name))) "SQL")
;;            (string= (substring mode-name 0 (min 3 (length mode-name))) "sql"))
;;        (message "untabifying buffer before save")
;;        (save-excursion
;;          (untabify (point-min) (point-max))
;;          (sqlup-capitalize-keywords-in-region (point-min) (point-max)))
;;        )
;;       )
;;      ))

;; (setq tabify-regexp "^\t* [ \t]+")
;; (add-hook 'before-save-hook 'my-tabify)

;; ;(add-hook 'python-mode-hook
;; ;          (lambda ()

;; ;           (setq indent-tabs-mode t)
;;             ;(setq-default indent-tabs-mode t)
;; ;           (setq tab-width 2)
;; ;           (setq-default py-indent-tabs-mode t))
;; ;          (add-to-list 'write-file-functions 'delete-trailing-whitespace))

;; ;(add-to-list 'load-path "C:/Users/bphelps/AppData/Roaming/.emacs.d/elpa/org-20170210/")

;; ;;(defun convert-filename-to-executable (file)
;; ;;  (if (eq system-type 'windows-nt)
;; ;;      (concat (file-name-sans-extension file) ".exe")
;;     ;; linux
;; ;;    (concat "./" (file-name-sans-extension file))))


;; ;;(add-hook 'c++-mode-hook
;; ;;          (lambda ()
;; ;;            (unless (file-exists-p "Makefile")
 ;; ;;              (set (make-local-variable 'compile-command)
;; ;;                   (let* ((file (file-name-nondirectory buffer-    file-name))
;; ;;                      (executable (convert-filename-to-executable file)))
;; ;;                 (concat "g++ -g -Wall -o "
;; ;;                         (file-name-sans-extension file)
;; ;;                         " "
;; ;;                         file
;; ;;                         " && "
;; ;;                         executable))))))

;; ;;(add-hook 'c-mode-hook
;; ;;      (lambda ()
;; ;;        (unless (file-exists-p "Makefile")
;; ;;          (set (make-local-variable 'compile-command)
;; ;;               (let* ((file (file-name-nondirectory buffer-file-name))
;; ;;                      (executable (convert-filename-to-executable file)))
;; ;;                 (concat "gcc -g -ansi -Wall -Wpedantic -Wextra -Wc++-compat -Wconversion -o "
;; ;;                         (file-name-sans-extension file)
;; ;;                         " "
;; ;;                         file
;; ;;                         " && "
;; ;;                         executable))))))
;; ;;(add-hook 'python-mode-hook
;; ;;          (lambda ()
;; ;;              (set (make-local-variable 'compile-command)
;; ;;                   (concat "python " buffer-file-name))))

;; ;;(add-hook 'perl-mode-hook
;; ;;         (lambda ()
;; ;;              (set (make-local-variable 'compile-command)
;; ;;                   (concat "python " buffer-file-name))))
