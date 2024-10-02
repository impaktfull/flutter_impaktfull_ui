import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/bottom_navigation_item/bottom_navigation_item_style.dart';
import 'package:impaktfull_ui_2/src/components/notification_badge/notification_badge.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'bottom_navigation_item_style.dart';

part 'bottom_navigation_item.describe.dart';

class ImpaktfullUiBottomNavigationItem extends StatelessWidget with ComponentDescriptorMixin {
  final ImpaktfullUiAsset asset;
  final String? label;
  final bool isSelected;
  final bool badgeShow;
  final String? badgeText;
  final Color? badgeColor;
  final VoidCallback? onTap;
  final ImpaktfullUiBottomNavigationItemTheme? theme;

  const ImpaktfullUiBottomNavigationItem({
    required this.asset,
    required this.isSelected,
    this.label,
    this.onTap,
    this.badgeShow = false,
    this.badgeText,
    this.badgeColor,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiBottomNavigationItemTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => Expanded(
        child: ImpaktfullUiTouchFeedback(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ImpaktfullUiAutoLayout.vertical(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImpaktfullUiNotificationBadge(
                  show: badgeShow,
                  text: badgeText,
                  color: badgeColor ??
                      (isSelected ? componentTheme.colors.badgeActive : componentTheme.colors.badgeInActive),
                  child: ImpaktfullUiAssetWidget(
                    asset: asset,
                    color: isSelected ? componentTheme.colors.active : componentTheme.colors.inactive,
                  ),
                ),
                if (label != null) ...[
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

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  TextStyle _getLabelText(ImpaktfullUiBottomNavigationItemTheme theme) {
    if (isSelected) return theme.textStyles.activeLabel;
    return theme.textStyles.inActiveLabel;
  }
}
