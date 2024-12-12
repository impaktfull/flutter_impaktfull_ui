import 'dart:io';

import 'package:impaktfull_ui_figma_sync/impaktfull_ui_figma_sync.dart';

class ImpaktfullUiThemeWritor {
  static Future<void> writeTheme({
    required ImpaktfullUiFigmaTheme theme,
    String label = 'Figma sync theme',
  }) async {
    final themeString = """import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullUiCustomTheme {
    static final theme = ImpaktfullUiTheme.custom(
      label: '$label',
      primary: const Color(0x${theme.colors.get('primary').color.toHexWithoutHash()}),
      accent: const Color(0x${theme.colors.get('accent').color.toHexWithoutHash()}),
      secondary: const Color(0x${theme.colors.get('secondary').color.toHexWithoutHash()}),
      tertiary: const Color(0x${theme.colors.get('tertiary').color.toHexWithoutHash()}),
      canvas: const Color(0x${theme.colors.get('canvas').color.toHexWithoutHash()}),
      card: const Color(0x${theme.colors.get('card').color.toHexWithoutHash()}),
      border: const Color(0x${theme.colors.get('border').color.toHexWithoutHash()}),
      shadow: const Color(0x${theme.colors.get('shadow').color.toHexWithoutHash()}),
      text: const Color(0x${theme.colors.get('text').color.toHexWithoutHash()}),
      textOnAccent: const Color(0x${theme.colors.get('onAccent').color.toHexWithoutHash()}),
      textOnSecondary: const Color(0x${theme.colors.get('onSecondary').color.toHexWithoutHash()}),
      borderRadiusExtraSmall: BorderRadius.zero,
      borderRadiusSmall: BorderRadius.zero,
      borderRadius: BorderRadius.zero,
      borderRadiusLarge: BorderRadius.zero,
      borderRadiusExtraLarge: BorderRadius.zero,
      package: null,
    );
}""";

    final file = File('lib/src/util/custom_theme.dart');
    if (file.existsSync()) {
      file.deleteSync();
    }
    file.writeAsStringSync(themeString);
  }
}
