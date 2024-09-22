{ pkgs, lib, terminals, ... }:

let
  terminalOptions = [ "alacritty" "kitty" ];
  invalidTerminals = builtins.filter (t: !(builtins.elem t terminalOptions)) terminals;
in
assert lib.assertMsg (invalidTerminals == [])
    "Error: Invalid terminals specified: ${toString invalidTerminals}";
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