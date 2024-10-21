import 'package:impaktfull_ui_example/src/building_block_library/building_blocks/login/login_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/building_blocks/not_found/not_found_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/building_blocks/register/register_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';

class BuildingBlockLibrary {
  static BuildingBlockLibrary? _instance;

  BuildingBlockLibrary._();

  static BuildingBlockLibrary get instance =>
      _instance ??= BuildingBlockLibrary._();

  final List<BuildingBlockLibraryItem> buildingBlocks = [
    const LoginBuildingBlock(),
    const NotFoundBuildingBlock(),
    const RegisterBuildingBlock(),
  ];
}
