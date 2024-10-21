import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';

class ForgetPasswordBuildingBlock extends BuildingBlockLibraryItem {
  const ForgetPasswordBuildingBlock();

  @override
  String get title => 'ImpaktfullUiBBForgetPassword';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiBBForgetPassword(
      email: '',
      onChangedEmail: (value) {},
      onResetPasswordTapped: () async =>
          Future.delayed(const Duration(seconds: 2)),
    );
  }
}
