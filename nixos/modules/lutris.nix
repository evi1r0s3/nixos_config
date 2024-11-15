{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    (lutris.override {
      extraLibraries =  pkgs-unstable: [
        # List library dependencies here
      ];
      extraPkgs = pkgs-unstable: [
         # List package dependencies here
      ];
    })
  ];
}
