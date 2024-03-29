;; info
(setq user-full-name "Diego Costantino")
(setq user-mail-address "diego@diegocostantino.com")

;; disable splashscreen
(setq inhibit-splash-screen t
      initial-scratch-message nil)

;; use right opt key as alt and not as emacs meta
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

(require 'cl-lib)
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
;; disable dired on OSX
(setq dired-use-ls-dired nil)

;; disable backup files
(setq make-backup-files nil)

;; disable auto-save
(setq auto-save-default nil)

;; disable sound
(setq ring-bell-function 'ignore)

;; remove scrollbar and menu bar
;;(if (display-graphic-p)
;;    (progn
;;      (tool-bar-mode -1)
;;      (scroll-bar-mode -1)))

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; packages
(package-initialize)

;; Ido
(require 'ido)
(setq ido-separator "\n")
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; column number
(setq column-number-mode t)
(global-display-line-numbers-mode 1)

;; highlight paired parentheses
(show-paren-mode 1)

;; hide toolbar
(tool-bar-mode -1)

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

;; custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; enable markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (writegood-mode t)
            (flyspell-mode t)))
