import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiPinCodeTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiPinCodeAssetsTheme assets;
  final ImpaktfullUiPinCodeColorTheme colors;
  final ImpaktfullUiPinCodeDimensTheme dimens;
  final ImpaktfullUiPinCodeDurationsTheme durations;
  final ImpaktfullUiPinCodeTextStyleTheme textStyles;

  const ImpaktfullUiPinCodeTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  static ImpaktfullUiPinCodeTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.pinCode;

  static ImpaktfullUiPinCodeTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiPinCodeTheme(
        assets: ImpaktfullUiPinCodeAssetsTheme(
          backspace: assets.icons.backspace,
          check: assets.icons.check,
        ),
        colors: ImpaktfullUiPinCodeColorTheme(
          valueBackgroundSelected: colors.accent,
          valueBackground: colors.card,
          valueBorder: colors.border,
        ),
        dimens: ImpaktfullUiPinCodeDimensTheme(
          valueBorderRadius: dimens.borderRadius,
        ),
        durations: ImpaktfullUiPinCodeDurationsTheme(
          submitOpacity: durations.short,
        ),
        textStyles: const ImpaktfullUiPinCodeTextStyleTheme(),
      );
}

class ImpaktfullUiPinCodeAssetsTheme {
  final ImpaktfullUiAsset backspace;
  final ImpaktfullUiAsset check;

  const ImpaktfullUiPinCodeAssetsTheme({
    required this.backspace,
    required this.check,
  });
}

class ImpaktfullUiPinCodeColorTheme {
  final Color valueBackground;
  final Color valueBackgroundSelected;
  final Color valueBorder;

  const ImpaktfullUiPinCodeColorTheme({
    required this.valueBackground,
    required this.valueBackgroundSelected,
    required this.valueBorder,
  });
}

class ImpaktfullUiPinCodeDimensTheme {
  final BorderRadiusGeometry valueBorderRadius;

  const ImpaktfullUiPinCodeDimensTheme({
    required this.valueBorderRadius,
  });
}

class ImpaktfullUiPinCodeDurationsTheme {
  final Duration submitOpacity;

  const ImpaktfullUiPinCodeDurationsTheme({
    required this.submitOpacity,
  });
}

class ImpaktfullUiPinCodeTextStyleTheme {
  const ImpaktfullUiPinCodeTextStyleTheme();
}
