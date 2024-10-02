import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/tooltip/tooltip.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

part 'icon_button.describe.dart';

class ImpaktfullUiIconButton extends StatelessWidget
    with ComponentDescriptorMixin {
  final VoidCallback onTap;
  final Color? color;
  final ImpaktfullUiAsset asset;
  final double size;
  final String? tooltip;

  const ImpaktfullUiIconButton({
    required this.onTap,
    required this.asset,
    this.color,
    this.size = 16,
    this.tooltip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiTooltip(
      message: tooltip,
      child: ImpaktfullUiTouchFeedback(
        borderRadius: BorderRadius.circular(9999),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ImpaktfullUiAssetWidget(
            asset: asset,
            color: color,
            size: size,
          ),
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
