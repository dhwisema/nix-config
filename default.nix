{
  config,
  lib,
  pkgs,
  hostname,
  ...
}:
{
  imports = if hostname == "Pumat" then [ ./Modules/Containers/CWA.nix ./Modules/Containers/jellyfin.nix ] else [ ];
}
