{ pkgs-unstable , inputs , ... }:
{
  environment.systemPackages = with pkgs-unstable; [ 
    inputs.binary-ninja.packages."${pkgs-unstable.system}".binary-ninja-personal-wayland
  ];
}
