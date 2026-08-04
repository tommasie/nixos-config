{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware = {
      url = "path:/home/thomas/projects/nixos-hardware/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    nix-amd-ai.url = "github:noamsto/nix-amd-ai";
    nix-gaming.url = "github:fufexan/nix-gaming";
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      nixos-hardware,
      home-manager,
      sops-nix,
      ...
    }:
    {
      nixosConfigurations.fw13 = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.framework-amd-ai-300-series
          { nixpkgs.hostPlatform = "x86_64-linux"; }
          sops-nix.nixosModules.sops
          inputs.nix-amd-ai.nixosModules.default
          inputs.nix-gaming.nixosModules.wine
        ];
      };
    };
}
