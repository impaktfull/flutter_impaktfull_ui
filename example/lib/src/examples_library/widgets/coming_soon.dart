import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExampleComingSoon extends StatelessWidget {
  const ExampleComingSoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: 'Coming soon',
      isDrawerEnabled: true,
      builder: (context) => ImpaktfullUiPlaceholderState(
        title: 'Coming soon',
        subtitle: 'This example page has not been implemented yet.',
        assetBuilder: (context) => Center(
          child: Container(
            decoration: BoxDecoration(
              color: theme.colors.accent,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(32),
            child: Icon(
              PhosphorIcons.craneTower(),
              color: theme.colors.textOnAccent,
            ),
          ),
        ),
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondaryGrey,
            title: 'Open drawer',
            onTap: () => ImpaktfullUiScreen.of(context).openDrawer(),
          ),
        ],
      ),
    );
  }
}
