{inputs,config,pkgs,...}:{
 home.packages = [inputs.glide.packages.${pkgs.system}.default];
}
