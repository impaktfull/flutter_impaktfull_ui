import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/bottom_navigation_item/bottom_navigation_item_style.dart';
import 'package:impaktfull_ui/src/components/notification_badge/notification_badge.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'bottom_navigation_item_style.dart';

class ImpaktfullUiBottomNavigationItem extends StatelessWidget {
  final ImpaktfullUiAsset asset;
  final ImpaktfullUiAsset? selectedAsset;
  final String? label;
  final bool isSelected;
  final bool showLabel;
  final bool badgeShow;
  final String? badgeText;
  final Color? badgeColor;
  final VoidCallback? onTap;
  final ImpaktfullUiBottomNavigationItemTheme? theme;

  const ImpaktfullUiBottomNavigationItem({
    required this.asset,
    required this.isSelected,
    this.label,
    this.selectedAsset,
    this.onTap,
    this.showLabel = true,
    this.badgeShow = false,
    this.badgeText,
    this.badgeColor,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Expanded(
        child: ImpaktfullUiTouchFeedback(
          toolTip: showLabel ? null : label,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: showLabel ? 8 : 12),
            child: ImpaktfullUiAutoLayout.vertical(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ImpaktfullUiNotificationBadge(
                  show: badgeShow,
                  text: badgeText,
                  color: badgeColor ??
                      (isSelected
                          ? componentTheme.colors.badgeActive
                          : componentTheme.colors.badgeInActive),
                  child: ImpaktfullUiAssetWidget(
                    asset: isSelected ? (selectedAsset ?? asset) : asset,
                    color: isSelected
                        ? componentTheme.colors.active
                        : componentTheme.colors.inactive,
                  ),
                ),
                if (label != null && showLabel) ...[
                  Text(
                    label!,
                    style: _getLabelText(componentTheme),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _getLabelText(ImpaktfullUiBottomNavigationItemTheme theme) {
    if (isSelected) return theme.textStyles.activeLabel;
    return theme.textStyles.inActiveLabel;
  }
}
