{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountOptions = [ "umask=0077" ];
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
                  content = {
                  type = "btrfs";
                  extraArgs = [
                    "-L"
                    "nixos"
                    "-f"
                  ];
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = [
                        "subvol=root"
                        "compress=zstd:3"
                        "noatime"
                        "ssd"
                        "discard=async"
                      ];
                    };
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = [
                        "subvol=home"
                        "compress=zstd:3"
                        "noatime"
                        "ssd"
                        "discard=async"
                      ];
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "subvol=nix"
                        "compress=zstd:3"
                        "noatime"
                        "ssd"
                        "discard=async"
                      ];
                    };
                    "/swap" = {
                      mountpoint = "/swap";
                      mountOptions = [
                        "subvol=swap"
                        "compress=zstd:3"
                        "compress=no"
                        "ssd"
                      ];
                      swap.swapfile.size = "32G";
                    };
                  };
                };
            };
          };
        };
      }; #other here
      sata-one = {
        type = "disk";
        device = "/dev/sdb";
        content = {
          type = "gpt";
          partitions = {
            empty = {
              size = "100%";
            };
          };

        }

      };
      sata-two = {
        type = "disl";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            data = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = {
                  "-f"
                  "-L"
                  "-m raid1"
                  "-d single"
                  "/dev/sda1"
                };
                mountpoint = "/data";
                mountOptions = [
                  "ssd_spread"
                  "compress=zstd:3"
                  "noatime"
                  "discard=async"
                ];
              };
            };
          };
        };
      };
    };
  };
}
