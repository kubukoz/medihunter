let
  pkgs = import <nixpkgs> {};
in
pkgs.mkShell {
  buildInputs = [ pkgs.python3Packages.virtualenv ];
  shellHook = ''
    source ./bin/activate
  '';
}
