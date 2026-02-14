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
        setSocketVariable = true;
      };
    };

  persist.location.data.contents = [
    # docker containers
    ".local/share/docker/"
    # docker config
    ".docker/"
  ];
}
