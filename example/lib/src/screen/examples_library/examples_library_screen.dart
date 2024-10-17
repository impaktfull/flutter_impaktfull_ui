import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/examples_library/config/example_library.dart';
import 'package:impaktfull_ui_example/src/examples_library/config/example_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
import 'package:impaktfull_ui_example/src/widget/base/base_screen.dart';
import 'package:impaktfull_ui_example/src/widget/examples/example_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExamplesLibraryScreen extends StatelessWidget {
  const ExamplesLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Examples',
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
            asset: ImpaktfullUiAsset.icon(PhosphorIcons.chartLineUp()),
          );
        },
      ),
    );
  }

  void _onItemTapped(ExampleLibraryItem value) =>
      ImpaktfullUiNavigator.instance.goToExample(value);
}
