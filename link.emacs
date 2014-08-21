(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
(add-to-list 'load-path "~/.emacs.d/packages/") ; downloaded packages

;;;;;;;;;
;; custom

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; HiWin ;; too slow
;; (require 'hiwin)
;; (hiwin-mode 1)

;; "Key Chords"
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "uu" 'undo)
(key-chord-define-global "ii" "\C-e\n\t")
(key-chord-define-global "''" 'key-chord-mode)

;; winner mode, layout history
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; fixmee FIXME and TODO highlighting and nav
(require 'fixmee)
(global-fixmee-mode 1)

;; line numbers
;;(setq linum-format "%4d ")

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode 1)

;; slime
(require 'slime)
(slime-setup)

;; slime autocomplete
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; Crosshairs col-highlight/hl-line modes
(require 'crosshairs)
(global-set-key "\C-cc" 'flash-crosshairs)
(key-chord-define-global "cc" 'flash-crosshairs)

;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Nav (emacs-nav)
(require 'nav)
(define-key global-map (kbd "C-c nn") 'nav-toggle)
(key-chord-define-global "nn" 'nav-toggle)

;; Ace Jump ; had to download it, may be put on elpa by maintainer
(require 'ace-jump-mode)
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c jj") 'ace-jump-word-mode)
(key-chord-define-global "jj" 'ace-jump-word-mode)
(define-key global-map (kbd "C-c jk") 'ace-jump-char-mode)
(key-chord-define-global "jk" 'ace-jump-char-mode)
(define-key global-map (kbd "C-c jl") 'ace-jump-line-mode)
(key-chord-define-global "jl" 'ace-jump-line-mode)
(setq ace-jump-mode-scope 'global)

(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back :-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-c jb") 'ace-jump-mode-pop-mark)
(key-chord-define-global "jb" 'ace-jump-mode-pop-mark)

;; helm
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
;;(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c hb") 'helm-buffers-list)
(key-chord-define-global "hb" 'helm-buffers-list)
(global-set-key (kbd "C-c ho") 'helm-occur)
;(key-chord-define-global "ho" 'helm-occur) ;; common key combo
(global-set-key (kbd "C-c hm") 'helm-mini) ;; use helm-projectile instead
(global-set-key (kbd "C-c hc") 'helm-etags-select)
(global-set-key (kbd "M-.") 'helm-etags-select)
(helm-mode 1)
(require 'helm-themes)

;; Projectile
(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(global-set-key (kbd "C-c hh") 'helm-projectile) ;; steals it from helm-mini
(key-chord-define-global "hh" 'helm-projectile)
(key-chord-define-global "hj" 'helm-resume)
(global-set-key (kbd "C-c pm") 'projectile-multi-occur)
;;(key-chord-define-global "pm" 'projectile-multi-occur)
;;(global-set-key (kbd "C-c pg") 'projectile-grep)

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

;; buffer-menu instead of list-buffers
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; Magit
(require 'magit)

;; Which Function mode
(which-function-mode t)

;; Ruby Mode
(autoload 'ruby-mode "ruby-mode")
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

;; Inf Ruby
;;(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
;;(autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)
;;(eval-after-load 'ruby-mode
;;  '(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings))

;; Robe
;;(require 'robe)
;;(add-hook 'ruby-mode-hook 'robe-mode)

;; Rinari Mode (Rails)
;;(require 'rinari)

;; HAML Mode
(require 'haml-mode)

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

;; Evernote
;; (require 'evernote-mode)
;; (setq evernote-username "magnusnothus") ; optional: you can use this username as default.
;; (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; option


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


(eval-after-load "rspec-mode"
  '(defun rspec-project-root (&optional directory)
     "Finds the root directory of the project by walking the directory tree until it finds a rake file."
     (let ((directory (file-name-as-directory (or directory default-directory))))
       (cond ((rspec-root-directory-p directory)
              (error "Could not determine the project root."))
             ((file-exists-p (expand-file-name ".rspec_mode_ignore" directory))
              (rspec-project-root (file-name-directory (directory-file-name directory))))
             ((file-exists-p (expand-file-name "Rakefile" directory)) directory)
             ((file-exists-p (expand-file-name "Gemfile" directory)) directory)
             (t (rspec-project-root (file-name-directory (directory-file-name directory))))))))


;;;;;;;;;;;;;;;;
;; My own loaders
(add-hook 'ruby-mode-hook (lambda () (linum-mode 1)))
(add-hook 'ruby-mode-hook (lambda () (highlight-indentation-mode 1)))
;;(add-hook 'ruby-mode-hook (lambda () (flyspell-prog-mode 1)))

(setq auto-mode-alist (cons '("Gemfile$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Berksfile$" . ruby-mode) auto-mode-alist))

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
 '(rspec-spec-command "rspec --colour -p")
 '(rspec-use-bundler-when-possible t)
 '(rspec-use-opts-file-when-available t)
 '(rspec-use-rake-when-possible nil)
 '(rspec-use-rvm nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "color-234" :foreground "color-236"))))
 '(mode-line ((t (:background "color-202" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(which-func ((t (:background "black" :foreground "red")))))
