import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';

class RegisterBuildingBlock extends BuildingBlockLibraryItem {
  const RegisterBuildingBlock();

  @override
  String get title => 'ImpaktfullUiBBRegister';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiBBRegister(
      email: '',
      password: '',
      onChangedEmail: (value) {},
      onChangedPassword: (value) {},
      onRegisterTapped: () async => Future.delayed(const Duration(seconds: 2)),
      onBackToLoginTapped: () => ImpaktfullUiNavigator.instance.goBack(),
    );
  }
}
