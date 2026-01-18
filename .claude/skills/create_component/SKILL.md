
## Adding a New Component

### 1. Create the Component Directory

Create a new directory: `lib/src/components/<component_name>/`

### 2. Required Files

#### Main Widget File (`<component_name>.dart`)

```dart
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export '<component_name>_style.dart';

part '<component_name>.describe.dart';

class ImpaktfullUi<ComponentName> extends StatefulWidget with ComponentDescriptorMixin {
  final ImpaktfullUi<ComponentName>Theme? theme;

  const ImpaktfullUi<ComponentName>({
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUi<ComponentName>> createState() => _ImpaktfullUi<ComponentName>State();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUi<ComponentName>State extends State<ImpaktfullUi<ComponentName>> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        // Use componentTheme.colors, componentTheme.dimens, etc.
        return Container();
      },
    );
  }
}
```

#### Style/Theme File (`<component_name>_style.dart`)

```dart
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUi<ComponentName>Theme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUi<ComponentName>AssetsTheme assets;
  final ImpaktfullUi<ComponentName>ColorTheme colors;
  final ImpaktfullUi<ComponentName>DimensTheme dimens;
  final ImpaktfullUi<ComponentName>TextStylesTheme textStyles;

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
      ImpaktfullUi<ComponentName>Theme(
        assets: ImpaktfullUi<ComponentName>AssetsTheme(),
        colors: ImpaktfullUi<ComponentName>ColorTheme(),
        dimens: ImpaktfullUi<ComponentName>DimensTheme(),
        textStyles: ImpaktfullUi<ComponentName>TextStylesTheme(),
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

class ImpaktfullUi<ComponentName>TextStylesTheme {
  const ImpaktfullUi<ComponentName>TextStylesTheme();
}
```

#### Describe File (`<component_name>.describe.dart`)

```dart
part of '<component_name>.dart';

String _describeInstance(BuildContext context, ImpaktfullUi<ComponentName> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
```

#### Optional Files

- `<component_name>_enum_name.dart` - Custom enum files (e.g., `ImpaktfullUi<ComponentName>EnumName`)

### 3. Register in Theme System

#### Update `lib/src/theme/component_theme.dart`

1. Add import for the component style
2. Add field to `ImpaktfullUiComponentsTheme`:
   ```dart
   final ImpaktfullUi<ComponentName>Theme <componentName>;
   ```
3. Add to constructor
4. Add to `copyWith()` method
5. Add to static `of<T>()` method:
```dart
  } else if (T == ImpaktfullUi<ComponentName>Theme) {
     return ImpaktfullUi<ComponentName>Theme.of(context) as T;
   }
```

#### Update `lib/src/theme/theme_default.dart`

Add the default theme in `DefaultTheme.withMinimalChanges()`:

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

### 4. Export the Component

Add to `lib/impaktfull_ui.dart`:

```dart
export 'src/components/<component_name>/<component_name>.dart';
```

### 5. Add to Example App (Component Library)

The example app serves as a component library for showcasing all components.

#### Create Library Item Directory

Create: `example/lib/src/component_library/items/<component_name>/`

#### Library Item File (`<component_name>_library_item.dart`)

```dart
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/<component_name>/<component_name>_library_variant.dart';

class <ComponentName>LibraryItem extends ComponentLibraryItem {
  const <ComponentName>LibraryItem();

  @override
  String get title => 'ImpaktfullUi<ComponentName>';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const <ComponentName>LibraryVariant(),
      // Add more variants if needed (e.g., for different types/sizes)
    ];
  }
}

class <ComponentName>LibraryInputs extends ComponentLibraryInputs {
  // Add configurable inputs for the component library UI
  final label = ComponentLibraryStringInput(
    'Label',
    initialValue: 'Example',
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        label,
      ];
}
```

#### Library Variant File (`<component_name>_library_variant.dart`)

```dart
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/items/<component_name>/<component_name>_library_item.dart';

class <ComponentName>LibraryVariant
    extends ComponentLibraryVariant<<ComponentName>LibraryVariantInputs> {
  const <ComponentName>LibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, <ComponentName>LibraryVariantInputs inputs) {
    return [
      ImpaktfullUi<ComponentName>(
        // Use inputs.label.value, etc.
      ),
    ];
  }

  @override
  <ComponentName>LibraryVariantInputs inputs() => <ComponentName>LibraryVariantInputs();
}

class <ComponentName>LibraryVariantInputs extends <ComponentName>LibraryInputs {}
```

#### Register in Component Library

Update `example/lib/src/component_library/config/component_library.dart`:

1. Add import:
   ```dart
   import 'package:impaktfull_ui_example/src/component_library/items/<component_name>/<component_name>_library_item.dart';
   ```

2. Add to the `items` list (alphabetically):
   ```dart
   const <ComponentName>LibraryItem(),
   ```

## Accessing Theme in Components

```dart
// Get full theme
final theme = ImpaktfullUiTheme.of(context);

// Get specific component theme
final buttonTheme = ImpaktfullUiButtonTheme.of(context);

// Or using generic accessor
final badgeTheme = ImpaktfullUiComponentsTheme.of<ImpaktfullUiBadgeTheme>(context);
```