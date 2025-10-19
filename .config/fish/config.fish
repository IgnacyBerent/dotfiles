if status is-interactive
    fastfetch
    set -x PYENV_ROOT $HOME/.pyenv
    set -x PATH $PYENV_ROOT/bin $PATH
    pyenv init - | source
    pyenv virtualenv-init - | source
end

alias fishc="nvim ~/.config/fish/config.fish"
alias vim="nvim"
alias cat="bat"
alias ls="lsd"
alias la="ls -a"
alias ll="lsd -alh"
alias tree="lsd --tree"
alias grep="rg"
alias okular="okular --stylesheet /home/iberent/.config/okular.qss"

alias discord="flatpak run com.discordapp.Discord"

zoxide init --cmd cd fish | source
fzf --fish | source
