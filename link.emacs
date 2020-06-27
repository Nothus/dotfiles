(add-to-list 'load-path "~/.emacs.d/packages/") ; downloaded packages
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(if (not (getenv "TERM_PROGRAM"))
      (let ((path (shell-command-to-string
              "$SHELL -cl \"printf %s \\\"\\\$PATH\\\"\"")))
        (setenv "PATH" path)))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
;; (add-to-list 'load-path "~/.emacs.d/packages/") ; downloaded packages

;;;;;;;;;
;; custom

(when (display-graphic-p)
  )

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(osx-clipboard-mode +1)

;; Use Emacs terminfo, not system terminfo
;; (setq system-uses-terminfo nil)
;; -OR- try:
;; If you use Cocoa Emacs or Carbon Emacs
;; $ tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti

(when (display-graphic-p)
  ;; No scroll bar
  (scroll-bar-mode -1)

  ;; Set transparency
  (set-frame-parameter (selected-frame) 'alpha '(85 50))
  (add-to-list 'default-frame-alist '(alpha 85 50))
  )

;; (set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)
;; (require 'elscreen)
;; (elscreen-start)

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
  ;;(load-theme 'ample-zen t)
  (load-theme 'darktooth t)
  )

;; Auto Revert Buffers
;; (global-auto-revert-mode 1) ;; CPU is high when on.

;; Splitting Windows (display-buffer)
(setq split-height-threshold 1000)
(setq split-width-threshold 300)

;; Auto Window Resizing
;; (require 'golden-ratio)
;; (golden-ratio-mode 1)

;; HiWin ;; too slow
;; (require 'hiwin)
;; (hiwin-mode 1)

;; (require 'bookmark+)

;; "Key Chords"
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "uu" 'undo)
(key-chord-define-global "ii" "\C-e\n\t")
(key-chord-define-global "''" 'key-chord-mode)
;; (key-chord-define-global "NN" 'next-buffer)
;; (key-chord-define-global "PP" 'previous-buffer)
(key-chord-define-global "NN" 'elscreen-next)
(key-chord-define-global "PP" 'elscreen-previous)

;; Multi Term Mode
;;(require 'multi-term) ;; Figure out better

;; Whitespace
(require 'whitespace)
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
  ;; (require 'linum)
  ;; (global-linum-mode 1)
  ;; (setq linum-format "%4d ")
  ;; (add-hook 'prog-mode-hook #'linum-on)
  )

;; Git Gutter
(require 'git-gutter)
;;(require 'git-gutter-fringe)
(global-git-gutter-mode t)
(when (display-graphic-p)
  ;; (git-gutter:linum-setup)
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
;; (require 'auto-complete)
;; (global-auto-complete-mode 1)

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
(define-key global-map (kbd "C-c tt") 'term)
(define-key global-map (kbd "C-c tr") 'rename-uniquely)


;; cycle-resize
(require 'cycle-resize)
(global-set-key (kbd "C-M-v") 'cycle-resize-window-vertically)
(global-set-key (kbd "C-M-h") 'cycle-resize-window-horizontally)


;; helm
(require 'helm)
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'undefined)
(global-set-key (kbd "M-x") 'helm-M-x)
(key-chord-define-global "hb" 'helm-mini)
(global-set-key (kbd "M-.") 'helm-etags-select)
(global-set-key (kbd "C-c s") 'helm-occur)
;;(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "M-s") 'helm-resume)
(require 'helm-themes)
;; helm-google
(require 'helm-google)
(key-chord-define-global "gf" 'helm-google)
(require 'helm-bundle-show)
(require 'helm-pages)
(require 'helm-ls-git)
(require 'ac-helm)
(require 'helm-flx)
(helm-flx-mode +1)
;; Projectile
(require 'projectile)
(require 'helm-projectile)
(helm-projectile-on)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
;; (key-chord-define-global "hh" 'helm-browse-project)
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

;; Magit + Github
(require 'magithub)

;; Which Function mode
;; (which-function-mode t)

;; Ruby Mode
(autoload 'ruby-mode "ruby-mode")
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

;; Inf Ruby
;; (autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
;; (autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)
;; (eval-after-load 'ruby-mode
;;  '(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings))
(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(require 'ac-inf-ruby)
(eval-after-load 'auto-complete
  '(add-to-list 'ac-modes 'inf-ruby-mode))
(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)

;; Robe
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;; Rinari Mode (Rails)
;;(require 'rinari)

;; HAML Mode
(require 'haml-mode)

;; rvm
(require 'rvm)
;;(rvm-use-default)
;; (rvm-autodetect-ruby)

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


;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)

;;;; do overlay
(setq ruby-block-highlight-toggle 'overlay)

;; Highlight Indentations
;; (require 'highlight-indentation)

(require 'highlight-thing)
(global-highlight-thing-mode)

(require 'highlight-blocks)
(add-hook 'ruby-mode-hook 'highlight-blocks-mode)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;; Window Movement
(global-set-key "\C-xp" 'previous-multiframe-window)
;(global-set-key "\C-xp" 'my-next-window)
(global-set-key "\C-x\M-f" 'windmove-right)
(global-set-key "\C-x\M-b" 'windmove-left)
(global-set-key "\C-x\M-p" 'windmove-up)
(global-set-key "\C-x\M-n" 'windmove-down)

(define-key global-map (kbd "s-r") 'rspec-rerun)
(define-key global-map (kbd "s-n") 'next-error)
(define-key global-map (kbd "s-`") 'next-multiframe-window)
(define-key global-map (kbd "H-n") 'scroll-other-window)
(define-key global-map (kbd "H-p") 'scroll-other-window-up)
(define-key global-map (kbd "H-}") 'next-multiframe-window)
(define-key global-map (kbd "H-{") 'previous-multiframe-window)



(add-to-list 'display-buffer-alist
             `(,(rx bos "*helm" (* not-newline) "*" eos)
               (display-buffer-in-side-window)
               (inhibit-same-window . t)
               (window-height . 20)))

;; (defun select-window--flash-crosshairs-around (orig-func &rest args)
;;   "`flash-crosshairs' when switching to a new buffer."
;;   (let ((cur-buffer-name (buffer-name))
;;         (win (apply orig-func args)))
;;     (unless (string= (buffer-name (window-buffer)) cur-buffer-name)
;;       (flash-crosshairs))
;;     win))
;; (advice-add 'select-window :around #'select-window--flash-crosshairs-around)
;; (advice-add 'switch-to-buffer :after #'flash-crosshairs)

;; (defun split-window--select-window (orig-func &rest args)
;;   "Switch to the other window after a `split-window'"
;;   (let ((cur-window (selected-window))
;;         (new-window (apply orig-func args)))
;;     (when (equal (window-buffer cur-window) (window-buffer new-window))
;;       (select-window new-window))
;;     new-window))
;; (advice-add 'split-window :around #'split-window--select-window)

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

(setq rcirc-server-alist
      '(("gekkoscience.com" :port 9001 :encryption tls)))
(setq rcirc-default-nick "nothus")
(setq rcirc-authinfo
      '(("gekkoscience.com" chanelserv "nothus" "#staff" "testpass")))

(require 'diminish)
;; (diminish 'abbrev-mode "Abv")
;; (diminish 'jiggle-mode)
;; (diminish 'mouse-avoidance-mode "M")


;;;;;;;;;;;;;;;;
;; My own loaders
;; (add-hook 'ruby-mode-hook (lambda () (linum-mode 1)))
;; (add-hook 'ruby-mode-hook (lambda () (highlight-indentation-mode 1)))
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
 '(ansi-color-names-vector
   ["#3C3836" "#FB4934" "#84BB26" "#FABD2F" "#83A598" "#D3869B" "#3FD7E5" "#EBDBB2"])
 '(auto-revert-check-vc-info t)
 '(auto-revert-use-notify t)
 '(bmkp-auto-light-when-jump (quote any-bookmark))
 '(bmkp-auto-light-when-set (quote any-bookmark))
 '(bmkp-last-as-first-bookmark-file "/Users/mvazquez/.emacs.d/bookmarks")
 '(bmkp-light-style-autonamed-region (quote rfringe))
 '(compilation-always-kill t)
 '(compilation-ask-about-save nil)
 '(compilation-auto-jump-to-first-error nil)
 '(compilation-context-lines 5)
 '(compilation-message-face (quote default))
 '(compilation-save-buffers-predicate nil)
 '(compilation-scroll-output t)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (Pumpkin)))
 '(custom-safe-themes
   (quote
    ("40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "6f441c0e5d8199f08eb4b73e9c697710282bcae95e5925b7649ddfa8cea2e24c" "2e762dce792d87102c59dd659807e7a276327a12decd97e8ea13233c1d70cbe1" "c111cf659daf732848c576f9b76fcfd5f43e472bc8ed7382503bc328ea8185ee" "7963360a3c9b2c78b0a207ea1f5c326e25b476c2900f468c767e549380f44fc9" "a880f24f10201d6666a6328a6db65e84154e51774e1dcef0368751d3dcd9f64c" "0eea76fe89061a7f6da195f4a976c0b91150de987b942fac2dd10992aea33833" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "968c8cf5763708bb86a3f82bb0f8b8d2fe885e693ac8644268738ac2584da292" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" default)))
 '(ecb-options-version "2.40")
 '(even-window-sizes (quote width-only))
 '(fci-rule-color "#2e2e2e")
 '(frame-background-mode nil)
 '(fringe-mode 10 nil (fringe))
 '(global-auto-complete-mode t)
 '(global-auto-revert-mode nil)
 '(global-magit-file-mode t)
 '(global-undo-tree-mode t)
 '(helm-M-x-always-save-history t)
 '(helm-ag-base-command "/usr/local/bin/ag --nocolor --nogroup")
 '(helm-buffer-max-length 40)
 '(helm-buffers-favorite-modes
   (quote
    (lisp-interaction-mode emacs-lisp-mode text-mode org-mode ruby-mode)))
 '(helm-buffers-truncate-lines nil)
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (describe-symbol . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (disassemble . helm-completing-read-symbols)
     (trace-function . helm-completing-read-symbols)
     (trace-function-foreground . helm-completing-read-symbols)
     (trace-function-background . helm-completing-read-symbols)
     (find-tag . helm-completing-read-with-cands-in-buffer)
     (org-capture . helm-org-completing-read-tags)
     (org-set-tags . helm-org-completing-read-tags)
     (ffap-alternate-file)
     (tmm-menubar)
     (find-file . helm-completing-read-symbols)
     (execute-extended-command . helm-completing-read-symbols))))
 '(helm-ff-skip-boring-files t)
 '(helm-flx-mode t)
 '(helm-follow-mode-persistent t)
 '(helm-fuzzy-matching-highlight-fn (quote helm-flx-fuzzy-highlight-match))
 '(helm-fuzzy-sort-fn (quote helm-flx-fuzzy-matching-sort))
 '(helm-google-search-function (quote helm-google-api-search))
 '(helm-ls-git-show-abs-or-relative (quote relative))
 '(helm-mode t)
 '(helm-source-names-using-follow (quote ("Occur")))
 '(helm-split-window-default-side (quote below))
 '(helm-split-window-in-side-p t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(highlight-thing-excluded-major-modes (quote (term-mode)))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(indicate-buffer-boundaries (quote left))
 '(magit-auto-revert-mode nil)
 '(magit-auto-revert-tracked-only nil)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(ns-alternate-modifier (quote meta))
 '(ns-function-modifier (quote hyper))
 '(package-selected-packages
   (quote
    (sane-term multi-term xterm-color evil rainbow-mode helm-open-github helm-git browse-at-remote zoom-window expand-region highlight-blocks highlight-thing highlight-sexp helm-flx helm-dash git-gutter-fringe magithub undo-tree helm-descbinds helm-describe-modes bookmark+ darktooth-theme autofit-frame fit-frame fontawesome ac-helm ac-inf-ruby helm-bundle-show helm-pages helm-ls-git diminish helm-robe mactag robe w3m tao-theme symon solarized-theme rvm ruby-block rspec-mode restclient powerline osx-clipboard minimap magit key-chord jasminejs-mode jammer ibuffer-projectile highlight-indentation helm-themes helm-projectile helm-google helm-ag haml-mode golden-ratio git-gutter flymake-ruby fixmee figlet f escreen emamux elscreen editorconfig cycle-resize crosshairs ample-zen-theme ahungry-theme ag ace-jump-mode ac-slime)))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(projectile-buffers-filter-function (quote projectile-buffers-with-file-or-process))
 '(projectile-ignored-projects nil)
 '(projectile-sort-order (quote recently-active))
 '(projectile-use-git-grep t)
 '(red "#ffffff")
 '(rspec-autosave-buffer t)
 '(rspec-command-options nil)
 '(rspec-compilation-skip-threshold 2)
 '(rspec-spec-command "rspec")
 '(rspec-use-bundler-when-possible nil)
 '(rspec-use-opts-file-when-available nil)
 '(rspec-use-rake-when-possible nil)
 '(rspec-use-rvm t)
 '(rspec-use-spring-when-possible nil)
 '(ruby-align-to-stmt-keywords t)
 '(ruby-block-delay 0.1)
 '(ruby-block-highlight-toggle t)
 '(ruby-deep-arglist nil)
 '(ruby-deep-indent-paren-style nil)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(smie-indent-basic 2)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dd5542")
     (40 . "#CC5542")
     (60 . "#fb8512")
     (80 . "#baba36")
     (100 . "#bdbc61")
     (120 . "#7d7c61")
     (140 . "#6abd50")
     (160 . "#6aaf50")
     (180 . "#6aa350")
     (200 . "#6a9550")
     (220 . "#6a8550")
     (240 . "#6a7550")
     (260 . "#9b55c3")
     (280 . "#6CA0A3")
     (300 . "#528fd1")
     (320 . "#5180b3")
     (340 . "#6380b3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(visual-line-fringe-indicators (quote (nil nil)))
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(whitespace-action (quote (auto-cleanup)))
 '(whitespace-style (quote (face)))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120))))
 '(hi-yellow ((t (:underline (:color foreground-color :style wave)))))
 '(whitespace-line ((t (:background "gray10")))))
