let
  # Function to recursively import all `.nix` files in subdirectories
  importAllNixFiles = dir: 
    let
      entries = builtins.readDir dir; # Read all entries in the directory
      isDirectory = path: (builtins.getAttr "type" (builtins.stat path)) == "directory";
    in
      builtins.listToAttrs (map (name: {
        name = name;
        value = if isDirectory "${dir}/${name}"
                then importAllNixFiles "${dir}/${name}" # Recursively call for subdirectories
                else import "${dir}/${name}"; # Import the `.nix` file
      }) (builtins.filter (name: builtins.match ".*\\.nix$" name != null || isDirectory "${dir}/${name}") (builtins.attrNames entries)));
      
in
  importAllNixFiles ./. # Start from the current directory


# Terminals
config.alacrittyConfig.enable = true;