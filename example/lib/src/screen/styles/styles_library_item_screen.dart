import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
import 'package:impaktfull_ui_example/src/styles_library/config/styles_library_item.dart';

class StylesLibraryItemScreen extends StatelessWidget {
  final StylesLibraryItem item;
  const StylesLibraryItemScreen({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: item.title,
      onBackTapped: () => ImpaktfullUiNavigator.instance.goBack(),
      builder: (context) => item.build(context),
    );
  }
}
