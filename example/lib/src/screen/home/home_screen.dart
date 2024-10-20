import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
import 'package:impaktfull_ui_example/src/screen/settings/settings_screen.dart';
import 'package:impaktfull_ui_example/src/widget/home/action_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: 'impaktfull_ui',
      actions: [
        ImpaktfullUiAdaptiveNavBarActionItem(
          type: ImpaktfullUiAdaptiveNavBarActionItemType.secondaryGrey,
          asset: theme.assets.icons.settings,
          title: 'Settings',
          onTap: () => _onSettingsTapped(context),
        ),
      ],
      builder: (context) => ImpaktfullUiGridView.builder(
        padding: const EdgeInsets.all(16),
        spacing: 8,
        crossAxisCount: (context, config) => config.maxWidth ~/ 400,
        childAspectRatio: (context, config) => 16 / 12,
        items: [
          ActionCard(
            label: 'Components',
            asset: const ImpaktfullUiAsset.pixel(
              'components.png',
              directory: 'assets/images/supporting',
            ),
            onTap: () => ImpaktfullUiNavigator.instance.goToComponents(),
          ),
          ActionCard(
            label: 'Examples',
            asset: const ImpaktfullUiAsset.pixel(
              'examples.png',
              directory: 'assets/images/supporting',
            ),
            onTap: () => ImpaktfullUiNavigator.instance.goToExamples(),
          ),
        ],
        itemBuilder: (context, item, index) => item,
      ),
    );
  }

  void _onSettingsTapped(BuildContext context) => ImpaktfullUiModal.showSimple(
        context: context,
        title: 'Settings',
        showDividers: true,
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Close',
            onTap: () => ImpaktfullUiNavigator.instance.goBack(),
          ),
        ],
        childPadding: EdgeInsets.zero,
        child: const SettingsScreen(),
      );
}
