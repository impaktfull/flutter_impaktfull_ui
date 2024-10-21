import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';

class VerifyRegisterCodeBuildingBlock extends BuildingBlockLibraryItem {
  const VerifyRegisterCodeBuildingBlock();

  @override
  String get title => 'ImpaktfullUiBBVerifyRegisterCode';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiBBVerifyRegisterCode(
      code: '',
      onChangedVerificationCode: (value) {},
      onVerifyCodeTapped: () => Future.delayed(const Duration(seconds: 2)),
    );
  }
}
