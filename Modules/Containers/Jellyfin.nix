{pkgs,config,...}:{
  services.jellyfin = {
    enable = true;
    cacheDir = "/data/cache/jellyfin";
    logDir = "/data/log/jellyfin";
    configDir = "/data/config/jellyfin";
  };
 
  systemd.services.jellyfin.environment = {
    LIBVA_DRIVER_NAME = "iHD";
  };

}
