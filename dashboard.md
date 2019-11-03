# Stryker dashboard

A dashboard for mutation testing: https://dashboard.stryker-mutator.io

## Send a report manually

You can send a report with an HTTP PUT request, like so:

```sh
curl -X PUT \
  $BASE_URL$/api/reports/$PROJECT$/$VERSION$ \
  -H 'Content-Type: application/json' \
  -H 'Host: dashboard.stryker-mutator.io' \
  -H 'X-Api-Key: $API_KEY$ \
  -d '{
    "result": $REPORT_JSON$
  }'
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
* `REPORT_JSON`: A valid report according to the [mutation testing report schema](https://github.com/stryker-mutator/mutation-testing-elements/tree/master/packages/mutation-testing-report-schema)
* `MODULE`: Optional. If you want to store multiple reports for a version, you can use this value to separate them logically. For example, in a mono-repo setup where each package (or project or module) delivers a report.

## Dashboard reporter

Enabeling the dashboard reporter works the same accross all implementations of Stryker.

1. Enabling the dashboard reporter is done by adding `"dashboard"` to the `"reporters"` configuration.
2. Configure the reporter:
   * Configuring the "project" is done via the `dashboard.project` configuration key (default: retrieved from environment)
   * Configuring the "module is done via the `dashboard.module` configuration key. 
   * Configuring the "version" is done via the `dashboard.version` configuration key. (default: retrieved from environment)
   * Configuring the "baseUrl" is done via the `dashboard.baseUrl` configuration key. It defaults to "https://dashboard.stryker-mutator.io".
   * Configuring the "reportType" is done via the `dashboard.reporType` configuration key.
3. Configuring the API key by setting the "STRYKER_DASHBOARD_API_KEY" variable.

### Under construction:

#### Basic support

| | Stryker | Stryker.NET | Stryker4s |
|-|-|-|-|
| Full report | ❌|❌|❌|
| Mutation score report | ✅ |❌|✅|
| `dashboard.*` settings | ❌|❌|❌|

Retrieve `project` and `version` from build servers environment variables

| | Stryker | Stryker.NET | Stryker4s |
|-|-|-|-|
| Travis | ✅ |❌|✅|
| CircleCI | ✅ |❌|✅|
| Azure dev/ops | ❌ |❌|❌|
| GitlabCI | ❌ |❌|❌|
| Github actions | ❌ |❌|❌|

