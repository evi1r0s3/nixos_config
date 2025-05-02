{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [ 
    obsidian
    # 用于导出类的插件
    pandoc
    # 用于github copliot接入插件
    nodejs
    # 用于图像分析插件
    #ollama
  ];
  #services.ollama = {
  #  enable = true;
  #  acceleration = "cuda";
  #};
}
