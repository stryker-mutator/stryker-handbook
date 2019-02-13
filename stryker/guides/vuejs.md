# VueJS
Stryker supports VueJS projects that use the vue-template-compiler. 

All configurations will require at least the vue-template-compiler 2.0.0 or higher.

To get started using VueJS, please follow these steps:
1. Install the recommended packages for all VueJS projects: `npm i -D @stryker-mutator/core @stryker-mutator/vue-mutator @stryker-mutator/html-reporter`
2. Execute `npm i -D @stryker-mutator/javascript-mutator` for JavaScript projects or `npm i -D @stryker-mutator/typescript` for TypeScript projects
3. Execute `npm i -D @stryker-mutator/karma-runner` for Karma projects or `npm i -D @stryker-mutator/jest-runner` for Jest projects
4. Create a stryker.conf.js file and configure it using the settings below

Keep in mind that you may have to change some configuration settings such as paths to files.

## Karma configuration
The following config is a good starting point, but keep in mind that you may have to change the browsers config. 
We highly suggest using a headless browser when testing using stryker.

```js
module.exports = function (config) {
  config.set({
    mutate: ['src/**/*.js', 'src/**/*.ts', 'src/**/*.vue'],
    mutator: 'vue',
    testRunner: 'karma',
    karma: {
      configFile: 'test/unit/karma.conf.js',
      config: {
        browsers: ['ChromeHeadless']
      }
    },
    reporter: ['progress', 'clear-text', 'html'],
    coverageAnalysis: 'off'
  });
};
```

## Jest configuration
The following config is a good starting point, the stryker-jest-runner will attempt to find your config file by looking in your package.json and in the current working directory.

If your jest config is somewhere else, please specify it.
```js
module.exports = function (config) {
  config.set({
    mutate: ['src/**/*.js', 'src/**/*.ts', 'src/**/*.vue'],
    mutator: 'vue',
    testRunner: 'jest',
    jest: {
      // config: require('path/to/your/custom/jestConfig.js')
    }
    reporter: ['progress', 'clear-text', 'html'],
    coverageAnalysis: 'off'
  });
};
```
