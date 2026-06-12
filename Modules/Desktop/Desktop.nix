{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./themeing/stylix.nix
    ./Niri/niri.nix
    ./Gnome/default.nix
    ./Airpods-fix.nix
  ];
}
