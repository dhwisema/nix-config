{
  disko.devices = {
    disk = {
      nvme0 = {
        type = "disk";
        device = "/dev/disk/by-id/";

        content = {
          type = "gpt";

          partitions = {
            esp = {
              size = "1G";
              type = "EF00";

              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot1";
                mountOptions = [ "umask=0077" ];
              };
            };

            root = {
              size = "100%";
            };
          };
        };
      };

      nvme1 = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-YYYY";

        content = {
          type = "gpt";

          partitions = {
            esp = {
              size = "1G";
              type = "EF00";

              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot2";
                mountOptions = [ "umask=0077" ];
              };
            };

            root = {
              size = "100%";
            };
          };
        };
      };

      data = {
        type = "disk";
        device = "/dev/disk/by-id/ata-HGST_HTS541010A9E680_JD100ACH3TTA6K";

        content = {
          type = "gpt";

          partitions = {
            data = {
              size = "100%";

              content = {
                type = "filesystem";
                format = "btrfs";
                mountpoint = "/data";

                mountOptions = [
                  "compress=zstd:3"
                  "noatime"
                ];
              };
            };
          };
        };
      };
    };

    nodev = {
      root = {
        type = "btrfs";

        devices = [
          "/dev/disk/by-id/nvme-XXXX-part2"
          "/dev/disk/by-id/nvme-YYYY-part2"
        ];

        extraArgs = [
          "-f"
          "-L"
          "nixos"
          "-d"
          "raid1"
          "-m"
          "raid1"
        ];

        subvolumes = {
          "@root" = {
            mountpoint = "/";
          };

          "@home" = {
            mountpoint = "/home";
          };

          "@nix" = {
            mountpoint = "/nix";
          };

          "@persist" = {
            mountpoint = "/persist";
          };
        };
      };
    };
  };
}
