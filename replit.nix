{ pkgs }: {
  deps = [
    pkgs.dos2unix
    pkgs.ed
    pkgs.vim
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}