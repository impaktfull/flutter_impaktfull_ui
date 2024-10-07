import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/app.dart';

class ThemeButton extends StatefulWidget {
  static var activeTheme = _ThemeButtonState._themes.first;

  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  var _selectedThemeIndex = 0;

  static final _themes = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiButton(
      type: ImpaktfullUiButtonType.primary,
      title: 'Change theme',
      onTap: _onTap,
    );
  }

  void _onTap() {
    _selectedThemeIndex = _selectedThemeIndex + 1;
    if (_selectedThemeIndex == _themes.length) {
      _selectedThemeIndex = 0;
    }
    final nextTheme = _themes[_selectedThemeIndex];
    ThemeButton.activeTheme = nextTheme;
    MyApp.of(context).refresh();
    setState(() {}); // double check why this is needed
  }
}
