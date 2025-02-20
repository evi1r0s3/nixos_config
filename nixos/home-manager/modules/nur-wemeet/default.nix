{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [ inputs.nur-wemeet.packages.${pkgs.system}.wemeet ];
}
