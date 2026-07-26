# SPDX-FileCopyrightText: The maven-parent Authors
# SPDX-License-Identifier: 0BSD

# The single source of the development toolchain: CI and local shells run every
# gate through this flake's devShell, so both use the exact tool versions pinned
# in flake.lock. The shared lint gate and the org-wide nixpkgs pin come from
# metio/nix-devshell; Renovate keeps the lock fresh. The build itself runs via
# the shared metio/ci maven.yml, which invokes `nix develop --command mvn` — so
# a local `nix develop --command mvn verify` reproduces the gate exactly.
{
  description = "maven-parent development environment";

  inputs = {
    devshell.url = "github:metio/nix-devshell";
    nixpkgs.follows = "devshell/nixpkgs";
    flake-compat.follows = "devshell/flake-compat";
  };

  outputs =
    { nixpkgs, devshell, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (
        pkgs:
        let
          # global.jdkVersion in the POM is the bytecode target every consuming
          # project compiles against; running Maven on that same JDK keeps the
          # toolchain honest — a newer JDK would accept sources this parent's
          # `<release>` setting is meant to reject.
          jdk = pkgs.jdk17;
          maven = pkgs.maven.override { jdk_headless = jdk; };
        in
        {
          default = devshell.lib.mkDevShell {
            inherit pkgs;
            packages = [
              jdk
              maven
            ];
            env.JAVA_HOME = "${jdk}";
            menu = ''
              echo "maven-parent — JDK 17 + Maven. Build the POM with"
              echo "  nix develop --command mvn verify"
            '';
          };
        }
      );

      formatter = forAllSystems (pkgs: pkgs.nixfmt-rfc-style);
    };
}
