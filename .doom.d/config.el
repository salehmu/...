(add-to-list 'load-path "~/.doom.d/")
(require '+roam)
(require 'leader)
(require 'keys)
(require '+handy)
(add-to-list 'org-agenda-files "~/roam/journal/agenda/todo.org")
(add-to-list 'org-agenda-files "~/roam/journal/agenda/births.org")
(setq +org-capture-journal-file "~/blog/content/stack.org")
(setq +org-capture-changelog-file "~/blog/content/nice.org")
(setq +org-capture-todo-file "~/roam/main/life.org")
(setq neo-autorefresh 't)
(setq neo-mode-line-type 'default)
(setq load-prefer-newer t)

(custom-set-variables
 '(highlight-indent-guides-method 'bitmap))


(defun highltier ()
  (require 'highlight-indent-guides)
  (set-face-background 'highlight-indent-guides-odd-face "darkgray")
  (set-face-background 'highlight-indent-guides-even-face "dimgray")
  (set-face-foreground 'highlight-indent-guides-character-face "dimgray")
  (highlight-indent-guides-mode))
(add-hook 'org-mode-hook 'highltier)
(add-hook 'prog-mode-hook 'highltier)

(define-key evil-normal-state-map (kbd "C-g") 'evil-escape)
(define-key evil-visual-state-map (kbd "C-g") 'evil-escape)
(define-key evil-insert-state-map (kbd "C-g") 'evil-escape)
(define-key evil-replace-state-map (kbd "C-g") 'evil-escape)
(define-key evil-operator-state-map (kbd "C-g") 'evil-escape)

(defun my/evil-escape-and-abort-company ()
  (interactive)
  (company-abort)
  (evil-escape))
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-g") 'my/evil-escape-and-abort-company)
  (define-key company-search-map (kbd "C-g") 'my/evil-escape-and-abort-company))




(with-eval-after-load 'evil
  (define-key evil-insert-state-map (kbd "C-j") 'bibtex-next-field)
  (define-key evil-insert-state-map (kbd "C-k") 'bibtex-previous-entry))

(with-eval-after-load 'vertigo
  (vertigo-mode 1)
  (setq vertigo-completing-read-function 'ivy-completing-read))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3ee898efcd3fa5b63c4f15e225f3616497010f2347a514490be8b563edbd39d9" "545ab1a535c913c9214fe5b883046f02982c508815612234140240c129682a68" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" default))
 '(highlight-indent-guides-method 'bitmap)
 '(org-modern-block-name '(("" "" "")))
 '(org-modern-checkbox nil)
 '(org-modern-keyword '(("" . "")))
 '(org-modern-list nil)
 '(org-modern-priority nil)
 '(org-modern-star nil)
 '(org-modern-tag nil)
 '(org-modern-timestamp nil)
 '(org-modern-todo nil))
(global-org-modern-mode)

(use-package pdf-tools
  :pin manual
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-width)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  :custom
  (pdf-annot-activate-created-annotations t "automatically annotate highlights"))



(add-hook 'pdf-view-mode-hook
  (lambda ()
    (set (make-local-variable 'evil-normal-state-cursor) (list nil))))



(require 'webkit)
(global-set-key (kbd "s-b") 'webkit) ;; Bind to whatever global key binding you want if you want
(require 'webkit-ace) ;; If you want link hinting
(use-package evil-collection-webkit
  :config
  (evil-collection-xwidget-setup))

;; (setq browse-url-browser-function 'webkit-browse-url)
(setq browse-url-browser-function 'xwidget-webkit-browse-url)
(setq org-preview-html-viewer 'xwidget)




(add-hook 'prog-mode-hook 'column-enforce-mode)









(setq-default doom-modeline-height 20)
(setq doom-modeline-icon t)
(setq doom-modeline-buffer-state-icon t)
