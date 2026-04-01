{
inputs,
pkgs,
  ...
}:
{
  imports = [inputs.dms.homeModules.dank-material-shell];
  programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    settings = {
      showLauncherButton = false;
      screenPreferences.wallpaper = [""];
      # barConfigs = {
      #   barConfigs.leftWidgets = ["workspaceSwitcher" "focusedWindow"];
      #   barConfigs.centerWidget = ["clock"];
      #   barConfigs.rightWidgets = ["systemTray" "clipboard" "notificationButton" "controlCenterButton"];     
      #  };
      barConfigs = [{
      id = "default";
      name = "Main Bar";
      enabled = true;
      position = 0;
      screenPreferences = [
        "all"
      ];
      showOnLastDisplay = true;
      leftWidgets = [
        "workspaceSwitcher"
        "focusedWindow"
      ];
      centerWidgets = [
        "clock"
      ];
      rightWidgets = [
        "systemTray"
        "clipboard"
        "cpuUsage"
        "memUsage"
        "notificationButton"
        "battery"
        "controlCenterButton"
      ];
      spacing = 4; 
      innerPadding = 4;
      bottomGap = 0;
      transparency = 1;
      widgetTransparency = 1;
      squareCorners = false;
      noBackground = false;
      gothCornersEnabled = false;
      gothCornerRadiusOverride = false;
      gothCornerRadiusValue = 12;
      borderEnabled = false;
      borderColor = "surfaceText";
      borderOpacity = 1;
      borderThickness = 1;
      fontScale = 1;
      autoHide = false;
      autoHideDelay = 250;
      openOnOverview = false;
      visible = true;
      popupGapsAuto = true;
      popupGapsManual = 4;
    }];
  

     };
  };
}
