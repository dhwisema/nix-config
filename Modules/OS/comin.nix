{inputs, pkgs, config}:let
  comin = config.services.comin.package;
  ripgrep = pkgs.ripgrep;
  coreutils = pkgs.coreutils;
  systemd = pkgs.systemd;
  script-name = "comin-reboot-if-needed";
  rebootScriptDerivation = (
    pkgs.writeShellScriptBin script-name ''
      if ${comin}/bin/comin status | ${ripgrep}/bin/rg -q 'Need to reboot: yes'; then
        if ! ${coreutils}/bin/sleep 5; then
          echo "Warning: sleep failed, proceeding to reboot anyway" >&2
        fi
        ${systemd}/bin/systemctl reboot
      fi
    ''
  );
  rebootScript = "${rebootScriptDerivation}/bin/${script-name}";
in
{
 services.comin.postDeploymentCommand = rebootScript;
}
