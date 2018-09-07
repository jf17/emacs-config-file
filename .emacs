;; мой конфиг файл под Windows , Mac , Linux 

;; в Windows конфиг находится проводник в адресной строке набрать  %APPDATA%

;;C-x 2 - разделить окна по горизонтали 
;;C-x 3 - разделить окна по вертикали
;;C-x 1 - оставить одно окно (в котором щас нахожусь)
;;C-x 0(ноль) - закрыть одно окно (в котором щас нахожусь)

;;C-x O(буква) - перемещение между окнами
 
 
 ;; для ускорения под Виндой 
 ;;(setq inhibit-compacting-font-caches t)
 
 
;; key binding
;; поиск по Crtl+F
(global-unset-key (kbd "C-f"))
(global-set-key (kbd "C-f") 'isearch-forward) ; Ctrl+F
;; ------------------------------------------
; закоменировать или раскоментировать по Crtl+/
(global-unset-key (kbd "C-/"))
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)    
;; ------------------------------------------
; переключаться между буферами по "Ctrl+Tab"
(global-unset-key (kbd "<C-tab>"))
(global-set-key (kbd "<C-tab>") 'next-buffer)      
;; ------------------------------------------   
;; увеличить размер текста "Ctrl+колесико_мыши_вверх"
(global-unset-key (kbd "<C-wheel-up>"))
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)    
;; ------------------------------------------
;; уменьшить размер текста "Ctrl+колесико_мыши_вниз"
(global-unset-key (kbd "<C-wheel-down>"))
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)    
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
    ;;jdee ;; (плохо работает под Mac OS X) Java Development Environment for Emacs 
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
(load-theme 'misterioso t)
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
;; formats
(setq display-time-24hr-format t)
(display-time-mode t)
(size-indication-mode t)

;; ------------------------------------------
; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all)
(add-hook 'go-mode-hook 'yas-minor-mode)

;; ------------------------------------------


;;скрипт на компиляцию C++

 ;; (global-set-key [(f7)] 'compile)
 ;;(add-hook 'c++-mode-hook
 ;; (lambda ()
  ;;  (unless (file-exists-p "Makefile")
 ;;     (set (make-local-variable 'compile-command)
  ;;  (let ((file (file-name-nondirectory buffer-file-name)))
  ;;    (concat "g++ -g -O2 -Wall -o " 
  ;;     (file-name-sans-extension file)
;; " " file))))))
;; ------------------------------------------
;; CUA mode for CTRL+x,c,v. 
(cua-mode t)
    (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
    (transient-mark-mode 1)               ;; No region when it is not highlighted
    (setq cua-keep-region-after-copy t) 
;;-----------------------------------------
;; для Golang
;;(require 'company)
;;(require 'company-go)
;;(add-hook 'go-mode-hook (lambda ()
 ;;                           (set (make-local-variable 'company-backends) '(company-go))
  ;;                          (company-mode)))

;; отображение имени файла в заголовке окна   
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
;;-----------------------------------------   
;; отображение номеров строк. 
(line-number-mode   t)
(global-linum-mode  t)
(column-number-mode t)
(setq linum-format " %d")
;;-----------------------------------------   

