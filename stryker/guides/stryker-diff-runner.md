# stryker-diff-runner
`stryker-diff-runner` is an utility script that allow you to run mutation testing on the part of the code that have diff with the `origin/master` branch.

To get started using `stryker-diff-runner`, please follow these steps:
1. Install required packages for the script to run: `npm i -D @stryker-mutator/core @stryker-mutator/api stryker-diff-runner`
2. Install required packages for the targeted project typology (Angular, React.js, Vue.js or Node.js).
3. Add at least the `mutate` section of the *stryker.conf.js* file with the files you want to have mutation on.
4. Run it through `npx stryker-diff-runner` or through any NPM script created from your own.

Keep in mind that you may have to change some configuration settings such as paths to files.

## Example of configuration

```js
module.exports = function (config) {
  config.set({
    mutate: [
      'src/**/*.js',
      '!src/config.js'
    ],
    // ...
  });
};
```

With that configuration, `stryker-diff-runner` will use the *mutate* attribute to configure Stryker with only the files that have diff with the `origin/master` branch.
Having a scenario with :
- *src/controllers/user.js*
- *src/config.js*
as the result of the diff. The configuration will end up with :
```js
  mutate: [
    '!src/config.js',
    'src/controllers/user.js'
  ]
```
so that mutation testing will only be executed for the *src/controllers/user.js* that have been updated.

## Sources

Project's sources are [here](https://github.com/tverhoken/stryker-diff-runner)
