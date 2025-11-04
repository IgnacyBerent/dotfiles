if status is-interactive
    fastfetch

    set -gx PYENV_ROOT $HOME/.pyenv
    test -d $PYENV_ROOT/bin; and fish_add_path $PYENV_ROOT/bin
    pyenv init - fish | source
end

# Environment globals
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERMINAL ghostly

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
alias okular="okular --stylesheet /home/iberent/.config/okular.qss"

# Tools init
zoxide init --cmd cd fish | source
fzf --fish | source
oh-my-posh init fish --config ~/.poshthemes/catppuccin_mocha.omp.json | source
