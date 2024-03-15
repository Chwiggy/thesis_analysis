{
  lib,
  buildPythonPackage,
  fetchPypi
}:

buildPythonPackage rec {
  pname = mapclassify;
  version = "2.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-z4Q23FnYaVNG/NOrKW3kZCXsqwDWQJbOvnn7Ueyy65M=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  doCheck = false;

  meta = with lib; {
    homepage = https://pysal.org/mapclassify/;
    description = "open-source python library for Choropleth map classification. It is part of PySAL the Python Spatial Analysis Library";
    license = licenses.bsd3;
  };
}