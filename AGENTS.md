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

Deprecated APIs are removed together in the next major release (1.0.0), never in a minor or patch release.

**The release that deprecates is the upgrade step.** Users can only migrate automatically on a release where the old and the new name both exist. So the README and `doc/migrations/1.0.0.md` tell users to upgrade to that release first (today: 0.80.0), run `dart fix --apply` there, and only then move on. When a later release deprecates more API, say in the migration guide which release introduced it, so users know which version to step through. Removing them is a `feat!:` pull request that deletes the aliases, their `fix_data.yaml` transforms, `test_fixes` cases and tests, and keeps the migration guide.

## Naming public parameters

Constructor parameters, fields, getters and callbacks follow these rules, so an app developer can guess a name without looking it up. Component names stay as they are: the rules are about parameters. Renaming an existing parameter always goes through "Changing public API" above.

1. **Stay in line with Flutter** wherever Flutter has the same concept:
   - `onTap` (not `onPress` or `onClick`), `onDoubleTap`, `onLongPress` (not `onLongTap`).
   - `onSubmitted` (not `onSubmit`), `onFocusChange`, `onExpansionChanged`, `onPageChanged`.
   - The callback that reports a new value of the component is `onChanged` (and `onChangeStart` / `onChangeEnd` like `Slider`). A second value of the same component is `on<Thing>Changed` (`onStartDateChanged`, `onEmailChanged`), never `onChanged<Thing>`.
   - A selection uses `value` (and `groupValue` for radio buttons), not `selectedValue`.
   - `controller`, `focusNode`, `tooltip`, `semanticLabel`, `floatingActionButton`.
   - A component is disabled by passing `null` as its callback (`onTap: null`, `onChanged: null`), not with an extra `enabled` flag.
2. **A tap on one part of a component is `on<Thing>Tapped`**: `onCloseTapped`, `onMoreTapped`, `onEventTapped`, `onPrimaryActionTapped`, `onLinkTapped`. Never `onCloseTap` or `primaryActionOnTap`. A tap on the component itself stays `onTap`.
3. **The main text of a display component is `title`** (buttons, the floating action button, badges, tabs, navigation items, list items, cards, section titles, dropdown buttons: `buttonTitle`), with `subtitle` for a second line and `titleBuilder` for a builder. **Input fields keep `label`**, like Flutter's `InputDecoration.labelText`.
4. **The value parameter** is recognizable next to the Flutter widget for the same job and consistent with the other components of this package: `value` / `onChanged` for inputs (`ImpaktfullUiInputField`, `ImpaktfullUiDateInputField`, `ImpaktfullUiTimePicker`, `ImpaktfullUiWysiwyg`), `value` / `groupValue` for selections. Keep a domain name when Flutter uses one or there is no clearer equivalent (`ImpaktfullUiPinCode.code`, `ImpaktfullUiDatePicker.selectedDate` with `onDateChanged` like `CalendarDatePicker`, `ImpaktfullUiPagination.page`). Do not rename for uniformity alone.

## Theme classes

A theme is a value: an app that builds its theme again with the same tokens gets an equal theme, and `ImpaktfullUiThemeConfigurator.updateShouldNotify` then rebuilds nothing that reads it. Every `class ImpaktfullUi*Theme` under `lib/src` (and the value classes a theme holds: `ImpaktfullUiAsset`, `ImpaktfullUiButtonConfig`, `ImpaktfullUiFluidPaddingBreakPoint`) therefore has three things, and a new field is added to all of them:

- a `copyWith` with one nullable named parameter per field, in alphabetical order, forwarded as `field: field ?? this.field`;
- an `operator ==` that compares every field: `identical(this, other) || other is <TheTheme> && a == other.a && ...`, with `listEquals(a, other.a)` for a `List` field;
- a `hashCode` over the same fields: `Object.hash(...)` (2 to 20 arguments), `field.hashCode` for a single field, `Object.hashAll([...])` above 20 and `Object.hashAll(field)` for a list. A theme without tokens is `other is <TheTheme>` with `runtimeType.hashCode`.

`test/src/theme/theme_copy_with_source_test.dart` and `test/src/theme/theme_equality_source_test.dart` scan the sources and fail with the class and the field that is missing. Details and the caveats (the `customTheme` of an app and the type argument of `ImpaktfullUiTheme<T>` are compared by reference) are in the [Theme System](.claude/skills/theme_system/SKILL.md) skill.

## Accessibility

Every component must work with screen readers, keyboards and the "reduce motion" setting (see the README "Accessibility" section and the Accessibility step in the [Create a Component](.claude/skills/create_component/SKILL.md) skill):

