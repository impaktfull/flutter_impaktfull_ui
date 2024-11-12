import 'package:impaktfull_ui_example/src/building_block_library/items/forget_password/forget_password_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/items/licenses/licenses_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/items/login/login_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/items/not_found/not_found_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/items/register/register_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/items/verify_register_code/verify_register_code_building_block.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';

class BuildingBlockLibrary {
  static BuildingBlockLibrary? _instance;

  BuildingBlockLibrary._();

  static BuildingBlockLibrary get instance =>
      _instance ??= BuildingBlockLibrary._();

  final List<BuildingBlockLibraryItem> items = [
    const ForgetPasswordBuildingBlock(),
    const LoginBuildingBlock(),
    const LicensesBuildingBlock(),
    const NotFoundBuildingBlock(),
    const RegisterBuildingBlock(),
    const VerifyRegisterCodeBuildingBlock(),
  ];
}
