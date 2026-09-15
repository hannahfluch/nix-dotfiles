{ ... }:
{
  virtualisation =
    let
      options = {
        virtualisation.memorySize = 8192;
        virtualisation.graphics = true;
        virtualisation.cores = 6;
      };
    in
    {
      vmVariant = options;
      vmVariantWithDisko = options;
      # rootless docker
      docker.rootless = {
        enable = true;
        setSocketVariable = true; # <--- interferes with podman python client `from_env`
        # fix broken dns
        daemon.settings = {
          dns = [
            "1.1.1.1"
            "8.8.8.8"
          ];
        };
      };
    };
}
