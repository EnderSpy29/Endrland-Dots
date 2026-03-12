## Endrland-Dots

<img src="https://raw.githubusercontent.com/EnderSpy29/Endrland-Dots/refs/heads/main/Showoff/ShowOff-single.png" width="45%"></img> <img src="https://raw.githubusercontent.com/EnderSpy29/Endrland-Dots/refs/heads/main/Showoff/ShowOff-dual.png" width="45%"></img>

Get the [Wallpapers!](https://github.com/EnderSpy29/Wacky-Walls/)

Hello there
You seem to have stumbled across my hyprland dotfiles, These are now in a 'stable' state (and by that i mean they won't receive updates) because I'm useing SwayWM now.
If you'd like to install the dotfiles, please follow the instructions below.
And if installing them manually was tedious, maybe you'd like to contribute to this project and add an installation script.

I am using the [Rosepink-Dark](https://github.com/Fausto-Korpsvart/Rose-Pine-GTK-Theme) GTK Theme
PS: For this and other themes you will need to install this: `sudo pacman -S gtk-engine-murrine`

**THIS IS HYPRLAND**
First things first, you're going to need hyprland installed (duh). Then you need to install the [hy3 plugin](https://github.com/outfoxxed/hy3) with
```
hyprpm add https://github.com/outfoxxed/hy3
hyprpm update
hyprpm enable hy3
```

**QT Theme**

Install 'qt5ct' and 'qt6ct' and 'kvantum' and 'kvantum-qt5'
Go to https://github.com/catppuccin/Kvantum/tree/main and install your preffered theme and install it in kvantum.
then set kvantum as the theme in qt5ct and qt6ct

**AGS/ASTAL INTRUCTIONS**
using AGSv2 and Astal
https://aylur.github.io/astal/guide/getting-started/installation

**Require Package list** WIP

This is all the required packages + Some just to be safe ones + Some rice terminal stuff (yazi file manager my beloved) (use paru or yay) (It is highly probable I've forgotten some packages)

```
paru swaybg xdg-desktop-portal-hyprland waypaper wallust macchina quickshell hyprpicker qt5ct qt6ct nwg-look grim gtk-engine-murrine slurp fastfetch kvantum zsh kitty yazi mesa lib32-mesa  vulkan-radeon lib32-vulkan-radeon opencl-clover-mesa opencl-rusticl-mesa libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau
```
