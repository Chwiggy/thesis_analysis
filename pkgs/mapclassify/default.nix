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
    python3Packages.setuptools
    python3Packages.wheel
  ];
}