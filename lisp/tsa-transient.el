;; THIS FILE IS GENERATED
;; Miscellaneous functions
;; Tory S. Anderson (concat "mail" "@" "toryanderson" ".com")

;;; Usage Functions
(defun transient-ace-cmd ()
  (interactive)
  (ace-window 1)
  (add-hook 'ace-window-end-once-hook
	    'tsa/transient-window))

(defun tsa/split-vertical ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun tsa/split-horizontal ()
  (interactive)
  (split-window-below)
  (windmove-down))

(defun tsa/screen-swap ()
  (interactive)
  (ace-window 4)
  ;; (add-hook 'ace-window-end-once-hook
  ;; 	    'transient-window)
  )

(defun tsa/del-window ()
  (interactive)
  (ace-window 16)
  (add-hook 'ace-window-end-once-hook
	    'transient-window))

(defun tsa/split-window-4 ()
  "Split into 4 windows"
 (interactive)
 (when (= 1 (length (window-list)))
   (split-window-vertically)
   (split-window-horizontally)
   (other-window 2)
   (split-window-horizontally)))

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

(transient-define-prefix tsa/transient-highlight ()
  "Persistent Highlights"
  [["Highlight"
    ("r" "Highlight regexp" highlight-lines-matching-regexp)
    ;("c" "Column Highlight Mode" column-highlight-mode)
    ("X" "highlight changes (global)" global-highlight-changes-mode)
    ("x" "Highlight changes (local)" highlight-changes-mode)
    ;("e" "Global highlight edits" global-semantic-highlight-edits-mode)
    ("l" "Highlight lines" highlight-lines-matching-regexp)
    ("b" "Compare buffers" highlight-compare-buffers)
    ("f" "Compare file" highlight-compare-with-file)
    ("p" "Highlight Phrase" highlight-phrase)
    ("r" "Highlight regexp" highlight-regexp)
    ("." "Highlight symbol at point" highlight-symbol-at-point)
    ("u" "Unhighlight" unhighlight-regexp)
    ]])

(transient-define-prefix tsa/transient-multiplecursors ()
  "MultiCursors"
  :transient-suffix 'transient--do-stay  
  [["Multiple Cursors"
    ("n" "next~" mc/mark-next-lines)
    ("N" "un next~" mc/unmark-next-like-this)
    ("p" "prev~" mc/mark-previous-like-this)
    ("P" "un prev~" mc/unmark-previous-like-this)
    ("a" "all~" mc/mark-all-like-this)
    ("r" "all-region" mc/mark-all-in-region)
    ("d" "all-dwim" mc/mark-all-dwim)
    ("." "mark-pop" mc/mark-pop)
    ("w" "words" mc/mark-all-words-like-this)
    ("#" "numbers" mc/insert-numbers)]])

(transient-define-prefix tsa/transient-w3m ()
  "W3M"
  ["W3M"
   ("e" "🔍 search" w3m-search)
   ("n" "🏠 new" w3m)
   ("h" "history" w3m-db-history)
   ("b" "buffers" w3m-select-buffer)
   ])

(transient-define-prefix tsa-transient-spelling ()
  "Spelling"
  ["Spelling"
   ("<f12>" "spell buffer" flyspell-buffer :transient t)
   ("<f11>" "spell correct" tsa/correct-all)
   ("<f10>" "one correct" flyspell-correct-wrapper)]
  )

(transient-define-prefix tsa/transient-shell
  "Shell commands to be used"
  ["Shell Commands"
   [("z" "bettersh" better-shell-shell)
    ("r" "remote" better-shell-remote-open)
    ("e" "eshell" eshell)
    ("t" "term" term)
    ]])

(transient-define-prefix tsa/transient-help ()
  "Help commands that I use. A subset of C-h with others thrown in."
  ["Help Commands"
   ["Mode & Bindings"
    ("m" "Mode" describe-mode)
    ("b" "Major Bindings" which-key-show-full-major-mode)
    ("B" "Minor Bindings" which-key-show-full-minor-mode-keymap)
    ("d" "Descbinds" tsa/consult-descbinds)
    ("D" "Descbinds" Helper-describe-bindings)
    ("t" "Top Bindings  " which-key-show-top-level)]
   ["Describe"
    ("C" "Command" helpful-command)
    ("f" "Function" helpful-callable)
    ("v" "Variable" helpful-variable)
    ("k" "Key" helpful-key)
    ("c" "Key Briefly" describe-key-briefly)
    ]
   ["Info on"
    ("C-m" "Linux Manual" man)
    ("C-c" "Emacs Command" Info-goto-emacs-command-node)
    ("C-f" "Function" describe-function)
    ("C-v" "Variable" describe-variable)     
    ("C-k" "Emacs Key" Info-goto-emacs-key-command-node)
    ]
   ["Goto Source"
    ("L" "Library" find-library-other-frame)
    ("F" "Function" find-function-other-frame)
    ("V" "Variable" find-variable-other-frame)
    ("K" "Key" find-function-on-key-other-frame)
    ]
   ]
  [
   ["Internals"
    ("u" "Insert Unicode Char" insert-char)
    ("I" "Input Method" describe-input-method)
    ("G" "Language Env" describe-language-environment)
    ("S" "Syntax" describe-syntax)
    ("O" "Coding System" describe-coding-system)
    ("C-o" "Coding Brief" describe-current-coding-system-briefly)
    ("T" "Display Table" describe-current-display-table)
    ("e" "Echo Messages" view-echo-area-messages)
    ("l" "Lossage" view-lossage)
    ]
   ["Describe"
    ("s" "Symbol" helpful-symbol)
    ("." "At Point   " helpful-at-point)
    ("C-f" "Face" describe-face)
    ("w" "Where Is" where-is)
    ("=" "Position" what-cursor-position)
    ]
   ["Info Manuals"
    ("C-i" "Info" info)
    ("C-4" "Other Window " info-other-window)
    ("C-e" "Emacs" info-emacs-manual)
    ("C-m" "Linux Man" man)
    ]
   ]
  )

(transient-define-prefix tsa/transient-global-org
  "Orgmode Master Transient"
  ;; (:color blue
  ;; :hint nil
  ;; :body-pre (setq exwm-input-line-mode-passthrough ''t)
  ;; :post (setq exwm-input-line-mode-passthrough nil))
  [["Clocks"
    ("C-t" "timer start"  org-timer-start)
    ("C-s" "timer stop"  org-timer-stop)
    ("w" "clock-in to recent task" org-mru-clock-in)
    ("W" "Clock in the last task" org-clock-in-last)
    ("o" "Clock Out" org-clock-out)
    ("j" "goto clock" org-clock-goto)
    ("J" "Go to a clock" (lambda () (interactive) (org-clock-goto '(4))))]

   ["Timers"
    ("r" "Set Timer" org-timer-set-timer)
    ("p" "Print org timer" org-timer)]

   ["Hugo Blogging"
    ("h" "export to hugo" hugo)
    ("u" "upload" hugo-publish-up)
    ("t" "publish and upload" hugo-total)
    ]

   ["Misc"
    ("g" "Export as Markdown" org-gfm-export-as-markdown)
    ("\\" "toggle pretty entities" org-toggle-pretty-entities)
    ("l" "go to last stored capture" org-capture-goto-last-stored)
    ("," "set org priority" org-priority)]])

(defun tsa/move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun tsa/move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'left))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun tsa/move-splitter-up (arg)
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

(defun tsa/move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

(transient-define-prefix tsa/transient-scroll ()
  "WIP Navigate screen repeatably. but suffix or infix don't seem to do it"
  [["Navigate Viewport"
    ("," "scroll leftward" scroll-right)
    ("." "scroll rightward" scroll-left)
    ("[" "backward a page" backward-page)
    ("]" "forward a page" forward-page)]])

(transient-define-prefix tsa/transient-goto ()
  "Buffer nav"
  [["Go To in Buffer"
    ("g" "line" goto-line)
    ("TAB" "column" move-to-column)
    ("l" "jump to visible line" ace-jump-line-mode)
    ("c" "char" goto-char)
    ("o" "ace" ace-link)   
    ]
   ["Navigate Viewport"
    ("[" "Navigate Viewport" tsa/transient-scroll)
    ]
   ["Errors"
    ("n" "next err" next-error)
    ("p" "prev err" previous-error)]

   ["Replace"
    ("r" "query replace simple" anzu-query-replace)
    ("R" "query replace regexp" anzu-query-replace-regexp)
    ("t" "query replace thing at cursor" anzu-query-replace-at-cursor)
    ("T" "clobber-replace thing at cursor" anzu-query-replace-at-cursor-thing)
    ]])

(transient-define-prefix tsa/transient-bbdb ()
  "BBDB Commands"
  ["BBDB"
   ("b" "Ivy BBDB" tsa/bbdb-list)
   ("B" "BBDB" bbdb)
   ("c" "Create" bbdb-create)
   ("x" "X-Field" bbdb-search-xfields)
   ("s" "Snarf" bbdb-snarf)]
  )

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

(transient-define-prefix tsa/transient-fkeys
  "Transient for the <f#> keys"
  ["F-Keys"
  ("<f1>" "hide modeline" tsa/hide-mode-line)
  ("<C-f1>" "show filename" tsa/show-file-name)
  ("<f2>" "prev msg" tsa/insert-previous-message)
  ("<f3>" "Toggle search word//char" tsa/toggle-ace-mode)
  ("<f4>" "shorturl" tsa/yourls-shorten-at-point)
  ("<f5>" "truncate lines" toggle-truncate-lines)
  ("<f6>" "hl-line mode" global-hl-line-mode)
  ("<S-f6>" "hicol" column-highlight-mode )
  ("<f7>" "line num mode" display-line-numbers-mode)
  ("<C-f7" "scrollbar" toggle-scroll-bar)
  ("r" "revert buffer" revert-buffer)])

(defun tsa/hide-mode-line (arg)
  "Hide or global hide-modeline for a transient. Doesn't work, though."  
  (interactive "p")
  (message (format "Arg is: %d" arg))
  (cond
   ((equal arg 1)
    ((lambda () (interactive) (hide-mode-line-mode))))
   ((equal arg 4)
    ((lambda () (interactive) (global-hide-mode-line-mode))))))