- A new interactive component has semantics (role, state, label), is focusable and activatable with enter and space, and has a semantics test in `test/src/accessibility/` (or next to its other tests).
- Every animation duration goes through `ImpaktfullUiAnimationUtil.duration(context, duration)`; endless decorative animations do not run when `ImpaktfullUiAnimationUtil.reduceMotion(context)` is true.
- **A widget never constructs a theme to read a value from it.** `const ImpaktfullUiAccordionDurationsTheme().expand` is a hardcoded default wearing a token's clothes: it ignores `widget.theme` and the theme of the app. Read every value from `widget.theme ?? ImpaktfullUi<Component>Theme.of(context)` or the `componentTheme` of `ImpaktfullUiOverridableComponentBuilder`, and keep the default in the `*_style.dart` theme class. An `AnimationController` created in `initState` gets no `duration` there: create it as `AnimationController(vsync: this)` and set `duration` in `didChangeDependencies`, which runs before the first build. An object without a `BuildContext` (a `PageRoute`) takes the value as a parameter from the caller that has one. `test/src/theme/theme_construction_source_guard_test.dart` fails on a theme that is built under `lib/src/components` or `lib/src/building_block`.
- Semantics labels are user-facing texts: they go through localizations (`ImpaktfullUiAccessibilityLocalizations` or the localizations of the component).
- Do not change the layout size of an existing component to meet a tap target guideline: add an opt-in (`minTapTargetSize` in its dimens theme).

## Every platform

The package supports Android, iOS, macOS, Windows, Linux and the web, compiled to JS and to Wasm. Keep it that way:

- **No `dart:io` in `lib/`**, except in `lib/src/util/io_file/io_file_io.dart` and `lib/src/util/device_util/device_util_io.dart`, which are only reached through a conditional import: `import 'x_io.dart' if (dart.library.js_interop) 'x_web.dart'`. Keep the `dart:io` file as the default: the analyzer and `tool/public_api` resolve the default, the web (JS and Wasm) resolves `dart.library.js_interop`. pana reports a package that imports `dart:io` on the web as not supporting the web.
- **No `dart:html`, `dart:js`, `dart:js_util` or `package:js`**: they do not compile to Wasm. Use `package:web` and `dart:js_interop`, behind a conditional import on `dart.library.js_interop` (not `dart.library.html`, which is not available with Wasm).
- **No `Platform.isX`**: use `DeviceUtil` (`lib/src/util/device_util/device_util.dart`) or `defaultTargetPlatform`.
- **No `Image.file`, `File` or isolates in a public API**: take bytes (`Uint8List`) or an `XFile` (`package:cross_file`), and read them asynchronously. `compute` and isolates do not run on the web.
- A new dependency must support every platform, including Wasm (check its pub.dev page, or run pana).

### A golden per shipped theme

`runComponentTest` (`test/util/golden_test_util.dart`) renders every component golden **once per theme this package ships**, in light and in dark: `<fileName>.png` is the default theme, next to `<fileName>_dark.png`, `<fileName>_shadcn.png`, `<fileName>_shadcn_dark.png`, `<fileName>_ant_design.png` and `<fileName>_ant_design_dark.png`. A component that hardcodes a colour, a radius or a size shows up in the diff of the design system goldens.

The list of themes is `shippedThemes` in `test/util/shipped_themes.dart`, and `test/src/theme/shipped_themes_source_test.dart` fails when a theme under `lib/src/theme/presets` is missing from it, so a new theme cannot be forgotten. A theme with a dark variant belongs in the list twice.

Two cases render one golden instead of the whole set: a `theme:` passed to `runComponentTest` (a test of the tokens of one theme) and `perTheme: false` (a test whose widgets build an `ImpaktfullUiApp` with a theme of their own, like the theme showcase). Both keep the file name they always had.

### Tests on every platform

`flutter test` runs the tests on the Dart VM. `tool/test_web.sh` runs them in Chrome (`tool/test_web.sh --wasm` for Wasm). It leaves out two kinds of test files, and `test/src/test_platform_test.dart` fails when a test file that needs the VM is not left out:

- **Golden tests must be named `*_golden_test.dart`.** alchemist does not compile for the web, and the goldens only run on macOS. Shared helpers that use alchemist go in a `*_golden_helpers.dart` file that only golden tests import (e.g. `test/src/_core_golden_helpers.dart` next to `_core_test_helpers.dart`): the guard follows the imports of every test file.
- **A test file that uses `dart:io` must start with `@TestOn('vm')`** (followed by `library;`).

Do not skip a test on the web: a test that fails in Chrome found a bug (text metrics differ from the VM, so an overflow shows up there first) or depends on the VM. Helpers for the second case:

