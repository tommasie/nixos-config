{ self, inputs, ... }: {
  flake.nixosConfigurations.fw13 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.fw13Configuration
      self.modules.nixos.homeManager
      {
        home-manager.users.thomas.imports = with self.modules.homeManager; [
          thomas
          fw13
        ];
      }
      inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
      inputs.sops-nix.nixosModules.sops
      inputs.nix-amd-ai.nixosModules.default
      inputs.nix-gaming.nixosModules.wine
    ];
  };
}
