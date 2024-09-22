{ pkgs, lib, terminals, ... }:

let
  terminalOptions = [ "alacritty" "kitty" ];
in
{
  imports = lib.lists.flatten (map (terminal:
    if builtins.elem terminal terminalOptions
    then [ (./. + "/${terminal}") ]
    else []
  ) terminals);

  config = lib.mkMerge (map (terminal:
    lib.mkIf (builtins.elem terminal terminalOptions) {
      ${terminal}.enable = true;
    }
  ) terminals);
}