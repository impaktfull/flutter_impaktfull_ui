import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/components/segmented_control/segmented_control.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';

class ImpaktfullUiSegmentControlItem extends StatelessWidget {
  final String label;
  final ImpaktfullUiAsset? icon;
  final bool isSelected;
  final VoidCallback? onTap;
  final ImpaktfullUiSegmentedControlTheme? theme;

  const ImpaktfullUiSegmentControlItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiTouchFeedback(
        onTap: onTap,
        borderRadius: componentTheme.dimens.borderRadius,
        child: Center(
          child: ImpaktfullUiAutoLayout.horizontal(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              if (icon != null) ...[
                ImpaktfullUiAssetWidget(
                  asset: icon,
                ),
              ],
              Text(
                label,
                style: isSelected
                    ? componentTheme.textStyles.activeLabel
                    : componentTheme.textStyles.label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
