# dotfiles

---

## Install

### Replace AMD packages with Intel equivalents

#### AMD Packages

    vulkan-radeon xf86-video-amdgpu amd-ucode

#### Intel Packages

    vulkan-intel xf86-video-intel intel-ucode

#### To remove

    grub

### Pacman

    sudo pacman -S --needed - < pkglist.txt

### YAY

    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd ~
    rm -rf /tmp/yay
    yay -S --needed - < pkglist-aur.txt

### Tmux plugins

    mkdir -p ~/.tmux/plugins/tpm && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    Ctrl + Space + I

### Okular theme

    cp /usr/share/applications/org.kde.okular.desktop ~/.local/share/applications/
    mkdir -p ~/.local/share/applications
    nvim ~/.local/share/applications/org.kde.okular.desktop

    Exec=okular --stylesheet /home/iberent/.config/okular.qss %U

### Gtk themes

    papirus-folders -C cat-mocha-sky --theme Papirus-Dark
    gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
    gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-blue-standard+default"

## Symlinks

    stow .

## Set Ghostly as Terminal Emulator in Thunar

    Go to Thunar > Edit > Configure custom actions... > TerminalEmulator
    ghostty --working-directory=%f
