let
  pkgs = import <nixpkgs> {};
in
pkgs.mkShell {
  buildInputs = [ pkgs.python3Packages.virtualenv pkgs.gotify-cli ];
  shellHook = ''
    source ./bin/activate
  '';
}
