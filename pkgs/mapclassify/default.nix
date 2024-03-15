{
  lib,
  buildPythonPackage,
  fetchPypi,

  #build dependencies
  setuptools, wheel, setuptools-scm,

  #dependencies
  networkx, numpy, pandas, scikit-learn, scipy,

  #test dependencies
  # geopandas,
  # libpysal,
  # matplotlib,
  # pytest,
  # pytest-cov,
  # pytest-xdist,
}:

buildPythonPackage rec {
  pname = "mapclassify";
  version = "2.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-REF5jVWgUedSBr9G3M/IqPgyOqyFltGZYdEWYMmGd8o=";
  };

  nativeBuildInputs = [
    setuptools-scm
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    networkx numpy pandas scikit-learn scipy
  ];

  doCheck = false;
  #nativeCheckInputs = [
  #  geopandas
  #  libpysal
  #  matplotlib
  #  pytest
  #  pytest-cov
  #  pytest-xdist
  #];

  meta = with lib; {
    homepage = "https://pysal.org/mapclassify/";
    repository = "https://github.com/pysal/mapclassify";
    description = "open-source python library for Choropleth map classification. It is part of PySAL the Python Spatial Analysis Library";
    license = licenses.bsd3;
  };
}