import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:impaktfull_ui_2/src/components/adaptive_nav_bar/model/adaptive_nav_bar_action_type.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';

class ImpaktfullUiAdaptiveNavBarActionItem {
  final String title;
  final ImpaktfullUiAsset asset;
  final VoidCallback onTap;
  final ImpaktfullUiAdaptiveNavBarActionItemType type;

  const ImpaktfullUiAdaptiveNavBarActionItem({
    required this.title,
    required this.asset,
    required this.onTap,
    this.type = ImpaktfullUiAdaptiveNavBarActionItemType.primary,
  });

  ImpaktfullUiIconButton small() => ImpaktfullUiIconButton(
        onTap: onTap,
        asset: asset,
        tooltip: title,
      );

  ImpaktfullUiButton medium() => ImpaktfullUiButton(
        onTap: onTap,
        leadingAsset: asset,
        title: title,
        size: ImpaktfullUiButtonSize.small,
        type: type.buttonType,
      );
}
