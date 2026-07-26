<!--
SPDX-FileCopyrightText: The maven-parent Authors
SPDX-License-Identifier: 0BSD
 -->

# maven-parent

Parent POM for Maven-based Java projects.

## Usage

Declare this project as a parent in your projects:

```xml
  <parent>
    <groupId>wtf.metio.maven</groupId>
    <artifactId>maven-parent</artifactId>
    <version>${version.parent}</version>
  </parent>
```

## Development

The toolchain is a [nix flake](flake.nix) — JDK and Maven come from `flake.lock`,
so a local run and CI resolve the same versions:

```shell
nix develop --command mvn verify
```

The shared lint gate (`ci-reuse`, `ci-yaml`, `ci-actionlint`, `ci-markdown`,
`ci-typos`) rides in the same shell. CI runs the build through
[`metio/ci`](https://github.com/metio/ci)'s reusable Maven pipeline, and every
job through this flake's devShell.

## Contributing

See the org-wide [contributor guide](https://github.com/metio/.github/blob/main/CONTRIBUTING.md).
Every commit needs a `Signed-off-by` trailer (`git commit --signoff`); the DCO
gate enforces it.
