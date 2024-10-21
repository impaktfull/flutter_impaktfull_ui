import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';

class BuildingBlockLibrary {
  static BuildingBlockLibrary? _instance;

  BuildingBlockLibrary._();

  static BuildingBlockLibrary get instance =>
      _instance ??= BuildingBlockLibrary._();

  final List<BuildingBlockLibraryItem> examples = [];
}
