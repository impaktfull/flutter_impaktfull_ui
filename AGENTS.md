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

### More than one changelog entry per pull request

A pull request that changes several things documents each of them in the changelog: put one Conventional Commit line per change in the **commit message body**, separated by blank lines. release-please turns every line into its own entry. The repository squash-merges with the commit messages as the body, so the lines must be in the branch's commits (check them in the squash dialog before merging).

```
feat: deprecate misspelled public APIs

feat: add ImpaktfullUiCarousel

deprecate: ImpaktfullUiCarrousel, use ImpaktfullUiCarousel

fix: ImpaktfullUiCard no longer crashes without borderError
```

`deprecate:` lines are listed under **Deprecations** (configured in `changelog-sections` of `release-please-config.json`). They do not trigger a release on their own, so a pull request that deprecates something always also has a `feat:` title for the replacement.

## Changing public API

The package has many users: **never rename or remove a public API in one step.** Everything exported from `lib/impaktfull_ui.dart` is public API, including constructor parameters, fields, getters and enum values.

1. **Add** the new API next to the old one.
2. **Deprecate** the old one with `@Deprecated('Use <replacement> instead. Will be removed in 1.0.0.')`. Keep it working by forwarding to the new one:
   - Class, enum or typedef: rename it, then add a deprecated `typedef OldName = NewName;` to `lib/src/deprecated/deprecated_typedefs.dart`.
   - Named constructor: a deprecated redirecting constructor, `const Old.oldName(...) : this.newName(...)`.
   - Field or getter: a deprecated getter that returns the new field.
   - Constructor or `copyWith` parameter: accept both names (`newName ?? oldName`) and mark the old parameter `@Deprecated`. A `required` parameter becomes optional with an `assert` that one of the two is passed; note in the migration guide that it becomes `required` again at removal.
   - Enum value: a deprecated `static const oldName = newName;` inside the enum.
3. **Make it migrate automatically:** add a transform to `lib/fix_data.yaml` and a use of the old name to `test_fixes/deprecated_names.dart`, then regenerate `test_fixes/deprecated_names.dart.expect` by running `dart fix --apply` in `test_fixes/` on a copy. CI runs `dart fix --compare-to-golden` there. Two quirks:
   - Members of an enum need `inClass`, not `inEnum`.
   - A renamed constructor of a renamed class needs a second transform with the old class name in `inClass`, or `dart fix` produces `NewClass.NewClass(...)`.
4. **Test that the old API still works** in `test/src/deprecated/deprecated_api_test.dart`.
5. **Document it** in `doc/migrations/1.0.0.md` (old → new), including any internal change a user could notice (renamed files under `lib/src/`, changed defaults).
6. **Changelog:** a `feat:` line for the new API and a `deprecate:` line per deprecated API in the commit body (see above).

Deprecated APIs are removed together in the next major release (1.0.0), never in a minor or patch release. Removing them is a `feat!:` pull request that deletes the aliases, their `fix_data.yaml` transforms, `test_fixes` cases and tests, and keeps the migration guide.

## Validate

The Flutter version is pinned in `.fvmrc`. Use that version locally (`fvm use`), CI reads the same file.

```bash
./tool/format.sh
./tool/analyze.sh
flutter test
(cd tool/public_api && dart pub get) && dart run tool/public_api/bin/check_public_api.dart
```

`tool/public_api/bin/check_public_api.dart` uses the analyzer to check the public API. It fails when a type of this package is used in a public signature (constructor parameter, field, getter, method, supertype, typedef) but not exported from `lib/impaktfull_ui.dart`, when an implementation of an exported abstract type is not exported, or when the README component or building block list names something that is not exported, is not alphabetical or misses an exported widget. Export the type from the file of its component (`export 'model/<name>.dart';`) or make it private. Pass `--list-unexported` to print every public declaration under `lib/src` that is not exported.

Every pull request and push to `main` runs `.github/workflows/validate.yml`, which must pass before merging:

| Job | Runner | Checks |
|-----|--------|--------|
| `validate` | ubuntu | `dart format` (no changes allowed), `flutter analyze .` (package + example), public API exports (`tool/public_api`), `dart fix` migrations, `flutter pub publish --dry-run` |
| `test` | macOS | `flutter test`, including the golden tests (they only run on a macOS host) |
| `example` | ubuntu | `flutter build web` of the example app that is deployed to GitHub Pages |

When a golden test fails because of an intended visual change, regenerate the goldens with `flutter test --update-goldens` on macOS using the pinned Flutter version, and review the image diff before committing.

## Create Pull Request

Pull requests are created on Github. `main` branch is the default branch.
All changes pushed to the default branch should be done through a pull request.
