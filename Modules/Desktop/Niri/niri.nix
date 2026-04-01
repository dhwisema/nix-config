{
  #only dealing with packages to install
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  programs.dconf.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
    config = {
      niri = {
        default = [
          "gtk"
          "gnome"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
      };
    };
  };
  environment.systemPackages = with pkgs; [
    # sway-contrib.grimshot
    xwayland-satellite
    pavucontrol
    waybar
    adwaita-icon-theme-legacy
    adwaita-icon-theme
    bluetuith
    gnome-keyring
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    wl-clipboard
    kdePackages.qtsvg
    kdePackages.dolphin
    kdePackages.kio # needed since 25.11
    kdePackages.kio-fuse # to mount remote filesystems via FUSE
    kdePackages.kio-extras
  ];
  hardware.brillo.enable = true;
  environment.pathsToLink = [ "share/thumbnailers" ];

  programs.niri.enable = true;
}
