import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/app.dart';
import 'package:impaktfull_ui_example/src/util/themes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final myApp = MyApp.of(context);
    return Container(
      color: theme.colors.canvas,
      child: ImpaktfullUiListView(
        shrinkWrap: true,
        spacing: 16,
        padding: const EdgeInsets.all(16),
        children: [
          ImpaktfullUiSeparatedColumn(
            title: 'Theme',
            titleMargin: EdgeInsets.zero,
            separatorMargin: EdgeInsets.zero,
            children: [
              for (final theme in ExampleThemes.themes) ...[
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
          ImpaktfullUiSeparatedColumn(
            title: 'Info',
            titleMargin: EdgeInsets.zero,
            separatorMargin: EdgeInsets.zero,
            children: [
              ImpaktfullUiListItem(
                title: 'Open git repo',
                leading: ImpaktfullUiAsset.icon(PhosphorIcons.githubLogo()),
                onTap: _onGitRepoPressed,
              ),
              ImpaktfullUiListItem(
                title: 'Open Linkedin',
                leading: ImpaktfullUiAsset.icon(PhosphorIcons.linkedinLogo()),
                onTap: _onLinkedinTapped,
              ),
              ImpaktfullUiListItem(
                title: 'Open impaktfull.com',
                leading: ImpaktfullUiAsset.icon(PhosphorIcons.globe()),
                onTap: _onWebsiteTapped,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onThemeChanged(String? value) {
    final theme =
        ExampleThemes.themes.firstWhere((element) => element.label == value);
    MyApp.of(context).setTheme(theme);
    setState(() {});
  }

  void _onTargetPlatformChanged(TargetPlatform? value) {
    MyApp.of(context).setTargetPlatform(value);
    setState(() {});
  }

  void _onGitRepoPressed() =>
      launchUrlString('https://github.com/impaktfull/flutter_impaktfull_ui');

  void _onWebsiteTapped() => launchUrlString('https://impaktfull.com');

  void _onLinkedinTapped() =>
      launchUrlString('https://www.linkedin.com/company/impaktfull/');
}
