# :NOTE: this contains common dependencies
{ pkgs }:

let
    python-cowsay = import ./python-cowsay.nix {inherit pkgs; };
in
{
  # dependencies needed during build time
  myBuildPackages = [
    pkgs.python3Packages.typer
    pkgs.python3Packages.terminaltexteffects
    pkgs.python3Packages.textual
    pkgs.python3Packages.textualeffects
    python-cowsay
  ];
  
  # dependencies only needed for development
  myDevPackages = [
  ];
}
