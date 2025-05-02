{ pkgs-default , inputs , ... }:
{
  environment.systemPackages = with pkgs-default; [ 
    inputs.binary-ninja.packages."${pkgs.system}".binary-ninja-personal-wayland
  ];
}
