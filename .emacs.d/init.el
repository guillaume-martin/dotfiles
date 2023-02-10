;;  update 2023-01-11 18:16 (work)

;; ==================================
;; Package Support
;; ==================================
;; Initialize package sources
(require 'package)

(setq package-archives '(
   ("melpa" . "https://melpa.org/packages/")
   ("org" . "https://orgmode.org/elpa/")
   ("elpa" . "https://elpa.gnu.org/packages/")
))

;; Fix bug preventing loading the elpa archive
;; https://emacs.stackexchange.com/a/51772
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; ===================================
;; Completion system
;; ===================================

;; minibuffer prompt history
(setq history-length 25)
(savehist-mode 1)


(use-package ivy
   :diminish
   :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
   :config
   (ivy-mode 1))


;; ===================================
;; Basic configuration
;; ===================================

;; Don't show the splash screen
(setq inhibit-startup-message t)

;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'moerror 'nomessage)

(setq make-backup-files nil)    ; stop creating ~ files

;; Flash when the bell rings
(setq visible-bell t)

;; Toggle UI elements
;;(menu-bar-mode -1)        ; Leave on for beginner
(tool-bar-mode -1)          ; Disable toolbar
(scroll-bar-mode -1)        ; Disable scroll bar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Get some breathing room
(setq use-dialog-bx nil)    ; Don't pop up UI dialogs when prompt

;; Show line numbers
(global-display-line-numbers-mode 1)

;; Remember recent files (call with M-x recentf-open-file)
(recentf-mode 1)

;; remember and restore the last cursor location in opened files
(save-place-mode 1)

;; Refresh buffer when the underlying file has changed
(global-auto-revert-mode 1)
;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Setup theme
(require 'gruvbox-theme)
(load-theme 'gruvbox-dark-soft t)

;; Note: the first time you load your configuratoin on a new machinem you'll
;; need to run the following command interactively so that the mode line icons
;; display correctly
;;
;; M-x all-the-icons-install-fonts
(use-package all-the-icons)

;; Install mode line
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Auto close brackets
(electric-pair-mode 1)

;;==================================
;; Evil Mode
;;=================================
;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(use-package evil
  :init
  (setq evil-want-integration t)
  :config
  (evil-mode 1)
)


;;==================================
;; Org Mode
;;==================================

(require 'org)

;; Standard key bindings
(global-set-key (kbd "<f12>") 'org-agenda)

;; Use bullets instead of stars for headings
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Setup TODO status keywords
(setq org-todo-keywords
   (quote ((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")
   )))

(setq org-todo-keyword-faces
   '( ("STARTED" . (:foreground "#fabd2f" :weight bold))
      ("WAITING" . (:foreground "#b16286" :weight bold))
      ("CANCELED" . (:foreground "#bdae93" :weight bold))
   ))

;; Set priority levels
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

;; Autocomplete tasks when all subtasks are done
;; Source: https://orgmode.org/manual/Breaking-Down-Tasks.html:
(defun org-summary-todo (n-done n-not-done)
   "Switch entry to DONE when all subentries are done, to TODO otherwise."
   (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook #'org-summary-todo)


;; Agenda
(setq org-agenda-files '("~/Documents/00-INBOX"
                        "~/Documents/01-PROJECTS"))

;; logging
(setq org-log-into-drawer t)    ;; Save log notes in LOGBOOK drawer
(setq org-log-done 'time)       ;; Log when a task is done

;; Setup capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/Documents/00-INBOX/inbox.org")


;; Capture templates
(setq org-capture-templates
   '(("t" "todo" entry (file+headline "~/Documents/00-INBOX/inbox.org" "ACTIONABLES")
      "* TODO %?")
	("n" "note" entry (file+headline "~/Documents/00-INBOX/inbox.org" "NOTES")
	   "* %? :note:")
	("j" "journal" entry (file+datetree "~/Documents/02-AREAS/diary.org"))))


;; Refiling
(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))

;; Archiving 
;; Archived items are moved in a file with the same name as their origin file
;; placed in the archive folder of the current year.
(setq org-archive-location (concat "~/Documents/04-ARCHIVES/"
                                 (format-time-string "%Y" (current-time))
                                 "/%s::"))


;; Agenda
(setq org-agenda-files '("~/Documents/00-INBOX"
                         "~/Documents/01-PROJECTS"))



;; Custom agenda command definitions

