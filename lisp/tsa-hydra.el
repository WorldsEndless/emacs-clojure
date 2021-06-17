;; THIS FILE IS GENERATED
;; Miscellaneous functions
;; Tory S. Anderson (concat "mail" "@" "toryanderson" ".com")

;;; Usage Functions
(defun tsa/hydra-ace-cmd ()
  (interactive)
  (ace-window 1)
  (add-hook 'ace-window-end-once-hook
	    'tsa/transient-window))

(defun hydra-split-vertical ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun hydra-split-horizontal ()
  (interactive)
  (split-window-below)
  (windmove-down))

(defun tsa/hydra-screen-swap ()
  (interactive)
  (ace-window 4)
  (add-hook 'ace-window-end-once-hook
	    'tsa/hydra-window))

(defun hydra-del-window ()
  (interactive)
  (ace-window 16)
  (add-hook 'ace-window-end-once-hook
	    'tsa/transient-window))

(defun tsa/split-window-4 ()
  "Split into 4 windows"
 (interactive)
 (if (= 1 (length (window-list)))
     (progn (split-window-vertically)
	    (split-window-horizontally)
	    (other-window 2)
	    (split-window-horizontally))))

(defun tsa/correct-all () 
  (interactive)
  (setq current-prefix-arg '(4))
  (call-interactively 'flyspell-correct-wrapper))

(defun tsa/projectile (&optional choose-project)
  "Open the scratch buffer. With c-u, in other window."
  (interactive "P")
  (let ((scratch "*scratch*"))
    (if choose-project (projectile-switch-project)
      (projectile-find-file))))

(defun tsa/open-scratch (&optional same-window)
  "Open the scratch buffer. With c-u, in other window."
  (interactive "P")
  (let ((scratch "*scratch*"))
    (if same-window (switch-to-buffer scratch)
      (switch-to-buffer-other-window scratch))))

(defhydra tsa/hydra-multiplecursors (global-map "C-;"
					    :color red)
  "MultiCursors"
  ("n" mc/mark-next-lines "next~")
  ("N" mc/unmark-next-lines "un next~")
  ("p" mc/mark-previous-lines "prev~")
  ("P" mc/unmark-previous-lines "un prev~")
  ("a" mc/mark-all-like-this "all~")
  ("r" mc/mark-all-in-region "all-region")
  ("d" mc/mark-all-dwim "all-dwim")
  ("." mc/mark-pop "mark-pop")
  ("w" mc/mark-all-words-like-this "words")
  ("#" mc/insert-numbers "numbers")
  ("SPC" nil) )

(defhydra tsa/hydra-w3m (:color blue)
   "EW3M"
   ("e" w3m-search "w3m 🔍")
   ("E" w3m "w3m 🏠")
   ("h" w3m-db-history "history")
   ("b" w3m-select-buffer "buffers")
   )

;; "Eww"
;; ("e" eww "eww")
;; ("b" eww-switch-to-buffer "switch")
;; ("B" eww-list-buffers "buffers")
;;"h" eww-list-histories "history")

(global-set-key
 (kbd "<f12>")
 (defhydra tsa/hydra-spelling (:color red)
   "Shell"
   ("<f12>" flyspell-buffer "spell buffer")
   ("<f11>" tsa/correct-all "spell correct" :color blue)
   ("<f10>" flyspell-correct-wrapper "one correct")))

(global-set-key
 (kbd "C-z")
 (defhydra tsa/hydra-shells (:color blue)
   "Shell"
   ("z" better-shell-shell "bettersh")
   ("C-z" better-shell-shell "bettersh")
   ("Z" better-shell-remote-open "better-remote")
   ("e" eshell "eshell")
   ("t" term "term")))

(global-set-key
 (kbd "C-c o")
 (defhydra tsa/hydra-global-org (:color blue
			    :hint nil
			    :body-pre (setq exwm-input-line-mode-passthrough ''t)
			    :post (setq exwm-input-line-mode-passthrough nil))

   ("C-t"  org-timer-start "⏰ start")
   ("C-s"  org-timer-stop "⏰ stop")
   ("C-S"  org-timer-stop)
   ;; Need to be at timer
   ("r" org-timer-set-timer "⏰ set")
   ("C-r"  org-timer-set-timer)
   ;; Print timer value to buffer0:00:00 
   ("p" org-timer "⏲ stat")
   ("C-p"  org-timer)
   ("w" (org-mru-clock-in ;org-clock-in '(4)
	 ) "🕑 clock-in")
   ("C-w"  (org-clock-in '(4)))
   ("o" org-clock-out "🕕 out")
   ("C-o"  org-clock-out)
   ;; Visit the clocked task from any buffer
   ("j" org-clock-goto "⮏")
   ("C-j"  org-clock-goto)
   ("l" org-capture-goto-last-stored "⮰")
   ("C-l"  org-capture-goto-last-stored)
   ("," org-priority "orgp⤴")
   ("C-,"  org-priority)
   ("h" hugo "✍ hugo")
   ("u" hugo-publish-up "✍ pub")
   ("t" hugo-total "✍ total")
   ("g" org-gfm-export-as-markdown "as🅫")
   ("\\" org-toggle-pretty-entities "λ")
   ("W" org-clock-in-last "Clock in the last task")      
   ("J" (lambda () (interactive) (org-clock-goto '(4))) "Go to a clock")))

(require 'windmove) ; also already added in my emacs-el

(defun tsa/hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun tsa/hydra-move-splitter-left (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun tsa/hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun tsa/exwm-workspace-swap ()
  "Swap workspaces, querying for which to swap if there are more than 2"
  (interactive)
  (if (= 2 (exwm-workspace--count))
      (let ((w1 (first exwm-workspace--list))
	    (w2 (second exwm-workspace--list)))
	(exwm-workspace-swap w1 w2))
    (call-interactively 'exwm-workspace-swap)))

(defun tsa/hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

(bind-key* "C-M-o"
	   (defhydra tsa/hydra-window (:body-pre (setq exwm-input-line-mode-passthrough ''t)
					     :post (setq exwm-input-line-mode-passthrough nil))
	     "
Movement^^        ^Split^         ^Switch^		^Resize^
----------------------------------------------------------------
_h_ ←       	_v_ertical    	_b_uffer		_q_ X←
_j_ ↓        	_x_ horizontal	_f_ind files	_w_ X↓
_k_ ↑        	_z_ undo      	_a_ce 1		_e_ X↑
_l_ →        	_Z_ redo      	_s_wap		_r_ X→
_F_ollow	_S_witch  	_D_lt Other   			max_i_mize
_SPC_ cancel	_o_nly this   	_d_elete	
_,_ Scroll←			_p_roject
_._ Scroll→                     _g_rep
"
	     ("h" windmove-left )
	     ("C-h"  windmove-left )
	     ("j" windmove-down )
	     ("C-j"  windmove-down )
	     ("k" windmove-up )
	     ("C-k"  windmove-up )
	     ("l" windmove-right )
	     ("C-l"  windmove-right )
	     ("q" tsa/hydra-move-splitter-left)
	     ("C-q"  tsa/hydra-move-splitter-left)
	     ("w" tsa/hydra-move-splitter-down)
	     ("C-w"  tsa/hydra-move-splitter-down)
	     ("e" tsa/hydra-move-splitter-up)
	     ("C-e"  tsa/hydra-move-splitter-up)
	     ("r" tsa/hydra-move-splitter-right)
	     ("C-r"  tsa/hydra-move-splitter-right)
	     ("b" switch-to-buffer)
	     ("C-b"  switch-to-buffer)
	     ("f" find-file)
	     ("C-f"  find-file)
	     ("g" consult-git-grep :color blue)
	     ("p" tsa/projectile)
	     ("C-p"  tsa/projectile)
	     ("F" follow-mode)
	     ("C-F"  follow-mode)
	     ("a" tsa/hydra-ace-cmd)
	     ("C-a"  tsa/hydra-ace-cmd)
	     ("v" tsa/split-vertical)
	     ("C-v"  tsa/split-vertical)
	     ("x" tsa/split-horizontal)
	     ("C-x"  tsa/split-horizontal)
	     ("s" tsa/screen-swap)
	     ("C-s"  tsa/screen-swap)
	     ("S" toggle-window-split)
	     ("C-S" toggle-window-split)
	     ("d" delete-window)
	     ("C-d"  delete-window)
	     ("D" tsa/del-window)
	     ("C-D"  tsa/del-window)
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
	     ("4" tsa/split-window-4)
	     ("=" tsa/open-scratch "Scratch")
	     ("t" projectile-toggle-between-implementation-and-test "test<>imp")
	     ("`" tsa/exwm-workspace-swap "exwm swap")))

(global-set-key
 (kbd "M-g")
 (defhydra tsa/hydra-goto ()
   "Go To"
   ("g" goto-line "line") ; reserve for normal M-g g function (may be different in some modes)
   ("M-g" goto-line "line")
   ("TAB" move-to-column "col")
   ("l" ace-jump-line-mode "ace line" :color blue)
   ("c" goto-char "char")
   ("n" next-error "next err")
   ("o" ace-link "ace" :color blue)
   ("p" previous-error "prev err")
   ("r" anzu-query-replace "qrep")
   ("R" anzu-query-replace-regexp "rep regex")
   ("t" anzu-query-replace-at-cursor "rep cursor")
   ("T" anzu-query-replace-at-cursor-thing "rep cursor thing")
   ("," scroll-right "scroll leftward")
   ("." scroll-left "scroll rightward")
   ("[" backward-page "back page")
   ("]" forward-page "forward page")
   ("SPC" nil "cancel")))

(defhydra tsa/hydra-gnus-group ()
  "Gnus Group"
					;    ("TAB" gnus-topic-indent "indent")
					;    ("<tab>" gnus-topic-indent "indent")
  ("#" gnus-topic-mark-topic "mark")
  ("u" gnus-topic-unmark-topic "unmark")
  ("C" gnus-topic-copy-matching "Copy-m")
  ("D" gnus-topic-remove-group "DLT")
  ("H" gnus-topic-toggle-display-empty-topics "Hide Empty")
  ("M" gnus-topic-move-matching "Move-m")
  ("S" gnus-topic-sort-map "sort")
  ("c" gnus-topic-copy-group "copy")
  ("h" gnus-topic-hide-topic "hide")
  ("j" gnus-topic-jump-to-topic "jump")
  ("m" gnus-topic-move-group "move")
  ("N" gnus-topic-create-topic "new")
  ("n" gnus-topic-goto-next-topic "→")
					;    ("TAB" gnus-topic-goto-next-topic "→")
  ("<tab>" gnus-topic-goto-next-topic "→")
  ("p" gnus-topic-goto-previous-topic "←")
					;    ("BACKTAB" gnus-topic-goto-previous-topic "←")
  ("<backtab>" gnus-topic-goto-previous-topic "←")
  ("r" gnus-topic-rename "rename")
  ("s" gnus-topic-fold-this-topic "show")
  ("DEL" gnus-topic-delete "delete")
  ("SPC" nil "cancel"))

(global-set-key
 (kbd "C-c b")
 (defhydra tsa/hydra-bbdb ()
   "Go To"
   ("b" tsa/bbdb-list "Ivy BBDB")
   ("B" bbdb "BBDB")
   ("c" bbdb-create "Create")
   ("x" bbdb-search-xfields "X-Field")
   ("s" bbdb-snarf "Snarf")
   ("SPC" nil "cancel")
   ))

(defun tsa/toggle-ace-mode ()
  "Toggle whether to search by word or char"
  (interactive)
  (if (function-equal ace-isearch-function 'ace-jump-char-mode)
      (progn 
	(setq ace-isearch-function 'ace-jump-word-mode)
	(message "Jump-Word Mode"))
    (progn 
      (setq ace-isearch-function 'ace-jump-char-mode)
      (message "Jump-Char Mode"))))

(defun tsa/hide-mode-line (arg)
  "Hide or global hide-modeline for a hydra. Doesn't work, though."  
  (interactive "p")
  (message (format "Arg is: %d" arg))
  (cond
   ((equal arg 1)
    ((lambda () (interactive) (hide-mode-line-mode))))
   ((equal arg 4)
    ((lambda () (interactive) (global-hide-mode-line-mode))))))

(defhydra tsa/hydra-fkeys
  (:color red)
  "F Keys"
  ("<f1>" tsa/hide-mode-line "modeline" :color blue)
  ("<C-f1" tsa/show-file-name "filename" :color blue)
  ("<f2>" tsa/insert-previous-message "prev msg")
  ("<f3>" tsa/toggle-ace-mode "Search w//c")
  ("<f4>" tsa/yourls-shorten-at-point "shorturl")
  ("<f5>" toggle-truncate-lines "truncate" :color blue)
  ("<f6>" global-hl-line-mode "hlline")
  ("<S-f6>" column-highlight-mode  "hicol")
  ("<f7>" display-line-numbers-mode "lnum")
  ("<C-f7" toggle-scroll-bar "scrollbar")
  ("r" revert-buffer "revert")
  ("SPC" nil "cancel" :color blue))
