{
  description = "TrickyRick nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      common = import ./nix/common.nix { inherit pkgs; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          common.myBuildPackages
          common.myDevPackages
        ];

        shellHook = ''
          # so running the python module runs correctly
          export PYTHONPATH="src"
        '';
      };
      
      packages.${system} = {
        trickyrick = import ./nix/trickyrick.nix { inherit pkgs; };
        default = self.packages.${system}.trickyrick;
      };
    };
}
