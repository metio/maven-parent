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

[breto](https://github.com/metio/breto) installs the toolchain [`.breto.edn`](.breto.edn)
names: JDK 17, Maven and the shared lint tools, in the versions the
[metio/toolchains](https://github.com/metio/toolchains) groups pin, so a local run and
CI use the same versions:

```shell
eval "$(breto env)"
mvn verify
```

`breto run ci-lint` runs the shared lint gate. CI runs the build through
[`metio/ci`](https://github.com/metio/ci)'s reusable Maven pipeline, and every other
job installs the same toolchain with the breto action.

## Contributing

See the org-wide [contributor guide](https://github.com/metio/.github/blob/main/CONTRIBUTING.md).
Every commit needs a `Signed-off-by` trailer (`git commit --signoff`); the DCO
gate enforces it.

## License

[0BSD](LICENSES/0BSD.txt).
