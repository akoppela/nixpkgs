{stdenv, fetchurl, bison, flex, fftw}:

# Note that this does not provide the ngspice command-line utility. For that see
# the ngspice derivation.
stdenv.mkDerivation rec {
  pname = "libngspice";
  version = "33";

  src = fetchurl {
    url = "mirror://sourceforge/ngspice/ngspice-${version}.tar.gz";
    sha256 = "1wa1hmpn13spmxqgbb1m7vgy32mwvjqwrxhymzll8z65q5nbd7dr";
  };

  nativeBuildInputs = [ flex bison ];
  buildInputs = [ fftw ];

  configureFlags = [ "--with-ngshared" "--enable-xspice" "--enable-cider" ];

  meta = with stdenv.lib; {
    description = "The Next Generation Spice (Electronic Circuit Simulator)";
    homepage = "http://ngspice.sourceforge.net";
    license = with licenses; [ bsd3 gpl2Plus lgpl2Plus ]; # See https://sourceforge.net/p/ngspice/ngspice/ci/master/tree/COPYING
    maintainers = with maintainers; [ bgamari ];
    platforms = platforms.unix;
  };
}
