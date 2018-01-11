(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")))
(package-initialize)

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'delight)
(require 'bind-key)                ;; if you use any :bind variant



(setq visible-bell t)











(global-set-key [f5] 'toggle-truncate-lines) ;; Linewrap?
(global-set-key [f6] 'global-hl-line-mode) ;; Highlight current line
(global-set-key [f7] 'linum-mode) ;; Line Numbers in margin
(global-set-key [C-f7] 'toggle-scroll-bar) ;; Toggle scroll bar 
(global-set-key [C-f8] 'calendar) ;; start calendar
(global-set-key [f9] 'tsa/quick-gnus) ;; Check mail
(global-set-key [s-f11] 'toggle-frame-fullscreen)
(global-set-key [f12] 'ispell) ;; Spellcheck
(global-set-key (kbd "C-x C-d") 'dired) ;; so dired is both C-x C-d and C-x d
(global-set-key (kbd "C-x C-q") 'view-mode) ;; view mode
(global-set-key (kbd "M-C-;") 'comment-box)

(setq initial-scratch-message "")
(setq inhibit-startup-message t)














(use-package cider-hydra
  :ensure t)




(use-package clojure-mode
  :ensure t
  :config
  (defun my-clojure-mode-hook () 
    (highlight-phrase "TODO" 'web-mode-comment-keyword-face) 
    (yas-minor-mode 1) 
    )
  (add-hook 'clojure-mode-hook #'my-clojure-mode-hook))


(use-package company
  :ensure t
  :delight company-mode "C"
  :bind (("TAB" . company-indent-or-complete-common))
  :defer t
  :config
  (global-company-mode)
  (use-package "ac-html-csswatcher")
  (use-package "company-auctex")
  (use-package "company-web")
  (use-package "helm-company")
  (define-key company-mode-map (kbd "C-:") 'helm-company)
  (define-key company-active-map (kbd "C-:") 'helm-company)
  (setq company-idle-delay 0.3))

(use-package company-quickhelp
  :ensure pos-tip
  :config
  (company-quickhelp-mode 1)
  (setq company-quickhelp-delay 0.5))


(use-package diminish-mode)
(use-package dired-filter
  :ensure t)
(use-package dired-subtree
  :ensure t)
(use-package dired-narrow
  :ensure t
  :config 
  (bind-keys
   :map dired-mode-map
   ("C-c n" . dired-narrow)))











(use-package helm
  :ensure t
  :bind (("C-c h" . helm-command-prefix)
         ("M-y" . helm-show-kill-ring)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("C-h z" . helm-resume)
         ("M-x" . helm-M-x))
  :delight helm-mode
  :config
  (use-package helm-config)
  (use-package helm-files)
  (use-package helm-grep)
  (use-package helm-org)
  (use-package helm-org-rifle :ensure t)
  (use-package helm-descbinds :ensure t)
  (helm-descbinds-mode)
  (global-set-key (kbd "C-h k") 'helm-descbinds)
  (global-unset-key (kbd "C-x c"))
  
  (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  (define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
  (define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
  (define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)
  
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))
  (setq helm-quick-update                     t ; do not display invisible candidates
        helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
        helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
        helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
        helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
        helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
        helm-ff-file-name-history-use-recentf t
        helm-semantic-fuzzy-match         t ; imenu fuzzy match
        helm-imenu-fuzzy-match            t)
  (helm-mode 1))




(use-package helm-swoop
  :ensure t
  :bind (("M-i" . helm-swoop)
         ("M-I" . helm-swoop-back-to-last-point)
         ("C-c M-i" . helm-multi-swoop)
         ("C-x M-i" . helm-multi-swoop-all))
  :config
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)
  (setq helm-multi-swoop-edit-save t)
  
  (setq helm-swoop-split-with-multiple-windows nil)
  
  (setq helm-swoop-split-direction 'split-window-vertically)
  
  (setq helm-swoop-speed-or-color t)
  
  (setq helm-swoop-move-to-line-cycle t)
  
  (setq helm-swoop-use-line-number-face t))

(use-package hydra
  :ensure t
  :config
  
  (require 'windmove) ; also already added in my emacs-el
  (defun hydra-move-splitter-left (arg)
    "Move window splitter left."
    (interactive "p")
    (if (let ((windmove-wrap-around))
          (windmove-find-other-window 'right))
        (shrink-window-horizontally arg)
      (enlarge-window-horizontally arg)))
  
  (defun hydra-move-splitter-right (arg)
    "Move window splitter right."
    (interactive "p")
    (if (let ((windmove-wrap-around))
          (windmove-find-other-window 'right))
        (enlarge-window-horizontally arg)
      (shrink-window-horizontally arg)))
  
  (defun hydra-move-splitter-up (arg)
    "Move window splitter up."
    (interactive "p")
    (if (let ((windmove-wrap-around))
          (windmove-find-other-window 'up))
        (enlarge-window arg)
      (shrink-window arg)))
  
  (defun hydra-move-splitter-down (arg)
    "Move window splitter down."
    (interactive "p")
    (if (let ((windmove-wrap-around))
          (windmove-find-other-window 'up))
        (shrink-window arg)
      (enlarge-window arg)))
  
  
  (global-set-key [C-up] 'enlarge-window)
  (global-set-key [C-down] (lambda () (interactive)
                             (enlarge-window -1)))
  
  (bind-key* "C-M-o"
             (defhydra hydra-window ()
               "
Movement^^        ^Split^         ^Switch^		^Resize^
----------------------------------------------------------------
_h_ ←       	_v_ertical    	_b_uffer		_q_ X←
_j_ ↓        	_x_ horizontal	_f_ind files	_w_ X↓
_k_ ↑        	_z_ undo      	_a_ce 1		_e_ X↑
_l_ →        	_Z_ redo      	_s_wap		_r_ X→
_F_ollow		_D_lt Other   	_S_ave		max_i_mize
_SPC_ cancel	_o_nly this   	_d_elete	
_,_ Scroll←			_p_roject
_._ Scroll→
"
               ("h" windmove-left )
               ("C-h"  windmove-left )
               ("j" windmove-down )
               ("C-j"  windmove-down )
               ("k" windmove-up )
               ("C-k"  windmove-up )
               ("l" windmove-right )
               ("C-l"  windmove-right )
               ("q" hydra-move-splitter-left)
               ("C-q"  hydra-move-splitter-left)
               ("w" hydra-move-splitter-down)
               ("C-w"  hydra-move-splitter-down)
               ("e" hydra-move-splitter-up)
               ("C-e"  hydra-move-splitter-up)
               ("r" hydra-move-splitter-right)
               ("C-r"  hydra-move-splitter-right)
               ("b" helm-mini)
               ("C-b"  helm-mini)
               ("f" helm-find-files)
               ("C-f"  helm-find-files)
               ("p" helm-projectile)
               ("C-p"  helm-projectile)
               ("F" follow-mode)
               ("C-F"  follow-mode)
               ("a" hydra-ace-cmd)
               ("C-a"  hydra-ace-cmd)
               ("v" hydra-split-vertical)
               ("C-v"  hydra-split-vertical)
               ("x" hydra-split-horizontal)
               ("C-x"  hydra-split-horizontal)
               ("s" hydra-swap)
               ("C-s"  hydra-swap)
               ("S" save-buffer)
               ("C-S"  save-buffer)
               ("d" delete-window)
               ("C-d"  delete-window)
               ("D" hydra-del-window)
               ("C-D"  hydra-del-window)
               ("o" delete-other-windows)
               ("C-o"  delete-other-windows)
               ("i" ace-maximize-window)
               ("C-i"  ace-maximize-window)
               ("z" (progn
                      (winner-undo)
                      (setq this-command 'winner-undo)))
               ("C-z" (progn
                        (winner-undo)
                        (setq this-command 'winner-undo)))
               ("Z" winner-redo)
               ("C-Z"  winner-redo)
               ("SPC" nil)
               ("C-SPC"  nil)
               ("." scroll-left)
               ("," scroll-right)
               ))
  
  (global-set-key
   (kbd "M-g")
   (defhydra hydra-goto ()
     "Go To"
     ("g" goto-line "line") ; reserve for normal M-g g function (may be different in some modes)
     ("M-g" goto-line "line")
     ("TAB" move-to-column "col")
     ("a" ace-jump-mode "ace line")
     ("c" goto-char "char")
     ("n" next-error "next err")
     ("p" previous-error "prev err")
     ("r" anzu-query-replace "qrep")
     ("R" anzu-query-replace-regexp "rep regex")
     ("t" anzu-query-replace-at-cursor "rep cursor")
     ("T" anzu-query-replace-at-cursor-thing "rep cursor thing")
     ("," scroll-right "scroll leftward")
     ("." scroll-left "scroll rightward")
     ("[" backward-page "back page")
     ("]" forward-page "forward page")
     ("SPC" nil "cancel")
     ))
  )

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer))
  :config (autoload 'ibuffer "ibuffer" "List buffers." t))

(use-package ivy
  :ensure t)

(use-package magit
  :ensure t
  :config
  (global-magit-file-mode)
  (global-set-key "\C-xg" 'magit-status)
  (setq magit-diff-use-overlays nil))


(use-package company-quickhelp
  :ensure pos-tip
  :config
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))











(use-package smartparens-config
  :ensure smartparens
  :demand t
  :config
  (show-smartparens-global-mode)
  (sp-use-paredit-bindings)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'clojure-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'cider-repl-mode-hook #'turn-on-smartparens-strict-mode)
  (bind-keys
   :map smartparens-strict-mode-map
   (";" . sp-comment)
   ("M-f" . sp-forward-symbol)
   ("M-b" . sp-backward-symbol)
   ("M-a" . sp-beginning-of-sexp)
   ("M-e" . sp-end-of-sexp)))

(use-package paren
  :config
  (show-paren-mode 1))

(use-package projectile
  :ensure t
  :delight '(:eval (concat "[P: " (projectile-project-name) "]"))
  :config
  (use-package helm-projectile :ensure t)
  (projectile-global-mode)
  (setq projectile-completion-system 'helm
        projectile-switch-project-action 'helm-projectile)
  (define-key projectile-command-map (kbd "s g") 'helm-projectile-grep))

(use-package rainbow-mode
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package rainbow-identifiers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))

(use-package rainbow-mode
  :ensure t)

(use-package recentf
  :ensure t
  :bind (("C-x C-r" . recentf-open-files))
  :config
  (setq recentf-max-menu-items 100)
  (recentf-mode 1))

(use-package smart-mode-line
  :ensure powerline
  :config
  (setq
   sml/theme 'dark
   sml/name-width 44
   sml/mode-width 'full
   sml/show-eol nil)
  )

(use-package spacemacs-common
  :ensure spacemacs-theme
  :config
  (load-theme 'spacemacs-dark t)
  )




(use-package frame
  :config
  (setq blink-cursor-blinks -1)
  (blink-cursor-mode))

(use-package shell
  :config ;http://stackoverflow.com/questions/704616/something-wrong-with-emacs-shell
  (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
  
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  (add-to-list 'display-buffer-alist
               '("^\\*shell\\*$" . (display-buffer-same-window)))) ;; don't open shell in a new window


(use-package web-mode
  :config
  (add-to-list 'web-mode-comment-formats '("php" . "//"))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.htm\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.htaccess\\'" . conf-mode))
  (add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python-mode))
  (defun my-web-mode-hook ()
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-indent-style 2))
  (setq-default indent-tabs-mode nil)
  (add-hook 'web-mode-hook  'my-web-mode-hook))

(use-package windmove
  :ensure t
  :config
  (setq windmove-default-keybindings t)
  (setq max-specpdl-size 10000))


(use-package yasnippet
  :delight yas-minor-mode "Y"
  :ensure t
  :config
  (add-to-list 'yas-snippet-dirs
               "~/emacs/Snippets"
               )
  (yas-global-mode))

(use-package cider
  :ensure t
  :config
  (setq cider-repl-use-clojure-font-lock t
        cider-font-lock-dynamically '(macro core function var))
  (cider-repl-toggle-pretty-printing)
  (setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (defun figwheel-connect ()
    (interactive)
    (cider-connect "localhost" "7002"))
  )

