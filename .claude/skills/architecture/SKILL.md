# Architecture Overview

This guide explains the overall architecture and patterns of the ImpaktfullUI library.

## Project Structure

```
lib/
├── impaktfull_ui.dart              # Main public exports
└── src/
    ├── building_block/             # Pre-built screens (ImpaktfullUiBB*)
    ├── components/                 # UI components (ImpaktfullUi*)
    ├── models/                     # Shared data models
    ├── navigator/                  # Navigation utilities
    ├── theme/                      # Theme system core
    ├── util/                       # Utilities and extensions
    └── widget/                     # Base widget infrastructure

example/
└── lib/src/
    ├── component_library/          # Component showcase app
    └── building_block_library/     # Building block showcase

tool/
├── format.sh
└── analyze.sh
```

## Naming Conventions

| Type | Prefix | Example |
|------|--------|---------|
| Component | `ImpaktfullUi` | `ImpaktfullUiButton` |
| Building Block | `ImpaktfullUiBB` | `ImpaktfullUiBBLogin` |
| Component Theme | `ImpaktfullUi*Theme` | `ImpaktfullUiButtonTheme` |
| Assets Theme | `ImpaktfullUi*AssetsTheme` | `ImpaktfullUiButtonAssetsTheme` |
| Color Theme | `ImpaktfullUi*ColorTheme` | `ImpaktfullUiButtonColorTheme` |
| Dimens Theme | `ImpaktfullUi*DimensTheme` | `ImpaktfullUiButtonDimensTheme` |
| TextStyle Theme | `ImpaktfullUi*TextStyleTheme` | `ImpaktfullUiButtonTextStyleTheme` |
| Localizations | `ImpaktfullUiBB*Localizations` | `ImpaktfullUiBBLoginLocalizations` |

## File Naming

All files use `snake_case`:
- `button.dart` - Main component file
- `button_style.dart` - Theme/style definitions
- `button.describe.dart` - Component descriptor (part file)
- `button_type.dart` - Enums/constants

## Key Patterns

### 1. Overridable Component Builder

Every component uses `ImpaktfullUiOverridableComponentBuilder` for theme overrides:

```dart
ImpaktfullUiOverridableComponentBuilder<ImpaktfullUiButtonTheme>(
  overrideComponentTheme: theme,
  builder: (context, componentTheme) {
    // componentTheme = instance override ?? globalTheme
    return /* widget */;
  },
)
```

### 2. Component Descriptor Mixin

Components implement `ComponentDescriptorMixin` for debugging/inspection:

```dart
class ImpaktfullUiButton extends StatelessWidget with ComponentDescriptorMixin {
  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
```

### 3. Localization Provider

Building blocks use `ImpaktfullUiLocalizationProvider` for i18n:

```dart
ImpaktfullUiLocalizationProvider(
  localizations: localizations,
  builder: (context, localizations) => Text(localizations.title),
)
```

### 4. Asset System

```dart
// Defining assets
final icon = ImpaktfullUiAsset.icon(PhosphorIcons.check());
final svg = ImpaktfullUiAsset.svg('assets/icon.svg');

// Rendering
ImpaktfullUiAssetWidget(asset: icon, color: Colors.blue, size: 24)
```

### 5. Responsive Layout

```dart
if (ImpaktfullUiResponsiveLayout.isMediumOrSmaller(context)) {
  return MobileLayout();
}
return DesktopLayout();
```

## Development Workflow

1. **Create** - Follow the skill guides to create all required files
2. **Register in theme** - Add to `component_theme.dart` and `theme_default.dart`
3. **Export** - Add to `impaktfull_ui.dart`
4. **Add to library** - Create showcase in example app
5. **Validate** - Run `./tool/format.sh` and `./tool/analyze.sh`
6. **Update changelog** - Document changes in `CHANGELOG.md`
