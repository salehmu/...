;;; configs/~s/.doom.d/+hooks.el -*- lexical-binding: t; -*-


(add-hook! '(maxima-inferior-mode-hook
             neotree-mode-hook
             sly-mrepl-mode-hook
             vterm-mode-hook
             dired-mode-hook
             mu4e-headers-mode-hook
             mu4e-view-mode-hook
             mu4e-main-mode-hook)               #'salih/disable-bright)



(add-hook! '(org-agenda-mode-hook
             treemacs-mode-hook
             org-mode-hook
             dired-mode-hook
             native-comp-limple-mode-hook)      #'centaur-tabs-local-mode)



(add-hook! 'python-mode-hook (flycheck-mode -1))
(add-hook 'after-make-frame-functions   (lambda (frame)
                                          (with-selected-frame frame (salih/keyboard-config))))
(add-hook! 'bibtex-mode-hook (add-hook 'after-save-hook #'+format/buffer nil t))
(add-hook! 'pdf-view-mode-hook (setq-local evil-normal-state-cursor (list nil)))

(add-hook! 'org-mode-hook
           (add-hook 'before-save-hook  #'vulpea-project-update-tag nil 'local)
           (add-hook 'find-file-hook    #'vulpea-project-update-tag nil 'local)
           (setq org-hide-leading-stars t)
           (display-line-numbers-mode -1)
           (setq-local truncate-lines t)
           (git-gutter-mode -1))



(add-hook! 'nov-mode-hook
  (defface tmp-buffer-local-face '((t :family "Roboto Condensed" :height 1.0)) "")
  (buffer-face-set 'tmp-buffer-local-face)
  (setq-local right-fringe-width 0)
  (setq-local left-margin-width  4)
  (setq-local left-fringe-width  0)
  (text-scale-set 1))


(add-hook! 'org-roam-capture-new-node-hook (setq roam-titles
                                                 (salih/org-roam-get-node-files
                                                  (org-roam-node-read--completions))))



(add-hook 'prog-mode-hook               #'auto-fill-mode)
(add-hook 'csv-mode-hook                #'csv-align-mode)
(add-hook 'prog-mode-hook               #'column-enforce-mode)
(add-hook 'after-init-hook              #'global-flycheck-mode)
(add-hook 'sage-shell-after-prompt-hook #'sage-shell-view-mode)
(add-hook 'lisp-mode-hook               #'rainbow-delimiters-mode)
(add-hook 'html-mode-hook               #'sgml-electric-tag-pair-mode)
(add-hook 'nov-mode-hook                #'nov-xwidget-inject-all-files)
(add-hook 'eshell-alias-load-hook       #'salih/eshell-load-bash-aliases)
(add-hook 'dired-after-readin-hook      #'salih/dired-git-info-auto-enable)
(add-hook 'prog-mode-hook               #'salih/format-all-ensure-formatter)
(remove-hook! '(prog-mode-hook text-mode-hook conf-mode-hook) #'vi-tilde-fringe-mode)



;; TODO: what about adding some verious quotes here? I can imaging having an RPC
;; call to some external program to get awsome quotes from there.
(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width
                                        "The fear of the Lord is the beginning of wisdom; all those who practice it have
a good understanding. His praise endures forever. ")))


;; Activate the advice
(ad-activate 'org-agenda-get-some-entry-text)

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(add-to-list 'org-babel-load-languages '(julia-vterm . t))


(org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)



(remove-hook 'vterm-mode-hook                   #'hide-mode-line-mode)
(remove-hook 'treemacs-mode-hook                #'doom-themes-hide-modeline)
(remove-hook '+doom-dashboard-functions         #'doom-dashboard-widget-footer)
(remove-hook 'after-change-major-mode-hook      #'doom-highlight-non-default-indentation-h)


(advice-add  #'doom-highlight-non-default-indentation-h :override #'ignore)





;; init
(epa-file-enable)
(centaur-tabs-mode)
(yas-global-mode 1)
(vertico-buffer-mode)
(global-wakatime-mode)
(salih/keyboard-config)
(consult-org-roam-mode 1)
(global-visual-line-mode 1)
(salih/consult-preview-at-point)
(run-at-time nil (* 30 60) #'elfeed-update)
(when salih/awqat-show-mode-line (awqat-display-prayer-time-mode))



;; see https://github.com/emacs-lsp/lsp-mode/issues/3577#issuecomment-1709232622
(after! lsp
  (delete 'lsp-terraform lsp-client-packages))


(use-package indent-bars
  :hook ((lsp-mode) . indent-bars-mode))


(provide '+hooks)
