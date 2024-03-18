{
  description = "A Nix-flake-based Jupyter development environment";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";

  outputs =
    { self
    , nixpkgs
    ,
    }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f:
        nixpkgs.lib.genAttrs supportedSystems (system:
          f {
            pkgs = import nixpkgs { inherit system; };
          });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs;[
            python311
            virtualenv
            jdk17
            ]
            ++ (with pkgs.python311Packages; [ 
              pip
              jupyter
              pandas
              geopandas
              folium
              matplotlib
              numpy
              matplotlib
              umap-learn
              rasterio
              branca
              osmnx
              (python311.pkgs.callPackage ./pkgs/mapclassify/default.nix {})
              (python311.pkgs.callPackage ./pkgs/r5py/default.nix {})
            ]);
        };
      });
    };
} 