# VueJS
Stryker supports Vue projects. It can mutate both your js/ts files as the script tags in your `*.vue` files.

This article will explain how to configure Stryker with the [vue-cli](https://github.com/vuejs/vue-cli). If you're not using the vue-cli, you'll have to configure Stryker manually.

To get started using Stryker with the vue-cli, first install the core package: `npm i -D @stryker-mutator/core` or `yarn add --dev @stryker-mutator/core`. Next follow the guide for Jest or Mocha based on if you're using the [unit-jest](https://cli.vuejs.org/core-plugins/unit-jest.html) plugin or the [unit-mocha](https://cli.vuejs.org/core-plugins/unit-mocha.html) plugin.

Keep in mind that you may have to change some configuration settings such as paths to files.

## Jest configuration

Follow this guide if you're using the if you're using the [unit-jest](https://cli.vuejs.org/core-plugins/unit-jest.html) plugin.

1. Install the `@stryker-mutator/jest-runner` plugin: `npm i -D @stryker-mutator/jest-runner` or `yarn add --dev @stryker-mutator/jest-runner`.
1. Install `crossenv` (if you haven't already) `npm i -D cross-env@stryker-mutator/jest-runner` plugin.
1. Create a "stryker.conf.json" file that looks like this:
    ```
    {
      "$schema": "./node_modules/@stryker-mutator/core/schema/stryker-schema.json",
      "mutator": {
        "plugins": []	
      },
      "tempDirName_comment": "Jest doesn't play nice with the default (.stryker-tmp).",
      "tempDirName": "stryker-tmp",
      "testRunner": "jest",
      "coverageAnalysis": "off",
    }
    ```
1. Add `stryker-tmp` to your `.gitignore` file.
1. Add this script to your package.json: 
   ```json
   {
     "scripts": {
        "test:mutation": "cross-env BABEL_ENV=test VUE_CLI_TRANSPILE_BABEL_RUNTIME=true VUE_CLI_BABEL_TARGET_NODE=true VUE_CLI_BABEL_TRANSPILE_MODULES=true stryker run",
     }
   }
   ```

Now give it a go with `npm run test:mutation` or `yarn test:mutation`. 

Note that it is important to configure `BABEL_ENV`, `VUE_CLI_TRANSPILE_BABEL_RUNTIME` and `VUE_CLI_BABEL_TARGET_NODE` environment variables. This is done with the `test:mutation` script.

## Mocha configuration

Follow this guide if you're using the if you're using the [unit-mocha](https://cli.vuejs.org/core-plugins/unit-mocha.html) plugin.

To enable Stryker with your vue-cli project, we will have to rebuild parts of the `unit-mocha` plugin in Stryker configuration here. First we'll make unit tests run by running webpack and mocha separately. Next we'll configure Stryker to use it. After following this guide you can also opt to remove the "unit-mocha" vue-cli plugin entirely and use this setup for normal unit testing as well.

### Rebuild unit tests with webpack and mocha

Follow these steps to be able "manually" run webpack and mocha.

1. Install `cross-env` and `webpack-cli`: `npm i -D webpack-cli cross-env` or `yarn add --dev webpack-cli cross-env`.
2. Add webpack 

