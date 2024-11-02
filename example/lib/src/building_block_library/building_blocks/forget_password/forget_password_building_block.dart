import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';

class ForgetPasswordBuildingBlock extends BuildingBlockLibraryItem {
  const ForgetPasswordBuildingBlock();

  @override
  String get title => 'ImpaktfullUiBBForgetPassword';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiBBForgetPassword(
      email: '',
      onChangedEmail: (value) {},
      onResetPasswordTapped: () async => Future.delayed(const Duration(seconds: 2)),
      onBackToLoginTapped: () => ImpaktfullUiNavigator.instance.goBack(),
    );
  }
}
