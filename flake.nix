{
  description = "TrickyRick nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
         (pkgs.python3.withPackages (python-pkgs: [
           python-pkgs.typer
           python-pkgs.terminaltexteffects

           python-pkgs.textual # :NOTE: try to use this so it'll run in browser + cli
           python-pkgs.textualeffects

           (import ./python-cowsay.nix)
         ]))
        ];

        shellHook = ''
          # so running the python module runs correctly
          export PYTHONPATH="src"
        '';
      };
      
      # packages.${system} = {
      #   trickyrick = import ./trickyrick.nix { inherit pkgs; };
      #   default = self.packages.${system}.trickyrick;
      # };
    };
}
