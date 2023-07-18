{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/8ad5e8132c5dcf977e308e7bf5517cc6cc0bf7d8.tar.gz") {} }:

with pkgs;

let
  my-pkgs = rWrapper.override {
    packages = with rPackages; [
 
      targets 
      tarchetypes 
      rmarkdown 
    (buildRPackage {
      name = "housing";
      src = fetchgit {
      url = "https://github.com/rap4all/housing/";
      branchName = "fusen";
      rev = "1c860959310b80e67c41f7bbdc3e84cef00df18e";
      sha256 = "sha256-s4KGtfKQ7hL0sfDhGb4BpBpspfefBN6hf+XlslqyEn4=";
      };
    propagatedBuildInputs = [ 
        dplyr 
        ggplot2 
        janitor
        purrr
        readxl
        rlang
        rvest
        stringr
        tidyr
        ];
      }) 
    ];
  };
in
mkShell {
  buildInputs = [my-pkgs];
}
