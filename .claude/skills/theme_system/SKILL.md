# Theme System

This guide explains the theming architecture of ImpaktfullUI.

## Overview

ImpaktfullUI uses a hierarchical theme system:
- Global theming via `ImpaktfullUiTheme`
- Component-level theming via `ImpaktfullUi*Theme` classes
- Per-instance overrides via the `theme` parameter

## Theme Hierarchy

```
ImpaktfullUiTheme (root)
├── assets (ImpaktfullUiAssetTheme)          ─┐
├── colors (ImpaktfullUiColorTheme)           │
├── textStyles (ImpaktfullUiTextStylesTheme)  │ the base tokens
├── dimens (ImpaktfullUiDimensTheme)          │  └── spacing (ImpaktfullUiSpacingTheme)
├── durations (ImpaktfullUiDurationTheme)     │
├── shadows (ImpaktfullUiShadowsTheme)       ─┘
└── components (ImpaktfullUiComponentsTheme)  ← built from the base tokens by
    ├── button, card, ... (80+ component themes)  ImpaktfullUiComponentsTheme.getDefault
```

## Key Files

| File | Purpose |
|------|---------|
| `lib/src/theme/theme.dart` | Main `ImpaktfullUiTheme` class, `copyWith` and `copyWithBaseTokens` |
| `lib/src/theme/component_theme.dart` | Component themes container, and `ImpaktfullUiComponentsTheme.getDefault` (the 87 component themes) |
| `lib/src/theme/theme_default.dart` | `ImpaktfullUiDefaultTheme.withMinimalChanges`: the base tokens |
| `lib/src/theme/color_theme.dart` | Color definitions |
| `lib/src/theme/textstyle_theme.dart` | Typography definitions |
| `lib/src/theme/dimens_theme.dart` | The border radius scale (grown from one `radius` seed) |
| `lib/src/theme/spacing_theme.dart` | The spacing scale (grown from one `unit`) |
| `lib/src/components/theme/theme_configurator.dart` | `ImpaktfullUiThemeConfigurator`, the `InheritedWidget` that scopes a theme to a subtree |

## Creating a Theme

### Basic Setup

```dart
final theme = ImpaktfullUiDefaultTheme.withMinimalChanges(
  primary: const Color(0xFF007AFF),
  accent: const Color(0xFF5856D6),
  secondary: const Color(0xFFFF9500),
);
```

### Full Customization

```dart
final theme = ImpaktfullUiDefaultTheme.withMinimalChanges<MyCustomTheme>(
  primary: const Color(0xFF007AFF),
  accent: const Color(0xFF5856D6),
  secondary: const Color(0xFFFF9500),
  brightness: Brightness.light,
  canvas: const Color(0xFFF9FAFB),
  card: const Color(0xFFFFFFFF),
  text: const Color(0xFF344054),
  fontFamilyDisplay: 'Ubuntu', // the default; your app bundles the font
  fontFamilyText: 'Geologica',
  radius: 8,
  label: 'My App Theme',
  customTheme: MyCustomTheme(),
);
```

### Base tokens

Everything `withMinimalChanges` builds is a base token, and it builds the 87
component themes from them with `ImpaktfullUiComponentsTheme.getDefault`. A base
token that no component theme reads is not a token: **thread a new base token
through `ImpaktfullUiComponentsTheme.getDefault` into the `*_style.dart` of the
components that need it.**

| Group | Individual parameters | Whole group |
|---|---|---|
| `colors` | `primary`, `accent`, `secondary`, `canvas`, `card`, `border`, `text`, `warning`, ... | `colors:` |
| `dimens` | `radius` (the seed of the radius scale), `borderRadius` and the other steps, `spacingUnit` | `dimens:` |
| `textStyles` | `fontFamilyDisplay` / `fontFamilyText`, `heightDisplay` / `heightText`, `letterSpacingDisplay` / `letterSpacingText`, `fontWeightDisplay` / `fontWeightText` | `textStyles:` |
| `durations` | — | `durations:` |
| `shadows` | — (derived from `colors.shadow`) | `shadows:` |
| `assets` | `package`, `assetSuffix` | `assets:` |

