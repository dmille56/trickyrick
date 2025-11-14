{
  description = "TrickyRick nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      perSystem = { self, pkgs, system, ... }:
      let
        common = import ./nix/common.nix { inherit pkgs; };
      in 
      {
        devShells.default = pkgs.mkShell {
          packages = common.myBuildPackages ++ common.myDevPackages;

          shellHook = ''
            # so running the python module runs correctly
            export PYTHONPATH="src"
          '';
        };
        
        packages.default = import ./nix/trickyrick.nix { inherit pkgs; };
      };

      systems = [
        # systems for which you want to build the `perSystem` attributes
        "x86_64-linux"
      ];
    };
}
