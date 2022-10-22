# Dependabot

The application allows automating dependencies updates.
It provides information to Dependabot about used package ecosystems.

Docs: https://docs.github.com/en/code-security/dependabot.
Guide: https://go-module.octolab.org/redirects/guide/dependabot/.

# Settings

The application allows implementing Configuration as a Code approach.
It configures a repository by this configuration file.

Installation: https://github.com/apps/settings.

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
