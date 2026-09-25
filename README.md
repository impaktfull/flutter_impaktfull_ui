# impaktfull_ui

A UI library of impaktfull.

[![pub package](https://img.shields.io/pub/v/impaktfull_ui.svg)](https://pub.dartlang.org/packages/impaktfull_ui)
[![test](https://github.com/impaktfull/flutter_impaktfull_ui/actions/workflows/test.yaml/badge.svg)](https://github.com/impaktfull/flutter_impaktfull_ui/actions/workflows/test.yaml/badge.svg)
[![publish to github pages](https://github.com/impaktfull/flutter_impaktfull_ui/actions/workflows/publish_to_githubpages.yaml/badge.svg)](https://github.com/impaktfull/flutter_impaktfull_ui/actions/workflows/publish_to_githubpages.yaml/badge.svg)
[![live_demo](https://img.shields.io/badge/Live%20Demo-Available-7D64F2)](https://example.impaktfull-ui.opensource.impaktfull.com)

## Disclaimer

**impaktfull_ui is still in unstable & untested. everything under <1.0.0 should not be used unless you want to test it**

## Purpose

This UI library was built to have a simple way to build UIs for impaktfull. This will limit the maintenance cost of open-source projects and make it easier to build applications. That way we can focus on building new tools & features instead of bugfixing and maintaining UI changes from Flutter.

- Open-source example projects
- impaktfull applications

# Demo

[Live Web Demo](https://example.impaktfull-ui.opensource.impaktfull.com)

## Platform support

| Android | iOS | macOS | Windows | Linux | Web (JS) | Web (Wasm) |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

Every component works on every platform. CI proves it on each pull request: the tests run on the Dart VM and in Chrome (`tool/test_web.sh`, compiled to JS and to Wasm), the example app is built for every platform (Android, iOS, macOS, Windows, Linux and the web, JS and Wasm), and [pana](https://pub.dev/packages/pana) must report every platform and Wasm as supported.

Local files work on every platform when you pass bytes or an `XFile` (from [`cross_file`](https://pub.dev/packages/cross_file), which `image_picker` and `file_selector` return):

```dart
ImpaktfullUiGalleryItem.bytes(bytes: pngBytes);
ImpaktfullUiGalleryItem.xFile(xFile: pickedFile);
await imageCropController.cropImageBytes(cropInfo: cropInfo, bytes: pngBytes);
await imageCropController.cropXFile(cropInfo: cropInfo, xFile: pickedFile);
```

The `dart:io` `File` APIs (`ImpaktfullUiGalleryItem.file`, `ImpaktfullUiImageCropController.cropImageFile`) are deprecated: they keep working on Android, iOS, macOS, Windows and Linux, but can not read a file on the web.

## Upgrading

Public APIs are never renamed or removed in one step. A renamed API keeps its old name as a deprecated alias, and `dart fix` migrates your code. 1.0.0 removes every alias at once.

### Coming from 0.79.x or older: upgrade to 0.80.0 first

**0.80.0 is the release that renamed a lot of public API.** It is also the only release where both the old and the new names exist, so it is the one that can migrate your code for you. Do not jump straight from 0.79.x to a later version: the old names are gone there, and `dart fix` has nothing left to match.

```yaml
# 1. pubspec.yaml: go to 0.80.0 first, exactly
dependencies:
  impaktfull_ui: 0.80.0
```

```bash
# 2. see what changes, then apply it
dart fix --dry-run
dart fix --apply

# 3. check what is left: every remaining warning names its replacement
flutter analyze
```

Anything `dart fix` cannot migrate on its own (the global `theme` getter and the unprefixed extensions, which need a `BuildContext` or a copy in your own code) is listed in the [1.0.0 migration guide](doc/migrations/1.0.0.md).

```yaml
# 4. only then move to the latest version
dependencies:
  impaktfull_ui: ^0.80.0
```

### Already on 0.80.0 or newer

Run `dart fix --apply` whenever the analyzer reports a deprecation, and you stay ready for 1.0.0.

Every deprecation and its replacement is listed in the [1.0.0 migration guide](doc/migrations/1.0.0.md), and under **Deprecations** in the [CHANGELOG](CHANGELOG.md).

## Usage

<!--[![pub package](https://img.shields.io/pub/v/impaktfull_ui.svg)](https://pub.dartlang.org/packages/impaktfull_ui)-->

### Setup

- Setup your theme (colors, textStyles, shadows, dimens, assets)
- Use ImpaktfullUiApp
- Use the components provided in the UI library

### Component List

Components are always prefixed with `ImpaktfullUi` to avoid conflicts with other libraries.

- ImpaktfullUiAccordion
- ImpaktfullUiAdaptiveNavBar
  - ImpaktfullUiAdaptiveNavBarActionItem
- ImpaktfullUiAdaptivePageRoute
- ImpaktfullUiAdaptiveSafeArea
- ImpaktfullUiAdaptiveScreen
- ImpaktfullUiApp
- ImpaktfullUiAssetWidget
  - ImpaktfullUiAsset.icon
  - ImpaktfullUiAsset.lottie
  - ImpaktfullUiAsset.network
  - ImpaktfullUiAsset.pixel
  - ImpaktfullUiAsset.rive
  - ImpaktfullUiAsset.svg
- ImpaktfullUiAutoComplete
- ImpaktfullUiAutoLayout
- ImpaktfullUiAvatar
- ImpaktfullUiBadge
  - ImpaktfullUiCustomBadgeWidget
- ImpaktfullUiBottomActions
- ImpaktfullUiBottomNavigation
  - ImpaktfullUiBottomNavigationItem
- ImpaktfullUiBottomSheet
- ImpaktfullUiButton
- ImpaktfullUiCalendar
  - ImpaktfullUiCalendarList
  - ImpaktfullUiCalendarWeek
- ImpaktfullUiCard
- ImpaktfullUiCarousel
- ImpaktfullUiChat
- ImpaktfullUiCheckbox
- ImpaktfullUiCheckboxListItem
- ImpaktfullUiClampedFractionallySizedBox
- ImpaktfullUiCmsHeader
- ImpaktfullUiColorInputField
- ImpaktfullUiColorPicker
- ImpaktfullUiCommandMenu
  - ImpaktfullUiCommandMenuWindow
- ImpaktfullUiConfetti
- ImpaktfullUiContainer
- ImpaktfullUiDateInputField
- ImpaktfullUiDatePicker
  - ImpaktfullUiDatePicker.range
- ImpaktfullUiDateTimePicker
- ImpaktfullUiDesktopPageRoute
- ImpaktfullUiDivider
- ImpaktfullUiDropdown
- ImpaktfullUiFilePicker
- ImpaktfullUiFloatingActionButton
- ImpaktfullUiFluidPadding
- ImpaktfullUiFocusFeedback
- ImpaktfullUiGallery
  - ImpaktfullUiGalleryFullScreen
  - ImpaktfullUiGalleryHeroItem
- ImpaktfullUiGridView
- ImpaktfullUiHorizontalTab
  - ImpaktfullUiHorizontalTabs
- ImpaktfullUiHoverFeedback
- ImpaktfullUiIconButton
- ImpaktfullUiImageCrop
- ImpaktfullUiInputField
  - ImpaktfullUiInputFieldAction
- ImpaktfullUiIntroduction
- ImpaktfullUiLineChart
- ImpaktfullUiListItem
  - ImpaktfullUiSimpleListItem
- ImpaktfullUiListView
- ImpaktfullUiLoadingErrorData
- ImpaktfullUiLoadingIndicator
- ImpaktfullUiMarkdown
- ImpaktfullUiMasterDetail
  - ImpaktfullUiMasterDetailItemScreen
- ImpaktfullUiMetric
- ImpaktfullUiModal
- ImpaktfullUiMorseCodeTouchFeedback
- ImpaktfullUiNavBar
- ImpaktfullUiNetworkImage
- ImpaktfullUiNotification
- ImpaktfullUiNotificationBadge
- ImpaktfullUiNumberInput
- ImpaktfullUiOptionSelector
- ImpaktfullUiPagination
- ImpaktfullUiPasswordStrengthIndicator
- ImpaktfullUiPinCode
- ImpaktfullUiPlaceholder
- ImpaktfullUiProgressIndicator
  - ImpaktfullUiCircleProgressIndicator
  - ImpaktfullUiHalfCircleProgressIndicator
  - ImpaktfullUiLineProgressIndicator
- ImpaktfullUiRadioButton
- ImpaktfullUiRadioButtonListItem
- ImpaktfullUiRefreshIndicator
- ImpaktfullUiResponsiveLayout
- ImpaktfullUiResponsiveRow
- ImpaktfullUiScreen
- ImpaktfullUiSectionTitle
- ImpaktfullUiSegmentedControl
- ImpaktfullUiSelectableListItem
- ImpaktfullUiSeparatedColumn
- ImpaktfullUiSidebarNavigation
  - ImpaktfullUiSidebarNavigationItem
- ImpaktfullUiSkeleton
- ImpaktfullUiSlider
- ImpaktfullUiSnackyConfigurator
- ImpaktfullUiStatusBar
- ImpaktfullUiStepper
- ImpaktfullUiSwitch
- ImpaktfullUiSwitchListItem
- ImpaktfullUiTabBar
  - ImpaktfullUiTabBarItem
- ImpaktfullUiTable
  - ImpaktfullUiTableHeader
    - ImpaktfullUiTableHeaderItem
  - ImpaktfullUiTableRow
    - ImpaktfullUiTableRowItem
- ImpaktfullUiTheme
  - ImpaktfullUiComponentThemeBuilder
  - ImpaktfullUiThemeBuilder
- ImpaktfullUiTimePicker
- ImpaktfullUiTooltip
- ImpaktfullUiTouchFeedback
- ImpaktfullUiTouchFeedbackSequence
- ImpaktfullUiUnifiedScreenLayout
- ImpaktfullUiVirtualKeyboard
- ImpaktfullUiWrap
- ImpaktfullUiWysiwyg

#### Future

Much more components to come in the future, always with the focus on minimizing maintenance and maximizing a recognizable UI/brand for impaktfull (Checkout the TODO list below)

#### Overriding Components

These 2 components are used to override the components in the UI library.

- `ImpaktfullUiOverridableComponentBuilder` (Used in the original component that needs to be overriden)
- `ImpaktfullUiOverridableComponentConfigurator` (Used to configure the override components)

You can place an `ImpaktfullUiOverridableComponentBuilder` anywhere in your widget tree to override the components.

Example:

```dart
ImpaktfullUiOverridableComponentConfigurator(
  overrideComponents: [
    ImpaktfullUiOverridableComponent<ImpaktfullUiRadioButton<bool?>, ImpaktfullUiRadioButtonTheme>(
      builder: (context, component, theme) => OverrideComponent(component: component),
    ),
  ],
  child: ImpaktfullUiRadioButton(
    value: true,
    groupValue: inputs.value.value,
    onChanged: inputs.value.updateState,
  ),
),
```

The default configuration will be providing your `overrideComponents` to the `ImpaktfullUiApp`. 
The `ImpaktfullUiApp` will configure the `ImpaktfullUiOverridableComponentConfigurator` with your `overrideComponents`.

### Building Blocks

- ImpaktfullUiBBForgetPassword
- ImpaktfullUiBBLicenses
- ImpaktfullUiBBLogin
- ImpaktfullUiBBNotFound
- ImpaktfullUiBBRegister
- ImpaktfullUiBBVerifyRegisterCode

#### Custom licenses

`ImpaktfullUiBBLicenses` shows the license of every package of your app, read from Flutter's `LicenseRegistry`. Pass `customLicenses` to add the licenses of the app itself, for example to credit the author of a photo. A custom license can show that photo with `image`:

```dart
ImpaktfullUiBBLicenses(
  customLicenses: const [
    ImpaktfullUiLicense(
      name: 'Photo by stein egil liland',
      licenses: [
        'Free to use under the [Pexels license](https://www.pexels.com/license/).',
      ],
      image: ImpaktfullUiAsset.network('https://example.com/northern-lights.jpg'),
      imageSemanticLabel: 'Time lapse photo of northern lights',
    ),
  ],
)
```

- The custom licenses are shown first, in the order you pass them, above the licenses of the packages (which are sorted by package name). So their position never changes when you add a package.
- They are searched like the packages, on their `name`.
- The license texts are markdown, the same as for a package.
- `image` takes any `ImpaktfullUiAsset`: `ImpaktfullUiAsset.pixel`, `ImpaktfullUiAsset.svg` or `ImpaktfullUiAsset.network`. It is shown above the texts when the license is expanded, at `theme.components.bbLicenses.dimens.imageHeight` (160 by default), with its own aspect ratio. A network image that can not be loaded falls back to the placeholder of `ImpaktfullUiNetworkImage`.
- `imageSemanticLabel` is the alt text that screen readers announce. It defaults to `name`.

`LicenseRegistry.addLicense` is the alternative for a license that belongs to code: Flutter's own `LicensePage` shows those too, and `ImpaktfullUiBBLicenses` reads them like the licenses of any other package. Use `customLicenses` for a license that only belongs to this screen, or that shows an image.

#### Future

Much more building blocks to come in the future.

### Examples

- Dashboard

#### Future

Much more examples to come in the future.

### Theming

The provided theme contains the default impaktfull branding. But it is super important for us that the theme is easy to configure and highly configurable. That is why we choose for component based theming.

Start from your brand with `ImpaktfullUiDefaultTheme.withMinimalChanges` and pass it to `ImpaktfullUiApp`:

```dart
final theme = ImpaktfullUiDefaultTheme.withMinimalChanges(
  primary: const Color(0xFF007AFF),
  accent: const Color(0xFF5856D6),
  secondary: const Color(0xFFFF9500),
  radius: 8,
);

ImpaktfullUiApp(
  title: 'My App',
  impaktfullUiTheme: theme,
  home: const MyHomeScreen(),
);
```

Everything `withMinimalChanges` builds is a **base token**: the colors, the text
styles, the border radius and spacing scale, the animation durations, the
shadows and the assets. It builds the 87 component themes from them with
`ImpaktfullUiComponentsTheme.getDefault`, so a base token you change reaches
every component.

#### Base tokens

| Token | Parameter | Default |
| --- | --- | --- |
| colors | `primary`, `accent`, `secondary`, `canvas`, `card`, `border`, `text`, `warning`, ... or a whole `colors:` group | the impaktfull palette per `brightness` |
| border radius | `radius` (the seed), or a single step: `borderRadius`, `borderRadiusSmall`, `borderRadiusLarge`, ..., `borderRadiusCircle` | `radius: 8` → 4 / 6 / 8 / 12 / 16 |
| spacing | `spacingUnit`, or a whole `dimens:` group | `4` → 4 / 8 / 12 / 16 / 24 / 32 |
| typography | `fontSizeText` (the seed of the text scale), `fontFamilyDisplay`, `fontFamilyText`, `heightDisplay`, `heightText`, `letterSpacingDisplay`, `letterSpacingText`, `fontWeightDisplay`, `fontWeightText` | `fontSizeText: 16` → 20 / 18 / 16 / 14 / 12, Ubuntu / Geologica, and Flutter's defaults for the rest |
| durations | `durations:` | 200 / 350 / 500 ms |
| shadows | `shadows:` | derived from `colors.shadow` |
| assets | `package`, `assetSuffix`, or a whole `assets:` group | the assets of this package |

`radius` is one value for the whole radius scale, the way shadcn/ui's `--radius`
and Ant Design's `borderRadius` are: the steps are `radius - 4`, `radius - 2`,
`radius`, `radius + 4` and `radius + 8`, and a step you pass wins over the seed.
Almost every radius of the package reads `dimens.borderRadius`, the radius of a
control.

`colors`, `textStyles`, `dimens`, `durations`, `shadows` and `assets` take a
fully built token group and replace what the individual parameters would build,
for a token that has no parameter of its own:

```dart
final theme = ImpaktfullUiDefaultTheme.withMinimalChanges(
  primary: const Color(0xFF1677FF),
  accent: const Color(0xFF1677FF),
  secondary: const Color(0xFF1677FF),
  radius: 6,           // Ant Design's radius scale
  heightText: 1.5714,  // and its line height
  durations: const ImpaktfullUiDurationTheme(
    short: Duration(milliseconds: 100),
    medium: Duration(milliseconds: 200),
    long: Duration(milliseconds: 300),
  ),
);
```

With a `colors:` group, `primary`, `accent` and `secondary` can be left out.

#### The focus ring

Every component that can take the focus draws the same ring, from `ImpaktfullUiTouchFeedbackTheme.focusRing`: its `color` (the accent at 66% without one), `width` and `offset` (the space between the component and the ring). `ImpaktfullUiFocusRingTheme.inset` draws it against the inside edge instead, for a component inside a scroller that would clip it.

An app that shows the focus in its own way turns the ring off everywhere at once:

```dart
final base = ImpaktfullUiTheme.getDefault();
final theme = base.copyWith(
  components: base.components.copyWith(
    touchFeedback: base.components.touchFeedback.copyWith(
      focusRing: base.components.touchFeedback.focusRing.copyWith(enabled: false),
    ),
  ),
);
```

Keyboard and switch users depend on seeing where they are, so turn it off only when something else shows that.

#### A theme that renders its own snack

`ImpaktfullUiSnackyConfigurator` renders a snack as an `ImpaktfullUiNotification` with the tokens of the theme. A theme that needs another layout altogether passes a `SnackyBuilder` of its own:

```dart
// A top level or a static function: a closure written inline is a new object
// on every build, which makes the theme unequal to itself.
SnackyBuilder buildSnacky(ImpaktfullUiSnackyConfiguratorTheme theme) =>
    MySnackyBuilder(theme: theme);

final theme = base.copyWith(
  components: base.components.copyWith(
    snackyConfigurator:
        base.components.snackyConfigurator.copyWith(snackyBuilder: buildSnacky),
  ),
);
```

A `snackyBuilder` on the `ImpaktfullUiSnackyConfigurator` itself still wins over the one of the theme.

#### Design system themes

Two themes in the style of a well known design system ship with the package, built with the same public API:

```dart
ImpaktfullUiApp(
  impaktfullUiTheme: ImpaktfullUiShadcnTheme.light(fontFamily: 'Geist'),
  // or ImpaktfullUiAntDesignTheme.light(), and `.dark()` for both
  home: const MyHomeScreen(),
);
```

They are not ports and not affiliated with those design systems: what a theme can and cannot reach is in [doc/design-system-themes.md](doc/design-system-themes.md), together with the token tables. Both are in the theme picker of the example app, and each has a golden test, so a component that starts hardcoding a size or a color breaks them.

#### Changing a single token

Every theme class (the theme, the components theme, every component theme and its `colors`, `dimens`, `textStyles`, ...) has a `copyWith`. Pass only what changes:

```dart
final customTheme = theme.copyWith(
  components: theme.components.copyWith(
    card: theme.components.card.copyWith(
      dimens: theme.components.card.dimens.copyWith(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
  ),
);
```

The same works for a single widget with its `theme` parameter:

```dart
final cardTheme = ImpaktfullUiCardTheme.of(context);
ImpaktfullUiCard(
  theme: cardTheme.copyWith(
    colors: cardTheme.colors.copyWith(background: Colors.yellow),
  ),
  child: ...,
);
```

#### Changing a base token everywhere: `copyWithBaseTokens`

`copyWith` replaces exactly what you pass it, so `theme.copyWith(colors: ...)` changes `theme.colors` and leaves the 87 component themes alone: they were built from the old colors and keep them. That is on purpose — `copyWith` never throws away a per-component token you layered on top.

To change a base token *everywhere*, use `copyWithBaseTokens`. It replaces the base token groups and builds every component theme again from them:

```dart
final base = ImpaktfullUiTheme.getDefault();
final theme = base.copyWithBaseTokens(
  colors: base.colors.copyWith(accent: const Color(0xFF00B894)),
  durations: const ImpaktfullUiDurationTheme(
    short: Duration(milliseconds: 100),
    medium: Duration(milliseconds: 200),
    long: Duration(milliseconds: 300),
  ),
);
// theme.components.button.colors.primary is the new accent
```

Because it builds the component themes from scratch, it discards a change you made to a component theme of that theme. Apply those after it:

```dart
final theme = base
    .copyWithBaseTokens(colors: colors)
    .copyWith(components: ...); // the per-component tokens, on top
```

`ImpaktfullUiComponentsTheme.getDefault({assets, colors, textStyles, dimens, durations, shadows})` is what both `withMinimalChanges` and `copyWithBaseTokens` build the component themes with, if you want to build them yourself.

#### A theme for part of the tree

`ImpaktfullUiApp(impaktfullUiTheme:)` sets the theme of the whole app. Wrap a subtree in `ImpaktfullUiThemeConfigurator` to give it its own theme, e.g. for a preview pane:

```dart
ImpaktfullUiThemeConfigurator(
  theme: previewTheme,
  child: const MyPreview(),
);
```

`ImpaktfullUiTheme.of(context)` returns the nearest one, and a subtree rebuilds only when its own theme changes.

#### Light and dark

Pass a second theme as `impaktfullUiDarkTheme` and `ImpaktfullUiApp` uses it when `MediaQuery.platformBrightness` is dark, like `MaterialApp` with a `darkTheme`:

```dart
ImpaktfullUiApp(
  title: 'My App',
  impaktfullUiTheme: ImpaktfullUiTheme.getDefault(),
  impaktfullUiDarkTheme: ImpaktfullUiTheme.getDefaultDark(),
  home: const MyHomeScreen(),
);
```

`themeMode` (`ImpaktfullUiThemeMode.system`, `.light` or `.dark`) overrules the platform and is passed to the `MaterialApp` as well. Without an `impaktfullUiDarkTheme` the app always uses `impaktfullUiTheme`, so nothing changes for an app that has only one theme.

Build the dark variant of your own brand with `brightness: Brightness.dark`:

```dart
final darkTheme = ImpaktfullUiDefaultTheme.withMinimalChanges(
  brightness: Brightness.dark,
  primary: const Color(0xFF007AFF),
  accent: const Color(0xFF5856D6),
  secondary: const Color(0xFFFF9500),
);
```

The dark defaults are the light defaults with the neutral tokens moved to the other end of the same grey scale; the colors with a meaning of their own (`primary`, `accent`, `secondary` and `warning`, `error`, `info`, `success`, `destructive`) stay the same:

| token | light | dark |
| --- | --- | --- |
| `canvas` | `0xFFF9FAFB` | `0xFF0C0E12` |
| `card` | `0xFFFFFFFF` | `0xFF16181D` |
| `card2`, `border` | grey 20% | white 20% |
| `shadow` | black 12% | black 45% |
| `text` | `0xFF344054` | `0xFFECEFF3` |
| `tertiary` | `0xFF475467` | `0xFFB4BCC8` |
| `textTertiary` | `0xFF999b9e` | `0xFF9DA4AE` |

Every one of them stays overridable: pass the token to `withMinimalChanges` to keep full control. `ImpaktfullUiTheme.of(context).brightness` tells a widget which variant it renders on, e.g. to pick an asset.

#### Fonts and images

The package ships no fonts and no images (only `assets/lottie/loading.json`). What the theme asks for, your app provides:

- `fontFamilyDisplay` defaults to `'Ubuntu'` and `fontFamilyText` to `'Geologica'`, the impaktfull branding. A font family is resolved against the fonts of your app, so **bundle those fonts in your own `pubspec.yaml`** (the example app does) to get that typography. Pass your own families, or `null` for the font of the platform:

```dart
ImpaktfullUiTheme.getDefault(
  fontFamilyDisplay: 'Inter', // your own font, declared in your pubspec.yaml
  fontFamilyText: 'Inter',
);
ImpaktfullUiTheme.getDefault(
  fontFamilyDisplay: null, // the font of the platform
  fontFamilyText: null,
);
```

- `assets.images.logo` and `assets.images.splashLogo` render nothing by default: the package has no logo to ship. Build the theme with `package: null` to read `assets/images/logo.svg` and `assets/images/splash_logo.svg` of your own app, or set `assets.images` yourself:

```dart
final theme = ImpaktfullUiTheme.getDefault(package: null);
// or
final theme = base.copyWith(
  assets: base.assets.copyWith(
    images: ImpaktfullUiImageTheme(
      logo: const ImpaktfullUiAsset.svg('logo.svg', directory: 'assets/images/'),
      splashLogo: const ImpaktfullUiAsset.svg('splash.svg', directory: 'assets/images/'),
    ),
  ),
);
```

### Right-to-left

Every component supports right-to-left layouts (e.g. Arabic or Hebrew). They follow the `Directionality` of the widget tree, which `ImpaktfullUiApp` sets from its `locale`:

- Paddings, alignments and positions use start and end instead of left and right, so they mirror in a right-to-left layout.
- Directional icons (back, previous/next arrows and chevrons) point in the reading direction. Mark your own directional assets with `ImpaktfullUiAsset.icon(icon, matchTextDirection: true)` (or `asset.copyWith(matchTextDirection: true)`) to mirror them in a right-to-left layout.
- Location enums with left and right in their name (`ImpaktfullUiNotificationBadgeLocation`, `ImpaktfullUiDropdownAlignment`) follow the reading direction: in a right-to-left layout `topRight` is the top left corner.

### Accessibility

The components work with screen readers (TalkBack, VoiceOver, NVDA, ...), keyboards and the "reduce motion" setting of the platform.

#### Screen readers

- Checkboxes, radio buttons and switches announce their state (`checked`, `mixed`, `toggled`, in a mutually exclusive group), whether they are enabled, and can be activated. In `ImpaktfullUiCheckboxListItem`, `ImpaktfullUiRadioButtonListItem`, `ImpaktfullUiSwitchListItem` and `ImpaktfullUiSelectableListItem` the whole row is one element with the title as label.
- Buttons, navigation items (bottom navigation, tab bar, horizontal tabs, sidebar), segmented control segments and tappable badges and avatars are buttons with a `selected` state where it applies. Tabs have the tab role. Accordions, sidebar groups and the dropdown button announce whether they are expanded.
- A stepper announces every step (`Step 2 of 4`) and which step is completed or current, pagination announces the page when it changes, a carousel the current slide, a progress indicator its value as a percentage, a slider its value with increase and decrease actions, a notification badge the amount (`3 notifications`).
- Loading indicators announce `Loading`, skeletons and illustrations of placeholders are hidden. The error of `ImpaktfullUiLoadingErrorData` is announced when it appears.
- Modals, bottom sheets and the command menu hide the screen behind them. The command menu and the dropdown can be dismissed by screen readers.
- Icon-only buttons of the library have a tooltip, which screen readers announce.

Add a label where only you know what something means:

```dart
ImpaktfullUiCheckbox(value: accepted, onChanged: _onChanged, semanticLabel: 'Accept the terms');
ImpaktfullUiSlider(value: volume, min: 0, max: 10, onChanged: _onChanged, semanticLabel: 'Volume');
ImpaktfullUiAvatar(url: user.avatarUrl, semanticLabel: user.name); // decorative without a label
ImpaktfullUiNetworkImage(url: url, semanticLabel: 'A red bicycle'); // or excludeFromSemantics: true
ImpaktfullUiAssetWidget(asset: asset, semanticLabel: 'Warning'); // or excludeFromSemantics: true
ImpaktfullUiLineChart(data: data, semanticLabel: 'Revenue rose from 10k to 25k this year');
ImpaktfullUiProgressIndicator(value: 0.4, semanticLabel: 'Upload');
ImpaktfullUiIconButton(asset: asset, onTap: _onTap, tooltip: 'Add'); // always pass a tooltip
```

The texts that are only announced (`Loading`, `3 notifications`, `Step 2 of 4`, ...) come from `ImpaktfullUiAccessibilityLocalizations` (`ImpaktfullUiLocalizations(accessibility: ...)`), see [Localization](#localization).

#### Keyboard

Every interactive component can be focused with tab, shows a focus ring while navigating with a keyboard and is activated with enter or space. The slider changes with the arrow keys (left and right follow the reading direction) and goes to its minimum and maximum with home and end. The dropdown moves the focus into its items when it opens (arrow keys or tab to move, escape to close). The command menu keeps the focus in its window: tab and the arrow keys move between the input and the results, enter selects a result, escape closes it.

#### Reduce motion

When the user turns on "Remove animations" (Android), "Reduce motion" (iOS, macOS) or turns off "Show animations" (Windows), `MediaQuery.disableAnimations` is true and the components do not animate: skeletons do not shimmer, confetti is not shown, carousels do not autoplay, and accordions, the sidebar, dropdowns, modals, bottom sheets, switches, the segmented control and progress indicators change without a transition. Use the same helper in your own widgets:

```dart
AnimatedContainer(
  duration: ImpaktfullUiAnimationUtil.duration(context, const Duration(milliseconds: 200)),
  ...
);
if (!ImpaktfullUiAnimationUtil.reduceMotion(context)) _controller.repeat();
```

#### Tap targets

The Android guideline asks for tap targets of at least 48x48, iOS for 44x44. List items, bottom navigation items and large buttons meet both. The standalone checkbox (24x24), radio button (20x20) and switch keep their size by default, to not change the layout of existing apps. Opt in to a bigger tap area with the theme: the control looks the same, but takes (and reacts to taps in) at least this much space.

```dart
final theme = ImpaktfullUiTheme.getDefault();
final components = theme.components;
theme.copyWith(
  components: components.copyWith(
    checkbox: components.checkbox.copyWith(
      dimens: components.checkbox.dimens.copyWith(minTapTargetSize: const Size.square(48)),
    ),
    radioButton: components.radioButton.copyWith(
      dimens: components.radioButton.dimens.copyWith(minTapTargetSize: const Size.square(48)),
    ),
    switchTheme: components.switchTheme.copyWith(
      dimens: components.switchTheme.dimens.copyWith(minTapTargetSize: const Size.square(48)),
    ),
  ),
);
```

Inside the list items the control keeps its size: the row is the tap target. Medium buttons are 44 high (the iOS guideline), use `ImpaktfullUiButtonSize.large` for 48.

### Localization

Every text of the components and building blocks (buttons, tooltips, empty states, semantics labels) comes from a localizations class with English defaults, e.g. `ImpaktfullUiDatePickerLocalizations` or `ImpaktfullUiBBLoginLocalizations`. `ImpaktfullUiLocalizations` groups all of them.

#### Translate the whole app

Pass your translations to `ImpaktfullUiApp`. Only pass what you translate, the rest stays English:

```dart
ImpaktfullUiApp(
  title: 'My App',
  locale: const Locale('nl'),
  supportedLocales: const [Locale('en'), Locale('nl')],
  localizationsDelegates: GlobalMaterialLocalizations.delegates,
  localizations: ImpaktfullUiLocalizations(
    datePicker: const ImpaktfullUiDatePickerLocalizations(
      cancelBtn: 'Annuleren',
      applyBtn: 'Toepassen',
      selectYearTitle: 'Kies een jaar',
    ),
    pagination: ImpaktfullUiPaginationLocalizations(
      pageLabel: (page, amountOfPages) => 'Pagina $page van $amountOfPages',
    ),
    bbLogin: const ImpaktfullUiBBLoginLocalizations(
      title: 'Welkom terug!',
      loginBtn: 'Inloggen',
    ),
  ),
  home: const MyHomeScreen(),
);
```

Texts with a value (`Page 1 of 10`, `(2/3 days)`, `John is typing`) are functions, so every language can place the value (and handle plurals) where it needs to. To support more than one language, build `ImpaktfullUiLocalizations` for the current locale (e.g. from your own `AppLocalizations`) and pass it again when the locale changes. Use `copyWith` to change a single text:

```dart
const ImpaktfullUiLocalizations().copyWith(
  navBar: const ImpaktfullUiNavBarLocalizations().copyWith(backTooltip: 'Terug'),
);
```

#### Translate a single widget

Every component with texts has a `localizations` parameter that wins over the ones of the app:

```dart
ImpaktfullUiPagination(
  page: 0,
  itemsPerPage: 20,
  amountOfItems: 200,
  onPageChanged: _onPageChanged,
  localizations: ImpaktfullUiPaginationLocalizations(
    pageLabel: (page, amountOfPages) => '$page / $amountOfPages',
  ),
);
```

`ImpaktfullUiDatePicker.showModal`, `ImpaktfullUiDateTimePicker.showModal` and `ImpaktfullUiOptionSelector.show` take a `localizations` parameter too.

#### Dates, times and numbers

Dates, times, weekday and month names and percentages are formatted with [intl](https://pub.dev/packages/intl) in the locale of the app (`Localizations.localeOf(context)`):

- The locale needs `intl` date data. Register `GlobalMaterialLocalizations.delegates` (from `flutter_localizations`), which loads it for every supported locale, or call `initializeDateFormatting()` from `package:intl/date_symbol_data_local.dart`. Without data for the locale the components fall back to the default `intl` locale.
- The first day of the week of `ImpaktfullUiDatePicker` and `ImpaktfullUiCalendar` comes from `MaterialLocalizations.firstDayOfWeekIndex` (Sunday for `en` and `en_US`, Monday for `nl`, `fr` and `en_GB`). Apps without localized material localizations keep Monday. Pass `firstDayOfWeek: DateTime.monday` to choose it yourself.
- Short dates use `DateFormat.yMd` (`7/6/2023` for `en_US`, `6-7-2023` for `nl`). The plain `en` locale, the default of `ImpaktfullUiApp`, keeps `dd/MM/yyyy`. `ImpaktfullUiDateInputField(dateFormat: 'd MMMM y')` still takes a pattern.
- Times use 24 hours when `MediaQuery.alwaysUse24HourFormat` is set or the locale uses 24 hours (the plain `en` locale keeps 24 hours). `ImpaktfullUiTimePicker`, `ImpaktfullUiDateTimePicker` and `ImpaktfullUiCalendar` take `use24HourFormat` to choose it yourself; with 12 hours the time picker shows an AM/PM toggle.

#### Limiting the dates a user can pick

Every date picker takes `firstDate` and `lastDate`, named like `CalendarDatePicker` and `showDatePicker` of Flutter. Both are optional and `null` (the default) means no limit:

```dart
ImpaktfullUiDateInputField(
  label: 'Date of birth',
  value: _dateOfBirth,
  firstDate: DateTime(1900),
  lastDate: DateTime.now(),
  onChanged: _onDateOfBirthChanged,
);
```

They work the same way on `ImpaktfullUiDatePicker`, `ImpaktfullUiDatePicker.range`, `ImpaktfullUiDateTimePicker`, `ImpaktfullUiDateInputField` and the `showModal` / `showRangeModal` helpers of the pickers:

- Days outside the range are dimmed (`textStyles.cellDisabled` of the date picker theme), are not tappable, are not focusable with a keyboard and are announced as a disabled button (`ImpaktfullUiAccessibilityLocalizations.unavailableDate`).
- The month, year and decade navigation stops at the range: the arrows are disabled at the edge, the page view can not be swiped past it, the months outside the range are disabled and the years list only shows the years inside the range.
- The range picker can never report a start or an end outside the range.
- Only the calendar day counts, the time of day is ignored: a `lastDate` of `DateTime(2026, 9, 23, 10, 0)` still allows picking 23 September 2026, and `ImpaktfullUiDateTimePicker` keeps every time of day on that last day.
- A `selectedDate` / `value` outside the range does not throw: the picker opens on the closest month inside the range and does not show that date as the selection. It stays the value of the field until the user picks a date inside the range.
- `firstDate` must be on or before `lastDate`, asserted in debug mode.

### Assets

#### Images

These images are not included in the package: add your own files to the assets folder of your project (and pass your own `package` when needed). The [example app](example/assets/images) contains sample files.

- assets/images/logo.svg
- assets/images/splash_logo.svg

#### Lottie Animations

These lottie animations can be overriden by adding your own files to your assets folder. The only thing you need to do extra is override `package` (in your own project)

- assets/lottie/loading.json

#### Icons

These icons can be overriden in the theme itself. By adding your own IconData.

- add
- arrowLeft
- arrowRight
- arrowUp
- arrowDown
- check
- checkCircle
- chevronDown
- chevronLeft
- chevronRight
- chevronUp
- circle
- close
- confetti
- copy
- delete
- dot
- edit
- error
- home
- info
- lineVertical
- list
- logout
- minus
- moreHorizontal
- moreVertical
- passwordHide
- passwordShow
- refresh
- search
- settings
- success
- user
- warning
- wysiwygBold
- wysiwygCode
- wysiwygCodeBlock
- wysiwygHeader
- wysiwygItalic
- wysiwygLink
- wysiwygOrderedList
- wysiwygPhoto
- wysiwygUnorderedList
- wysiwygUnorderedListItem

# Todo

⌛️ Add tests

- Add screenshot tests for all components

⌛️ Add extra components

- ImpaktfullUiBreadcrumbs
- ImpaktfullUiQrCode
- ImpaktfullUiBarCode
- ImpaktfullUiBarChart
- ImpaktfullUiPieChart
- ImpaktfullUiStoryView
- ImpaktfullUiStoryViewItem
- ImpaktfullUiVideoPlayerControls
- ImpaktfullUiFileCropper
- ImpaktfullUiSocialLoginsButton
- ImpaktfullUiImageComparisonView
- ImpaktfullUiWebView
- ImpaktfullUiQrCodeScanner
- ImpaktfullUiBarcodeScanner
- ImpaktfullUiHtml
- ImpaktfullUiWysiwyg (HTML)
- ImpaktfullUiRating

⌛️ Add CustomRoutes

- ImpaktfullUiIosModalRoute

⌛️ Add addaptive components

- ImpaktfullUiAdaptiveNavigation
- ImpaktfullUiAdaptiveRoute
- ImpaktfullUiAdaptiveModalRoute

⌛️ Add building blocks

- ImpaktfullUiBBMoreScreen
- ImpaktfullUiBBDebugScreen
- ImpaktfullUiBBPrivacyPolicyScreen
- ImpaktfullUiBBTermsAndConditionsScreen

⌛️ Add examples

- Signup
- Forget Password
- Reset password
- 404
- Verify code

# License

You are free to use this library as long as you give credit to impaktfull. You can use it for commercial and non-commercial projects. See the [LICENSE](LICENSE) file for more information.

## Images

All images are from [Pexels](https://www.pexels.com/)

### Avatars

- Photo by Seats Photographix: https://www.pexels.com/photo/playful-28280965/
- Photo by GlassesShop GS: https://www.pexels.com/photo/blonde-beauty-s-eye-catching-glasses-27603433/
- Photo by mücahit koçhan: https://www.pexels.com/photo/a-man-in-sunglasses-and-a-hat-sitting-in-the-back-of-a-red-truck-27670175/
- Photo by Samad Ismayilov: https://www.pexels.com/photo/man-cross-legs-seating-on-white-wooden-chair-1270076/

### Gallery

- Photo by stein egil liland: https://www.pexels.com/photo/time-lapse-photo-of-northern-lights-1933316/
- Photo by Line Knipst: https://www.pexels.com/photo/enchanting-fly-agaric-mushrooms-in-autumn-forest-28987435/
- Photo by Asad Photo Maldives: https://www.pexels.com/photo/brown-dock-near-coconut-trees-1591372/
- Photo by Krivec Ales: https://www.pexels.com/photo/bird-s-eye-view-photography-of-mountains-552785/
- Photo by Alex Qian: https://www.pexels.com/photo/bird-s-eye-view-photography-of-high-rise-buildings-2304917/
