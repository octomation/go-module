[![Go Module][social.preview]][preview.config]

# 🧩 Module

Integrations and how-to guides.

## Automation

### GitHub Actions

- Project: https://github.com/features/actions.
- Documentation: https://docs.github.com/en/actions.

### Slack

- Project: https://slack.com.
- Application: https://github.com/marketplace/slack-github.

## Code quality

### Codecov

- Project: https://about.codecov.io.

### CodeQL

- Project: https://codeql.github.com.
- Documentation: https://codeql.github.com/docs/.
- Guide: https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/customizing-code-scanning.
- Configuration: [config.yml](codeql/config.yml) (→`codeql.yml`).
- Workflow: [ci.yml](codeql/ci.yml) (+`.github/workflows/ci.yml`).

### Qodana

- Project: https://qodana.cloud.
- Documentation: https://www.jetbrains.com/help/qodana/.
- Guide:
  - https://youtu.be/WrhnUnzMUCg,
  - https://youtu.be/JrWQkqaXZFQ,
  - https://youtu.be/RV1MFnURMP8.
- Action: https://github.com/marketplace/actions/qodana-scan.
- Configuration: [config.yml](qodana/config.yml) (→`qodana.yml`).
- Workflow: [ci.yml](qodana/ci.yml) (+`.github/workflows/ci.yml`).

```markdown
[![Quality][quality.icon]][quality.page]

[quality.page]:     https://qodana.cloud/...
[quality.icon]:     https://qodana.cloud/...
```

### SonarCloud

- Project: https://sonarcloud.io.
- Documentation: https://docs.sonarcloud.io.
- Application: https://github.com/marketplace/sonarcloud.
- Action: https://github.com/marketplace/actions/sonarcloud-scan.
- Configuration: [config.yml](sonar/config.properties) (→`sonar-project.properties`).
- Workflow: [ci.yml](sonar/ci.yml) (+`.github/workflows/ci.yml`).

```markdown
[![Quality][quality.icon]][quality.page]

[quality.page]:     https://sonarcloud.io/...
[quality.icon]:     https://sonarcloud.io/...
```

## Routine solvers

### Dependabot

The application allows automating dependencies updates.
It provides information to Dependabot about used package ecosystems.

- Documentation: https://docs.github.com/en/code-security/dependabot.
- Guide: https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file.

### Probot

- Project: https://probot.github.io.
- Documentation: https://probot.github.io/docs/.

#### Settings

The application allows implementing Configuration as a Code approach.
It configures a repository by this configuration file.

- Installation: https://github.com/apps/settings.
- Source: https://github.com/repository-settings/app.
- Configuration: [settings.yml](../settings.yml).

⚠️ It will be replaced, see https://github.com/octomation/go-module/issues/56.

<details>
  <summary>📜 Legacy</summary>

We recommend using it together with organization-level settings. Our recommendations are:

- Configure defaults: https://github.com/organizations/octomation/settings/repository-defaults
  - Repository default branch: main
  - Commit signoff: All repositories
  - Repository labels: none

- Configure team discussions: https://github.com/organizations/octomation/settings/teams
  - Enable team discussions for this organization: true

- Configure discussions: https://github.com/organizations/octomation/settings/discussions
  - Enable discussions for this organization: true
  - Host: .github

- Configure projects: https://github.com/organizations/octomation/settings/projects
  - Enable projects for the organization: true
  - Enable projects for all repositories: true
  - Allow members to change project visibilities for this organization: true

- Configure authentication security
  - Require two-factor authentication for everyone in this organization: true

- Configure code security and analysis
  - Dependency graph, Automatically enable for new private repositories: true
  - Dependabot alerts, Automatically enable for new repositories: true
  - Dependabot security updates, Automatically enable for new repositories: true

- Configure third-party application access policy
  - Policy: Access restricted
</details>

#### Stale

The application allows closing abandoned issues or pull requests after inactivity.

- Installation: https://github.com/apps/stale.
- Source: https://github.com/probot/stale.
- Configuration: [stale.yml](stale/stale.yml) (→`.github/stale.yml`).

⚠️ It's potentially deprecated, see https://github.com/probot/stale/issues/248.

Alternative via GitHub Actions:

- Action: https://github.com/marketplace/actions/close-stale-issues.
- Source: https://github.com/actions/stale.
- Workflow: [stale.yml](../workflows/stale.yml).

## Documentation

### GitHub Pages

- Project: https://pages.github.com.
- Documentation: https://docs.github.com/en/pages.

### Nextra

- Project: https://nextra.site.
- Documentation: https://nextra.site/docs.

## DX

### Graphite

- Project: https://graphite.dev.
- Documentation: https://graphite.dev/docs/introduction.

### Vercel

- Project: https://vercel.com.
- Documentation: https://vercel.com/docs.

## Miscellaneous

### Crontab.guru

- Project: https://crontab.guru.

### Git History

- Project: https://githistory.xyz.

### GitHub Socialify

- Project: https://socialify.git.ci.

### Shields.io

- Project: https://shields.io.

<p align="right">made with ❤️ for everyone by <a href="https://www.octolab.org/">OctoLab</a></p>

[social.preview]:   https://cdn.octolab.org/repo/go-module.png
[preview.config]:   https://socialify.git.ci/octomation/go-module?description=1&font=Raleway&language=1&name=1&owner=1&pattern=Circuit%20Board&theme=Light
[preview.fallback]: https://socialify.git.ci/octomation/go-module/image?description=1&font=Raleway&language=1&name=1&owner=1&pattern=Circuit%20Board&theme=Light
