### <h3 align="center">![](https://media.tenor.com/4VY0Ykn4lN4AAAAM/cat-broken-cat.gif "stupid cat") </h3>

# <h1 align="center"> My Dotfiles :-) </h1>

## Themes :
> nixos
> arch
Themes use shared configurations.

## Shared dotfiles : 
>* btop
>* cava
>* fastfetch
>* fcitx
>* mozc
>* nvim
>* waypaper

## Arch :
### **dotfiles**
>* gtk
>* hypr
>* thunar
>* waybar
>* bashrc and aliases
>* sddm
>* all shared dotfiles

## Nixos : 
### **dotfiles**
>* home-manager
>* hypr
>* waybar
>* bashrc and aliases
>* full nixos config
>* all shared dotfiles

## install
run the make_links.sh script
```
cd dotfiles-arch
./make_links.sh "{theme_name}"
```
where {theme_name} is the name of a subdirectory in the dotfiles/ directory
### Warning : this script is not safe and calls dangerous commands such as rm -rf.
### make sure it is able to find all the files it needs to, don't install nixos config onto another distro,
### and don't name files anything stupid such as "*" or "/".
