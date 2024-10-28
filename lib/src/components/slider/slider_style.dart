import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiSliderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSliderAssetsTheme assets;
  final ImpaktfullUiSliderColorTheme colors;
  final ImpaktfullUiSliderDimensTheme dimens;
  final ImpaktfullUiSliderTextStyleTheme textStyles;

  const ImpaktfullUiSliderTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSliderTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.slider;
}

class ImpaktfullUiSliderAssetsTheme {
  const ImpaktfullUiSliderAssetsTheme();
}

class ImpaktfullUiSliderColorTheme {
  final Color track;
  final Color activeTrack;
  final Color trackBorder;
  final Color thumb;
  final Color thumbBorder;

  const ImpaktfullUiSliderColorTheme({
    required this.track,
    required this.activeTrack,
    required this.trackBorder,
    required this.thumb,
    required this.thumbBorder,
  });
}

class ImpaktfullUiSliderDimensTheme {
  final BorderRadiusGeometry trackBorderRadius;
  final BorderRadiusGeometry thumbBorderRadius;

  const ImpaktfullUiSliderDimensTheme({
    required this.trackBorderRadius,
    required this.thumbBorderRadius,
  });
}

class ImpaktfullUiSliderTextStyleTheme {
  const ImpaktfullUiSliderTextStyleTheme();
}
