# Stryker dashboard

The Stryker dashboard is a dashboard for mutation testing: https://dashboard.stryker-mutator.io. It is free to use and open source. It has the following features:

🥇 Supply a mutation score badge to pimp your readme  
🤑 Free to use for open source  
📊 Hosts your mutation testing report in the cloud  
🌎 Supports all mutation testing frameworks*

\* That support the [mutation testing report schema](https://github.com/stryker-mutator/mutation-testing-elements/tree/master/packages/mutation-testing-report-schema).

⚠ Under construction ⚠

The Stryker dashboard is still very much under construction.

## Enable the dashboard for your project

Enabling the dashboard for your project is as simple as navigating to https://dashboard.stryker-mutator.io, loging in with your github account and enabling it for your repository.

## Send your first report

Send your first report [directly from Stryker](#send-a-report-direcly-from-Stryker), or manually via [a curl request](#send-a-report-via-curl).

### Send a report direcly from Stryker

Current status:

| | Stryker | Stryker.NET | Stryker4s |
|-|-|-|-|
| Full report | ✅|❌|✅|
| Mutation score report | ✅ |❌|✅|
| `dashboard.*` settings | ✅|❌|✅|

Enabeling the dashboard reporter works the same accross all implementations of Stryker.

1. Enabling the dashboard reporter is done by adding `"dashboard"` to the `"reporters"` configuration.
2. Configure the reporter:
   * Configuring the "project" is done via the `dashboard.project` configuration key (default: retrieved from environment)
   * Configuring the "module is done via the `dashboard.module` configuration key. 
   * Configuring the "version" is done via the `dashboard.version` configuration key. (default: retrieved from environment)
   * Configuring the "baseUrl" is done via the `dashboard.baseUrl` configuration key. It defaults to "https://dashboard.stryker-mutator.io".
   * Configuring the "reportType" is done via the `dashboard.reporType` configuration key.
3. Configuring the API key by setting the "STRYKER_DASHBOARD_API_KEY" variable.

#### Retrieved from environment

The `project` and `version` settings can also be retrieved from your build servers environment. This is not supported for all CI providers or Stryker implementations. See the table below for the current support.

| | Stryker | Stryker.NET | Stryker4s |
|-|-|-|-|
| Travis | ✅ |❌|✅|
| CircleCI | ✅ |❌|✅|
| Azure dev/ops | ❌ |❌|❌|
| GitlabCI | ❌ |❌|❌|
| Github actions | ✅ |❌|✅|

### Send a report via curl

You can send a report with an HTTP PUT request, like so:

```sh
curl -X PUT \
  $BASE_URL$/api/reports/$PROJECT$/$VERSION$ \
  -H 'Content-Type: application/json' \
  -H 'Host: dashboard.stryker-mutator.io' \
  -H 'X-Api-Key: $API_KEY$ \
  -d @mutation-testing-report.json
```

Multiple results per `VERSION` are also supported using this url: `$BASE_URL$/api/reports/$PROJECT$/$VERSION$?module=$MODULE_NAME$`

A report can also contain only a "mutation score" (without the report JSON). This way, you will have a mutation score badge, but no other information is stored. The body of the request should in that case be:

```json
{
  "mutationScore": 56
}
```

The variables here are:
* `BASE_URL`: `https://dashboard.stryker-mutator.io` for production, `https://stryker-dashboard-acceptance.azurewebsites.net/` for acceptance
* `PROJECT`: The name registered with the dashboard. It is in the form of `gitProvider/organization/repository`. At the moment the dashboard backend only supports `github.com` as a git provider, but we will also support `gitlab.com`/`bitbucket.org`, etc in the future. It can have an indefinite number of levels. Slashes (`/`) in this name are _not_ escaped.  For example `stryker-mutator/stryker-net`.
* `VERSION`: the version of the report. This should be filled with the branch name, git tag or git sha (although no validation is done). You can override a report of a specific version, like docker tags. Slashes in the version should be encoded. For example "feat/logging" becomes "feat%2Flogging" 
* `API_KEY`: The API key that you retrieved by enabling the report on the dashboard.stryker-mutator.io website.
* `mutation-testing-report.json`: A valid JSON report according to the [mutation testing report schema](https://github.com/stryker-mutator/mutation-testing-elements/tree/master/packages/mutation-testing-report-schema)
* `MODULE`: Optional. If you want to store multiple reports for a version, you can use this value to separate them logically. For example, in a mono-repo setup where each package (or project or module) delivers a report.

