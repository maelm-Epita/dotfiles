# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-stable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot = { 
    enable = true;
    configurationLimit = 20;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Configure X11 and Wayland
  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
    xkb.layout = "us";
    xkb.variant = "";
  };

  # hyprland default session
  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
  };

  # use zsh
  programs.zsh.enable = true;

  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${import ./custom-pkg/sddm-theme.nix {inherit pkgs; }}";
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mael = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "mael";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  home-manager = {
    users = { "mael" = import ./home.nix;};
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
  [
    # nixos specific
    # allow to run dynamically linked executables
    steam-run
    # cli essentials
    vim 
    neovim
    git
    fzf
    zip
    unzip
    tree
    starship
    tree-sitter
    ntfs3g
    # programming languages related
    gcc
    python3
    nodePackages_latest.npm
    nodejs_22
    yarn
    # get latex
    python312Packages.pylatexenc
    # daily use
    vesktop
    firefox
    foot
    # recording / editing software
    obs-studio
    libsForQt5.kdenlive
    gimp
    handbrake
    # desktop environment things
    rofi-wayland
    nemo
    waybar
    swaylock-effects
    waypaper
    swaybg
    lxqt.pavucontrol-qt
    # automount disks
    udiskie
    gnome-disk-utility
    # mount iphone
    libimobiledevice
    ifuse
    # make ntfs disks work propely
    ntfs3g
    # image
    qimgv
    # video
    mpv
    # notifications
    libnotify
    dunst
    # policykit for auth apps
    lxqt.lxqt-policykit
    # night light
    gammastep
    # screenshots
    grim
    slurp
    wl-clipboard
    # gui helper for partitionning disks
    gparted
    # needed for thunar
    xfce.xfconf
    xfce.tumbler
    ffmpegthumbnailer
    # gaming
    steam
    runelite
    # rice stuff
    fastfetch
    cava
    pywal
  ];

  fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      cascadia-code
  ];
  
  programs.steam.enable = true;

   
  environment.sessionVariables = {
  	NIXOS_OZONE_WL = "1";
	WLR_NO_HARDWARE_CURSORS = 1;
	_JAVA_AWT_WM_NONREPARENTING=1;
  };
  
  hardware = {
	opengl.enable = true;
  };
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };
  
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  security.polkit.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.udisks2.enable = true;
  services.usbmuxd = {
  enable = true;
  package = pkgs.usbmuxd2;
  };
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = ["nix-command" "flakes"];

}
