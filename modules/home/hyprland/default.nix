{ uberOS, ... }:
let
  inherit (uberOS) animChoice;
in
{
  imports = [
    animChoice
    ./binds.nix
    ./env.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
  ];
}
