{ pkgs, lib, terminals, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  terminal_options = [ "alacritty" "kitty" ];
in
functions.makeModuleConfig {
  options = terminal_options;
  current = terminals;
  module_name = "terminal";
}
