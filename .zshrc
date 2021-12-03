  #___________  _   _   _    ____    _    ____  ________
 #/ / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \ \
#/ / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \ \
#\ \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / / /
 #\_\_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/_/

# Mr. Quasar 173's zsh configuration!
# Some dependancies are required. These incluse [Oh-My-zsh, Powerlevel10k, Nerdfonts, lsd(better LS), lolcat, neofetch, fortune, cowsay,
# zsh-autosuggestions(zsh plugin), and zsh-syntax-highlighting (zsh plugin)]
# I know it's a LOT of dependancies, and I hate having to install a lot of dependancies when I download one thing just to make it. 
# work, but this is my personal configuration using things I already have on my system. If you want to use this as a template to
# build your own config, cool! If you want it to look exactly like mine, just install the stuff above :D 


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="/home/eli/.oh-my-zsh" # WARNING: please change "root" to "home". I made this configuration in WSL which makes you stay as root  permanently

# Load powerlevel10k, the amazing and beautiful prompt
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Enable command autocorrection
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
COMPLETION_WAITING_DOTS="true"

# show date stamp in history
 HIST_STAMPS="mm/dd/yyyy"

# Load pluggins. Git is preinstalled with zsh by default, user must install others
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    )

# Make sure oh-my-zsh is actually being loaded and used
source ~/.oh-my-zsh/oh-my-zsh.sh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Make snaps work
export PATH=$PATH:/snap/bin
# NOT MY CODE: quickly extract compressed files with custom command
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

# load powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# More settings
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)" # Make the history command not show tiny, everyday commands
# The next 8 lines make manpages colorful and better-looking
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESSHISTFILE=-

# Aliases
file=$(\ls ~/.config/neofetch/ascii|shuf -n 1)
alias nerdfetch='neofetch --source ~/.config/neofetch/ascii/$file' # theme neofetch art after halflife/portal series because i'm a nerd
alias dotfile='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' # Make dotfiles managment easy with git bare
alias grep='grep --color=auto' # add color to grep
alias vim='nvim' # Use neovim, the modern and faster vim 
alias zshrc='nvim ~/.zshrc' # Quickly open this file
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash' # Rickroll in terminal
# quicker cd
alias ...='cd ../..' 
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
# pacman
alias pacs='pacman -S'
alias pacrm='pacman -R'
alias pacu='pacman -Syu'
alias pacfix='pacman -Syyy'
alias unlock="sudo rm /var/lib/pacman/db.lck"
# git
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
command -v lsd > /dev/null && alias ls='lsd -l --group-dirs first' # Use lsd, the command line utility not the drug 
# (it makes the ls output look nice)

##Cmatrix astheticz
alias matrix='cmatrix -s -C cyan'

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"

#available free memory
alias free="free -mt"

#continue download
alias wget="wget -c"

#readable output
alias df='df -h'

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#Speeeeedy mirrors
#get fastest mirrors in your neighborhood
alias ram='rate-mirrors --allow-root arch | sudo tee /etc/pacman.d/mirrorlist'
alias reft='sudo systemctl enable reflector.service reflector.timer && sudo systemctl start reflector.service reflector.timer'

# XeroLinux software control
#Paru as aur helper - updates everything
alias pget='paru -S '
alias prm='paru -Rs '
alias psr='paru -Ss '
alias upall='paru -Syyu --noconfirm'

#Flatpak Update
alias fpup='flatpak update'

#Snap Update
alias sup='sudo snap refresh'

#grub update
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias saycow='fortune|cowsay -f $(\ls /usr/share/cows|shuf -n 1)|lolcat' # description below cause im too lazy to move it up here

# Startup commands
nerdfetch
# saycow # generates a random rainbow cowsay character saying something random
figlet -c "<<<QUASAR>>>" | lolcat
