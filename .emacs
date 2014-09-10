;; mode settings
(setq default-major-mode 'text-mode)
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq global-visual-line-mode t)

;; other places to find stuff to load
(setq load-path (cons "~/emacs" load-path))

;; set fonts and colors
(global-font-lock-mode t)

;; (require 'color-theme)
(color-theme-initialize)
(require 'color-theme-gruber-darker)
(color-theme-gruber-darker)

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

;; start the server so we can use emacsclient
(server-start)

;; Always load a shell.
;; (shell)

;; prefer utf-8
(prefer-coding-system 'utf-8-unix)
;; (set-buffer-process-coding-system 'utf-8 'utf-8)

;; things specific to AquaMacs on OS X

;; enable package management
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; c# highlighting
(setq omnisharp-server-executable-path "/usr/bin/omnisharp")
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-hook 'csharp-mode-hook 'company-mode)
(setq csharp-want-imenu nil)
(local-set-key (kbd "{") 'csharp-insert-open-brace)

;; highlighting for protobuf files
(require 'protobuf-mode)

;; ace-jump-mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; ace-jump-buffer
(define-key global-map (kbd "C-c j") 'ace-jump-buffer)

; set indendation for the common c mode
(defun my-c-mode-common-hook ()
  ; set indentation level to 4 spaces
  (setq c-basic-offset 4)
  ; set the extra indentation before a substatement (e.g. the opening brace in
  ; the consequent block of an if statement) to 0 (instead of '+)
  (c-set-offset 'substatement-open 0))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
