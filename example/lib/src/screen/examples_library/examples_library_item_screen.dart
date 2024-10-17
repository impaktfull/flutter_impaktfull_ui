import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/examples_library/config/example_library_item.dart';

class ExamplesLibraryItemScreen extends StatelessWidget {
  final ExampleLibraryItem item;
  const ExamplesLibraryItemScreen({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return item.build(context);
  }
}
