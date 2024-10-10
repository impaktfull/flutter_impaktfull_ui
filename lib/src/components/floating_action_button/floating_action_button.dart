import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/floating_action_button/floating_action_button_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'floating_action_button_style.dart';

part 'floating_action_button.describe.dart';

class ImpaktfullUiFloatingActionButton extends StatelessWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiAsset asset;
  final String? label;
  final String? toolTip;
  final VoidCallback? onTap;
  final ImpaktfullUiFloatingActionButtonTheme? theme;

  const ImpaktfullUiFloatingActionButton({
    required this.asset,
    this.label,
    this.toolTip,
    this.onTap,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<
        ImpaktfullUiFloatingActionButtonTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => ImpaktfullUiTouchFeedback(
        onTap: onTap,
        toolTip: toolTip,
        color: onTap == null
            ? componentTheme.colors.backgroundDisabled
            : componentTheme.colors.background,
        borderRadius: componentTheme.dimens.borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ImpaktfullUiAutoLayout.horizontal(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12,
            children: [
              ImpaktfullUiAssetWidget(
                asset: asset,
                color: componentTheme.colors.icon,
                size: 24,
              ),
              if (label != null) ...[
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: Text(
                    label!,
                    style: componentTheme.textStyles.label,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
