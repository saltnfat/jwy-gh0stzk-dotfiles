{ pkgs, ... }:
{
  # Only enable either docker or podman -- Not both
  virtualisation = {
    docker.enable = false;
    podman.enable = false;

    libvirtd.enable = true;

    virtualbox.host = {
      enable = false;
      enableExtensionPack = true;
    };
    vmVariant.virtualisation = {
      memorySize = 6000; # MiB
      cores = 3; # use 3 cpu cores
    };
  };

  programs = {
    virt-manager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virt-viewer # View Virtual Machines
    lazydocker
    docker-client
  ];
}
