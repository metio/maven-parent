<!--
SPDX-FileCopyrightText: The maven-parent Authors
SPDX-License-Identifier: 0BSD
 -->

# maven-parent [![Chat](https://img.shields.io/badge/matrix-%23talk.metio:matrix.org-brightgreen.svg?style=social&label=Matrix)](https://matrix.to/#/#talk.metio:matrix.org)

Parent POM for Maven based Java projects.


## Usage

Declare this project as a parent in your projects:

```xml
  <parent>
    <groupId>wtf.metio.maven</groupId>
    <artifactId>maven-parent</artifactId>
    <version>${version.parent}</version>
  </parent>
```
