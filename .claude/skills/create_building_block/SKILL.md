# Creating a New Building Block

This guide explains how to create a new building block in the ImpaktfullUI library.

## Overview

Building blocks are pre-built screens/layouts prefixed with `ImpaktfullUiBB` (e.g., `ImpaktfullUiBBLogin`). They compose multiple components into ready-to-use screens.

## Key Differences from Components

| Aspect | Components | Building Blocks |
|--------|------------|-----------------|
| Prefix | `ImpaktfullUi` | `ImpaktfullUiBB` |
| Theme | Has dedicated theme class | Uses existing component themes |
| Purpose | Single UI element | Complete screen/layout |
| Customization | Via theme override | Via callbacks and builders |

## Quick Reference

| What | Location |
|------|----------|
| Building block files | `lib/src/building_block/<name>/` |
| Library showcase | `example/lib/src/building_block_library/items/<name>/` |
| Exports | `lib/impaktfull_ui.dart` |
| Documentation | `README.md` (Building Blocks section) |

## Step-by-Step Guide

### 1. Create the Building Block Directory

Create: `lib/src/building_block/<name>/`

### 2. Create the Main File (`<name>.dart`)

```dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

export '<name>.localizations.dart';

class ImpaktfullUiBB<Name> extends StatelessWidget {
  final String email;
  final Function(String) onChangedEmail;
  final AsyncCallback onSubmitTapped;
  final WidgetBuilder? topBuilder;
  final WidgetBuilder? bottomBuilder;
  final Widget? Function(BuildContext)? startBuilder;
  final Widget? Function(BuildContext)? endBuilder;
  final Alignment alignment;
  final ImpaktfullUiBB<Name>Localizations? localizations;

  const ImpaktfullUiBB<Name>({
    required this.email,
    required this.onChangedEmail,
    required this.onSubmitTapped,
    this.topBuilder,
    this.bottomBuilder,
    this.startBuilder,
    this.endBuilder,
    this.alignment = Alignment.center,
    this.localizations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiLocalizationProvider(
      localizations: localizations,
      builder: (context, localizations) => ImpaktfullUiUnifiedScreenLayout(
        startBuilder: startBuilder,
        endBuilder: endBuilder,
        topBuilder: topBuilder,
        bottomBuilder: bottomBuilder,
        alignment: alignment,
        centerChild: ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          spacing: 48,
          children: [
            // Your content here
          ],
        ),
      ),
    );
  }
}
```

### 3. Create Localizations File (`<name>.localizations.dart`)

```dart
import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullUiBB<Name>Localizations extends ImpaktfullUiLocalizations {
  final String title;
  final String subtitle;

  const ImpaktfullUiBB<Name>Localizations({
    this.title = 'Default Title',
    this.subtitle = 'Default subtitle',
  });
}
```

### 4. Export the Building Block

Add to `lib/impaktfull_ui.dart` (alphabetically within the Building Blocks section):

```dart
export 'src/building_block/<name>/<name>.dart';
```

### 5. Add to Example App

#### Create `example/lib/src/building_block_library/items/<name>/<name>_building_block.dart`

```dart
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';

class <Name>BuildingBlock extends BuildingBlockLibraryItem {
  const <Name>BuildingBlock();

  @override
  String get title => 'ImpaktfullUiBB<Name>';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiBB<Name>(
      email: 'example@email.com',
      onChangedEmail: (value) {},
      onSubmitTapped: () => Future.delayed(const Duration(seconds: 2)),
    );
  }
}
```

#### Register in `example/lib/src/building_block_library/config/building_block_library.dart`

```dart
// Add import (alphabetically):
import 'package:impaktfull_ui_example/src/building_block_library/items/<name>/<name>_building_block.dart';

// Add to items list (alphabetically):
const <Name>BuildingBlock(),
```

### 6. Update README.md

Add the building block to the **Building Blocks** section in `README.md` (replace `<Name>` with actual name):

```markdown
- ImpaktfullUiBB<Name>

# Example: for a "ResetPassword" building block:
- ImpaktfullUiBBResetPassword
```

## Design Patterns

### Builder Parameters

```dart
final WidgetBuilder? topBuilder;      // Content above main
final WidgetBuilder? bottomBuilder;   // Content below main
final Widget? Function(BuildContext)? startBuilder;  // Left side
final Widget? Function(BuildContext)? endBuilder;    // Right side
```

### Responsive Side Panels

```dart
endBuilder: (context) {
  if (ImpaktfullUiResponsiveLayout.isMediumOrSmaller(context)) {
    return null;
  }
  return Expanded(child: Container(/* side panel */));
},
```

## Existing Building Blocks

- `ImpaktfullUiBBLogin` - Login screen
- `ImpaktfullUiBBRegister` - Registration screen
- `ImpaktfullUiBBForgetPassword` - Password recovery
- `ImpaktfullUiBBVerifyRegisterCode` - Code verification
- `ImpaktfullUiBBNotFound` - 404 screen
- `ImpaktfullUiBBLicenses` - License display

## Checklist

- [ ] Create building block directory
- [ ] Create main file
- [ ] Create localizations file
- [ ] Export in `impaktfull_ui.dart`
- [ ] Create library item
- [ ] Register in building block library
- [ ] Add to README.md Building Blocks section
- [ ] Run `./tool/format.sh && ./tool/analyze.sh`
