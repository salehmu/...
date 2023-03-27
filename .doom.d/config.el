(add-to-list 'load-path "~/.doom.d/")
(add-to-list 'org-agenda-files "~/roam/journal/agenda/todo.org")
(add-to-list 'org-agenda-files "~/roam/journal/agenda/births.org")
(require 'epa-file)
(require 'erc-services)



(setq load-prefer-newer t ;; avoid warnings
     ;; set org files
     +org-capture-journal-file                         "~/blog/content/stack.org"
     +org-capture-changelog-file                       "~/blog/content/nice.org"
     +org-capture-todo-file                            "~/roam/main/life.org"
     org-preview-html-viewer                           'xwidget
     org-roam-directory                                "~/roam"
     org-extend-today-until                            2


     ;; please don't stalk me
     user-full-name                                    "Salih Muhammed"
     user-mail-address                                 "salhghd7@gmail.com"

     ;; I've no idea of any of this.
     org-crypt-key                                     user-mail-address
     epa-file-cache-passphrase-for-symmetric-encryption t
     epa-file-select-keys                              'silent
     epa-file-encrypt-to                               user-mail-address


     ;; skull welecome in emacs
     fancy-splash-image                                "~/.doom.d/pan.png"

     ;; theme
     doom-theme                                        'distinguished
     highlight-indent-guides-method                    'character

     ;; prayer time
     calendar-latitude                                 30.0
     calendar-longitude                                31.2

     ;; school
     bibtex-completion-bibliography                    "~/configs/ref.bib"

     ;; translate
     gts-translate-list                                '(("en" "ar"))

     ;; keyboard
     salih/prefix-global                               "C-x "
     salih/prefix-mode                                 "C-c "


     ;; irc
     erc-nick                                          "jahiz"
     erc-user-full-name                                "Salih Muhammed"
     erc-prompt-for-password                            nil
     erc-prompt-for-nickserv-password                   nil
     erc-autojoin-channels-alist                        '(("irc.libera.chat" "##arabic"))

     ;; other
     vertico-buffer-display-action                     '(display-buffer-same-window)
     browse-url-generic-program                        "chromium"
     large-file-warning-threshold                      nil
     inferior-lisp-program                             "sbcl"
     neo-mode-line-type                                'default
     consult-preview-key                               nil
     treemacs-position                                 'right
     dired-sidebar-refresh-on-special-commands         t
     display-line-numbers-type                         t
     doom-modeline-height                              17
     doom-modeline-buffer-state-icon                   nil
     doom-modeline-icon                                nil
     org-annotate-file-storage-file                    "~/configs/annotated.org")


;; setup email
;; don't forget to setup authinfo
;; https://www.emacswiki.org/emacs/GnusAuthinfo
;; and of course mu, isync
(after! mu4e
  (setq message-send-mail-function 'smtpmail-send-it
        starttls-use-gnutls t
        mu4e-update-interval 200
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587
        smtpmail-starttls-credentials '(("smtp.gmail.com" "587" nil nil))
        smtpmail-stream-type 'starttls))



(after! solaire-mode
  (setq solaire-mode-real-buffer-fn #'salih/solaire-mode-real-buffer-custom-p))


(after! sly
  (setq sly-complete-symbol-function 'sly-flex-completions))

;; this should be called after defining salih/prefix-global
(require '+handy)
(require 'keys)

(add-hook 'org-mode-hook     #'highltier)
(add-hook 'prog-mode-hook    #'highltier)
(add-hook 'prog-mode-hook    #'column-enforce-mode)
(add-hook 'prog-mode-hook    #'auto-fill-mode)
(add-hook 'lisp-mode-hook    #'rainbow-delimiters-mode)
(add-hook 'neotree-mode-hook #'hide-mode-line-mode)
(add-hook 'after-init-hook   #'global-flycheck-mode)
(add-hook 'nov-mode-hook     #'salih/make-buffer-white)
(add-hook 'csv-mode-hook     #'csv-align-mode)
(add-hook 'prog-mode-hook    (lambda () (setq-default indent-tabs-mode nil)))
(add-hook 'org-mode-hook     (lambda ()
                               (display-line-numbers-mode -1)
                               (setq truncate-lines 1)))

(epa-file-enable)
(global-wakatime-mode)
(vertico-buffer-mode)
(salih/consult-preview-at-point)
(erc-spelling-mode 1)



(add-hook 'after-init-hook #'mu4e)
