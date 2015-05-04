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

(when (display-graphic-p)
  )

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(when (display-graphic-p)
  (scroll-bar-mode -1)
  )
(require 'jammer)
(jammer-mode)

;; Editorconfig
(require 'editorconfig)
(load "editorconfig")
;;(setq js-indent-level 2)

(when (display-graphic-p)
  ;; Solarized theme color-theme-solarized
  ;;(load-theme 'solarized-dark t)

  ;;(load-theme 'wombat t)
  (load-theme 'ample-zen t)
  )

;; Auto Revert Buffers
(global-auto-revert-mode 1)

;; Splitting Windows (display-buffer)
(setq split-height-threshold 1000)
(setq split-width-threshold 300)

;; HiWin ;; too slow
;; (require 'hiwin)
;; (hiwin-mode 1)

;; "Key Chords"
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "uu" 'undo)
(key-chord-define-global "ii" "\C-e\n\t")
(key-chord-define-global "''" 'key-chord-mode)
(key-chord-define-global "NN" 'next-buffer)
(key-chord-define-global "PP" 'previous-buffer)

;; Multi Term Mode
;;(require 'multi-term) ;; Figure out better

;; Whitespace
(require 'whitespace)
(setq whitespace-style '(face lines-tail))
(setq whitespace-line-column 80)
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(global-whitespace-mode t)

(defun turn-off-show-trailing-whitespace()
  "Turn off the highlighting of trailing whitespace in this buffer."
  (interactive)
  (setq show-trailing-whitespace nil))
(add-hook 'term-mode-hook 'turn-off-show-trailing-whitespace)

;; Sublime minimap
(when (display-graphic-p)
  (require 'minimap)
  )

;; Line Numbers
(when (display-graphic-p)
  (require 'linum)
  ;; (global-linum-mode 1)
  ;; (setq linum-format "%4d ")
  (add-hook 'prog-mode-hook #'linum-on)
  )

;; Git Gutter
(require 'git-gutter)
(global-git-gutter-mode 1)
(when (display-graphic-p)
  (git-gutter:linum-setup)
  )

;; winner mode, layout history
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; fixmee FIXME and TODO highlighting and nav
;; (require 'fixmee)
;; (global-fixmee-mode 1)

;; Figlet
(require 'figlet)
(defconst figlet-font-dir "/usr/local/share/figlet")

;; w3m
(setq w3m-new-session-url "http://duckduckgo.com/")

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
;; (key-chord-define-global "cc" 'flash-crosshairs)

;; Powerline
;; (require 'powerline)
;; (powerline-default-theme)

;; Nav (emacs-nav)
;; (require 'nav)
;; (define-key global-map (kbd "C-c nn") 'nav-toggle)
;; (key-chord-define-global "nn" 'nav-toggle)

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

;; emamux; TMUX for Emacs
(require 'emamux)
(define-key global-map (kbd "C-c ts") 'emamux:send-command)
(define-key global-map (kbd "C-c tr") 'emamux:run-command)
(define-key global-map (kbd "C-c ty") 'emamux:yank-from-list-buffers)
(define-key global-map (kbd "C-c tw") 'emamux:copy-kill-ring)
(define-key global-map (kbd "C-c tl") 'emamux:run-last-command)
(define-key global-map (kbd "C-c tz") 'emamux:zoom-runner)
(define-key global-map (kbd "C-c tj") 'emamux:inspect-runner)
(define-key global-map (kbd "C-c tx") 'emamux:close-runner-pane)

;; cycle-resize
(require 'cycle-resize)
(global-set-key (kbd "C-M-v") 'cycle-resize-window-vertically)
(global-set-key (kbd "C-M-h") 'cycle-resize-window-horizontally)


;; helm
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(key-chord-define-global "hb" 'helm-buffers-list)
(global-set-key (kbd "M-.") 'helm-etags-select)
(helm-mode 1)
(require 'helm-themes)
;; helm-google
(require 'helm-google)
(key-chord-define-global "gf" 'helm-google)

;; Projectile
(require 'projectile)
(require 'helm-projectile)
(helm-projectile-on)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(key-chord-define-global "hh" 'helm-projectile)
(key-chord-define-global "hj" 'helm-resume)

;; DuckDuckGo TODO: Not everything there yet
;; (require 'ddg)
;; (define-key global-map (kbd "C-c d") 'ddg-search)

;; Nav
;; (require 'nav)
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
(setq magit-last-seen-setup-instructions "1.4.0")

;; Which Function mode
;; (which-function-mode t)

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

;; RSpec
(require 'rspec-mode)
(key-chord-define-global "TT" 'rspec-toggle-spec-and-target)


;; Evernote
;; (require 'evernote-mode)
;; (setq evernote-developer-token "S=s44:U=48c300:E=150777b8bbe:C=1491fca5c60:P=1cd:A=en-devtoken:V=2:H=5521414644eb0b5d9e9bf3318dac635b")


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
;; (add-hook 'ruby-mode-hook (lambda () (linum-mode 1)))
(add-hook 'ruby-mode-hook (lambda () (highlight-indentation-mode 1)))
;;(add-hook 'ruby-mode-hook (lambda () (flyspell-prog-mode 1)))

(setq auto-mode-alist (cons '("Gemfile$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Berksfile$" . ruby-mode) auto-mode-alist))


(setq-default indent-tabs-mode nil)

;;;;;;;;;;;;;;;;
;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "968c8cf5763708bb86a3f82bb0f8b8d2fe885e693ac8644268738ac2584da292" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" default)))
 '(ecb-options-version "2.40")
 '(helm-google-search-function (quote helm-google-api-search))
 '(magit-use-overlays nil)
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
 '(default ((t (:height 100)))))
