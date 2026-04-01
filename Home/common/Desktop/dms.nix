{
inputs,
  ...
}:
{
  programs.dms-shell = {
    enable = true;
    enableCalendarEvents = false;
    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
  };
}
