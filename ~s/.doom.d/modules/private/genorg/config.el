;;; mine/genorg/config.el -*- lexical-binding: t; -*-

(after! org
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"                    ; A task that needs doing & is ready to do
           "APPOINT(a)"
           "PROJ(p)"                    ; A project, which usually contains other tasks
           "HOLD(h)"                    ; This task is paused/on hold because of me
           "|"
           "DONE(d)"                ; Task successfully completed
           "KILL(k)")               ; Task was cancelled, aborted or is no longer applicable
          (sequence
           "DAILY(D)"        ; A task that needs doing
           "|"
           "DONE(d)"))                    ; Task was completed

        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("DAILY" . "#708090")
          ("Hold" . +Org-todo-onhold)
          ("PROJ" . +org-todo-project)

          ("APPOINT" . "#0a66c2")
          ("KILL" . +org-todo-cancel)))

  (setq org-hide-leading-stars 't)
  (setq org-capture-templates
        '(("t" "Personal todo" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %? :PERSONAL:" :prepend t)


          ("w" "WATCH" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %? :WATCH:" :prepend t)

          ("c" "CHECK" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %? :CHECK:" :prepend t)

          ("n" "Personal notes" entry
           (file+headline +org-capture-notes-file "Inbox")
           "* %u %?\n%i\n%a" :prepend t)

          ("j" "Journal" entry
           (file+headline +org-capture-journal-file "Posts")
           "*** %<%A, %d %B %Y>\n%?"  :prepend t)))
  (require 'ox))



(require 'org-download)
(add-hook 'dired-mode-hook 'org-download-enable)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(setq org-archive-location "%s_archive.org::"
      org-agenda-start-with-log-mode t)




(advice-add 'org-agenda-quit :before 'org-save-all-org-buffers)



(setq org-agenda-custom-commands
      '(("p" "Personal TODOs" tags "+PERSONAL+TODO=\"TODO\"")
        ("c" "Check APPOINTs" todo "APPOINT")
        ("v" "Agenda"
         ((agenda ""
                  ((org-agenda-span '3)))
          (tags-todo "+TODO=\"TODO\"+PERSONAL"
                     ((org-agenda-overriding-header "Get something done")
                      (org-agenda-files '("~/roam/main/life.org"))
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))
                      (org-agenda-sorting-strategy '(todo-state-up priority-down))))


          (tags-todo "+TODO=\"TODO\"+CHECK"
                     ((org-agenda-overriding-header "Check this out")
                      (org-agenda-files '("~/roam/main/life.org"))
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))
                      (org-agenda-sorting-strategy '(todo-state-up priority-down))))


          (tags-todo "+TODO=\"TODO\"+WATCH"
                     ((org-agenda-overriding-header "Watch and chill..")
                      (org-agenda-files '("~/roam/main/life.org"))
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))
                      (org-agenda-sorting-strategy '(todo-state-up priority-down))))



          (tags-todo "+TODO=\"TODO\"+IDEA"
                     ((org-agenda-overriding-header "Looking for an idea?")
                      (org-agenda-files '("~/roam/main/life.org"))
                      (org-agenda-sorting-strategy '(todo-state-up priority-down))))))))



(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 0.9))))
 '(org-level-6 ((t (:inherit outline-6 :height 0.8))))
 '(org-level-7 ((t (:inherit outline-7 :height 0.7))))
 '(org-level-8 ((t (:inherit outline-8 :height 0.6))))
 '(org-document-title ((t (:weight bold :height 1.5)))))
