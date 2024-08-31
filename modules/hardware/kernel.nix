{ lib, config, pkgs-unstable, ... }:

{
  options = {
    module.kernel.unstable = lib.mkEnableOption "Enables the usage of the kernel from unstable.";
  };

  config = lib.mkIf config.module.kernel.unstable {
    boot.kernelPackages = pkgs-unstable.linuxPackages;
  };
}
