import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';

class LoginBuildingBlock extends BuildingBlockLibraryItem {
  const LoginBuildingBlock();

  @override
  String get title => 'ImpaktfullUiBBLogin';

  @override
  Widget build(BuildContext context) {
    return const ImpaktfullUiBBLogin();
  }
}
