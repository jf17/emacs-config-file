;; мой конфиг файл под Windows , Mac , Linux 

;; в Windows конфиг находится C:\Users\Алексей\AppData\Roaming

;; для ускорения под Виндой 
 (setq inhibit-compacting-font-caches t)

;; key binding
;; unset a key
(global-unset-key (kbd "C-f"))

(global-set-key (kbd "C-f") 'isearch-forward) ; Ctrl+F

;; ------------------------------------------

;; use more repositories for elpa
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; ------------------------------------------
;; авто установка пакетов 
(setq my-packages
      '(
        auto-complete
        markdown-mode
        nyan-mode
        json-mode
        neotree
        yasnippet
        ))

(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))
;; ------------------------------------------
;; Nyan Cat for Emacs! Nyanyanyanyanyanyanyanyanyan! 
(require 'nyan-mode)
(nyan-mode)
;; ------------------------------------------	 
;; theme
(load-theme 'light-blue t)
;; ------------------------------------------	   
 ;; make sure that UTF-8 is used everywhere.
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-language-environment    'utf-8)
(set-selection-coding-system 'utf-8)
(setq locale-coding-system   'utf-8)
(prefer-coding-system        'utf-8)
(set-input-method nil)

;; ------------------------------------------
; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

;; ------------------------------------------


;;скрипт на компиляцию C++
 (global-set-key [(f7)] 'compile)
 (add-hook 'c++-mode-hook
  (lambda ()
    (unless (file-exists-p "Makefile")
      (set (make-local-variable 'compile-command)
    (let ((file (file-name-nondirectory buffer-file-name)))
      (concat "g++ -g -O2 -Wall -o " 
       (file-name-sans-extension file)
       " " file))))))
;; ------------------------------------------
	   
	   
	   