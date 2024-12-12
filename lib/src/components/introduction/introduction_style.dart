import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiIntroductionTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiIntroductionAssetsTheme assets;
  final ImpaktfullUiIntroductionColorTheme colors;
  final ImpaktfullUiIntroductionDimensTheme dimens;
  final ImpaktfullUiIntroductionTextStyleTheme textStyles;

  const ImpaktfullUiIntroductionTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiIntroductionTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.introduction;

  static ImpaktfullUiIntroductionTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiIntroductionTheme(
        assets: ImpaktfullUiIntroductionAssetsTheme(),
        colors: ImpaktfullUiIntroductionColorTheme(),
        dimens: ImpaktfullUiIntroductionDimensTheme(),
        textStyles: ImpaktfullUiIntroductionTextStyleTheme(),
      );
}

class ImpaktfullUiIntroductionAssetsTheme {
  const ImpaktfullUiIntroductionAssetsTheme();
}

class ImpaktfullUiIntroductionColorTheme {
  const ImpaktfullUiIntroductionColorTheme();
}

class ImpaktfullUiIntroductionDimensTheme {
  const ImpaktfullUiIntroductionDimensTheme();
}

class ImpaktfullUiIntroductionTextStyleTheme {
  const ImpaktfullUiIntroductionTextStyleTheme();
}
