{ pkgs }:

let 
  common = import ./common.nix { inherit pkgs; };
in
pkgs.python3Packages.buildPythonPackage rec {
  pname = "trickyrick";
  version = "0.1.0-beta";
 
  # source: use the current directory
  src = ../.;
  
  pyproject = true;

  # python dependencies from nixpkgs (if available)
  propagatedBuildInputs = [ common.myBuildPackages ];

  # if you need system libs or build tools:
  # nativeBuildInputs = [ ];
  
  # optional metadata
  meta = with pkgs.lib; {
    description = "TrickyRick ;)";
    license = licenses.mit;
  };
}
