# Creating a New Component

This guide explains how to create a new component in the ImpaktfullUI library.

## Overview

Components are themeable, reusable UI widgets prefixed with `ImpaktfullUi` (e.g., `ImpaktfullUiButton`).

## Quick Reference

| What | Location |
|------|----------|
| Component files | `lib/src/components/<component_name>/` |
| Library showcase | `example/lib/src/component_library/items/<component_name>/` |
| Theme registration | `lib/src/theme/component_theme.dart` |
| Default theme | `lib/src/theme/theme_default.dart` |
| Exports | `lib/impaktfull_ui.dart` |
| Documentation | `README.md` (Component List section) |

## Step-by-Step Guide

### 1. Create the Component Directory

Create: `lib/src/components/<component_name>/`

### 2. Create the Style File (`<component_name>_style.dart`)

```dart
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUi<ComponentName>Theme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUi<ComponentName>AssetsTheme assets;
  final ImpaktfullUi<ComponentName>ColorTheme colors;
  final ImpaktfullUi<ComponentName>DimensTheme dimens;
  final ImpaktfullUi<ComponentName>TextStyleTheme textStyles;

  const ImpaktfullUi<ComponentName>Theme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUi<ComponentName>Theme copyWith({
    ImpaktfullUi<ComponentName>AssetsTheme? assets,
    ImpaktfullUi<ComponentName>ColorTheme? colors,
    ImpaktfullUi<ComponentName>DimensTheme? dimens,
    ImpaktfullUi<ComponentName>TextStyleTheme? textStyles,
  }) =>
      ImpaktfullUi<ComponentName>Theme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUi<ComponentName>Theme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.<componentName>;

  static ImpaktfullUi<ComponentName>Theme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUi<ComponentName>Theme(
        assets: ImpaktfullUi<ComponentName>AssetsTheme(),
        colors: ImpaktfullUi<ComponentName>ColorTheme(),
        dimens: ImpaktfullUi<ComponentName>DimensTheme(),
        textStyles: ImpaktfullUi<ComponentName>TextStyleTheme(),
      );
}

class ImpaktfullUi<ComponentName>AssetsTheme {
  const ImpaktfullUi<ComponentName>AssetsTheme();

  ImpaktfullUi<ComponentName>AssetsTheme copyWith() =>
      const ImpaktfullUi<ComponentName>AssetsTheme();
}

class ImpaktfullUi<ComponentName>ColorTheme {
  const ImpaktfullUi<ComponentName>ColorTheme();

  ImpaktfullUi<ComponentName>ColorTheme copyWith() =>
      const ImpaktfullUi<ComponentName>ColorTheme();
}

class ImpaktfullUi<ComponentName>DimensTheme {
  const ImpaktfullUi<ComponentName>DimensTheme();

  ImpaktfullUi<ComponentName>DimensTheme copyWith() =>
      const ImpaktfullUi<ComponentName>DimensTheme();
}

class ImpaktfullUi<ComponentName>TextStyleTheme {
  const ImpaktfullUi<ComponentName>TextStyleTheme();

  ImpaktfullUi<ComponentName>TextStyleTheme copyWith() =>
      const ImpaktfullUi<ComponentName>TextStyleTheme();
}
```

Name the sub-themes and their fields like every other component: `assets` (`*AssetsTheme`), `colors` (`*ColorTheme`), `dimens` (`*DimensTheme`), `durations` (`*DurationsTheme`), `shadows` (`*ShadowsTheme`) and `textStyles` (`*TextStyleTheme`).

Read the theme from the widget tree (`ImpaktfullUiTheme.of(context)` or the component theme passed to `ImpaktfullUiComponentThemeBuilder`), never with the deprecated global `theme` getter: a global does not follow theme overrides and does not rebuild when the theme changes. `lib/analysis_options.yaml` enables `deprecated_member_use_from_same_package`, so `flutter analyze` fails when the library uses one of its own deprecated APIs.

**Every theme class needs a `copyWith`** (the component theme and every sub-theme: assets, colors, dimens, textStyles, durations, shadows, ...), so users can change a single token without rebuilding the whole theme:

- One nullable named parameter per field, in alphabetical order, forwarded as `field: field ?? this.field`. For example, once the color theme has a `background` field:

  ```dart
  ImpaktfullUi<ComponentName>ColorTheme copyWith({
    Color? background,
  }) =>
      ImpaktfullUi<ComponentName>ColorTheme(
        background: background ?? this.background,
      );
  ```

- When you add a field to a theme class later, add it to its `copyWith` too.
- `test/src/theme/theme_copy_with_source_test.dart` fails when a `class ImpaktfullUi*Theme` has no `copyWith` or its `copyWith` misses a field.

