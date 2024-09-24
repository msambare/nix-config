{ pkgs, lib, utilities, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  utilities_options = [ ];
in
functions.makeModuleConfig {
  options = utilities_options;
  current = utilities;
  module_name = "utility";
}
