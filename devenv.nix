{ pkgs, lib, config, inputs, ... }:

{
  packages = [
    pkgs.git
    pkgs.ripgrep
    pkgs.yarn
    # These are needed to build mysql2
    pkgs.mariadb
    pkgs.libmysqlclient
    pkgs.openssl
    pkgs.libyaml
];

  env.DB = "postgresql";

  enterShell = ''
    bin/setup
  '';

  enterTest = ''
    bin/setup
    bin/rails db:create db:migrate db:test:prepare
    bin/rspec
  '';

  # https://devenv.sh/services/
  # services.postgres.enable = true;
  services.postgres.enable = true;

  # https://devenv.sh/languages/
  # languages.nix.enable = true;
  languages.ruby.enable = true;
  languages.ruby.version = "3.3.4";
  languages.javascript.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
