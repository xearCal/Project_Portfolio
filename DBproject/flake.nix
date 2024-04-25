{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    utils,
    ...
  }:
    utils.lib.eachDefaultSystem (
      system: let
        name = "dbproject";
        pkgs = import nixpkgs {
          inherit system;
        };
      in rec {
        devShells.default = pkgs.mkShell {
          name = "${name}-devshell";
          packages = with pkgs; [
            jdk17_headless
          ];
        };
      }
    );
}
