import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/adaptive_nav_bar/model/adaptive_nav_bar_action_type.dart';
import 'package:impaktfull_ui/src/components/adaptive_nav_bar/model/adaptive_nav_bar_small_loading_wrapper.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/models/asset.dart';

class ImpaktfullUiAdaptiveNavBarActionItem {
  final String title;
  final ImpaktfullUiAsset asset;
  final VoidCallback? onTap;
  final AsyncCallback? onAsyncTap;
  final ImpaktfullUiAdaptiveNavBarActionItemType type;

  const ImpaktfullUiAdaptiveNavBarActionItem({
    required this.title,
    required this.asset,
    this.onTap,
    this.onAsyncTap,
    this.type = ImpaktfullUiAdaptiveNavBarActionItemType.primary,
  })  : assert(onTap != null || onAsyncTap != null,
            'At least onTap or onAsyncTap must be provided'),
        assert(!(onTap != null && onAsyncTap != null),
            'Only one of onTap or onAsyncTap can be provided');

  Widget small() => ImpaktfullUiNavBarSmallLoadingWrapper(
        onTap: onTap,
        onAsyncTap: onAsyncTap,
        asset: asset,
        toolTip: title,
      );

  Widget medium() => ImpaktfullUiButton(
        onTap: onTap,
        onAsyncTap: onAsyncTap,
        leadingAsset: asset,
        title: title,
        size: ImpaktfullUiButtonSize.small,
        type: type.buttonType,
      );
}
