{ lib, config, ... }: 

{
  options = {
    module.pipewire.enable = lib.mkEnableOption "Enables pipewire.";
  };

  config = lib.mkIf config.module.pipewire.enable {
    sound.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;

      wireplumber.extraConfig."10-bluez" = {
        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.headset-roles" = [
            "hsp_hs"
            "hsp_ag"
            "hfp_hf"
            "hfp_ag"
          ];
        };
      };

      wireplumber.extraConfig."10-disable-camera" = {
        "wireplumber.profiles" = {
          main."monitor.libcamera" = "disabled";
        };
      };
    };
  };
}
