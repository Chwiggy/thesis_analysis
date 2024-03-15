{
  lib,
  pkgs
}:

{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    mapclassify = pkgs.callPackage ./default.nix {};

  };
}
