{pkgs,config,...}:{
  services.jellyfin = {
    enable = true;
  };
 


  systemd.services.jellyfin.environment = {
    LIBVA_DRIVER_NAME = "iHD";
  };

}
