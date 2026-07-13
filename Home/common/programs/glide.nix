{inputs,config,pkgs,...}:{
 imports = [inputs.glide-browser.homeModules.default];
# home.packages = [inputs.glide-browser.packages.${pkgs.system}.default];
 programs.glide-browser.enable = true;
}
