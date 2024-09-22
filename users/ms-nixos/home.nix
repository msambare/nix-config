{ pkgs, ... }: {

  imports = [

    ../base_user.nix

  ];

  programs.git = {
    enable = true;
    userName = "Manas73";
    userEmail = "manas.sambare@gmail.com";

  };

}
