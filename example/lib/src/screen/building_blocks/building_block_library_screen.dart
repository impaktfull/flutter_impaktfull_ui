import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
import 'package:impaktfull_ui_example/src/widget/building_block/building_block_card.dart';

class BuildignBLockLibraryScreen extends StatelessWidget {
  const BuildignBLockLibraryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: 'Building Blocks',
      onBackTapped: () => ImpaktfullUiNavigator.instance.goBack(),
      builder: (context) => ImpaktfullUiGridView.builder(
        crossAxisCount: (context, config) => config.maxWidth ~/ 250,
        padding: const EdgeInsets.all(16),
        items: BuildingBlockLibrary.instance.buildingBlocks,
        spacing: 8,
        itemBuilder: (context, item, index) {
          final value = BuildingBlockLibrary.instance.buildingBlocks[index];
          return BuildingBLockCard(
            label: value.name,
            onTap: () => _onItemTapped(value),
            builder: value.build,
          );
        },
      ),
    );
  }

  void _onItemTapped(BuildingBlockLibraryItem value) => ImpaktfullUiNavigator.instance.goToBuildingBlock(value);
}
