import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/example_library/config/example_library_item.dart';

class ExampleLibraryItemScreen extends StatelessWidget {
  final ExampleLibraryItem item;
  const ExampleLibraryItemScreen({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return item.build(context);
  }
}
