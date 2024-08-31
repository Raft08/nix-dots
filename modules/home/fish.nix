{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    grc
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      starship init fish | source
      pfetch
    '';

    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
  };
}