import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
import 'package:impaktfull_ui_example/src/styles_library/config/styles_library.dart';
import 'package:impaktfull_ui_example/src/styles_library/config/styles_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/styles/styles_card.dart';

class StylesLibraryScreen extends StatelessWidget {
  const StylesLibraryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: 'Styles',
      onBackTapped: () => ImpaktfullUiNavigator.instance.goBack(),
      builder: (context) => ImpaktfullUiGridView.builder(
        crossAxisCount: (context, config) => config.maxWidth ~/ 250,
        padding: const EdgeInsets.all(16),
        items: StylesLibrary.instance.items,
        spacing: 8,
        noDataLabel: 'No styles found',
        itemBuilder: (context, item, index) => StylesCard(
          label: item.name,
          onTap: () => _onItemTapped(item),
          builder: item.build,
        ),
      ),
    );
  }

  void _onItemTapped(StylesLibraryItem item) =>
      ImpaktfullUiNavigator.instance.goToStyle(item);
}
