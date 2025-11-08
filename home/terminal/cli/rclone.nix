{ config, ... }:
{
  programs.rclone = {
    enable = true;
    remotes = {
      school = {
        config = {
          type = "onedrive";
          drive_id = "b!fQ0pC47ZVkml_cdgqHmZomOTLxLSEGFKtwqB22NWVx0YL_R5F8AOSInnCITBk9zt";
          drive_type = "business";
        };
        secrets = {
          token = config.age.secrets.onedrive_school.path;
        };
        mounts."Documents" = {
          enable = true;
          mountPoint = "/home/hannah/onedrive";
        };
      };
    };

  };

}
