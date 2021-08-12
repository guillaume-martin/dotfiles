;; ===================================
;; Basic configuration
;; ===================================

;; Hide the start screen
(setq inhibit-startup-message t)

;; Setup theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'flatland t)

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



;;==================================
;; Org Mode
;;==================================

(require 'org)

;; Standard key bindings
(global-set-key (kbd "<f12>") 'org-agenda)

;; Insert recursively all the files that are in my project directory
;; Each project has it's own folder. In each folder, there is an .org
;; project file containing the actions list
(setq org-agenda-files (apply 'append
			      (mapcar
			       (lambda (directory)
				 (directory-files-recursively
				  directory org-agenda-file-regexp))
			       '("/home/guillaume/Documents/01-PROJECTS/"))))

;; Enable logging
(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)

;; Setup TODO set keywords. There is one set for tasks and one set
;; for projects
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
	      (sequence "BACKLOG(b)" "DEFINITION(f)" "READY(r)" "ACTIVE(a)" "WAITING(w)" "|" "COMPLETED(c)" "CANCELLED(k)"))))

;; Use the flatland palette colours for the keywords
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "#c92b14" :weight bold)
	      ("NEXT" :foreground "#72aaca" :weight bold)
	      ("DONE" :foreground "#b9d977" :weight bold)
	      ("BACKLOG" :foreground "#c92b14" :weight bold)
	      ("DEFINITION" :foreground "#df9400" :weight bold)
	      ("READY" :foreground "#c4b14a" :weight bold)
	      ("ACTIVE" :foreground "#72aaca" :weight bold)
	      ("WAITING" :foreground "#9877D9" :weight bold)
	      ("COMPLETED" :foreground "#b9d977" :weight bold)
	      ("CANCELLED" :foreground "#b9d977" :weight bold))))

;; Set priority levels colours


;; Setup capture
(setq org-default-notes-file "~/Documents/01-PROJECTS/_inbox.org")
(global-set-key (kbd "C-c c") 'org-capture)

;; Capture templates
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Documents/01-PROJECTS/_inbox.org")
	       "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t))))


;; Custom agenda view
(setq org-agenda-custom-commands
   '(("p" "Projects Master List"
     ((todo "ACTIVE"
            ((org-agenda-overriding-header "Active Projects")
             (org-agenda-files org-agenda-files)))
      (todo "WAITING"
            ((org-agenda-overriding-header "Waiting on External")
             (org-agenda-files org-agenda-files)))
      (todo "READY"
            ((org-agenda-overriding-header "Ready for Work")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "DEFINITION"
	    ((org-agenda-overriding-header "Projects Definition")
	     (org-agenda-files org-agenda-files)))
      (todo "BACKLOG"
            ((org-agenda-overriding-header "Project Backlog")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
       (todo "COMPLETED"
            ((org-agenda-overriding-header "Completed Projects")
             (org-agenda-files org-agenda-files)))
      (todo "CANC"
            ((org-agenda-overriding-header "Cancelled Projects")
             (org-agenda-files org-agenda-files)))))))


;; =================================
;; Development Setup
;;==================================






;; User-Defined init.el ends here

