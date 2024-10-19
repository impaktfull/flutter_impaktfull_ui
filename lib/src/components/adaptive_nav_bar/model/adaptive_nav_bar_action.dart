import 'package:flutter/foundation.dart';
import 'package:impaktfull_ui_2/src/components/adaptive_nav_bar/model/adaptive_nav_bar_action_type.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';

class ImpaktfullUiAdaptiveNavBarActionItem {
  final String title;
  final ImpaktfullUiAsset asset;
  final VoidCallback onTapped;
  final ImpaktfullUiAdaptiveNavBarActionItemType type;

  const ImpaktfullUiAdaptiveNavBarActionItem({
    required this.title,
    required this.asset,
    required this.onTapped,
    this.type = ImpaktfullUiAdaptiveNavBarActionItemType.primary,
  });

  ImpaktfullUiIconButton small() => ImpaktfullUiIconButton(
        onTap: onTapped,
        asset: asset,
        tooltip: title,
      );

  ImpaktfullUiButton medium() => ImpaktfullUiButton(
        onTap: onTapped,
        leadingAsset: asset,
        title: title,
        type: type.buttonType,
      );
}