A group that is passed wins over the individual parameters of that group; a
group that is not passed is still derived from the ones that are (the text
styles take their colors from `colors`). With a `colors:` group, `primary`,
`accent` and `secondary` may be left out: an `assert` keeps them required
without one, and they become `required` again in 1.0.0.

`radius` grows the whole scale (`radius - 4` / `radius - 2` / `radius` /
`radius + 4` / `radius + 8`, clamped at 0), the way shadcn/ui's `--radius` and
Ant Design's `borderRadius` do. 97 of the ~110 radius reads in `lib/` go through
`dimens.borderRadius`, the middle step. `ImpaktfullUiSpacingTheme`
(`dimens.spacing`) is the same idea for gaps and paddings; the components do not
read it yet, their paddings are still in their own `*DimensTheme`.

`ImpaktfullUiDimensTheme.borderRadiusCircle` is
`BorderRadius.circular(ImpaktfullUiDimensTheme.borderRadiusCircleMax)` (999).
Do not raise it: Flutter clamps a radius to half the shortest side when it
paints, and an `InkWell` with an absurd radius makes a software rendered frame
take minutes.

### Light and dark

`withMinimalChanges` takes a `brightness`. The dark defaults are the light
defaults with the neutral tokens (`canvas`, `card`, `card2`, `border`,
`shadow`, `text`, `tertiary`, `textTertiary`) moved to the other end of the
same grey scale; the given `primary`, `accent` and `secondary` and the
semantic colors stay the same. Every token stays overridable, and the table
with both values is in the doc comment of `withMinimalChanges` and in the
README.

`ImpaktfullUiTheme.getDefault()` and `ImpaktfullUiTheme.getDefaultDark()` are
the impaktfull branding for both. `ImpaktfullUiApp` picks between them:

```dart
ImpaktfullUiApp(
  impaktfullUiTheme: ImpaktfullUiTheme.getDefault(),
  impaktfullUiDarkTheme: ImpaktfullUiTheme.getDefaultDark(),
  themeMode: ImpaktfullUiThemeMode.system, // the default
  ...
);
```

Without an `impaktfullUiDarkTheme` the app always uses `impaktfullUiTheme`,
like a `MaterialApp` without a `darkTheme`. `ImpaktfullUiTheme.of(context)`
keeps returning the theme of the tree, the app only picks which one it
provides. `theme.brightness` says which variant a widget renders on.

### No bundled fonts or images

The package ships no fonts and no images (only `assets/lottie/loading.json`).

- The default theme asks for the `Ubuntu` and `Geologica` families. A family
  name resolves against the fonts of the **app**, so an app bundles them in its
  own `pubspec.yaml` (the example app does, and `test/assets/fonts` holds them
  for the goldens). `fontFamilyDisplay` and `fontFamilyText` are `String?`:
  pass your own families, or `null` for the font of the platform.
- `assets.images.logo` and `splashLogo` are `ImpaktfullUiAsset.none()` when the
  theme takes its assets from impaktfull_ui (`package: 'impaktfull_ui'`, the
  default), because the package has no logo to ship;
  `ImpaktfullUiAssetWidget` renders nothing for it. With `package: null` they
  still point at `assets/images/logo.svg` of the app, as before.

## Accessing Theme

### Global Access

```dart
final theme = ImpaktfullUiTheme.of(context);
final accentColor = theme.colors.accent;
final bodyText = theme.textStyles.onCanvas.text.medium;
```

### Component Theme Access

```dart
final buttonTheme = ImpaktfullUiButtonTheme.of(context);
// Or generic:
final theme = ImpaktfullUiComponentsTheme.of<ImpaktfullUiButtonTheme>(context);
```

`ImpaktfullUiComponentsTheme.of<T>` looks `T` up in
`_componentThemesByType`, a map that is built once per
`ImpaktfullUiComponentsTheme`. A new component theme is a new field **and** a
new entry in that map; `test/src/theme/components_theme_of_test.dart` fails
when one of the two is missing.

### Inside Components

