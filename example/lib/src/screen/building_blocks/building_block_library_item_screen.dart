import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';

class BuildingBlockLibraryItemScreen extends StatelessWidget {
  final BuildingBlockLibraryItem item;
  const BuildingBlockLibraryItemScreen({
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
