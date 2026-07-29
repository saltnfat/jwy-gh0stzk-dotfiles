{
  inputs,
  host,
  config,
  ...
}:
let
  inherit (config.uberOS) username;
in
{
  imports = [
    inputs.maccel.nixosModules.default
  ];

  hardware.maccel = {
    enable = true;
    enableCli = true; # Optional

    parameters = {

      # old/current
      mode = "linear"; # "synchronous"
      inputDpi = 3200.0; # default 1000.0
      # sensMultiplier = 1.2; # default 1.0
      # yxRatio = 2.00; # default 1.0
      # angleRotation = 0.0; # default 0.0
      # acceleration = 0.02;
      # offset = 0.2;
      # outputCap = 8.0;

      # hopefully matches our rawaccel values in windows
      sensMultiplier = 1.6; # default 1.0
      yxRatio = 2.00; # default 1.0
      angleRotation = 1.0; # default 0.0
      acceleration = 0.01;
      offset = 0.10;
      outputCap = 10.0;

      # default values
      # sensMultiplier = 1.0;
      # yxRatio = 1.0;
      # inputDpi = 1000.0;
      # angleRotation = 0.0;
      # mode = "synchronous";

      # Linear mode

      # # Natural mode
      # decayRate = 0.1;
      # offset = 2.0;
      # limit = 1.5;

      # # Synchronous mode
      # gamma = 1.0;
      # smooth = 0.5;
      # motivity = 2.5;
      # syncSpeed = 10.0;
    };
  };

  # To use maccel CLI/TUI without sudo
  users.groups.maccel.members = [ "${username}" ];
}
