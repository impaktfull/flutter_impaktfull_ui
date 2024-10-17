import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExampleComingSoon extends StatelessWidget {
  const ExampleComingSoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiScreen(
      child: ImpaktfullUiLoadingErrorData(
        isLoading: false,
        noDataTitle: 'Coming soon',
        noDataMessage: 'This example page has not been implemented yet.',
        noDataAssetBuilder: (context) => Center(
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
        items: const [],
        builder: (context) => const Center(
          child: Text('Coming soon'),
        ),
      ),
    );
  }
}
