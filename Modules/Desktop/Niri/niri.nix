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
    awww
    wl-clipboard
  ];
  hardware.brillo.enable = true;
  environment.pathsToLink = [ "share/thumbnailers" ];

  programs.niri.enable = true;

  services.greetd = {
    enable = true;
    restart = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --sessions /${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session --user-menu --window-padding 5 --asterisks --asterisks-char ^ --greeting '<~welcome~>' --theme 'button=yellow'";
        user = "greeter";
      };
    };
  };
}
