{ lib, config, pkgs, pkgs-unstable, ... }: 

{
  options = {
    module.dev.virtualization.enable = lib.mkEnableOption "Enables virtualization tools.";
  };

  config = lib.mkIf config.module.dev.virtualization.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;  # enable copy and paste between host and guest

    environment.systemPackages = with pkgs; [
      gnome.gnome-boxes
    ];
  };
}
