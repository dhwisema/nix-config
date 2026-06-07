{
  config,
  lib,
  pkgs,
  ...
}:
{
  virtualisation.oci-containers.containers.radarr = {
    restart = "unless-stopped";
    environment = {
      PUID = "1000";
      PGID = "1000";
    };
    hostname = "radarr.internal";
    image = "ghcr.io/hotio/radarr:latest";
    ports = "7878:7878";
    extraOptions = [ "--pull=newer" ];
    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/data/appdata/radarr:/config"
      "/data/jellyarr:/data"
    ];
  };
  virtualisation.oci-containers.containers.sonarr = {

    restart = "unless-stopped";

    environment = {
      PUID = "1000";
      PGID = "1000";
    };
    hostname = "sonarr.internal";
    image = "ghcr.io/hotio/sonarr:latest";
    ports = "8989:8989";

    extraOptions = [ "--pull=newer" ];

    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/data/appdata/sonarr:/config"
      "/data/jellyarr:/data"
    ];
  };
  virtualisation.oci-containers.containers.bazarr = {

    restart = "unless-stopped";
    environment = {
      PUID = "1000";
      PGID = "1000";
    };
    hostname = "bazarr.internal";
    image = "ghcr.io/hotio/bazarr:latest";
    ports = "6767:6767";

    extraOptions = [ "--pull=newer" ];

    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/data/appdata/bazarr:/config"
      "/data/jellyarr:/data"
    ];
  };
  virtualisation.oci-containers.containers.qbittorrent = {

    restart = "unless-stopped";
    environment = {
      PUID = "1000";
      PGID = "1000";

      VPN_ENABLED = "true";
      VPN_CONF = "wg0";
      VPN_PROVIDER = "proton";
      VPN_LAN_NETWORK = "192.168.1.0/24";
      VPN_LAN_LEAK_ENABLED = "false";
      VPN_AUTO_PORT_FORWARD = "true";
      VPN_HEALTHCHECK_ENABLED = "false";
      PRIVOXY_ENABLED = "false";
      UNBOUND_ENABLED = "false";
    };
    capabilities = {
      NET_ADMIN = true;
    };

    hostname = "qbittorrent";
    image = "ghcr.io/hotio/qbittorrent:latest";
    ports = "8080:8080";
    extraOptions = [ "--pull=newer" ];

    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/data/appdata/qbittorrent:/config"
      "/data/jellyarr/torrent:/data/torrent:rw"
    ];

  };

}
