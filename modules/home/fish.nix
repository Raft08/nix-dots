{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      starship init fish | source
      zoxide init fish | source
      atuin init fish | source

      pfetch
    '';

    shellAliases = {
      cd = "z";
      ls = "eza";
      cat = "bat";
      disk = "dust";
      search = "fzf";

      notes = "nano notes.txt";

      pipes = "pipes-rs";
      say = "cowsay -r";
      matrix = "cmatrix";
      bonsai = "cbonsai";
      ascii = "figlet";
    };
  };
}