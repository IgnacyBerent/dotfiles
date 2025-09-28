if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias fishc="nvim ~/.config/fish/config.fish"
alias vim="nvim"
alias cat="bat"
alias ls="lsd"
alias la="ls -a"
alias ll="lsd -alh"
alias tree="lsd --tree"
alias grep="rg"

alias discord="flatpak run com.discordapp.Discord"

zoxide init --cmd cd fish | source
fzf --fish | source
