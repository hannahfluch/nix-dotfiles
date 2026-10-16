{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pythonRelaxDepsHook,
  capstone,
  gevent,
  keystone-engine,
  multiprocess,
  pefile,
  pyelftools,
  python-fx,
  python-registry,
  pyyaml,
  questionary,
  termcolor,
  unicorn,
}:
buildPythonPackage {
  pname = "qiling";
  version = "1.4.11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "qilingframework";
    repo = "qiling";
    rev = "86c927cb329993b14e2586e04d1dd7a90deee5fb";
    hash = "sha256-HTlp6zSxeYEytXR085kLQadZKX+xaJ8u9XpWCLxI4Eg=";
  };

  build-system = [ poetry-core ];
  nativeBuildInputs = [ pythonRelaxDepsHook ];
  # Upstream pins 2.1.3; use Nixpkgs' 2.1.4 bindings and native library together.
  pythonRelaxDeps = [ "unicorn" ];
  dependencies = [
    capstone
    gevent
    keystone-engine
    multiprocess
    pefile
    pyelftools
    python-fx
    python-registry
    pyyaml
    questionary
    termcolor
    unicorn
  ];

  # The upstream suite needs separately distributed guest rootfs assets.
  doCheck = false;
  pythonImportsCheck = [ "qiling" "qiling.cli" ];

  meta = {
    description = "Advanced binary emulation framework";
    homepage = "https://qiling.io/";
    license = lib.licenses.gpl2Plus;
    mainProgram = "qltool";
  };
}
