;; ===================================
;; Basic configuration
;; ===================================

;; Hide the start screen
(setq inhibit-startup-message t)

;; Setup theme
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'flatland t)


(tool-bar-mode -1)         ;; Hide the tool bar
(global-linum-mode t)      ;; Enable line numbers globally
(scroll-bar-mode -1)       ;; Disable visible scrollbar
(tooltip-mode -1)          ;; Disable tooltips
(set-fringe-mode 10)       ;; Give some breathing room
(electric-pair-mode 1)     ;; Auto close bracket insertion
(show-paren-mode 1)        ;; Turn on highlight matching brackets
(setq show-paren-style 'parenthesis)  ;; Highlight brackets

(setq visible-bell t)      ;; Set up the visible bell

;; Make ESC quit prompt
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; ==================================
;; Package Support
;; ==================================

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

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

(use-package doom-themes
  :init (load-theme 'doom-palenight t))


;;==================================
;; Org Mode
;;==================================

(require 'org)

;; Standard key bindings
(global-set-key (kbd "<f12>") 'org-agenda)

;; Use bullets instead of stars for headings
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Load orgfiles
;(defun get-fullpath (@filename)
;  "Returns the full path of 'filename' relative to the caller's file location"
;  (concat (file-name-directory (or load-file-name buffer-file-name)) @filename)
;  )
;(load (get-fullpath "orgfiles.el"))

;; Enable logging
(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)

;; Setup TODO set keywords. There is one set for tasks and one set
;; for projects
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "|" "DONE(d)")
	      (sequence "BACKLOG(b)" "ACTIVE(a)" "HOLD(h)" "WAITING(w)" "|" "COMPLETED(c)" "CANCELLED(k)"))))

;; Set colours for the keywords
(setq org-todo-keyword-faces
      (quote (("TODO" :background "#c92b14" :weight bold)
	      ("DONE" :foreground "#b9d977" :weight bold)
	      ("BACKLOG" :foreground "#c92b14" :weight bold)
	      ("ACTIVE" :foreground "#72aaca" :weight bold)
	      ("WAITING" :foreground "#9877D9" :weight bold)
	      ("ON HOLD" :foreground "#9877D9" :weight bold)
	      ("COMPLETED" :foreground "#b9d977" :weight bold)
	      ("CANCELLED" :foreground "#b9d977" :weight bold))))


;; Set priority levels
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)


;; Setup capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/Documents/01-PROJECTS/org-files/inbox.org")


;; Capture templates
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/pCloudDrive/org/inbox.org" "ACTIONABLES")
	 "* TODO %?")
	("n" "note" entry (file+headline "~/pCloudDrive/org/inbox.org" "NOTES")
	 "* %? :note:")
	("j" "journal" entry (file+datetree "~/pCloudDrive/org/diary.org"))))


;; Setup refiling

;; Set the target files
(setq org-refile-targets '((nil :maxlevel .9)
                          (org-agenda-files :maxlevel .9)))



;; Custom agenda view
(setq org-agenda-custom-commands
      '(
	("r" "Items to refile"
	 (tags "inbox")
	 (org-agenda-files org-agenda-files))
	
       ("p" "Projects Master List"
	((todo "ACTIVE"
            ((org-agenda-overriding-header "Active Projects")
             (org-agenda-files org-agenda-files)
	     (org-agenda-sorting-strategy '(deadline-up priority-down))))
	 (todo "WAITING"
            ((org-agenda-overriding-header "Waiting on External")
             (org-agenda-files org-agenda-files)))
	 (todo "ON HOLD"
            ((org-agenda-overriding-header "On Hold")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
	 (todo "COMPLETED"
            ((org-agenda-overriding-header "Completed Projects")
             (org-agenda-files org-agenda-files)))
	 (todo "CANCELLED"
            ((org-agenda-overriding-header "Cancelled Projects")
             (org-agenda-files org-agenda-files)))))

       ("n" "Next Actions"
	((todo "TODO"
	       ((org-agenda-overriding-header "NEXT ACTIONS")
		(org-agenda-files org-agenda-files)
		(org-agenda-sorting-strategy '(deadline-up priority-down))))))
       
       ("d" "Today's dashboard"
	(
	 (agenda "" ((org-agenda-span 1)))
	 
	 (tags-todo "SCHEDULED=\"<today>\""
	       ((org-agenda-overriding-header "TODAY'S TASKS")
		(org-agenda-files org-agenda-files)
		(org-agenda-sorting-strategy '(deadline-up priority-down))))
	 
	 (tags-todo "+email+SCHEDULED=\"<today>\"|+call+SCHEDULED=\"<today>\""
		    ((org-agenda-overriding-header "TODAY'S COMMUNICATIONS")
		     (org-agenda-files org-agenda-files)))
	 ))
     ))


;; =================================
;; Development Setup
;;==================================






;; User-Defined init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-directory "~/pCloudDrive/org")
 '(org-agenda-files (list org-directory))
 '(package-selected-packages
   (quote
    (doom-themes org-bullets use-package ivy doom-modeline))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
