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
    ];
    config = {
      niri = {
        default = [
          "gtk"
          "gnome"
        ];
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
  ];
  hardware.brillo.enable = true;
  environment.pathsToLink = [ "share/thumbnailers" ];

  programs.niri.enable = true;
}
