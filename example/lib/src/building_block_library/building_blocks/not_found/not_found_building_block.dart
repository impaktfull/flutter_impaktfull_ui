import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';

class NotFoundBuildingBlock extends BuildingBlockLibraryItem {
  const NotFoundBuildingBlock();

  @override
  String get title => 'ImpaktfullUiBBNotFound';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiBBNotFound(
      actions: [
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.secondaryGrey,
          leadingAsset: theme.assets.icons.arrowLeft,
          title: 'Go back',
          onTap: () => ImpaktfullUiNavigator.instance.goBack(),
        ),
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Suprise me',
          onTap: () => ImpaktfullUiNavigator.instance.goBack(),
        ),
      ],
    );
  }
}
