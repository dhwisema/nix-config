{ pkgs, inputs, ... }:
{

  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    # distrobox-tui
    # distrobox #dont need this currently will reneable if i have to use code composer again.
    vesktop
    zellij
    ghostty
    alejandra
    kicad
    nil
    signal-desktop
    element-desktop
    obsidian
    nixd
    zoxide
    chromium
    devenv
  ];
  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
      environment = {
        USE_LAYER_SHELL = 1;
      };
    };
    settings = {
      close_on_focus_loss = true;
      favicon_service = "twenty";
      launcher_window = {
        opacity = 1;
      };

      theme = {
        light = {
          name = "stylix";
        };
        dark = {
          name = "stylix";
        };
      };
    };

    extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
      bluetooth
      nix
      niri
      firefox
           wifi-commander
      # Extension names can be found in the link below, it's just the folder namesi
      # https://github.com/vicinaehq/extensions/tree/main/extensions

    ];
  };
}
