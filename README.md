<!--
SPDX-FileCopyrightText: The maven-parent Authors
SPDX-License-Identifier: 0BSD
 -->

# maven-parent [![Chat](https://img.shields.io/badge/irc.libera.chat-%23metio-blue.svg)](ircs://irc.libera.chat:6697/#metio)

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
