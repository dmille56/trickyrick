# :NOTE: this contains common dependencies
{ pkgs }:

let
    python-cowsay = import ./python-cowsay.nix {inherit pkgs; };
in
{
  # dependencies needed during build time
  myBuildPackages = [
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.typer
      python-pkgs.terminaltexteffects
      python-pkgs.textual
      python-pkgs.textualeffects
    ]))

    python-cowsay
  ];
  
  # dependencies only needed for development
  myDevPackages = [
  ];
}
