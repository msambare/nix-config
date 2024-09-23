{ pkgs, lib, window_manager, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  window_manager_options = [ "i3" ];
in
functions.makeModuleConfig {
  options = window_manager_options;
  current = window_manager;
  module_name = "window_manager";
} // {
    imports = if (builtins.isList window_manager && !(builtins.elem "hyprland" window_manager)) || (!builtins.isList window_manager && window_manager != "hyprland")
      then [ ./x11.nix ]
      else [];
}