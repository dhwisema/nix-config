{  config,
  lib,
  pkgs,
  ...}:{
    virtualisation.oci-containers.containers.radarr = {
      environment = {
        "PUID=1000"
        "PGID=1000"
      };
      hostname = {"radarr.internal"};
      image = "ghcr.io/hotio/radarr:latest";
      ports = "7878:7878";
    };
    virtualisation.oci-containers.containers.sonarr = {
      environment = {
        "PUID=1000"
        "PGID=1000"
      };
      hostname = {"sonarr.internal"};
      image = "ghcr.io/hotio/sonarr:latest";
      ports = "8989:8989";
    };
    virtualisation.oci-containers.containers.bazarr = {
      environment = {
        "PUID=1000"
        "PGID=1000"
      };
      hostname = {"bazarr.internal"};
      image = "ghcr.io/hotio/bazarr:latest";
      ports = "6767:6767";
    };
    virtualisation.oci-containers.containers.qbittorrent = {
      environment = {
        "PUID=1000"
        "PGID=1000"
      };
      hostname = {"qbittorrent"};
      image = "ghcr.io/hotio/qbittorrent:latest";
      ports = "8080:8080";
    };

}