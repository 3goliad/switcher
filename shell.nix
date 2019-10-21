with (import <nixpkgs> { });
stdenv.mkDerivation {
  name = "switcher";
  buildInputs = [ nodejs-10_x elmPackages.elm-format ];
}
