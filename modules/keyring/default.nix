{ pkgs, lib, keyring, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  keyring_options = [ "gnome-keyring" ];
in
functions.makeModuleConfig {
  options = keyring_options;
  current = keyring;
  module_name = "keyring";
}