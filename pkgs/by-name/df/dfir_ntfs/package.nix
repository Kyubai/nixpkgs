{
  lib,
  fetchFromGitHub,
  python3Packages,
}:

python3Packages.buildPythonPackage rec {
  pname = "dfir_ntfs";
  version = "1.1.19";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "msuhanov";
    repo = "dfir_ntfs";
    tag = "${version}";
    hash = "sha256-iZd8qFLm77Fv8iUAB5M75u9a3SSBHqUEtZ8CPq8g7Ps=";
  };

  build-system = with python3Packages; [
    setuptools
  ];

  nativeCheckInputs = with python3Packages; [
    pytestCheckHook
  ];

  meta = {
    description = "NTFS/FAT parser for digital forensics & incident response";
    # vsc_mount requires llfuse, which has been removed from nixpkgs as it
    # depends on the unmaintained fuse2. Shadow copy mounting is unavailable.
    homepage = "https://github.com/msuhanov/dfir_ntfs";
    changelog = "https://github.com/msuhanov/dfir_ntfs/blob/${version}/ChangeLog";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ kyubai ];
  };
}
