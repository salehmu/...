;;; mine/genorg/config.el -*- lexical-binding: t; -*-

(after! org
  (setq org-tags-column -80)
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
           "* TODO %? :@general:" :prepend t)


          ("w" "WATCH" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %? :@watch:" :prepend t)

          ("r" "READ" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %? :@read:" :prepend t)


          ("c" "CHECK" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %? :@check:" :prepend t)


          ("i" "Got a new idea?" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %? :@idea:" :prepend t)

          ("j" "Journal" entry
           (file+headline +org-capture-journal-file "Posts")
           "*** %?\n:DATE:\n%<[%Y-%m-%d %a %H:%M]>\n:END:"  :prepend t)))

  (require 'ox))



(require 'org-download)
(add-hook 'dired-mode-hook 'org-download-enable)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(setq org-archive-location "%s_archive.org::"
      org-agenda-start-with-log-mode t)




(advice-add 'org-agenda-quit :before 'org-save-all-org-buffers)



(setq org-agenda-custom-commands
      '(("A" "Deadlines and Scheduled" ((tags-todo "DEADLINE<>\"\"|SCHEDULED<>\"\"")))
        ("v" "Agenda"
         ((org-ql-block '(and
                          (priority "A")
                          (not (deadline))
                          (not (scheduled)))

                        ((org-ql-block-header "High-priority tasks")))

          (agenda ""
                  ((org-agenda-span '5)))


          (org-ql-block '(and
                          (todo "DAILY")
                          (not (deadline))
                          (not (scheduled)))
                        ((org-ql-block-header "Do something today")))



          (org-ql-block '(and
                          (todo "TODO")
                          (tags "@general")
                          (not (deadline))
                          (not (scheduled)))
                        ((org-ql-block-header "Get something done")))



          (org-ql-block '(and
                          (todo "TODO")
                          (tags "@check")
                          (not (deadline))
                          (not (scheduled)))
                        ((org-ql-block-header "Check this out")))

          (org-ql-block '(and
                          (todo "TODO")
                          (tags "@watch")
                          (not (deadline))
                          (not (scheduled)))
                        ((org-ql-block-header "Your ungoogled watch later:")))

          (org-ql-block '(and
                          (todo "TODO")
                          (tags "@read")
                          (not (deadline))
                          (not (scheduled)))
                        ((org-ql-block-header "Read:")))


          (org-ql-block '(and
                          (todo "TODO")
                          (tags "@idea")
                          (not (deadline))
                          (not (scheduled)))
                        ((org-ql-block-header "Looking for an idea?")))))))




(defun salih/org-ql-view--format-element (orig-fun &rest args)
  "This function will intercept the original function and
add the category to the result.

ARGS is `element' in `org-ql-view--format-element'"
  (if (not args)
      ""
    (let* ((element args)
           (properties (cadar element))
           (result (apply orig-fun element))
           (smt "")
           (category (org-entry-get (plist-get properties :org-marker) "CATEGORY")))
      (if (> (length category) 11)
          (setq category (substring category 0 10)))
      (if (< (length category) 11)
          (setq smt (make-string (- 11 (length category)) ?\s)))
      (org-add-props
          (format "   %-8s %s" (concat category ":" smt) result)
          (text-properties-at 0 result)))))

(advice-add 'org-ql-view--format-element :around #'salih/org-ql-view--format-element)





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
