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

  ImpaktfullUiMetricTheme copyWith({
    ImpaktfullUiMetricAssetsTheme? assets,
    ImpaktfullUiMetricColorTheme? colors,
    ImpaktfullUiMetricDimensTheme? dimens,
    ImpaktfullUiMetricTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiMetricTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiMetricTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiMetricAssetsTheme {
  final ImpaktfullUiAsset more;
  const ImpaktfullUiMetricAssetsTheme({
    required this.more,
  });

  ImpaktfullUiMetricAssetsTheme copyWith({
    ImpaktfullUiAsset? more,
  }) =>
      ImpaktfullUiMetricAssetsTheme(
        more: more ?? this.more,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiMetricAssetsTheme && more == other.more;

  @override
  int get hashCode => more.hashCode;
}

class ImpaktfullUiMetricColorTheme {
  const ImpaktfullUiMetricColorTheme();

  ImpaktfullUiMetricColorTheme copyWith() =>
      const ImpaktfullUiMetricColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiMetricColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiMetricDimensTheme {
  const ImpaktfullUiMetricDimensTheme();

  ImpaktfullUiMetricDimensTheme copyWith() =>
      const ImpaktfullUiMetricDimensTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiMetricDimensTheme;

  @override
  int get hashCode => runtimeType.hashCode;
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

  ImpaktfullUiMetricTextStyleTheme copyWith({
    TextStyle? title,
    TextStyle? value,
    TextStyle? value2Branded,
    TextStyle? value2Custom,
    TextStyle? value2Decline,
    TextStyle? value2Growth,
    TextStyle? value2Neutral,
  }) =>
      ImpaktfullUiMetricTextStyleTheme(
        title: title ?? this.title,
        value: value ?? this.value,
        value2Branded: value2Branded ?? this.value2Branded,
        value2Custom: value2Custom ?? this.value2Custom,
        value2Decline: value2Decline ?? this.value2Decline,
        value2Growth: value2Growth ?? this.value2Growth,
        value2Neutral: value2Neutral ?? this.value2Neutral,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiMetricTextStyleTheme &&
          title == other.title &&
          value == other.value &&
          value2Growth == other.value2Growth &&
          value2Neutral == other.value2Neutral &&
          value2Decline == other.value2Decline &&
          value2Branded == other.value2Branded &&
          value2Custom == other.value2Custom;

  @override
  int get hashCode => Object.hash(title, value, value2Growth, value2Neutral,
      value2Decline, value2Branded, value2Custom);
}
