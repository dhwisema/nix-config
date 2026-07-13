{inputs,config,pkgs,...}:{
 imports = [inputs.glide-browser.homeManagerModules.default];
 home.packages = [inputs.glide-browser.packages.${pkgs.system}.default];
 programs.glide-browser.enable = true;
}
