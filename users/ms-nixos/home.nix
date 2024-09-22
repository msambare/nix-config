{ pkgs, ... }: {

  imports = [

    ../base_user.nix

  ];

  programs.git = {
    userName = "Manas73";
    userEmail = "manas.sambare@gmail.com";
  };

}