- `test/util/test_file/test_file.dart`: `readTestFile` reads a file of the repository synchronously: with `dart:io` on the VM, from the test server in Chrome.
- `test/util/test_image.dart`: `warmUpImageEncoding` in `setUpAll` of a test that encodes images (`toByteData`) inside `testWidgets`. With Wasm the first encoding binds its results to the zone of the caller, so without it every later widget test waits forever.
- `test/util/network_image_util.dart`: `brokenImageUrl` fails to load on both, and `waitForBrokenNetworkImage` waits until it failed. In Chrome, images, image decoding and other real I/O started by a widget only complete after a pump: wait with `tester.runAsync(() => Future.delayed(...))` followed by `tester.pump()` in a loop, not with a single `runAsync`.

## Validate

Use the latest stable Flutter release (`flutter channel stable && flutter upgrade`); CI does the same. There is no pinned version: when a new stable release changes the output of `dart format` or the golden images, update them in their own pull request.

```bash
./tool/format.sh
./tool/analyze.sh
flutter test
./tool/test_web.sh
(cd tool/public_api && dart pub get) && dart run tool/public_api/bin/check_public_api.dart
```

`tool/public_api/bin/check_public_api.dart` uses the analyzer to check the public API. It fails when a type of this package is used in a public signature (constructor parameter, field, getter, method, supertype, typedef) but not exported from `lib/impaktfull_ui.dart`, when an implementation of an exported abstract type is not exported, or when the README component or building block list names something that is not exported, is not alphabetical or misses an exported widget. Export the type from the file of its component (`export 'model/<name>.dart';`) or make it private. Pass `--list-unexported` to print every public declaration under `lib/src` that is not exported.

Every pull request and push to `main` runs `.github/workflows/validate.yml`, which must pass before merging:

| Job | Runner | Checks |
|-----|--------|--------|
| `validate` | ubuntu | `dart format` (no changes allowed), `flutter analyze .` (package + example), public API exports (`tool/public_api`), `dart fix` migrations, `flutter pub publish --dry-run` |
| `test` | macOS | `flutter test --coverage`, including the golden tests (they only run on a macOS host), and the minimum line coverage of `lib/` |
| `test_web (js)`, `test_web (wasm)` | ubuntu | `tool/test_web.sh` and `tool/test_web.sh --wasm`: the tests in Chrome, compiled to JS and to Wasm |
| `example` | ubuntu | `flutter build web` and `flutter build web --wasm` of the example app that is deployed to GitHub Pages |
| `example (android)`, `example (linux)` | ubuntu | `flutter build apk --debug` and `flutter build linux --debug` of the example app |
| `example (ios)`, `example (macos)` | macOS | `flutter build ios --debug --no-codesign` and `flutter build macos --debug` of the example app |
| `example (windows)` | windows | `flutter build windows --debug` of the example app |
| `pana` | ubuntu | [pana](https://pub.dev/packages/pana) must report Android, iOS, macOS, Windows, Linux, web and Wasm as supported, with full platform points |

The `example (<platform>)` jobs catch a plugin or native project setting (deployment target, CMake, Gradle) that breaks the build of one platform. Together with the web builds, the example app is built for every supported platform on each pull request. The native projects live in `example/android`, `example/ios`, `example/macos`, `example/linux` and `example/windows`; regenerate a missing one with `flutter create --platforms=<platform> .` in `example/` (Windows needs `flutter config --enable-windows-desktop` for that).

When a golden test fails because of an intended visual change, regenerate the goldens with `flutter test --update-goldens` on macOS using the pinned Flutter version, and review the image diff before committing.

### Coverage

CI fails when the line coverage of `lib/` drops below a minimum. Run it locally with:

```bash
flutter test --coverage
dart run tool/coverage/bin/coverage_summary.dart --min 89.6
```

`tool/coverage/bin/coverage_summary.dart` reads `coverage/lcov.info` (ignored by git), prints the coverage per directory of `lib/src` and exits with an error below `--min`. The minimum is set in the `Coverage` step of `.github/workflows/validate.yml`, about 1% below the measured coverage so small refactors do not fail CI. **The minimum only goes up:** when a pull request raises the coverage, raise the minimum to the new total minus 1% in the same pull request. Never lower it to make CI pass, add tests instead.

When a new test finds a bug in `lib/`, fix it in the same pull request (without breaking the public API) and add a `fix:` line for it to the commit body. Do not commit skipped tests.

## Create Pull Request

Pull requests are created on Github. `main` branch is the default branch.
All changes pushed to the default branch should be done through a pull request.
