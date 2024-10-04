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
    ImpaktfullUiTheme.getDefault(),
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
    ),
    ImpaktfullUiTheme.custom(
      label: 'Blue theme',
      primary: const Color.fromARGB(255, 255, 255, 255),
      accent: const Color.fromARGB(255, 23, 121, 206),
      secondary: const Color.fromARGB(255, 23, 121, 206),
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
