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


;; ==================================
;; MELPA Package Support
;; ==================================

;; Enable basic package support
(require 'package)

;; Add the Melpa repository
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; Initialize the package infrastructure
(package-initialize)



;; =================================
;; Development Setup
;;==================================

			   

;; User-Defined init.el ends here
