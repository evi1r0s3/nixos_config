{ pkgs-default, inputs, ... }:
{
  home.packages = [ inputs.nur-wemeet.packages.${pkgs-default.system}.wemeet ];
}
