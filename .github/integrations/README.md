# Integrations

## Code scanners

### CodeQL

- Project: https://codeql.github.com.
- Documentation: https://codeql.github.com/docs/.
- Guide:
  - https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/customizing-code-scanning.
- Configuration: [config.yml](codeql/config.yml) (→`codeql.yml`).
- Workflow: [ci.yml](codeql/ci.yml) (+`.github/workflows/ci.yml`).

### Qodana

- Project: https://qodana.cloud.
- Documentation: https://www.jetbrains.com/help/qodana/.
- Guide:
  - https://youtu.be/WrhnUnzMUCg,
  - https://youtu.be/JrWQkqaXZFQ.
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

## Misc

### GitHub Socialify

- Project: https://socialify.git.ci.

### Git History

- Project: https://githistory.xyz.

### Shields.io

- Project: https://shields.io.

## Routine solvers

### Probot

- Project: https://probot.github.io.
- Documentation: https://probot.github.io/docs/.

### Stale

The application allows closing abandoned issues or pull requests after inactivity.

- Installation: https://github.com/apps/stale.
- Source: https://github.com/probot/stale.
- Configuration: [stale.yml](stale/stale.yml) (→ `.github/stale.yml`).

⚠️ It's potentially deprecated, see https://github.com/probot/stale/issues/248.

#### Alternative via GitHub Actions

- Action: https://github.com/marketplace/actions/close-stale-issues.
- Source: https://github.com/actions/stale.
- Workflow: [stale.yml](../workflows/stale.yml).
