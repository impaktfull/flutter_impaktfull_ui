import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/example_library/config/example_library.dart';
import 'package:impaktfull_ui_example/src/example_library/config/example_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
import 'package:impaktfull_ui_example/src/widget/example/example_card.dart';

class ExampleLibraryScreen extends StatelessWidget {
  const ExampleLibraryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: 'Examples',
      onBackTapped: () => ImpaktfullUiNavigator.instance.goBack(),
      builder: (context) => ImpaktfullUiGridView.builder(
        crossAxisCount: (context, config) => config.maxWidth ~/ 250,
        padding: const EdgeInsets.all(16),
        items: ExampleLibrary.instance.examples,
        spacing: 8,
        itemBuilder: (context, item, index) {
          final value = ExampleLibrary.instance.examples[index];
          return ExampleCard(
            label: value.name,
            onTap: () => _onItemTapped(value),
            builder: value.build,
          );
        },
      ),
    );
  }

  void _onItemTapped(ExampleLibraryItem value) =>
      ImpaktfullUiNavigator.instance.goToExample(value);
}
