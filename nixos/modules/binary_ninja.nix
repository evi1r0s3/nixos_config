{ pkgs , inputs , ... }:
{
  environment.systemPackages = with pkgs; [ 
    inputs.binary-ninja.packages."${pkgs.system}".binary-ninja-personal-wayland
  ];
}
