import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/fluid_padding/fluid_padding.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiFluidPaddingTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiFluidPaddingAssetsTheme assets;
  final ImpaktfullUiFluidPaddingColorTheme colors;
  final ImpaktfullUiFluidPaddingDimensTheme dimens;
  final ImpaktfullUiFluidPaddingTextStyleTheme textStyles;

  const ImpaktfullUiFluidPaddingTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiFluidPaddingTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.fluidPadding;
}

class ImpaktfullUiFluidPaddingAssetsTheme {
  const ImpaktfullUiFluidPaddingAssetsTheme();
}

class ImpaktfullUiFluidPaddingColorTheme {
  const ImpaktfullUiFluidPaddingColorTheme();
}

class ImpaktfullUiFluidPaddingDimensTheme {
  final List<ImpaktfullUiFluidPaddingBreakPoint> breakPoints;

  const ImpaktfullUiFluidPaddingDimensTheme({
    required this.breakPoints,
  });
}

class ImpaktfullUiFluidPaddingTextStyleTheme {
  const ImpaktfullUiFluidPaddingTextStyleTheme();
}
