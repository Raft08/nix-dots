{ config, pkgs, split-monitor-workspaces, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    plugins = [
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];

    settings = { 
      input = {
        kb_layout = "be";
      };

      bind = [
        "Super + Ctrl, Right, workspace, +1"
        "Super + Ctrl, Left, workspace, -1"
        "Super, R, exec, alacritty"
        "Super, Return, exec, pkill anyrun || anyrun"
        "Super, C, killactive"
      ];
    };
  };
}
