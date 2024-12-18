;; editorconfig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; mode settings
(setq default-major-mode 'text-mode)
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq global-visual-line-mode t)

;; other places to find stuff to load
(setq load-path (cons "~/emacs" load-path))

;; set fonts and colors
(global-font-lock-mode t)

(load-theme 'railscast t t)
(enable-theme 'railscast)

;; markdown mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))

;; ;; set up the bash shell
(let ((shellname "/bin/bash"))
(setenv "ESHELL" shellname)
(setenv "SHELL" shellname)
(setq explicit-shell-args '("--login" "-i"))
(setq shell-file-name shellname))

;; ;; set shell paths
;; ;; note: can this be done using only shell settings files?
;; ;(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
;; ;(setenv "PATH" (concat "/usr/local/sbin:" (getenv "PATH")))

(load "comint")
(setq comint-completion-addsuffix t)
(setq comint-eol-on-send t)

;; aliases
(defalias 'qrr 'query-replace-regexp)
(defalias 'rr 'replace-regexp)

(defun revert-all-buffers ()
    "Refreshes all open buffers from their respective files."
    (interactive)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
          (revert-buffer t t t) )))
    (message "Refreshed open files.") )

;; ;; key-mappings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-x\C-k" 'kill-region)

(global-set-key "\M-r" 'revert-buffer-with-coding-system)

(global-set-key "\C-cr" 'revert-all-buffers)
(global-set-key "\C-ch" 'ff-find-other-file)

;; start the server so we can use emacsclient
(server-start)

;; disable the tool bar
(tool-bar-mode -1)
(setq column-number-mode t)

;; Always load a shell.
;; (shell)

;; prefer utf-8
(prefer-coding-system 'utf-8-unix)
;; (set-buffer-process-coding-system 'utf-8 'utf-8)

;; always use case-insensitive filename completion in the minibuffer
(setq read-file-name-completion-ignore-case t)

;; things specific to AquaMacs on OS X

;; enable package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; c# highlighting
(setq omnisharp-server-executable-path "/usr/bin/omnisharp")
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-hook 'csharp-mode-hook 'company-mode)
(setq csharp-want-imenu nil)
(local-set-key (kbd "{") 'csharp-insert-open-brace)

;; ace-jump-mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; ace-jump-buffer
(define-key global-map (kbd "C-c j") 'ace-jump-buffer)

;; smart-tabs
(smart-tabs-insinuate 'c 'c++ 'python 'ruby)
(setq-default indent-tabs-mode nil)

;; projectile
(projectile-global-mode)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

; set indendation for the common c mode
(defun my-c-mode-common-hook ()
  ; set indentation level to 4 spaces
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode t)
  ; set the extra indentation before a substatement (e.g. the opening brace in
  ; the consequent block of an if statement) to 0 (instead of '+)
  (c-set-offset 'substatement-open 0))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

; set indentation for python mode
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t)
	    (setq tab-width 4)))

;; don't add a comment with file encoding in ruby mode
(add-hook 'ruby-mode-hook
	  (setq ruby-insert-encoding-magic-comment nil))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(use-package editorconfig smart-tabs-mode projectile flx-ido color-theme-modern ace-jump-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
