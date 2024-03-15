{
  lib,
  buildPythonPackage,
  fetchPypi
}:

buildPythonPackage rec {
  pname = mapclassify;
  version = "2.6.1";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-z4Q23FnYaVNG/NOrKW3kZCXsqwDWQJbOvnn7Ueyy65M=";
  };

  nativeBuildInputs = [
    setuptools-scm
  ];
}