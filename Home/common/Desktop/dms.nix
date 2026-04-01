{
inputs,
pkgs,
  ...
}:
{
  imports = [inputs.dms.homeModules.dank-material-shell];
  programs.dank-material-shell = {
    enable = true;
    enableCalendarEvents = false;
    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    enableAudioWavelength = false;
    settings = {
      showLauncherButton = false;
      screenPreferences.wallpaper = [""];
      barConfigs = {
        barConfigs.leftWidgets = ["workspaceSwitcher" "focusedWindow"];
        barConfigs.centerWidget = ["clock"];
        barConfigs.rightWidgets = ["systemTray" "clipboard" "notificationButton" "controlCenterButton"];     
       };
     };
  };
}
