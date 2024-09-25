{ lib, config, pkgs-unstable, ... }: 

{
  systemd.oomd.enable = true;

  environment.systemPackages = with pkgs-unstable; [

    # Improved Cpu Scheduler
    ananicy-cpp
    ananicy-rules-cachyos
    irqbalance 
  ];
}
