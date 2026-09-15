{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pwntools,
  podman,
  docker,
  typer,
  rich,
}:

buildPythonPackage rec {
  pname = "vagd";
  version = "1.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fRzy9/emtyxiRPSyJ91gJezafks+eZpOH2NP9Z/jPGs=";
  };

  build-system = [ setuptools ];

  buildInputs = [
  ];

  nativeBuildInputs = [
  ];

  propagatedBuildInputs = [
    pwntools
    podman
    docker
    typer
    rich
  ];

  doCheck = true;

  meta = with lib; {
    description = "VirtuAlization GDb integrations in pwntools";
    homepage = "https://github.com/gfelber/vagd";
    changelog = "https://github.com/gfelber/vagd/releases/tag/${version}";
    license = licenses.gpl3Only;
    maintainers = [ ];
  };
}
