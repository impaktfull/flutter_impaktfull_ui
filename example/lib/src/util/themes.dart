import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/custom_theme.dart';

class ExampleThemes {
  static final themes = [
    ImpaktfullUiTheme.getDefault(
      package: null,
    ),
    ImpaktfullUiTheme.custom(
      label: 'Impaktfull Dark Theme',
      primary: const Color(0xFF1A1A1A),
      accent: const Color(0xFF7d64f2),
      secondary: const Color(0xFF7d64f2),
      canvas: const Color(0xFF1A1A1A),
      card: const Color(0xFF131313),
      shadow: Colors.black87,
      text: const Color(0xFFFFFFFF),
      textOnAccent: const Color(0xFFFFFFFF),
      textOnSecondary: const Color(0xFFFFFFFF),
      package: null,
      assetSuffix: 'theme_dark',
    ),
    ImpaktfullUiTheme.custom(
      label: 'Light mode (zero border radius)',
      primary: const Color(0xFF1A1A1A),
      accent: const Color(0xFF7d64f2),
      secondary: const Color(0xFF7d64f2),
      borderRadiusExtraSmall: BorderRadius.zero,
      borderRadiusSmall: BorderRadius.zero,
      borderRadius: BorderRadius.zero,
      borderRadiusLarge: BorderRadius.zero,
      borderRadiusExtraLarge: BorderRadius.zero,
      package: null,
    ),
    ImpaktfullUiCustomTheme.theme,
  ];
}
