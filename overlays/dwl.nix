{stdenv, fetchurl, pkg-config, wayland-protocols, wlroots, wayland, libudev, patches ? []}:

let
  name = "dwl";
in
stdenv.mkDerivation {
  inherit name;

  src = fetchurl {
    url = "https://github.com/LukasZumvorde/dwl/tarball/master";
    sha256 = "03hirnj8saxnsfqiszwl2ds7p0avg20izv9vdqyambks00p2x44p";
    # url = "https://dl.suckless.org/dwm/${name}.tar.gz";
    # sha256 = "03hirnj8saxnsfqiszwl2ds7p0avg20izv9vdqyambks00p2x44p";
  };

  buildInputs = [ pkg-config wayland-protocols wlroots wayland libudev ];

  # prePatch = ''sed -i "s@/usr/local@$out@" config.mk'';

  # Allow users set their own list of patches
  inherit patches;

  buildPhase = " make ";

  meta = {
    homepage = "https://suckless.org/";
    description = "Dynamic window manager for Wayland";
    license = stdenv.lib.licenses.gpl3;
    # maintainers = with stdenv.lib.maintainers; [viric];
    platforms = with stdenv.lib.platforms; all;
  };
}
