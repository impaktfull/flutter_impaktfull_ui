import 'package:impaktfull_ui_example/src/building_block_library/building_blocks/forget_password/forget_password_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/building_blocks/licenses/licenses_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/building_blocks/login/login_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/building_blocks/not_found/not_found_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/building_blocks/register/register_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/building_blocks/verify_register_code/verify_register_code_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';

class BuildingBlockLibrary {
  static BuildingBlockLibrary? _instance;

  BuildingBlockLibrary._();

  static BuildingBlockLibrary get instance =>
      _instance ??= BuildingBlockLibrary._();

  final List<BuildingBlockLibraryItem> buildingBlocks = [
    const ForgetPasswordBuildingBlock(),
    const LoginBuildingBlock(),
    const LicensesBuildingBlock(),
    const NotFoundBuildingBlock(),
    const RegisterBuildingBlock(),
    const VerifyRegisterCodeBuildingBlock(),
  ];
}
