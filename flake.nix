{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/65a5c8f";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    nix-amd-ai.url = "github:noamsto/nix-amd-ai";
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
        # system = "x86_64-linux";
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.framework-amd-ai-300-series
          { nixpkgs.hostPlatform = "x86_64-linux"; }
          sops-nix.nixosModules.sops
          inputs.nix-amd-ai.nixosModules.default
        ];
      };
    };
}
