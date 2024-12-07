with import <nixpkgs> {};
mkShell {
  # === Packages
  packages = [
    (python3.withPackages (p : with p; [
      pipenv
    ]))
    stdenv.cc.cc
    direnv
  ];


  # === Environment Variables
  
  # fix libc++.so.6 error
  NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
    stdenv.cc.cc
  ];
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";

  # === Hook
  shellHook = ''
    export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
  '';
}