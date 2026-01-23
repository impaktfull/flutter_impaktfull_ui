import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/fluid_padding/fluid_padding.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

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

  static ImpaktfullUiFluidPaddingTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiFluidPaddingTheme(
        assets: ImpaktfullUiFluidPaddingAssetsTheme(),
        colors: ImpaktfullUiFluidPaddingColorTheme(),
        dimens: ImpaktfullUiFluidPaddingDimensTheme(
          breakPoints: [
            ImpaktfullUiFluidPaddingBreakPoint(
              label: 'Mobile',
              maxWidth: 600,
              padding: 16,
            ),
            ImpaktfullUiFluidPaddingBreakPoint(
              label: 'Tablet',
              minWidth: 600,
              maxWidth: 1024,
              paddingMin: 16,
              paddingMax: 64,
            ),
            ImpaktfullUiFluidPaddingBreakPoint(
              label: 'Desktop',
              minWidth: 1024,
              maxWidth: 1400,
              paddingMin: 64,
              paddingMax: 128,
            ),
            ImpaktfullUiFluidPaddingBreakPoint(
              label: 'Large Desktop',
              minWidth: 1400,
              maxWidth: 2000,
              paddingMin: 128,
              paddingMax: 256,
            ),
            ImpaktfullUiFluidPaddingBreakPoint(
              label: 'Ultra Wide Desktop',
              minWidth: 2000,
              paddingMin: 256,
              paddingMax: 512,
            ),
          ],
        ),
        textStyles: ImpaktfullUiFluidPaddingTextStyleTheme(),
      );
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
