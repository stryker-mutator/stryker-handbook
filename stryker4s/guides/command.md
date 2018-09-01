# Command

The command test-runner is designed to be able to work with any build tool that supports Scala. This is done by directly executing a command on a terminal.  

## Stryker4s

To get started you need to clone the [Stryker4s repository](https://github.com/stryker-mutator/stryker4s). 

## Configuration

After cloning the repository, create the `stryker4s.conf` file in the root of the Stryker4s repository. 

The configuration below contains a good starting point to run Stryker4s with the command test-runner. You will have to edit the `base-dir` to match the codebase you want to mutate. Also, make sure the `test-runner` is configured with the commands you need to run your unit tests.

```hocon
stryker4s {
  files: [
    "foo/bar/src/main/**/*.scala"
  ]

  base-dir: "/tmp/project"

  log-level: INFO

  test-runner: {
    type=commandrunner
    command: "sbt"
    args: "test"
  }

  reporters: ["console"]
}
```

