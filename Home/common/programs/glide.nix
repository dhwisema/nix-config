{inputs,config,pkgs,...}:{
 home.packages = [inputs.glide-browser.packages.${pkgs.system}.default];
 programs.glide-browser.enable = true;
}
