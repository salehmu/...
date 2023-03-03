;;; ../configs/.doom.d/keys.el -*- lexical-binding: t; -*-

(provide 'keys)
(require '+handy)


;; unbinding
(define-key org-mode-map (kbd "C-c C-f") nil)
(global-unset-key        (kbd "C-f"))
(general-auto-unbind-keys)



(define-key evil-normal-state-map       (kbd "C-g") 'evil-escape)
(define-key evil-visual-state-map       (kbd "C-g") 'evil-escape)
(define-key evil-insert-state-map       (kbd "C-g") 'evil-escape)
(define-key evil-replace-state-map      (kbd "C-g") 'evil-escape)
(define-key evil-operator-state-map     (kbd "C-g") 'evil-escape)


(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-g") 'salih/evil-escape-and-abort-company)
  (define-key company-search-map (kbd "C-g") 'salih/evil-escape-and-abort-company))


;; Run project

;; TODO Refactor this. I think this should be rewritten as an only one function
;; that is "Run file", which check the mode and map it to the matching running
;; method.

(add-hook 'c++-mode-hook
          (lambda () (local-set-key (salih/mode "C-c") 'salih/compile-and-run-cpp)))

(add-hook 'csharp-mode-hook
          (lambda () (local-set-key (salih/mode "C-c") 'salih/compile-and-run-csharp)))

(add-hook 'go-mode-hook
          (lambda () (local-set-key (salih/mode "C-c") 'salih/compile-and-run-go-file)
                (local-set-key (kbd "<f2>") 'salih/compile-and-run-go-project)))


;; open file in dired
(add-hook 'dired-mode-hook
          (lambda () (local-set-key (salih/mode "C-c") 'salih/open-in-external-app)))

;; make life easier in org
(add-hook 'org-mode-hook
          (lambda () (local-set-key (salih/mode "C-f") 'org-footnote-action)))

(add-hook 'TeX-mode-hook
          (lambda () (local-set-key (salih/global "C-l") '(TeX-command-master "LatexMk"))))
;; convenient
(general-define-key
 :prefix salih/prefix-global
 "c"    'org-capture
 "a"    'org-agenda
 "."    'find-file
 ","    'persp-switch-to-buffer
 "<"    'switch-to-buffer
 "RET"  'bookmark-jump
 "["    'previous-buffer
 "]"    'next-buffer
 "d"    'kill-current-buffer
 "k"    'kill-current-buffer
 "D"    'doom/kill-all-buffers
 "K"    'doom/kill-other-buffers
 "C-t"  'gts-do-translate
 "l l"  'leetcode
 "TAB d" '+workspace/delete
 "SPC" 'projectile-find-file)

;; file keys
(general-define-key
 :prefix (concat salih/prefix-global "f")
 "r" 'recentf-open-files
 "g" 'magit-find-file
 "l" 'projectile-find-file)

;; code keys
(general-define-key
 :prefix (concat salih/prefix-mode "c")
 "d" '+lookup/definition
 "r" '+lookup/references
 "t" '+lookup/type-definition
 "e" '+default/diagnostics
 "g" 'salih/find-definition-or-lookup)

;; convenient
(general-define-key
 :prefix (concat salih/prefix-mode "e")
 ;; e + l = (e)rrors (l)ist
 "l" 'flycheck-list-errors
 ;; wat
 ";" 'salih/rename-or-iedit)

;; search global
(general-define-key
 :prefix (concat salih/prefix-global "s")
 "d" '+default/search-cwd
 "b" '+default/search-buffer
 "p" '+default/search-project
 "g" 'rgrep
 "w" '+lookup/dictionary-definition)

;; insertion
(general-define-key
 :prefix (concat salih/prefix-mode "i")
 "u" 'insert-char
 "n" 'org-noter-insert-note
 "t" 'insert-now-timestamp)

;; notes
(general-define-key
 :prefix (concat salih/prefix-global "n")
 "b" 'citar-open-notes
 "f" 'citar-open-notes
 "n" 'org-noter
 "o" 'salih/open-book)

;; roam
(general-define-key
 :prefix (concat salih/prefix-global "r")
 "b" 'org-roam-buffer-toggle
 "c" 'org-roam-capture
 "f" 'org-roam-node-find
 "j" 'org-roam-dailies-capture-today
 "t" 'org-roam-dailies-goto-today)

;; roam mode
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (salih/global "r i") 'org-roam-node-insert)
            (local-set-key (salih/global "r t") 'org-roam-tag-add)
            (local-set-key (salih/global "r a") 'org-roam-alias-add)))


;; magit and vc
(general-define-key
 :prefix (concat salih/prefix-global "g")
 "g"   'magit-status
 "G"   'magit-status-here
 "C"   'magit-clone
 "L"   'magit-log-buffer-file
 "."   '+vc/browse-at-remote
 "t"   'magit-todos-list
 "D"   'magit-file-delete)

;; other
(general-define-key
 :prefix (concat salih/prefix-global "e")
 "e" 'eshell)

;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-x p a") 'projectile-add-known-project)

;; convenient
(global-set-key (kbd "M-RET") 'lsp-execute-code-action)
(global-set-key (kbd "C-M-g") '+lookup/definition)

;; resize windows
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>") 'enlarge-window)
(global-set-key (kbd "C-<up>") 'shrink-window)

;; maximize buffer
(global-set-key (kbd "<f3>") 'salih/toggle-maximize-buffer)

;; commenting lines
(global-set-key (kbd "M-;") 'salih/comment-or-uncomment-region-or-line)

(global-set-key [f6]
                (lambda ()
                  (neotree-project-dir)
                  (lsp-treemacs-symbols)
                  (evil-window-next 0)))
