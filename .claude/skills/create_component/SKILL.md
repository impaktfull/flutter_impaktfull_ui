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
}

class ImpaktfullUi<ComponentName>ColorTheme {
  const ImpaktfullUi<ComponentName>ColorTheme();
}

class ImpaktfullUi<ComponentName>DimensTheme {
  const ImpaktfullUi<ComponentName>DimensTheme();
}

class ImpaktfullUi<ComponentName>TextStyleTheme {
  const ImpaktfullUi<ComponentName>TextStyleTheme();
}
```

### 3. Create the Describe File (`<component_name>.describe.dart`)

```dart
part of '<component_name>.dart';

String _describeInstance(BuildContext context, ImpaktfullUi<ComponentName> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
```

### 4. Create the Main Component File (`<component_name>.dart`)

```dart
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/<component_name>/<component_name>_style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export '<component_name>_style.dart';

part '<component_name>.describe.dart';

class ImpaktfullUi<ComponentName> extends StatelessWidget with ComponentDescriptorMixin {
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

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
```

### 5. Register in Theme System

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

### 6. Export the Component

Add to `lib/impaktfull_ui.dart` (alphabetically within the Components section):

```dart
export 'src/components/<component_name>/<component_name>.dart';
```

### 7. Add to Example App

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

### 8. Update README.md

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
- [ ] Create describe file
- [ ] Create main component file
- [ ] Register in `component_theme.dart` (5 places)
- [ ] Add default in `theme_default.dart`
- [ ] Export in `impaktfull_ui.dart`
- [ ] Create library item and variant
- [ ] Register in component library
- [ ] Add to README.md Component List
- [ ] Run `./tool/format.sh && ./tool/analyze.sh`
