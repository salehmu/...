;;; init.el -*- lexical-binding: t; -*-
(doom! :input
       :completion
       company
       (vertico +icons)

       :ui
       vc-gutter
       doom
       doom-dashboard
       hl-todo
       (treemacs +lsp)
       (ligatures
        +pragmata-pro)
       modeline
       (popup +defaults)
       workspaces

       :editor
       (evil
        +everywhere)
       file-templates
       fold
       (format +onsave)
       lispy
       parinfer
       snippets
       word-wrap

       :emacs
       (dired
        +icons)
       electric
       undo
       vc

       :term
       eshell
       vterm

       :checkers
       (syntax +childframe)
       (spell  +flyspell)

       :tools
       biblio
       (lookup
        +dictionary
        +offline)
       (lsp +peak)
       (magit)
       pdf
       ;; debugger

       :os
       (tty)

       :lang
       (cc +lsp)
       common-lisp
       (csharp +lsp)
       emacs-lisp
       (go +lsp)
           
       json
       (latex +flod
              +latexmk
              +lsp)
       (org
        +roam2
        +noter)
       (rest +jq)
       sh
       yaml
       (julia
        +lsp)
        
       ess
       (java +lsp)

       :email
       mu4e

       :app
       ;; irc
       rss

       :config
       (default ;; +bindings
        +smartparens)

       :private
       compiler
       ;; src==irc
       ;; for the options `erc-prompt-for-password' and
       ;; `erc-prompt-for-nickserv-password', you should have a .authinfo file
       ;; conatins your password for the nickname. For Example, using
       ;; yournickname and yourpassword as a NickName and password (repsectively
       ;; machine irc.libera.chat login yournickname password yourpassword
       ;; See. https://www.gnu.org/software/emacs/manual/html_node/emacs/Authentication.html
       src
       gen
       genorg
       cite
       roam
       bind)
