# Angular
Stryker supports Angular projects using the Angular CLI starting from @angular/cli v6.1.0. Are you using an older version? Then there are some tips later in this document.

## @angular/cli 6.1.0 and higher
Recommended stryker packages: `npm i -D stryker-api stryker stryker-karma-runner stryker-typescript stryker-html-reporter`

Recommended other packages: 
* @angular/cli 6.1.0 or higher
* @angular-devkit/build-angular 0.7.2 or higher
* karma 2.0.4 or higher
* typescript 2.4.2 or higher

### Configuration
After installing the recommended packages, create the `stryker.conf.js` file in your repository. 
The configuration below contains a good starting point for Angular projects. 
You may have to change some paths or config settings like the selected browsers. 
We highly suggest using a headless browser when testing using stryker.

Coverage analysis with [stryker-jasmine](http://npmjs.com/package/stryker-jasmine) is unfortunately not supported as of right now.
```js
module.exports = function (config) {
  config.set({
    mutate: [
      'src/**/*.ts',
      '!src/**/*.spec.ts',
      '!src/test.ts',
      '!src/environments/*.ts'
    ],
    mutator: 'typescript',
    testRunner: 'karma',
    karma: {
      configFile: 'src/karma.conf.js',
      project: 'angular-cli',
      config: {
        browsers: ['ChromeHeadless']
      }
    },
    reporter: ['progress', 'clear-text', 'html'],
    coverageAnalysis: 'off'
  });
};
```

## Older Angular version
Are you using an older version of Angular? Then we highly suggest upgrading to at least version 6.1.0 of the cli. 
You can use the [Angular Update Guide](https://update.angular.io/) to help you with this. 
If it's not possible for you to upgrade your Angular version, please check out [this repo and its commits](https://github.com/nicojs/angular-stryker-example).
