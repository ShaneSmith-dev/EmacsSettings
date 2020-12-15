
;;(add-to-list 'load-path "~/helm-master")

;;(require 'helm)
;;(require 'package)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)


(require 'org)

(global-set-key (kbd "<f12>") 'org-agenda)

(ido-mode t) ;; turns on auto complete when searching for file and directories using C-x C-f
(setq ido-everywhere-t t)
; (setq org-refile-use-outline-path t)

;; Load the Jira api settings file
(load-file "C:/ControlRepos/py_jira/init-jira.el")

;; Setting up backup files to happen in a specific directory rather than the source directory
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/agenda/work.org" "~/agenda/time_off.org" "~/agenda/refile.org" "~/agenda/prof_dev.org" "~/agenda/prod_supp.org" "~/agenda/proc_imp.org" "~/agenda/notes.org" "~/agenda/meetings.org" "~/agenda/hed_od.org" "~/agenda/genesis_od.org" "~/agenda/email.org" "~/agenda/contacts.org")))
 '(package-selected-packages (quote (rainbow-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Calibri" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

;; This command sets lines to wrap around in org-mode
(setq org-startup-truncated nil)

;; This command is supposed to make paragraph wrapping better
(setq org-startup-indented t)

;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; This sets compact-blocks to false, so I have the dividing lines
(setq org-agenda-compact-blocks nil)

;; Set up org-states
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "OTHER" "BACKLOG(b)" "|" "DONE(d)" "DELEGATED(g/!)" )
              (sequence "EMAIL(e)" "TIMEOFF(v)" "WAITING(w@/!)" "MEETING" "|" "CANCELLED(c/!)"))))

;; This builds a custom agenda view, set up to trigger with the spacebar, " " and having REFILE
;; right below the week agenda. That is followed by tasks, then a section for notes. 
(setq org-agenda-custom-commands
      (quote ((" " "Agenda"
	       ((agenda "" nil)
		(tags "REFILE"
		      ((org-agenda-overriding-header "Task to Refile")
		       (org-tags-match-list-sublevels nil)))
		(tags-todo "-REFILE-CANCELLED-WAITING-HOLD-Notes-MEETING-TIME_OFF/!"
			   ((org-agenda-overriding-header "Standalone Tasks")
			    (org-agenda-sorting-strategy 
			     '(category-keep))))
		(tags-todo "Notes"
			    ((org-agenda-overriding-header "Notes")
			     (org-agenda-sorting-strategy
			      '(category-keep))))
		(tags-todo "MEETING"
			   ((org-agenda-overriding-header "Meetings")
			    (org-agenda-sorting-strategy
			     '(category-keep))))
		(tags-todo "TIME_OFF"
			   ((org-agenda-overriding-header "Time Off")
			    (org-agenda-sorting-strategy
			     '(category-keep))))
		nil)))))


(require 'calendar)

;; This is supposed to clear scheduled entries when the task is marked as done
(setq org-agenda-skip-scheduled-if-done t)

(setq org-refile-targets (quote ((nil :maxlevel . 9)
				 (org-agenda-files :maxlevel . 9))))
;; Clock setup
;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)
(setq org-clock-history-length 23)
(setq org-completion-use-ido t)
(setq org-clock-in-resume t)
(setq org-log-done (quote time))
(setq org-log-into-drawer nil) ; Doesn't put time logged into a drawer
(setq org-clock-into-drawer nil) ; Doesn't log time into a drawer
(setq org-log-state-notes-insert-after-drawers nil)
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-clock-persist t)
(setq org-clock-persist-query-resume nil)
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))

(setq org-clock-report-include-clocking-task t)

;;; vscode-dark-plus-theme.el --- A complete port of the default Visual Studio Code Dark+ theme for Emacs

;; Copyright (C) 2020 , Ian Y.E. Pan

;; Author: Ian Y.E. Pan

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:
 
;; (load-file "<filepath>")

(setq org-todo-keyword-faces
      '(("MEETING" . (:foreground "#EB8C00" :weight bold))))

(deftheme vscode-dark-plus)
(let ((class '((class color) (min-colors 89)))
      (fg0     "#AEAFAD") ; Grey
      (fg1     "#d4d4d4") ; Light grey
      (fg2     "#e8e8e8") ; Very light grey
      (fg3     "#f4f4f4") ; Very light grey?
      (fg4     "#fafafa") ; Very light grey?
      (bg00    "#000000") ; Black
      (bg0     "#111111") ; Black
      (bg1     "#1e1e1e") ; Black
      (bg2     "#252526") ; Black
      (bg3     "#313131") ; Light black?
      (bg4     "#4b474c") ; Dark grey
      (bg-hl   "#124f7b") ; Dark blue
      (tw-r    "#A41511") ; Dark red
      (tw-g    "#4A7F00") ; Dark green
      (tw-b    "#207FA1") ; Cyan
      (key2    "#db8e73") ; Salmon
      (key3    "#85ddff") ; Light blue
      (accent  "#ffffff") ; White
      (builtin "#d4d4d4") ; Light grey
      (keyword "#339cdb") ; Lightish blue
      (const   "#339CDB") ; Lightish blue
      (comment "#579C4C") ; Green
      (doc     "#777778") ; Dark grey
      (func    "#D9DAA2") ; Tan
      (str     "#DB8E73") ; Salmon
      (type    "#35CDAF") ; Blue green
      (var     "#85DDFF") ; Light blue
      (warning "#ef2929")); Red
  (custom-theme-set-faces
   'vscode-dark-plus
   `(default                                  ((,class (:background ,bg1 :foreground ,fg1))))

   `(company-preview-common                   ((t (:foreground unspecified :background ,bg2))))
   `(company-scrollbar-bg                     ((t (:background ,bg2))))
   `(company-scrollbar-fg                     ((t (:background ,bg3))))
   `(company-tooltip                          ((t (:inherit default :background ,bg2))))
   `(company-tooltip-common                   ((t (:inherit font-lock-constant-face))))
   `(company-tooltip-selection                ((t (:background ,bg-hl))))

   `(font-lock-builtin-face                   ((,class (:foreground ,builtin))))
   `(font-lock-comment-face                   ((,class (:foreground ,comment))))
   `(font-lock-negation-char-face             ((,class (:foreground ,const))))
   `(font-lock-reference-face                 ((,class (:foreground ,const))))
   `(font-lock-constant-face                  ((,class (:foreground ,const))))
   `(font-lock-doc-face                       ((,class (:foreground ,doc))))
   `(font-lock-function-name-face             ((,class (:foreground ,func :bold t))))
   `(font-lock-keyword-face                   ((,class (:bold ,class :foreground ,keyword))))
   `(font-lock-string-face                    ((,class (:foreground ,str))))
   `(font-lock-type-face                      ((,class (:foreground ,type ))))
   `(font-lock-variable-name-face             ((,class (:foreground ,var))))
   `(font-lock-warning-face                   ((,class (:foreground ,warning :background ,bg2))))

   `(region                                   ((,class (:background ,bg-hl))))
   `(highlight                                ((,class (:foreground ,bg3 :background ,fg3))))
   `(hl-line                                  ((,class (:background  ,bg2))))
   `(fringe                                   ((,class (:background ,bg1 :foreground ,fg4))))
   `(cursor                                   ((,class (:background ,fg0))))
   `(show-paren-match-face                    ((,class (:background ,warning))))
   `(show-paren-match                         ((t (:foreground ,accent :underline t))))
   `(show-paren-mismatch                      ((t (:background ,warning))))
   `(isearch                                  ((,class (:bold t :foreground ,accent :background ,bg4))))
   `(vertical-border                          ((,class (:foreground ,bg3))))
   `(minibuffer-prompt                        ((,class (:bold t :foreground ,keyword))))
   `(default-italic                           ((,class (:italic t))))
   `(link                                     ((,class (:foreground ,const :underline t))))
   `(warning                                  ((,class (:foreground ,warning))))
   `(dired-directory                          ((t (:inherit (font-lock-keyword-face)))))
   `(line-number                              ((,class (:foreground ,bg4))))
   `(line-number-current-line                 ((,class (:foreground ,comment))))

   `(mode-line                                ((,class (:bold nil :foreground ,fg1 :background "#237AD3"))))
   `(mode-line-inactive                       ((,class (:bold nil :foreground ,fg2 :background "#237AD3"))))
   `(mode-line-buffer-id                      ((,class (:bold t :foreground ,func :background nil))))
   `(mode-line-highlight                      ((,class (:foreground ,keyword :box nil :weight bold))))
   `(mode-line-emphasis                       ((,class (:foreground ,fg1))))

   `(org-code                                 ((,class (:foreground ,fg2))))
   `(org-hide                                 ((,class (:foreground ,fg4))))
   `(org-level-1                              ((,class (:bold t :foreground ,keyword :height 1.1))))
   `(org-level-2                              ((,class (:bold nil :foreground ,func))))
   `(org-level-3                              ((,class (:bold t :foreground ,keyword))))
   `(org-level-4                              ((,class (:bold nil :foreground ,var))))
   `(org-date                                 ((,class (:underline t :foreground ,var) )))
   `(org-footnote                             ((,class (:underline t :foreground ,fg4))))
   `(org-link                                 ((,class (:underline t :foreground ,type ))))
   `(org-special-keyword                      ((,class (:foreground ,func))))
   `(org-block                                ((,class (:foreground ,fg2 :background ,bg0 :extend t))))
   `(org-quote                                ((,class (:inherit org-block :slant italic))))
   `(org-verse                                ((,class (:inherit org-block :slant italic))))
   `(org-todo                                 ((,class (:foreground ,warning :bold t))))
   `(org-done                                 ((,class (:bold t :foreground ,comment))))
   `(org-meeting                              ((,class (:foreground ,tw-b :bold t))))
   `(org-warning                              ((,class (:underline t :foreground ,warning))))
   `(org-agenda-structure                     ((,class (:weight bold :foreground ,fg3 :box (:color ,fg4) :background ,bg3))))
   `(org-agenda-date                          ((,class (:foreground ,var :height 1.1 ))))
   `(org-agenda-date-weekend                  ((,class (:weight normal :foreground ,fg4))))
   `(org-agenda-date-today                    ((,class (:weight bold :foreground ,keyword :height 1.4))))
   `(org-agenda-done                          ((,class (:foreground ,bg4))))
   `(org-scheduled                            ((,class (:foreground ,type))))
   `(org-scheduled-today                      ((,class (:foreground ,func :weight bold :height 1.2))))
   `(org-ellipsis                             ((,class (:foreground ,builtin))))
   `(org-verbatim                             ((,class (:foreground ,fg4))))
   `(org-document-info-keyword                ((,class (:foreground ,func))))
   `(org-sexp-date                            ((,class (:foreground ,fg4))))

   `(font-latex-bold-face                     ((,class (:foreground ,type))))
   `(font-latex-italic-face                   ((,class (:foreground ,key3 :italic t))))
   `(font-latex-string-face                   ((,class (:foreground ,str))))
   `(font-latex-match-reference-keywords      ((,class (:foreground ,const))))
   `(font-latex-match-variable-keywords       ((,class (:foreground ,var))))

   `(ido-only-match                           ((,class (:foreground ,keyword))))
   `(ido-subdir                               ((,class (:weight bold :foreground ,fg0))))
   `(ido-first-match                          ((,class (:foreground ,keyword :bold t))))

   `(gnus-header-content                      ((,class (:foreground ,keyword))))
   `(gnus-header-from                         ((,class (:foreground ,var))))
   `(gnus-header-name                         ((,class (:foreground ,type))))
   `(gnus-header-subject                      ((,class (:foreground ,func :bold t))))

   `(mu4e-view-url-number-face                ((,class (:foreground ,type))))
   `(mu4e-cited-1-face                        ((,class (:foreground ,fg2))))
   `(mu4e-cited-7-face                        ((,class (:foreground ,fg3))))
   `(mu4e-header-marks-face                   ((,class (:foreground ,type))))

   `(ffap                                     ((,class (:foreground ,fg4))))

   `(js2-private-function-call                ((,class (:foreground ,const))))
   `(js2-jsdoc-html-tag-delimiter             ((,class (:foreground ,str))))
   `(js2-jsdoc-html-tag-name                  ((,class (:foreground ,key2))))
   `(js2-external-variable                    ((,class (:foreground ,type  ))))
   `(js2-function-param                       ((,class (:foreground ,const))))
   `(js2-jsdoc-value                          ((,class (:foreground ,str))))
   `(js2-private-member                       ((,class (:foreground ,fg3))))
   `(js2-warning                              ((t (:underline ,warning))))
   `(js2-error                                ((t (:foreground ,warning :weight bold))))
   `(js2-jsdoc-tag                            ((t (:foreground ,var))))
   `(js2-jsdoc-type                           ((t (:foreground ,var))))
   `(js2-instance-member                      ((t (:foreground ,var))))
   `(js2-object-property                      ((t (:foreground ,func))))
   `(js2-magic-paren                          ((t (:foreground ,const))))
   `(js2-function-call                        ((t (:foreground ,const))))
   `(js2-keywords                             ((t (:foreground ,keyword))))
   `(js3-warning-face                         ((,class (:underline ,keyword))))
   `(js3-error-face                           ((,class (:underline ,warning))))
   `(js3-external-variable-face               ((,class (:foreground ,var))))
   `(js3-function-param-face                  ((,class (:foreground ,key3))))
   `(js3-jsdoc-tag-face                       ((,class (:foreground ,keyword))))
   `(js3-instance-member-face                 ((,class (:foreground ,const))))

   `(ac-completion-face                       ((,class (:underline t :foreground ,keyword))))
   `(info-quoted-name                         ((,class (:foreground ,builtin))))
   `(info-string                              ((,class (:foreground ,str))))
   `(icompletep-determined                    ((,class :foreground ,builtin)))

   `(slime-repl-inputed-output-face           ((,class (:foreground ,type))))
   `(trailing-whitespace                      ((,class :foreground nil :background ,warning)))
   `(lazy-highlight                           ((,class (:foreground ,fg2 :background ,bg3))))

   `(undo-tree-visualizer-current-face        ((,class :foreground ,builtin)))
   `(undo-tree-visualizer-default-face        ((,class :foreground ,fg2)))
   `(undo-tree-visualizer-unmodified-face     ((,class :foreground ,var)))
   `(undo-tree-visualizer-register-face       ((,class :foreground ,type)))

   `(rainbow-delimiters-depth-1-face          ((,class :foreground "Gold")))
   `(rainbow-delimiters-depth-2-face          ((,class :foreground "Orchid")))
   `(rainbow-delimiters-depth-3-face          ((,class :foreground "LightSkyBlue")))
   `(rainbow-delimiters-depth-4-face          ((,class :foreground "Gold")))
   `(rainbow-delimiters-depth-5-face          ((,class :foreground "Orchid")))
   `(rainbow-delimiters-depth-6-face          ((,class :foreground "LightSkyBlue")))
   `(rainbow-delimiters-depth-7-face          ((,class :foreground "Gold")))
   `(rainbow-delimiters-depth-8-face          ((,class :foreground "Orchid")))
   `(rainbow-delimiters-depth-9-face          ((,class :foreground "LightSkyBlue")))
   `(rainbow-delimiters-unmatched-face        ((,class :foreground ,warning)))

   `(magit-item-highlight                     ((,class :background ,bg3)))
   `(magit-section-heading                    ((,class (:foreground ,keyword :weight bold))))
   `(magit-hunk-heading                       ((,class (:background ,bg3))))
   `(magit-section-highlight                  ((,class (:background ,bg2))))
   `(magit-hunk-heading-highlight             ((,class (:background ,bg3))))
   `(magit-diff-context-highlight             ((,class (:background ,bg3 :foreground ,fg3))))
   `(magit-diffstat-added                     ((,class (:foreground ,type))))
   `(magit-diffstat-removed                   ((,class (:foreground ,var))))
   `(magit-process-ok                         ((,class (:foreground ,func :weight bold))))
   `(magit-process-ng                         ((,class (:foreground ,warning :weight bold))))
   `(magit-branch                             ((,class (:foreground ,const :weight bold))))
   `(magit-log-author                         ((,class (:foreground ,fg3))))
   `(magit-hash                               ((,class (:foreground ,fg2))))
   `(magit-diff-file-header                   ((,class (:foreground ,fg2 :background ,bg3))))

   `(term                                     ((,class (:foreground ,fg1 :background ,bg1))))
   `(term-color-black                         ((,class (:foreground ,bg3 :background ,bg3))))
   `(term-color-blue                          ((,class (:foreground ,func :background ,func))))
   `(term-color-red                           ((,class (:foreground ,keyword :background ,bg3))))
   `(term-color-green                         ((,class (:foreground ,type :background ,bg3))))
   `(term-color-yellow                        ((,class (:foreground ,var :background ,var))))
   `(term-color-magenta                       ((,class (:foreground ,builtin :background ,builtin))))
   `(term-color-cyan                          ((,class (:foreground ,str :background ,str))))
   `(term-color-white                         ((,class (:foreground ,fg2 :background ,fg2))))

   `(helm-header                              ((,class (:foreground ,fg2 :background ,bg1 :underline nil :box nil))))
   `(helm-source-header                       ((,class (:foreground ,keyword :background ,bg1 :underline nil :weight bold))))
   `(helm-selection                           ((,class (:background ,bg2 :underline nil))))
   `(helm-selection-line                      ((,class (:background ,bg2))))
   `(helm-visible-mark                        ((,class (:foreground ,bg1 :background ,bg3))))
   `(helm-candidate-number                    ((,class (:foreground ,bg1 :background ,fg1))))
   `(helm-separator                           ((,class (:foreground ,type :background ,bg1))))
   `(helm-time-zone-current                   ((,class (:foreground ,builtin :background ,bg1))))
   `(helm-time-zone-home                      ((,class (:foreground ,type :background ,bg1))))
   `(helm-buffer-not-saved                    ((,class (:foreground ,type :background ,bg1))))
   `(helm-buffer-process                      ((,class (:foreground ,builtin :background ,bg1))))
   `(helm-buffer-saved-out                    ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-buffer-size                         ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-ff-directory                        ((,class (:foreground ,func :background ,bg1 :weight bold))))
   `(helm-ff-file                             ((,class (:foreground ,fg1 :background ,bg1 :weight normal))))
   `(helm-ff-executable                       ((,class (:foreground ,key2 :background ,bg1 :weight normal))))
   `(helm-ff-invalid-symlink                  ((,class (:foreground ,key3 :background ,bg1 :weight bold))))
   `(helm-ff-symlink                          ((,class (:foreground ,keyword :background ,bg1 :weight bold))))
   `(helm-ff-prefix                           ((,class (:foreground ,bg1 :background ,keyword :weight normal))))
   `(helm-grep-cmd-line                       ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-file                           ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-finish                         ((,class (:foreground ,fg2 :background ,bg1))))
   `(helm-grep-lineno                         ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-match                          ((,class (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running                        ((,class (:foreground ,func :background ,bg1))))
   `(helm-moccur-buffer                       ((,class (:foreground ,func :background ,bg1))))
   `(helm-source-go-package-godoc-description ((,class (:foreground ,str))))
   `(helm-bookmark-w3m                        ((,class (:foreground ,type))))

   `(web-mode-builtin-face                    ((,class (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face                    ((,class (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face                   ((,class (:inherit ,font-lock-constant-face))))
   `(web-mode-keyword-face                    ((,class (:foreground ,keyword))))
   `(web-mode-doctype-face                    ((,class (:inherit ,font-lock-doc-face))))
   `(web-mode-function-name-face              ((,class (:inherit ,font-lock-function-name-face))))
   `(web-mode-string-face                     ((,class (:foreground ,str))))
   `(web-mode-type-face                       ((,class (:inherit ,font-lock-type-face))))
   `(web-mode-html-attr-name-face             ((,class (:foreground ,func))))
   `(web-mode-html-attr-value-face            ((,class (:foreground ,keyword))))
   `(web-mode-warning-face                    ((,class (:inherit ,font-lock-warning-face))))
   `(web-mode-html-tag-face                   ((,class (:foreground ,builtin))))

   `(jde-java-font-lock-package-face          ((t (:foreground ,var))))
   `(jde-java-font-lock-public-face           ((t (:foreground ,keyword))))
   `(jde-java-font-lock-private-face          ((t (:foreground ,keyword))))
   `(jde-java-font-lock-constant-face         ((t (:foreground ,const))))
   `(jde-java-font-lock-modifier-face         ((t (:foreground ,key3))))
   `(jde-jave-font-lock-protected-face        ((t (:foreground ,keyword))))
   `(jde-java-font-lock-number-face           ((t (:foreground ,var))))

   `(centaur-tabs-default                     ((t (:background ,bg1 :foreground ,fg1))))
   `(centaur-tabs-selected                    ((t (:background ,bg1 :foreground ,fg3 :box nil))))
   `(centaur-tabs-unselected                  ((t (:background ,bg2 :foreground ,fg0 :box nil))))
   `(centaur-tabs-selected-modified           ((t (:background ,bg2 :foreground ,accent :box nil))))
   `(centaur-tabs-unselected-modified         ((t (:background ,bg2 :foreground ,fg4 :box nil))))
   `(centaur-tabs-active-bar-face             ((t (:background ,accent :box nil))))
   `(centaur-tabs-modified-marker-selected    ((t (:inherit 'centaur-tabs-selected-modified :foreground ,accent :box nil))))
   `(centaur-tabs-modified-marker-unselected  ((t (:inherit 'centaur-tabs-unselected-modified :foreground ,accent :box nil))))

   `(solaire-default-face                     ((t (:inherit default :background ,bg2))))
   `(solaire-minibuffer-face                  ((t (:inherit default :background ,bg2))))
   `(solaire-hl-line-face                     ((t (:inherit hl-line :background ,bg3))))
   `(solaire-org-hide-face                    ((t (:inherit org-hide :background ,bg2))))


   `(ivy-confirm-face                         ((t (:inherit minibuffer-prompt :foreground ,keyword))))
   `(ivy-current-match                        ((t (:background "#08304C" :extend t))))
   `(ivy-highlight-face                       ((t (:inherit font-lock-builtin-face))))
   `(ivy-match-required-face                  ((t (:inherit minibuffer-prompt :foreground ,warning))))
   `(ivy-minibuffer-match-face-1              ((t (:inherit isearch))))
   `(ivy-minibuffer-match-face-2              ((t (:inherit ivy-minibuffer-match-face-1))))
   `(ivy-minibuffer-match-face-3              ((t (:inherit ivy-minibuffer-match-face-2))))
   `(ivy-minibuffer-match-face-4              ((t (:inherit ivy-minibuffer-match-face-2))))
   `(ivy-minibuffer-match-highlight           ((t (:inherit ivy-current-match))))
   `(ivy-modified-buffer                      ((t (:inherit default :foreground ,var))))
   `(ivy-virtual                              ((t (:inherit default :foreground ,comment))))
   `(ivy-posframe                             ((t (:background "#252526"))))

   `(counsel-key-binding                      ((t (:foreground ,var))))

   `(swiper-match-face-1                      ((t (:inherit ivy-minibuffer-match-face-1))))
   `(swiper-match-face-2                      ((t (:inherit ivy-minibuffer-match-face-2))))
   `(swiper-match-face-3                      ((t (:inherit ivy-minibuffer-match-face-3))))
   `(swiper-match-face-4                      ((t (:inherit ivy-minibuffer-match-face-4))))
   `(swiper-line-face                         ((t (:foreground ,fg0 :background ,bg4 :extend t))))


   `(diff-hl-insert                           ((t (:foreground ,tw-g))))
   `(diff-hl-delete                           ((t (:foreground ,tw-r))))
   `(diff-hl-change                           ((t (:foreground ,tw-b))))

   `(sml/global                               ((t :foreground ,fg1 :weight normal)))
   `(sml/filename                             ((t :foreground ,fg1 :weight normal)))
   `(sml/prefix                               ((t :foreground ,fg1 :weight normal)))
   `(sml/read-only                            ((t :foreground ,fg1 :weight normal)))
   `(sml/modes                                ((t :foreground ,fg1 :weight normal)))

   `(evil-ex-substitute-matches               ((t :foreground "#ff0000" :weight bold :strike-through t)))
   `(evil-ex-substitute-replacement           ((t :foreground "#0ff000" :weight bold)))
   ))

(provide-theme 'vscode-dark-plus)

;;; vscode-dark-plus-theme.el ends here
