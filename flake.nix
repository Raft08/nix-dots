{
  description = "RaftDev's Configuration Flake";

  inputs = {
    # Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
 
    # Anyrun
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Spicetify
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Suyu - Switch Emulator
    suyu = {
      url = "git+https://git.suyu.dev/suyu/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen - Browser
    zen = {
      url = "git+https://github.com/ch4og/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?ref=refs/tags/v0.41.2&submodules=1"; # 0.42.x breaks Minecraft with Nvidia.
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { self, nixpkgs, hyprland, nixpkgs-unstable, split-monitor-workspaces, zen, spicetify-nix, ... }@inputs: 
  {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
        
        pkgs-unstable = import nixpkgs-unstable {
          config.allowUnfree = true;
          inherit system;
        };
      };

      modules = [
        ./hosts/desktop/configuration.nix
      ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
        
        pkgs-unstable = import nixpkgs-unstable {
          config.allowUnfree = true;
          inherit system;
        };
      };

      modules = [
        ./hosts/laptop/configuration.nix
      ];
    };
  };
}