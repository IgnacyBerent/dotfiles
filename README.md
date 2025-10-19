# dotfiles

---

## Install

### Replace AMD packages with Intel equivalents

#### AMD Packages

    vulkan-radeon xf86-video-amdgpu amd-ucode

#### Intel Packages

    vulkan-intel xf86-video-intel intel-ucode

### Pacman

    sudo pacman -S --needed - < pkglist.txt

### YAY

    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd ~
    rm -rf /tmp/yay
    yay -S --needed pkglist-aur-txt

### Tmux plugins

    mkdir -p ~/.tmux/plugins/tpm && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    Ctrl + Space + I

### Okular theme

    nvim ~/.local/share/applications/org.kde.okular.desktop

    Exec=okular --stylesheet /home/iberent/.config/okular.qss %U

## Symlinks

    stow .
