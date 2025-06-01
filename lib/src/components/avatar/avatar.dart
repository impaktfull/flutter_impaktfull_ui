import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/avatar/avatar_style.dart';
import 'package:impaktfull_ui/src/components/network_image/network_image.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'avatar_style.dart';

part 'avatar.describe.dart';

class ImpaktfullUiAvatar extends StatelessWidget with ComponentDescriptorMixin {
  final String? url;
  final ImpaktfullUiAsset? placeholderAsset;
  final double width;
  final double height;
  final BoxFit? fit;
  final VoidCallback? onTap;
  final ImpaktfullUiAvatarTheme? theme;

  const ImpaktfullUiAvatar({
    required this.url,
    this.placeholderAsset,
    this.width = 40,
    this.height = 40,
    this.fit,
    this.onTap,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: componentTheme.dimens.borderRadius,
                color: componentTheme.colors.background,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: componentTheme.colors.border,
                  width: 1,
                ),
                borderRadius: componentTheme.dimens.borderRadius,
                color: componentTheme.colors.background,
              ),
            ),
            Positioned.fill(
              child: ImpaktfullUiAssetWidget(
                asset: placeholderAsset ?? componentTheme.assets.placeholder,
                color: componentTheme.colors.placeholder,
                size: width / 2,
              ),
            ),
            if (url != null) ...[
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: componentTheme.dimens.borderRadius,
                  child: Builder(
                    builder: (context) => ImpaktfullUiNetworkImage(
                      url: url!,
                      fit: fit,
                    ),
                  ),
                ),
              ),
            ],
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: componentTheme.colors.border,
                  width: 1,
                ),
                borderRadius: componentTheme.dimens.borderRadius,
              ),
            ),
            if (onTap != null) ...[
              Positioned.fill(
                child: ImpaktfullUiTouchFeedback(
                  onTap: onTap,
                  borderRadius: componentTheme.dimens.borderRadius,
                  child: const ColoredBox(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
