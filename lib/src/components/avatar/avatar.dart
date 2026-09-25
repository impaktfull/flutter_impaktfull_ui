import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/avatar/avatar_style.dart';
import 'package:impaktfull_ui/src/components/network_image/network_image.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'avatar_style.dart';

class ImpaktfullUiAvatar extends StatelessWidget {
  final String? url;
  final ImpaktfullUiAsset? placeholderAsset;
  final double width;
  final double height;
  final BoxFit? fit;
  final VoidCallback? onTap;
  final ImpaktfullUiAvatarTheme? theme;

  /// What screen readers announce for the avatar, e.g. `Jane Doe`. Without
  /// it the avatar is decorative (hidden from screen readers), unless it has
  /// an [onTap].
  final String? semanticLabel;

  const ImpaktfullUiAvatar({
    required this.url,
    this.semanticLabel,
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
      builder: (context, componentTheme) => _withSemantics(
        SizedBox(
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
                    width: componentTheme.dimens.borderWidth,
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
                        // The avatar has the label.
                        excludeFromSemantics: true,
                      ),
                    ),
                  ),
                ),
              ],
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: componentTheme.colors.border,
                    width: componentTheme.dimens.borderWidth,
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
      ),
    );
  }

  Widget _withSemantics(Widget child) {
    final semanticLabel = this.semanticLabel;
    if (semanticLabel == null && onTap == null) {
      return ExcludeSemantics(child: child);
    }
    return Semantics(
      container: true,
      image: semanticLabel != null,
      button: onTap != null,
      label: semanticLabel,
      child: child,
    );
  }
}
