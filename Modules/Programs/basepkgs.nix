{
  config,
  lib,
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    curl
    wget
    yazi
    btop
    jq
    zoxide
    fzf
  ];
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
