import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/loading_indicator/loading_indicator_style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'loading_indicator_style.dart';

part 'loading_indicator.describe.dart';

class ImpaktfullUiLoadingIndicator extends StatelessWidget with ComponentDescriptorMixin {
  final ImpaktfullUiAsset? asset;
  final Color? color;
  final ImpaktfullUiLoadingIndicatorTheme? theme;

  const ImpaktfullUiLoadingIndicator({
    this.theme,
    this.color,
    super.key,
  }) : asset = null;

  const ImpaktfullUiLoadingIndicator.custom({
    required this.asset,
    this.color,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiLoadingIndicatorTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final lottie = asset ?? componentTheme.assets.lottie;
        if (lottie != null) {
          final lottieWidget = ImpaktfullUiAssetWidget(
            asset: lottie,
            width: 48,
            height: 48,
          );
          if (color == null) return lottieWidget;
          return ColorFiltered(
            colorFilter: ColorFilter.mode(
              color!,
              BlendMode.srcATop,
            ),
            child: lottieWidget,
          );
        }
        return CircularProgressIndicator(
          color: color ?? componentTheme.colors.color,
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
