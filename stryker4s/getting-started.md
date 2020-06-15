# Getting started

Stryker4s is a mutation testing framework for Scala. It allows you to test your tests by temporarily inserting bugs.

This guide is for the sbt plugin for Stryker4s. For other ways to run Stryker4s, such as on Maven projects, look at our [README](https://github.com/stryker-mutator/stryker4s/blob/master/README.md#getting-started).

## 1 Install

To install Stryker4s on your project, add the following line to `project/plugins.sbt` [![Maven Central](https://img.shields.io/maven-central/v/io.stryker-mutator/stryker4s-core_2.12.svg?label=Maven%20Central&colorB=brightgreen)](https://search.maven.org/search?q=g:io.stryker-mutator):

```scala
addSbtPlugin("io.stryker-mutator" % "sbt-stryker4s" % stryker4sVersion)
```

## 2 Configure

Stryker4s will look for a `stryker4s.conf` file in the root of your project. If found, it will use the configured values. All arguments in the configuration (and the file itself) are optional. You can find the possible values on our configuration page on [GitHub](https://github.com/stryker-mutator/stryker4s/blob/master/docs/CONFIGURATION.md#configuration).

## 3 Let's kill some mutants

Run Stryker4s to mutation test your project:

```shell
sbt stryker
```

## 4 Having trouble?

Are you having troubles? Try enabling debug logging, for more information on how to enable debug logging visit our [configuration page](https://github.com/stryker-mutator/stryker4s/blob/master/docs/CONFIGURATION.md#log-level).
If you are having issues, please let us know by [reporting an issue](https://github.com/stryker-mutator/stryker4s/issues/new) or talk to us on [Gitter](https://gitter.im/stryker-mutator/stryker4s).
