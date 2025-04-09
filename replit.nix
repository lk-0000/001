{pkgs}: {
  deps = [
    pkgs.zip
    pkgs.mailutils
    pkgs.glibcLocales
    pkgs.postgresql
    pkgs.openssl
  ];
}
