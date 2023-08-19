;;; configs/~s/.doom.d/feeds.el -*- lexical-binding: t; -*-


(setq elfeed-search-feed-face ":foreground #fff :weight bold"
      elfeed-feeds '(("https://lukesmith.xyz/index.xml" luke philosophy)
                     ("http://monakareem.blogspot.com/feeds/posts/default?alt=rss" mona blogs)
                     ("https://blackaly.github.io//feed.xml" ali blogs)
                     ("https://sachachua.com/blog/category/monthly/feed" emacs_asian_girl blogs)
                     ("https://www.emadelsaid.com/+/feed.rss" emad blogs)
                     ("https://appliedgo.net/index.xml" appliedgo programming)
                     ("https://williamdavies.blog/feed/" consumption philosophy)
                     ("http://chomsky.info/feed/" chomsky philosophy)
                     ("https://blog.giovanh.com/feeds/atom.xml" g cs)
                     ("https://www.theatlantic.com/feed/best-of/" atlantic politics)

                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCAiiOTio8Yu69c3XnR7nQBQ" systemcraft emacs yt)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCX7katl3DVmch4D7LSvqbVQ" montemayor history yt)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCEqNbbsx0i7fhwRt0saYIcQ" america history yt)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UC7pr_dQxm2Ns2KlzRSx5FZA" sandrhoman history yt)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCrI5U0R293u9uveijefKyAA" ryan history yt)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCdHT7KB1gDAXZYpPW71fn0Q" Distributist yt philosophy)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCqBiWcuTF8IaLH7wBqnihsQ" toldinstone yt history)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCsaViv1SDQy2FcRFHrf_Dkw" hikma yt history)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UC9-y-6csu5WGm29I7JiwpnA" computerphile yt cs)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCheAUBrk8xw6QhJIxEPsvhg" thelifeguide yt history)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UC9ff15w4ufviWfv9UfIuByA" wes cecil history philosophy)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCMhLD2vecQSBqKd5uVPrwaQ" historiancraft yt history)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCp9ZtilfKJds0iWytR_pnOQ" Epimetheum history yt)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCVpb6nv1igxnoY0SRVhaoEA" engieering yt cs)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UC_5ENzPnzYCGRxiOIdtaRug" ramah yt aesthetic)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UC99wd4wi8AfaSkqprWo206g" edits yt aesthetic)
                     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCoxcjq-8xIDTYp3uz647V5A" numberphile yt math)))


(use-package elfeed-goodies
  :init
  (elfeed-goodies/setup)
  :config
  (setq elfeed-goodies/entry-pane-size 0.5))


(after! elfeed
  (setq elfeed-search-filter "@1-month-ago +unread"))

(add-hook 'elfeed-search-mode-hook #'elfeed-update)



(defun salih/add-feeds-by-keyword (keyword-category-list)
  (let ((urls (list "https://hnrss.org/newest?q=%s"
                    "https://rssc.fly.dev/rss?src=https://boards.4channel.org/sci/index.rss&titlef=(?i)%s&descriptionf=(?i)%s"
                    "https://rssc.fly.dev/rss?src=https://boards.4channel.org/g/index.rss&titlef=(?i)%s&descriptionf=(?i)%s"
                    "https://rssc.fly.dev/rss?src=https://theconversation.com/articles.atom?language=en&titlef=(?i)%s&descriptionf=(?i)%s")))
    (dolist (pair keyword-category-list)
      (let ((keyword (car pair))
            (category (cdr pair)))
        (dolist (url urls)
          (let ((l (salih/format url keyword)))
            (add-to-list 'elfeed-feeds `(,l ,category))))))))

(setq keyword-category-list
      '(("chomsky"      . philosophy)
        ("arabic"       . philosophy)
        ("emacs"        . emacs)
        ("Egypt"        . politics)
        ("Algeria"      . politics)
        ("lisp"         . programming)
        ("Arab"         . politics)
        ("Israel"       . politics)
        ("Palestine"    . politics)))

(salih/add-feeds-by-keyword keyword-category-list)


(provide '+feeds)