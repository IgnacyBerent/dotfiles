# dotfiles

---

## Save pkglist

    pacman -Qqen > pkglist.txt
    pacman -Qqem > pkglist-aur.txt

## Install

### Replace AMD packages with Intel equivalents

#### AMD Packages

    vulkan-radeon xf86-video-amdgpu amd-ucode

#### Intel Packages

    vulkan-intel intel-media-driver intel-ucode

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
    tmux
    Ctrl + Space + I

## Themes

### Gtk themes

    papirus-folders -C cat-mocha-mauve --theme Papirus-Dark
    gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
    gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-mauve-standard+default"

### Jupyter Lab

    settings -> theme -> Catppuccin Mocha

### Thunar

    Go to Thunar > Edit > Configure custom actions... > Open Terminal Here -> settings
    ghostty --working-directory=%f

## Symlinks

    stow .

## Environment

    sudo vim /etc/environment
    (paste)

    QT_QPA_PLATFORM="wayland;xcb"
    ANKI_WAYLAND=1
    MOZ_ENABLE_WAYLAND=1

## Dotfiles Git

    ssh-keygen -t ed25519 -C "2gb02ignac@gmail.com"
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub
    GitHub > Settings > SSH and GPG keys -> New SSH Key
    git remote set-url origin git@github.com:IgnacyBerent/dotfiles.git
