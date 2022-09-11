;;; ../configs/.doom.d/feedreader.el -*- lexical-binding: t; -*-
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)
(add-hook 'elfeed-search-mode-hook
      (lambda () (setq elfeed-feeds
                  '(("http://www.ahl-ul-bayt.org/ar/?format=feed&type=rss" art)
                    ("https://www.reddit.com/r/cscareerquestions/.rss" cs reddit prod)
                    ("https://anime--irl.tumblr.com/rss" comics)
                    ("https://www.reddit.com/r/Semenretention/.rss" people reddit prod)
                    ("https://xkcd.com/rss.xml" comics prod)
                    ("https://www.reddit.com/r/awakened/.rss" people reddit prod)
                    ("https://www.reddit.com/r/MathJokes/.rss" reddit prod)
                    ("https://www.reddit.com/r/Egypt/.rss" people reddit egypt social)
                    ("https://www.reddit.com/r/slatestarcodex/.rss" theory reddit)
                    ("https://www.reddit.com/r/theoryofpropaganda/.rss" theory reddit)
                    ("https://revsoc.me/feed" theory)
                    ("https://www.ahewar.org/rss/default.asp?lt=3&i=5329" theory)
                    ("https://www.ahewar.org/rss/default.asp?lt=3&i=1781" theory)
                    ("https://www.ahewar.org/rss/default.asp?lt=3&i=9391" theory)
                    ("https://naeem-writing.com/?feed=rss2" theory people)
                    ("https://www.ahewar.org/rss/default.asp?lt=5" theory)
                    ("https://engineering.linkedin.com/blog.rss.html" cs prod)
                    ("https://www.claudiobernasconi.ch/feed/" cs prod)
                    ("https://www.reddit.com/r/programming/.rss" cs prod)
                    ("https://www.fluentcpp.com//feed" cs) ;; Oh yeah! I miss those days I used to love C++.
                    ("https://www.cppstories.com/index.xml" cs)
                    ("https://thomaslevesque.com/index.xml" cs prod)
                    ("https://devblogs.microsoft.com/dotnet/feed/" cs)
                    ("https://feed.infoq.com/" cs software_engineering prod)
                    ("https://www.reddit.com/r/golang/.rss" cs)
                    ("https://suckless.org/atom.xml" cs)
                    ("https://blog.janestreet.com/feed.xml" cs prod)
                    ("https://www.ribice.ba/index.xml" cs prod)
                    ("https://github.com/salehmu.private.atom?token=ARVKOP6Q6D3TE577LYBCYSWA3RAUG" github prod)
                    ("http://www.infoworld.com/index.rss" cs prod)
                    ("https://hackernoon.com/feed" cs prod)
                    ("http://cachestocaches.com/feed/" cs prod)
                    ("https://boards.4channel.org/g/index.rss" cs social)
                    ("https://boards.4channel.org/adv/index.rss" people social)
                    ("https://harian-oftheday.blogspot.com/feeds/posts/default?alt=rss" spirit prod)
                    ("https://medium.com/feed/@villekuosmanen" cs prod)
		    ("https://www.reddit.com/r/OneTruthPrevails/.rss" reddit prod)
                    ("http://nedroid.com/feed/" comics prod)
                    ("https://dave.cheney.net/feed" cs prod)))
        (elfeed-update)))
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)

(use-package elfeed-dashboard
  :load-path "~/gits/elfeed-dashboard/"
  :config
  (setq elfeed-dashboard-file "~/gits/elfeed-dashboard/elfeed-dashboard.org")
  ;; update feed counts on elfeed-quit
  (advice-add 'elfeed-search-quit-window :after #'elfeed-dashboard-update-links))

(provide 'feedreader)
