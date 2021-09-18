#  ___________  _   _   _    ____    _    ____  ________
# / / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \ \
#/ / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \ \
#\ \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / / /
# \_\_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/_/

# MrQuaras173's fish config!
# I mainly use ZSH, however the prompt, futures, and startup command I use with it are not suited for my text 
# editor's integrated terminal. Therefore, I use fish because it is an amazing shell and I can make it more ideal for integrated
# programming use. The only dependancy here is the starship prompt.

set fish_greeting # Get rid of annyoing fish greeting

# set autocomplete/highlight colors
set fish_color_normal brgreen
set fish_color_autosuggestion '#676e95'
set fish_color_command brgreen
set fish_color_error '#ff5370'
set fish_color_param brgreen

#aliases
alias mcc='meson build'
alias crr='cargo run'
alias crb='cargo build'
alias crc='cargo check'
alias vim='nvim'
alias pacs='pacman -S'
alias pacrm='pacman -R'
alias pacu='pacman -Syu'
alias pacfix='pacman -Syyy'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# use starship 
eval (starship init fish)
