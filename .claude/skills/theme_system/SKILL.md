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
├── assets (ImpaktfullUiAssetTheme)
├── colors (ImpaktfullUiColorTheme)
├── textStyles (ImpaktfullUiTextStylesTheme)
├── dimens (ImpaktfullUiDimensTheme)
├── durations (ImpaktfullUiDurationTheme)
├── shadows (ImpaktfullUiShadowsTheme)
└── components (ImpaktfullUiComponentsTheme)
    ├── button, card, ... (80+ component themes)
```

## Key Files

| File | Purpose |
|------|---------|
| `lib/src/theme/theme.dart` | Main `ImpaktfullUiTheme` class |
| `lib/src/theme/component_theme.dart` | Component themes container |
| `lib/src/theme/theme_default.dart` | Default theme creation |
| `lib/src/theme/color_theme.dart` | Color definitions |
| `lib/src/theme/textstyle_theme.dart` | Typography definitions |

## Creating a Theme

### Basic Setup

```dart
final theme = DefaultTheme.withMinimalChanges(
  primary: const Color(0xFF007AFF),
  accent: const Color(0xFF5856D6),
  secondary: const Color(0xFFFF9500),
);
```

### Full Customization

```dart
final theme = DefaultTheme.withMinimalChanges<MyCustomTheme>(
  primary: const Color(0xFF007AFF),
  accent: const Color(0xFF5856D6),
  secondary: const Color(0xFFFF9500),
  canvas: const Color(0xFFF9FAFB),
  card: const Color(0xFFFFFFFF),
  text: const Color(0xFF344054),
  fontFamilyDisplay: 'Ubuntu',
  fontFamilyText: 'Geologica',
  borderRadius: BorderRadius.circular(8),
  label: 'My App Theme',
  customTheme: MyCustomTheme(),
);
```

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

// With override
ImpaktfullUiButton(
  type: ImpaktfullUiButtonType.primary,
  title: 'Click',
  theme: ImpaktfullUiButtonTheme(
    colors: ImpaktfullUiButtonColorTheme(primary: Colors.red),
  ),
)
```

## Text Style System

```
theme.textStyles
├── onCanvas / onCanvasAccent / onCanvasSecondary / onCanvasTertiary
├── onCard / onCardAccent / onCardSecondary / onCardTertiary / onCardDestructive
├── onPrimary / onAccent / onSecondary / onDestructive
    └── display / text
        └── extraSmall / small / medium / large / extraLarge
```

### Modifiers

```dart
theme.textStyles.onCanvas.text.medium.semiBold
theme.textStyles.onCanvas.text.medium.withOpacity(0.66)
```

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
      theme: DefaultTheme.withMinimalChanges(
        primary: const Color(0xFF007AFF),
        accent: const Color(0xFF5856D6),
        secondary: const Color(0xFFFF9500),
      ),
      builder: (context) => const MyApp(),
    ),
  );
}
```

## Best Practices

1. **Use semantic colors** - Access via theme, not hardcoded
2. **Prefer getDefault** - Inherit global values in component themes
3. **Override sparingly** - Only change what's needed
4. **Type safety** - Use typed theme classes
