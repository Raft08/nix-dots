{ lib, config, ... }: 

{
  options = {
    module.nvidia.enable = lib.mkEnableOption "Enables the Nvidia Drivers.";
  };

  config = lib.mkIf config.module.nvidia.enable {
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false; # Disables Kernel Open-Source Drivers
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  
    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
