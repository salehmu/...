#! /bin/bash
for f in /etc/X11/xinit/xinitrc.d/*.sh; do
    source "$f"
done
~/.dwm/screen.sh
picom &
#--experimental-backends &
dunst &
xset r rate 200 25
setxkbmap -layout us,ara -option 'grp:alt_shift_toggle'
# /home/l/go/bin/ang &
feh --bg-fill ~/configs/~s/bg.png
#feh --bg-fill "$(find ~/me/links/art/land -type f | shuf -n 1)"
# tor &
# pgrep -fl 'pidswallow -gl' || pidswallow -gl
#pantalaimon --data-path ~/tmp/pant/ &
flameshot &
picom --xrender-sync-fence --vsync
libinput-gestures-setup start