### 3. Create the Main Component File (`<component_name>.dart`)

```dart
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/<component_name>/<component_name>_style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';

export '<component_name>_style.dart';

class ImpaktfullUi<ComponentName> extends StatelessWidget {
  final ImpaktfullUi<ComponentName>Theme? theme;

  const ImpaktfullUi<ComponentName>({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder<ImpaktfullUi<ComponentName>Theme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        // Use componentTheme.colors, componentTheme.dimens, etc.
        return Container();
      },
    );
  }
}
```

#### Right-to-left support

Components must work in right-to-left layouts (Arabic, Hebrew, ...). Use the directional APIs, which follow the `Directionality` of the widget tree:

| Instead of | Use |
|------------|-----|
| `EdgeInsets.only(left:, right:)`, `EdgeInsets.fromLTRB` | `EdgeInsetsDirectional.only(start:, end:)`, `EdgeInsetsDirectional.fromSTEB` (symmetric paddings can stay `EdgeInsets.symmetric`/`all`) |
| `Alignment.centerLeft`, `Alignment.topRight`, `Alignment(x, y)` | `AlignmentDirectional.centerStart`, `AlignmentDirectional.topEnd`, `AlignmentDirectional(x, y)` |
| `Positioned(left:, right:)` | `PositionedDirectional(start:, end:)` |
| `BorderRadius.only(topLeft: ...)`, `Border(left: ...)` | `BorderRadiusDirectional.only(topStart: ...)`, `BorderDirectional(start: ...)` |
| `TextAlign.left` / `right` | `TextAlign.start` / `end` |
| `TextDirection.ltr` (e.g. in a `TextPainter`) | `Directionality.of(context)` |

