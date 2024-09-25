{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "2bb6702a5ddc9417aadbebd6d66aae14973e47ea";
    sha256 = "0djxiy8pzigw3rf81z59n36r6lw8cqf9hrxl3vjsg5267k8kjqhp";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
