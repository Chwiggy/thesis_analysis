{
  lib,
  buildPythonPackage,
  fetchPypi,

  #build dependencies
  setuptools, wheel,

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
    hash = lib.fakeSha256;
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
    importlib-resources
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
    homepage = "https://r5py.readthedocs.io/en/stable/";
    repository = "https://github.com/r5py/r5py/tree/main";
    description = "R⁵py is a Python library for rapid realistic routing on multimodal transport networks (walk, bike, public transport, and car)";
    license = licenses.gpl3Plus;
  };
}