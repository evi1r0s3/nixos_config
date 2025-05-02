{
  pkgs-default, inputs, system, ...
}:
{
  environment.systemPackages = with pkgs-default; [ wpsoffice-cn ];
  nixpkgs.config.joypixels.acceptLicense = true;
  fonts.packages = [
    inputs.wpsFonts.packages.${system}.default
  ];
}
