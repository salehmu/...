; -*- no-byte-compile: t; -*-

(package! imenu-list)
(package! org-journal)
(package! vimish-fold)
(package! lsp-treemacs)
(package! ob-csharp :recipe (:host github :repo "luggages/ob-csharp"))
(package! org-superstar)
(package! dotnet)
(package! leuven-theme)
(package! wakatime-mode)
(package! org-web-tools)
(package! ts)
(package! org-ql)
(unpin! org-roam)
(package! org-roam-ui)
(package! humanoid-themes)
(package! org-present)
(package! wiki-summary)
(package! iedit)
(package! protobuf-mode)
(package! git-auto-commit-mode)
(package! distinguished-theme)
(package! highlight-indent-guides)
(package! grip-mode)
(package! emacsql-sqlite3)
(package! emacsql-sqlite-module)





(package! org-modern)
(package! pdf-tools)
(package! org-noter)

(straight-use-package
 '(webkit :type git :host github :repo "luggages/emacs-webkit"
   :branch "main"
   :files (:defaults "*.js" "*.css" "*.so")
   :pre-build ("make")))
(package! org-preview-html)
(package! column-enforce-mode)
