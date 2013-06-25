(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;;;;;;;;;
;; custom

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; winner mode, layout history
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; fixmee FIXME and TODO highlighting and nav
(require 'fixmee)
(global-fixmee-mode 1)

;; line numbers
;;(setq linum-format "%4d ")

;; Crosshairs col-highlight/hl-line modes
(require 'crosshairs)
(global-set-key "\C-cc" 'flash-crosshairs)

;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Ace Jump
(require 'ace-jump-mode)
;;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c jj") 'ace-jump-word-mode)
(define-key global-map (kbd "C-c jk") 'ace-jump-char-mode)
(define-key global-map (kbd "C-c jl") 'ace-jump-line-mode)

;; helm
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)
(require 'helm-themes)

;; Projectile
(require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-c h") 'helm-projectile) ;; steals it from helm-mini

;; Nav
(require 'nav)
;;(nav-disable-overeager-window-splitting)

;; autopair
;; (require 'autopair)
;; (autopair-global-mode) ;; enable autopair in all buffers
(electric-pair-mode t)

;; Display column number
(column-number-mode 1)

;; No more starting splash
(setq inhibit-startup-message t)

;; Syntax highlight!
(global-font-lock-mode 1)

;; always end a file with a newline
(setq require-final-newline t)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Make selection visible in terminal
(setq transient-mark-mode t)

;; We are quite opinionated regarding whitespace
(setq show-trailing-whitespace nil) ;; this does nothing
(setq-default indent-tabs-mode nil)

;; ls switches for dired
(setq dired-listing-switches "-lR")

;; make ctags stop asking to reload TAGS file
(setq tags-revert-without-query 1)

;; Magit
(require 'magit)

;; Which Function mode
(which-function-mode t)

;; Ruby Mode
(autoload 'ruby-mode "ruby-mode")
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

;; Rinari Mode (Rails)
;;(require 'rinari)

;; rvm
(require 'rvm)
;;(rvm-use-default)
(rvm-autodetect-ruby)

;; Flymake
(require 'flymake-easy)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(require 'rspec-mode)
;;(require 'ruby-test-mode)
;;(global-set-key "\C-ctf" 'ruby-test-run)
;;(global-set-key "\C-cts" 'ruby-test-run-at-point)
;;(global-set-key "\C-ctt" 'ruby-test-toggle-implementation-and-specification)


;; ruby-end
(require 'ruby-end)

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)

;;;; do overlay
(setq ruby-block-highlight-toggle 'overlay)

;; Highlight Indentations
(require 'highlight-indentation)

;; Window Movement
(global-set-key "\C-xp" 'previous-multiframe-window)
;(global-set-key "\C-xp" 'my-next-window)
(global-set-key "\C-x\M-f" 'windmove-right)
(global-set-key "\C-x\M-b" 'windmove-left)
(global-set-key "\C-x\M-p" 'windmove-up)
(global-set-key "\C-x\M-n" 'windmove-down)

(defun my-next-window ()
  "Next window then highlights the cursor."
  (interactive)
  (command-execute previous-mutiframe-window)
  (command-execute crosshairs-flash))


;;;;;;;;;;;;;;;;
;; My own loaders
(add-hook 'ruby-mode-hook (lambda () (linum-mode 1)))
(add-hook 'ruby-mode-hook (lambda () (highlight-indentation-mode 1)))
;;(add-hook 'ruby-mode-hook (lambda () (flyspell-prog-mode 1)))

(setq auto-mode-alist (cons '("Gemfile$" . ruby-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;
;; compile
;; (autoload 'mode-compile "mode-compile"
;;   "Command to compile current buffer file dependently of the major mode" t)
;; (global-set-key "\C-cc" 'mode-compile)
;; (autoload 'mode-compile-kill "mode-compile"
;;   "Command to kill a compilation launched by `mode-compile'" t)
;; (global-set-key "\C-ck" 'mode-compile-kill)

(setq-default indent-tabs-mode nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 ;; '(rspec-key-command-prefix "t")
 '(rspec-spec-command "rspec")
 '(rspec-use-bundler-when-possible t)
 '(rspec-use-opts-file-when-available t)
 '(rspec-use-rake-flag nil)
 '(rspec-use-rvm nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "color-234" :foreground "color-236"))))
 '(mode-line ((t (:background "color-202" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(which-func ((t (:background "black" :foreground "red")))))
