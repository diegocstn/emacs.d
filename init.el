;; info
(setq user-full-name "Diego Costantino")
(setq user-mail-address "diego@diegocostantino.com")

;; use right opt key as alt and not as emacs meta
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

(require 'cl)
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
;; disable backup files
(setq make-backup-files nil)

;; disable auto-save
(setq auto-save-default nil)

;; disable sound
(setq ring-bell-function 'ignore)

;; remove scrollbar and menu bar
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Tuareg
(load "/Users/diego/.opam/4.01.0/share/emacs/site-lisp/tuareg-site-file")
(add-to-list 'load-path "/Users/diego/.opam/4.01.0/share/emacs/site-lisp/")
(package-initialize)

;; Ido
(require 'ido)
(ido-mode t)

;; column number
(setq column-number-mode t)

;; install packages
(load "~/.emacs.d/packages.el")
(defun diegocstn/packages-installed-p ()
  (cl-loop for pkg in diegocstn/packages
        when (not (package-installed-p pkg)) do (cl-return nil)
        finally (cl-return t)))

(unless (diegocstn/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg diegocstn/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; theme
(load-theme 'monokai t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("557c283f4f9d461f897b8cac5329f1f39fac785aa684b78949ff329c33f947ec" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
