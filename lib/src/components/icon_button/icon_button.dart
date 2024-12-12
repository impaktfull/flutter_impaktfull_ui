import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

part 'icon_button.describe.dart';

class ImpaktfullUiIconButton extends StatelessWidget
    with ComponentDescriptorMixin {
  final VoidCallback onTap;
  final Color? color;
  final ImpaktfullUiAsset asset;
  final double size;
  final String? tooltip;
  final Color? backgroundColor;
  const ImpaktfullUiIconButton({
    required this.onTap,
    required this.asset,
    this.color,
    this.size = 16,
    this.backgroundColor,
    this.tooltip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //todo add theming
    return ImpaktfullUiTouchFeedback(
      toolTip: tooltip,
      borderRadius: BorderRadius.circular(9999),
      onTap: onTap,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ImpaktfullUiAssetWidget(
          asset: asset,
          color: color,
          size: size,
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  ImpaktfullUiIconButton overrideColor(Color color) {
    if (this.color != null) return this;
    return ImpaktfullUiIconButton(
      onTap: onTap,
      asset: asset,
      color: color,
      size: size,
      tooltip: tooltip,
    );
  }
}
