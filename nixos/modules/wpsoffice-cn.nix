{
  pkgs, pkgs-unstable, inputs, system, ...
}:
{
  environment.systemPackages = with pkgs-unstable; [ wpsoffice-cn ];
  nixpkgs.config.joypixels.acceptLicense = true;
  fonts.packages = with pkgs; [
    inputs.wpsFonts.packages.${system}.default
  ];
}
