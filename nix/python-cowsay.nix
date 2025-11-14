{ pkgs }:

pkgs.python3Packages.buildPythonPackage rec {
  name = "cowsay";
  version = "6.1";

  src = builtins.fetchGit {
    url = "https://github.com/VaasuDevanS/cowsay-python.git";
    rev = "dcf7236f0b5ece9ed56e91271486e560526049cf";
  };
  

  pyproject = true;
  build-system = [ pkgs.python3Packages.setuptools ];

  propagatedBuildInputs = [ 
    pkgs.python3Packages.wheel
  ];

  nativeBuildInputs = [
    pkgs.python3Packages.pytest
    pkgs.python3Packages.pytest-cov
  ];

  meta = {
    description = ''
      Python cowsay port
    '';
  };
}
