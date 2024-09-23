{ pkgs, lib, ... }:

let
  makeModuleConfig = { options, current, module_name }:
    let
      currentList = if builtins.isList current && current != []
        then current
        else if builtins.isString current
             then [ current ]
        else [];
      invalid_options = builtins.filter (t: !(builtins.elem t options)) currentList;
    in
    assert lib.assertMsg (invalid_options == [])
      "Error: Invalid options specified: ${toString invalid_options}";
    {
      imports = lib.lists.flatten (map (option:
        if builtins.elem option options
        then [ (import ./${module_name}/${option}) ] # Fixing the syntax here for importing
        else []
      ) currentList);

      config = lib.mkMerge (map (option:
        lib.mkIf (builtins.elem option options) {
          "${option}".enable = true; # Ensure correct string interpolation here
        }
      ) currentList);
    };
in
{
  inherit makeModuleConfig;
}
