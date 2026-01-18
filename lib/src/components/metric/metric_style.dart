import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiMetricTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiMetricAssetsTheme assets;
  final ImpaktfullUiMetricColorTheme colors;
  final ImpaktfullUiMetricDimensTheme dimens;
  final ImpaktfullUiMetricTextStyleTheme textStyles;

  const ImpaktfullUiMetricTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiMetricTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.metric;

  static ImpaktfullUiMetricTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
    required ImpaktfullUiAsset moreIcon,
  }) =>
      ImpaktfullUiMetricTheme(
        assets: ImpaktfullUiMetricAssetsTheme(
          more: moreIcon,
        ),
        colors: const ImpaktfullUiMetricColorTheme(),
        dimens: const ImpaktfullUiMetricDimensTheme(),
        textStyles: ImpaktfullUiMetricTextStyleTheme(
          title: textStyles.onCard.text.small,
          value: textStyles.onCard.text.extraLarge.medium,
          value2Growth:
              textStyles.onCard.text.small.copyWith(color: colors.success),
          value2Neutral:
              textStyles.onCard.text.small.copyWith(color: colors.text),
          value2Decline:
              textStyles.onCard.text.small.copyWith(color: colors.error),
          value2Branded:
              textStyles.onCard.text.small.copyWith(color: colors.accent),
          value2Custom: textStyles.onCard.text.small,
        ),
      );
}

class ImpaktfullUiMetricAssetsTheme {
  final ImpaktfullUiAsset more;
  const ImpaktfullUiMetricAssetsTheme({
    required this.more,
  });
}

class ImpaktfullUiMetricColorTheme {
  const ImpaktfullUiMetricColorTheme();
}

class ImpaktfullUiMetricDimensTheme {
  const ImpaktfullUiMetricDimensTheme();
}

class ImpaktfullUiMetricTextStyleTheme {
  final TextStyle title;
  final TextStyle value;
  final TextStyle value2Growth;
  final TextStyle value2Neutral;
  final TextStyle value2Decline;
  final TextStyle value2Branded;
  final TextStyle value2Custom;
  const ImpaktfullUiMetricTextStyleTheme({
    required this.title,
    required this.value,
    required this.value2Growth,
    required this.value2Neutral,
    required this.value2Decline,
    required this.value2Branded,
    required this.value2Custom,
  });
}
