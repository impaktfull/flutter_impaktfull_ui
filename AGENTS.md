# ImpaktfullUI

A comprehensive Flutter UI component library with themeable components and pre-built building blocks.

## Quick Start

This codebase contains two main types of UI elements:

- **Components** (`ImpaktfullUi*`) - Reusable, themeable UI widgets (buttons, inputs, cards, etc.)
- **Building Blocks** (`ImpaktfullUiBB*`) - Pre-built screens/layouts composed of components (login, register, etc.)

## Skills

Learn how to work with this codebase:

- [Create a Component](.claude/skills/create_component/SKILL.md) - How to add new reusable components
- [Create a Building Block](.claude/skills/create_building_block/SKILL.md) - How to add new pre-built screens
- [Theme System](.claude/skills/theme_system/SKILL.md) - How the theming architecture works
- [Architecture Overview](.claude/skills/architecture/SKILL.md) - Project structure, patterns, and conventions

## Releases & Changelog

Releases are automated with [release-please](https://github.com/googleapis/release-please). **Do not edit `CHANGELOG.md`, the `version` in `pubspec.yaml` or `.release-please-manifest.json` by hand.**

Pull requests are squash-merged, so the **pull request title** must be a [Conventional Commit](https://www.conventionalcommits.org). It becomes the changelog entry and decides the version bump:

| PR title | Release |
|----------|---------|
| `fix: ...` | patch (0.0.x) |
| `feat: ...` | minor (0.x.0) |
| `feat!: ...` | major (x.0.0) |
| `docs:`, `ci:`, `chore:`, `refactor:`, `test:` | no release on their own |

How a release happens:

1. Every push to `main` runs `.github/workflows/release.yml`. release-please keeps one open **release PR** (`chore(main): release x.y.z`) that bumps `pubspec.yaml`, `.release-please-manifest.json` and prepends the new section to `CHANGELOG.md`.
2. Merging that PR creates the GitHub release and pushes the tag `vX.Y.Z`.
3. The tag push runs `.github/workflows/publish_to_pubdev.yaml`, which publishes to pub.dev.

`release.yml` uses the `IMPAKTFULL_GITHUB_PAT` secret instead of `GITHUB_TOKEN`: a tag pushed with `GITHUB_TOKEN` does not trigger other workflows, and pub.dev only accepts publishes triggered by a tag push. The token needs Contents, Pull requests and Issues as "Read and write" on this repository.

To force a specific version (e.g. a pre-release), set `"release-as": "x.y.z"` in `release-please-config.json` and remove it again after that release is merged. `pubspec.yaml` must always hold a plain `x.y.z` version: release-please keeps anything after it as a build suffix (`1.0.0-dev.1` would become `1.0.0+-dev.1`).

## Validate

The Flutter version is pinned in `.fvmrc`. Use that version locally (`fvm use`), CI reads the same file.

```bash
./tool/format.sh
./tool/analyze.sh
flutter test
```

Every pull request and push to `main` runs `.github/workflows/validate.yml`, which must pass before merging:

| Job | Runner | Checks |
|-----|--------|--------|
| `validate` | ubuntu | `dart format` (no changes allowed), `flutter analyze .` (package + example), `flutter pub publish --dry-run` |
| `test` | macOS | `flutter test`, including the golden tests (they only run on a macOS host) |
| `example` | ubuntu | `flutter build web` of the example app that is deployed to GitHub Pages |

When a golden test fails because of an intended visual change, regenerate the goldens with `flutter test --update-goldens` on macOS using the pinned Flutter version, and review the image diff before committing.

## Create Pull Request

Pull requests are created on Github. `main` branch is the default branch.
All changes pushed to the default branch should be done through a pull request.
