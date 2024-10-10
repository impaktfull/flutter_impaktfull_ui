import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/navigator/page_route/native_page_route_builder.dart';
import 'package:impaktfull_ui_example/src/screen/components/components_library_screen.dart';
import 'package:impaktfull_ui_example/src/screen/settings/settings_screen.dart';
import 'package:impaktfull_ui_example/src/widget/base/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'impaktfull_ui',
      canGoBack: false,
      actions: [
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.secondaryGrey,
          leadingAsset: theme.assets.icons.settings,
          title: 'Settings',
          onTap: () => _onSettingsTapped(context),
        ),
      ],
      builder: (context) => ImpaktfullUiListView(
        padding: const EdgeInsets.all(16),
        spacing: 8,
        children: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Components',
            fullWidth: true,
            onTap: () => Navigator.of(context).push(NativePageRoute(
                builder: (context) => const ComponentsLibraryScreen())),
          ),
        ],
      ),
    );
  }

  void _onSettingsTapped(BuildContext context) => ImpaktfullUiModal.showSimple(
        context: context,
        title: 'Settings',
        showDividers: true,
        child: const SettingsScreen(),
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Close',
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      );
}
