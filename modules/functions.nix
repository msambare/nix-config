{ pkgs, lib, ... }:

let
  makeModuleConfig = { options, current, module_name, conditional_imports ? [], extra_config ? (_: {}) }:
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
       imports = lib.lists.flatten (
        # Existing import logic for each window manager option
        map (option:
          if builtins.elem option options
          then [ (import ./${module_name}/${option}) ]
          else []
        ) currentList
      ) ++ conditional_imports; # Add the conditional imports at the end

      config = lib.mkMerge ([
        (lib.mkMerge (
          map (option:
            lib.mkIf (builtins.elem option options) {
              "${option}".enable = true;
            }
          ) currentList
        ))
      ] ++ [(extra_config currentList)]);  # Execute the finalizer function at the end
    };
in
{
  inherit makeModuleConfig;
}