```dart
ImpaktfullUiOverridableComponentBuilder<ImpaktfullUiButtonTheme>(
  overrideComponentTheme: theme,
  builder: (context, componentTheme) {
    // componentTheme = instance override ?? globalTheme
    return Container(color: componentTheme.colors.primary);
  },
)
```

## Theme Override Pattern

```dart
// Default theme
ImpaktfullUiButton(type: ImpaktfullUiButtonType.primary, title: 'Click')

// With override: start from the current theme and change one token
final buttonTheme = ImpaktfullUiButtonTheme.of(context);
ImpaktfullUiButton(
  type: ImpaktfullUiButtonType.primary,
  title: 'Click',
  theme: buttonTheme.copyWith(
    colors: buttonTheme.colors.copyWith(primary: Colors.red),
  ),
)
```

## Changing a Single Token (`copyWith`)

Every theme class has a `copyWith`: `ImpaktfullUiTheme`, `ImpaktfullUiComponentsTheme`, every component theme (`ImpaktfullUiCardTheme`, ...) and every sub-theme (`assets`, `colors`, `dimens`, `textStyles`, `durations`, `shadows`, ...). Each parameter is nullable, so you only pass what changes and keep everything else:

```dart
final theme = ImpaktfullUiTheme.getDefault();
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

Because `copyWith` uses `value ?? this.value`, it cannot set a nullable field back to `null`. Build that sub-theme with its constructor instead.

### `copyWith` does not rebuild the components, `copyWithBaseTokens` does

`ImpaktfullUiTheme.copyWith` replaces exactly the values it is given, so
`copyWith(colors: ...)` changes `theme.colors` and leaves `components` alone:
`theme.components.button.colors.primary` still holds the old accent. **That is
deliberate, not a bug:** `copyWith` must never throw away a per-component token
an app layered on top of the theme.

`ImpaktfullUiTheme.copyWithBaseTokens` is the one that rebuilds. It replaces the
base token groups and builds every component theme again from them with
`ImpaktfullUiComponentsTheme.getDefault`:

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

It builds the component themes from scratch, so it drops a change that was
applied to a component theme of that theme. Apply those with `copyWith` after
it:

```dart
final theme = base
    .copyWithBaseTokens(colors: colors)
    .copyWith(components: ...); // the per-component tokens, on top
```

It does not derive `textStyles` from `colors` (a copied theme already has its
text styles, and their colors are not always the ones of `colors`): pass both,
or build the theme again with `withMinimalChanges`, which derives everything
from nothing.

`test/src/theme/theme_base_tokens_test.dart` guards all of this: every base
token group reaching the component themes and the widgets, the radius seed, the
spacing scale, the bounded `borderRadiusCircle` and the difference between the
two copies.

`ImpaktfullUiTheme.getDefault()` is the impaktfull branding built with `withMinimalChanges`.

### Scoping a theme to a subtree

`ImpaktfullUiThemeConfigurator` is the exported `InheritedWidget` that provides
the theme. `ImpaktfullUiApp` builds one around the app; wrap a subtree in
another one to give it its own theme (a preview pane, a side-by-side
comparison, a test):

```dart
ImpaktfullUiThemeConfigurator(
  theme: previewTheme,
  child: const MyPreview(),
);
```

### Rules for theme classes

- Every `class ImpaktfullUi*Theme` has a `copyWith` with one nullable named parameter per field, in alphabetical order, forwarded as `field: field ?? this.field`.
- `test/src/theme/theme_copy_with_source_test.dart` scans `lib/src` and fails when a theme class has no `copyWith`, or its `copyWith` misses a field.
- Every theme class also has an `operator ==` and a `hashCode` that cover every field, so a theme compares by value (see below).
- `test/src/theme/theme_equality_source_test.dart` scans `lib/src` and fails when a theme class has no `==` or `hashCode`, or its `==` misses a field.

## Value equality

Every theme class, `ImpaktfullUiAsset` and the other value classes of a theme (`ImpaktfullUiButtonConfig`, `ImpaktfullUiFluidPaddingBreakPoint`) compare by value:

```dart
ImpaktfullUiTheme.getDefault() == ImpaktfullUiTheme.getDefault(); // true
```

`ImpaktfullUiThemeConfigurator.updateShouldNotify` compares the themes with `!=`, so an app that builds its theme again with the same tokens (even inside `build()`) rebuilds nothing that reads the theme. Only a theme with a changed token notifies its dependents.

Two things are compared by reference, because there is nothing else to compare:

- the `customTheme` of an app: it is compared with its own `==`, so a custom theme class without one is only equal to itself. Give it a `==` to profit from this.
- the type argument of `ImpaktfullUiTheme<T>`: two themes with a different `T` are never equal.

The lookup map of `ImpaktfullUiComponentsTheme` is derived from its fields, so it is not part of the value (and not of the `hashCode`).

Write the members at the end of the class:

```dart
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCardDimensTheme &&
          borderRadius == other.borderRadius &&
          padding == other.padding;

  @override
  int get hashCode => Object.hash(borderRadius, padding);
