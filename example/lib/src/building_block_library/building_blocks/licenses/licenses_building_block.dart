import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';

class LicensesBuildingBlock extends BuildingBlockLibraryItem {
  const LicensesBuildingBlock();

  @override
  String get title => 'ImpaktfullUiBBLicenses';

  @override
  Widget build(BuildContext context) {
    return const ImpaktfullUiBBLicenses();
  }
}
