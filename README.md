# dotfiles

---

## Install

### YAY

    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd ~
    rm -rf /tmp/yay

### Replace AMD packages with Intel equivalents

#### AMD Packages

vulkan-radeon xf86-video-amdgpu amd-ucode")

#### Intel Packages

vulkan-intel xf86-video-intel intel-ucode

### Tmux plugins

`mkdir -p ~/.tmux/plugins/tpm && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
`Ctrl + Space + I`

### Okular theme

`nvim ~/.local/share/applications/org.kde.okular.desktop`

Change:
`Exec=okular --stylesheet /home/iberent/.config/okular.qss %U`

## Symlinks

`stow .`
