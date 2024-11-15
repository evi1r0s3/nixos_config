{ pkgs-unstable, inputs, ... }:
{
  home.packages = with pkgs-unstable; [ inputs.nur-wemeet.packages.${pkgs-unstable.system}.wemeet ];
}
