import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';

class BuildingBlockLibraryItemScreen extends StatelessWidget {
  final BuildingBlockLibraryItem item;
  const BuildingBlockLibraryItemScreen({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return item.build(context);
  }
}
