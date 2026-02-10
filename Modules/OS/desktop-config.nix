{
  pkgs,
  lib,
  config,
  hostname,
  username,
  options,
  ...
}:
{
  imports = [
    ./Base-config.nix
    ./../Desktop/Desktop.nix
    ./../Programs/wireshark.nix
  ];
#because i hate life and nixos doesnt have pyside 6 working correctly yay
virtualisation.podman = {
  enable = true;
  dockerCompat = true;
};


services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};
  hardware.bluetooth.enable = true;
  services.flatpak.enable = true;
  programs.zoxide.enable = true;
  programs.zoxide.enableFishIntegration = true;
  environment.systemPackages = with pkgs; [
    seahorse
    udisks
    gnome-software
    distrobox
    distrobox-tui
    uv
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
  ];

  programs.nix-ld = {
    enable = true;
    libraries = options.programs.nix-ld.libraries.default ++ (
      with pkgs; [
        glib # libglib-2.0.so.0
        libGL
	libxkbcommon
	fontconfig
        libx11
      ]
    );
  };
  users.users.${username}.extraGroups = [
    "video"
    "audio"
    "render"
  ];
  services.fwupd.enable = true;
  services.libinput.enable = true;
  zramSwap.enable = true;
}
