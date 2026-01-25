if status is-interactive
    fastfetch
end

# Environment globals
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERMINAL ghostly
set -gx PATH /opt/android-sdk/platform-tools $PATH
set -gx JAVA_HOME /usr/lib/jvm/java-21-openjdk
set -gx QT_QPA_PLATFORMTHEME qt6ct

fish_add_path $HOME/.local/bin

# Aliases
alias fishc="nvim ~/.config/fish/config.fish"
alias vim="nvim"
alias cat="bat"
alias ls="lsd"
alias la="ls -a"
alias ll="lsd -alh"
alias tree="lsd --tree"
alias grep="rg"
alias docker="sudo docker"
alias start_vcamera='sudo modprobe v4l2loopback exclusive_caps=1 card_label="OBS Virtual Camera"'
alias save_pkglist='pacman -Qqen > pkglist.txt && pacman -Qqem > pkglist-aur.txt && echo "Package lists updated!"'

# Tools init
zoxide init --cmd cd fish | source
fzf --fish | source
oh-my-posh init fish --config ~/.poshthemes/catppuccin_mocha.omp.json | source
