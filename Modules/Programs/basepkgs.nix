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
    btop
    jq
    fzf
  ];
  programs.yazi = {
    enable = true;
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