- Accept `AlignmentGeometry`/`EdgeInsetsGeometry` in new public parameters, and default to a directional value.
- Mirror directional assets (back, previous/next, chevrons): `componentTheme.assets.arrowRight.copyWith(matchTextDirection: true)`.
- Mirror horizontal gestures and arrow keys when needed (e.g. a slider's minimum is on the right in a right-to-left layout).
- Add a right-to-left case to the tests: pump the component inside `Directionality(textDirection: TextDirection.rtl, child: ...)` (see `test/src/rtl/rtl_layout_test.dart`).

`test/src/rtl/rtl_source_guard_test.dart` fails on physical (left/right) layout code in `lib/src/components`. When the physical side is intended, add a `// rtl-ignore: <reason>` comment on the line above.

### 3b. User-facing texts go through localizations (REQUIRED)

Never hardcode a text that users of an app see: `Text('...')`, `tooltip:`, `title:`, `label:`, `placeholder:`, empty states, semantics labels, notifications. `test/src/localizations/hardcoded_strings_test.dart` fails on them. Put them in a localizations class with the English default instead:

```dart
// lib/src/components/<component_name>/<component_name>.localizations.dart
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUi<ComponentName>Localizations
    extends ImpaktfullUiComponentLocalizations {
  /// Shown when there are no items.
  final String noItems;

  /// A text with a value is a function, so every language can place it.
  final String Function(int amount) amountLabel;

  const ImpaktfullUi<ComponentName>Localizations({
    this.noItems = 'No items',
    this.amountLabel = _defaultAmountLabel,
  });

  static ImpaktfullUi<ComponentName>Localizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUi<ComponentName>Localizations>(
          context);

  ImpaktfullUi<ComponentName>Localizations copyWith({
    String? noItems,
    String Function(int amount)? amountLabel,
  }) =>
      ImpaktfullUi<ComponentName>Localizations(
        noItems: noItems ?? this.noItems,
        amountLabel: amountLabel ?? this.amountLabel,
      );
}

String _defaultAmountLabel(int amount) => '$amount items';
```

- Export it from the component file (`export '<component_name>.localizations.dart';`) and add an optional `final ImpaktfullUi<ComponentName>Localizations? localizations;` parameter to the component.
- Register it in `ImpaktfullUiLocalizations` (`lib/src/util/localizations/localizations.dart`): a field with a `const` default, the `copyWith` parameter and a branch in `of<T>`.
- Resolve it in `build`: `final localizations = widget.localizations ?? ImpaktfullUi<ComponentName>Localizations.of(context);` (or wrap the tree in `ImpaktfullUiLocalizationProvider`).
- Dates, times and numbers use the locale of the app through `ImpaktfullUiLocaleUtil` (`lib/src/util/locale/locale_util.dart`), never a hardcoded pattern like `'dd/MM/yyyy'`, `'HH:mm'` or `'${value}%'`. Use `ImpaktfullUiLocaleUtil.firstDayOfWeek` for weeks and `ImpaktfullUiLocaleUtil.use24HourFormat` for times.
- Add a test that a custom localization shows up to `test/src/localizations/component_localizations_test.dart`.

### 4. Register in Theme System

#### Update `lib/src/theme/component_theme.dart`

**Important: All additions must be in alphabetical order!**

1. Add import (alphabetically):
```dart
import 'package:impaktfull_ui/src/components/<component_name>/<component_name>.dart';
```

2. Add field to `ImpaktfullUiComponentsTheme` (alphabetically):
```dart
final ImpaktfullUi<ComponentName>Theme <componentName>;
```

3. Add to constructor (alphabetically):
```dart
required this.<componentName>,
```

4. Add to `copyWith()` (alphabetically in both parameter list and return statement):
```dart
ImpaktfullUi<ComponentName>Theme? <componentName>,
// In return:
<componentName>: <componentName> ?? this.<componentName>,
```

5. Add to `of<T>()` (alphabetically):
```dart
} else if (T == ImpaktfullUi<ComponentName>Theme) {
  return ImpaktfullUi<ComponentName>Theme.of(context) as T;
}
```

#### Update `lib/src/theme/theme_default.dart`

Add in `DefaultTheme.withMinimalChanges()` (alphabetically):

```dart
<componentName>: ImpaktfullUi<ComponentName>Theme.getDefault(
  assets: assets,
  colors: colors,
  textStyles: textStyles,
  dimens: dimens,
  durations: durations,
  shadows: shadows,
),
```

### 5. Export the Component

Add to `lib/impaktfull_ui.dart` (alphabetically within the Components section):

```dart
export 'src/components/<component_name>/<component_name>.dart';
```

Every type of the package that the component uses in a public signature (constructor parameters, fields, callbacks, controllers, enums, models, localizations, implementations of an abstract type it accepts) must be exported too, from the component file:

```dart
export 'model/<component_name>_type.dart';
```

`dart run tool/public_api/bin/check_public_api.dart` (CI runs it) fails when one is missing.

### 6. Add to Example App

#### Create `example/lib/src/component_library/items/<component_name>/`

#### Create `<component_name>_library_item.dart`

```dart
import 'package:impaktfull_ui_example/src/component_library/items/<component_name>/<component_name>_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class <ComponentName>LibraryItem extends ComponentLibraryItem {
  const <ComponentName>LibraryItem();

  @override
  String get title => 'ImpaktfullUi<ComponentName>';

  @override
  List<ComponentLibraryVariant> getComponentVariants() => [
    const <ComponentName>LibraryVariant(),
  ];
}

class <ComponentName>LibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
```

#### Create `<component_name>_library_variant.dart`

```dart
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/<component_name>/<component_name>_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class <ComponentName>LibraryVariant extends ComponentLibraryVariant<<ComponentName>LibraryPrimaryInputs> {
  const <ComponentName>LibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, <ComponentName>LibraryPrimaryInputs inputs) => [
    const ImpaktfullUi<ComponentName>(),
  ];

  @override
  <ComponentName>LibraryPrimaryInputs inputs() => <ComponentName>LibraryPrimaryInputs();
}

class <ComponentName>LibraryPrimaryInputs extends <ComponentName>LibraryInputs {}
```

#### Register in `example/lib/src/component_library/config/component_library.dart`

```dart
// Add import (alphabetically):
import 'package:impaktfull_ui_example/src/component_library/items/<component_name>/<component_name>_library_item.dart';

// Add to items list (alphabetically):
const <ComponentName>LibraryItem(),
```

### 7. Update README.md

Add the component to the **Component List** section in `README.md` (alphabetically, replace `<ComponentName>` with actual name):

```markdown
- ImpaktfullUi<ComponentName>

# Example: for a "Chip" component:
- ImpaktfullUiChip
```

If the component has sub-components, indent them:

```markdown
# Example: for a "Tabs" component with sub-components:
- ImpaktfullUiTabs
  - ImpaktfullUiTabsItem
```

## Checklist

- [ ] Create component directory
- [ ] Create style file
- [ ] Create main component file (directional APIs only, see Right-to-left support)
- [ ] Put user-facing texts in `<component_name>.localizations.dart` and register it in `ImpaktfullUiLocalizations`
- [ ] Register in `component_theme.dart` (5 places)
- [ ] Add default in `theme_default.dart`
- [ ] Export in `impaktfull_ui.dart`
- [ ] Create library item and variant
- [ ] Register in component library
- [ ] Add to README.md Component List
- [ ] Run `./tool/format.sh && ./tool/analyze.sh`
- [ ] Run `dart run tool/public_api/bin/check_public_api.dart`
