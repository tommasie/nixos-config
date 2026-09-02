{ self, inputs, ... }: {
  flake.nixosConfigurations.fw13 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.fw13Configuration
      inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
      inputs.sops-nix.nixosModules.sops
      inputs.nix-amd-ai.nixosModules.default
      inputs.nix-gaming.nixosModules.wine
    ];
  };
}
