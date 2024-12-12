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
