(setq-default frame-title-format                        '("%b")
              shr-inhibit-images                        t
              bidi-paragraph-direction                  'left-to-right
              org-download-image-dir                    "~/roam/media"
              indent-tabs-mode                          nil
              pdf-view-display-size                     'fit-width
              display-line-numbers-width                8)

(defalias 'l 'list)
(defmacro s/pb (filename)
  `(f-join salih/blog-content-path ,filename))

(defmacro s/not (&rest args)
  "Wrap multiple arguments in `and` and then in `not`."
  `(not (and ,@args)))

(defmacro s/pr (&rest args)
  `(f-join org-roam-directory ,@args))

(defmacro s/pc (&rest args)
  `(f-join user-config-repo-path ,@args))


(defmacro s/ufn ()
  `(car (split-string user-full-name " ")))

(defmacro s/pl (source-directory)
  `(mapcar 'file-truename (directory-files-recursively ,source-directory "" nil t)))

(defmacro s/cm (m)
  `(concat "/" user-mail-address ,m))

(defmacro s/require (&rest packages)
  `(progn
     ,@(mapcar (lambda (pkg) `(if ,pkg (require ,pkg))) packages)))

(defun doom-theme? ()
  (string-prefix-p "doom-" (symbol-name doom-theme)))


(defun salih/get-random-theme (inc)
  (let* ((current-day (+ inc (string-to-number (format-time-string "%d"))))
         (list-length (length salih/prefered-themes))
         (selected (nth (mod current-day list-length) salih/prefered-themes)))
    selected))

(defun salih/get-random-nour-theme (inc)
  (let* ((salih/prefered-themes '((ef-frost . nour)
                                  (ef-light . nour))))
    (salih/get-random-theme inc)))


;;

(setq salih/prefered-themes '((doom-peacock             . dark)
                              (doom-rouge               . dark)
                              (doom-henna               . dark)
                              (kaolin-galaxy            . dark)
                              (ef-maris-dark            . dark)
                              (ef-deuteranopia-light    . nour)
                              (ef-elea-dark             . dark)
                              (ef-cherie                . dark)
                              (ef-bio                   . dark)
                              (doom-rouge               . dark)
                              (doom-feather-dark        . dark)
                              (ef-summer                . nour) ; that's too happy for me
                              (ef-melissa-dark          . dark)
                              (ef-duo-dark              . dark)
                              (ef-spring                . nour)
                              (kaolin-valley-dark       . dark)
                              (ef-dark                  . dark)
                              (ef-trio-dark             . dark)
                              (doom-rouge               . dark)
                              (kaolin-dark              . dark)
                              (ef-day                   . nour)
                              (ef-duo-light             . nour)
                              (ef-deuteranopia-dark     . dark)
                              (ef-trio-light            . nour)
                              (doom-badger              . dark)
                              (ef-symbiosis             . dark)
                              (ef-autumn                . dark)
                              (ef-frost                 . nour)
                              (doom-rouge               . dark)
                              (ef-light                 . nour)
                              (ef-winter                . dark)
                              (kaolin-temple            . dark)
                              (ef-cyprus                . nour)
                              (kaolin-ocean             . dark)
                              (ef-maris-light           . nour)
                              (doom-rouge               . dark)
                              (ef-trio-light            . nour)
                              (kaolin-bubblegum         . dark)
                              (ef-night                 . dark)))

;; [2024-07-25 Thu 06:45] currently, my glasses do not help me well with light
;; themes.
;; (setq salih/prefered-themes
;;       (seq-filter (lambda (theme)
;;                     (not (eq (cdr theme) 'nour)))
;;                   salih/prefered-themes))



(defun salih/really-random-theme ()
  (let* ((themes '(modus-vivendi-tritanopia kaolin-dark doom-nord
                   doom-nord-aurora doom-opera doom-oceanic-next
                   kaolin-aurora kaolin-bubblegum
                   kaolin-ocean doom-gruvbox doom-material-dark
                   ef-trio-light
                   doom-material doom-molokai
                   doom-monokai-machine doom-monokai-octagon
                   doom-monokai-pro doom-moonlight
                   doom-nord-aurora doom-oceanic-next doom-one doom-palenight
                   doom-shades-of-purple doom-solarized-dark
                   doom-spacegrey doom-vibrant
                   doom-wilmersdorf misterioso wombat))
         (random-theme (nth (random (length themes)) themes)))
    random-theme))

(defun salih/really-really-random-theme-load ()
  (interactive)
  (load-theme (salih/really-random-theme)))

(provide '+early)
