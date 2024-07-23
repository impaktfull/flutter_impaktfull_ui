import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:lottie/lottie.dart';

export 'loading_indicator_style.dart';

part 'loading_indicator.describe.dart';

class ImpaktfullUiLoadingIndicator extends StatelessWidget with ComponentDescriptorMixin {
  final String? asset;
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
      builder: (context, theme, componentTheme) {
        final lottie = asset ?? componentTheme.assets.lottie;
        if (lottie != null) {
          final lottieWidget = Lottie.asset(
            lottie,
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
  String describe() => _describeInstance(this);
}