```

A `List` field is compared with `listEquals(field, other.field)` and hashed with `Object.hashAll(field)`. `Object.hash` takes at most 20 arguments: a class with more fields uses `Object.hashAll([...])`.

## Text Style System

```
theme.textStyles
├── onCanvas / onCanvasAccent / onCanvasSecondary / onCanvasTertiary
├── onCard / onCardAccent / onCardSecondary / onCardTertiary / onCardDestructive
├── onPrimary / onAccent / onSecondary / onDestructive
    └── display / text
        └── extraSmall / small / medium / large / extraLarge
```

`ImpaktfullUiTextStylesTheme.getDefault({colors, ...})` builds all 13 groups
from a color theme. The font size of each step is fixed (display 72 / 60 / 48 /
30 / 24 / 20, text 20 / 18 / 16 / 14 / 12); everything else about the typography
is a parameter of `getDefault`, of `ImpaktfullUiTextStyleTheme.getByColor`
(`heightDisplay` / `heightText`, `letterSpacingDisplay` / `letterSpacingText`,
`fontWeightDisplay` / `fontWeightText`) and of
`ImpaktfullUiTextStyle{Display,Text}Theme.getByColor` (`height`,
`letterSpacing`, `fontWeight`). They apply to every step of that scale and
default to `null`, which is Flutter's default.

### Modifiers

Inside `lib/`, import the internal extension `package:impaktfull_ui/src/util/extension/text_style_extension.dart` (`InternalTextStyleExtension`):

```dart
theme.textStyles.onCanvas.text.medium.semiBold
theme.textStyles.onCanvas.text.medium.withOpacity(0.66)
```

The internal extensions in `lib/src/util/extension/` are not exported. The exported `TextStyleExtension`, `DateTimeExtensions`, `BorderRadiusGeometryExtension` and `EdgeInsetsGeometryExtension` (`lib/src/deprecated/deprecated_extensions.dart`) are deprecated and only kept for apps until 1.0.0. Never import both in one file: their members have the same names, so every use is ambiguous. Apps use `copyWith(fontWeight: ...)` instead.

## Color System

```dart
theme.colors
├── primary / accent / secondary / tertiary
├── canvas / card / card2 / border / shadow
├── text / textSecondary / textTertiary
├── textOnPrimary / textOnAccent / textOnSecondary / textOnDestructive
└── warning / error / info / success / destructive
```

## Applying Theme

```dart
void main() {
  runApp(
    ImpaktfullUiApp(
      title: 'My App',
      impaktfullUiTheme: ImpaktfullUiDefaultTheme.withMinimalChanges(
        primary: const Color(0xFF007AFF),
        accent: const Color(0xFF5856D6),
        secondary: const Color(0xFFFF9500),
      ),
      home: const MyHomeScreen(),
    ),
  );
}
```

Build the theme once (a `static final`, or `ImpaktfullUiApp` without a theme,
which shares one default). A theme that is built inside `build()` no longer
rebuilds the widgets that read it, because an equal theme notifies nobody (see
"Value equality"), but building the 84 component themes again on every build
is still work that nothing needs.

## Best Practices

1. **Use semantic colors** - Access via theme, not hardcoded
2. **Prefer getDefault** - Inherit global values in component themes
3. **Override sparingly** - Only change what's needed, with `copyWith`
4. **Type safety** - Use typed theme classes
