import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/app.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
  ];

  @override
  Widget build(BuildContext context) {
    final myApp = MyApp.of(context);
    return Container(
      color: theme.colors.canvas,
      padding: const EdgeInsets.all(16),
      child: ImpaktfullUiListView(
        shrinkWrap: true,
        spacing: 16,
        children: [
          ImpaktfullUiSeparatedColumn(
            title: 'Theme',
            titleMargin: EdgeInsets.zero,
            separatorMargin: EdgeInsets.zero,
            children: [
              for (final theme in _themes) ...[
                ImpaktfullUiRadioButtonListItem(
                  title: theme.label ?? 'N/A',
                  value: theme.label,
                  groupValue: myApp.theme?.label,
                  onChanged: _onThemeChanged,
                ),
              ],
            ],
          ),
          ImpaktfullUiSeparatedColumn(
            title: 'Target platform',
            titleMargin: EdgeInsets.zero,
            separatorMargin: EdgeInsets.zero,
            children: [
              ImpaktfullUiRadioButtonListItem(
                title: 'Android',
                value: TargetPlatform.android,
                groupValue: myApp.targetPlatform,
                onChanged: _onTargetPlatformChanged,
              ),
              ImpaktfullUiRadioButtonListItem(
                title: 'iOS',
                value: TargetPlatform.iOS,
                groupValue: myApp.targetPlatform,
                onChanged: _onTargetPlatformChanged,
              ),
              ImpaktfullUiRadioButtonListItem(
                title: 'Systeem',
                value: null,
                groupValue: myApp.targetPlatform,
                onChanged: _onTargetPlatformChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onThemeChanged(String? value) {
    final theme = _themes.firstWhere((element) => element.label == value);
    MyApp.of(context).setTheme(theme);
    setState(() {});
  }

  void _onTargetPlatformChanged(TargetPlatform? value) {
    MyApp.of(context).setTargetPlatform(value);
    setState(() {});
  }
}
