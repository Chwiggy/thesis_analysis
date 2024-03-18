{
  lib,
  buildPythonPackage,
  fetchPypi,

  #build dependencies
  setuptools, wheel

  #dependencies
  ConfigArgParse,
  filelock,
  fiona,
  geopandas,
  importlib_resources,
  joblib,
  jpype1,
  numpy,
  pandas,
  psutil,
  pyproj,
  requests,
  shapely
}:

buildPythonPackage rec {
  pname = "r5py";
  version = "0.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-REF5jVWgUedSBr9G3M/IqPgyOqyFltGZYdEWYMmGd8o=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    ConfigArgParse
    filelock
    fiona
    geopandas
    importlib_resources
    joblib
    jpype1
    numpy
    pandas
    psutil
    pyproj
    requests
    shapely
  ];

  #ignoring testing for now because i don't want to package r5py sampledata
  doCheck = false;
  # nativeCheckInputs = [
  # 
  # ];

  meta = with lib; {
    homepage = ;
    repository = ;
    description = ;
    license = [];
  };
}