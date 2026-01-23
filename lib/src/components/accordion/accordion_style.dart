import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiAccordionTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiAccordionAssetsTheme assets;
  final ImpaktfullUiAccordionColorTheme colors;
  final ImpaktfullUiAccordionDimensTheme dimens;
  final ImpaktfullUiAccordionTextStyleTheme textStyles;

  const ImpaktfullUiAccordionTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiAccordionTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.accordion;

  static ImpaktfullUiAccordionTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiAccordionTheme(
        assets: ImpaktfullUiAccordionAssetsTheme(
          chevronDown: assets.icons.chevronDown,
        ),
        colors: const ImpaktfullUiAccordionColorTheme(),
        dimens: const ImpaktfullUiAccordionDimensTheme(),
        textStyles: const ImpaktfullUiAccordionTextStyleTheme(),
      );
}

class ImpaktfullUiAccordionAssetsTheme {
  final ImpaktfullUiAsset chevronDown;
  const ImpaktfullUiAccordionAssetsTheme({
    required this.chevronDown,
  });
}

class ImpaktfullUiAccordionColorTheme {
  const ImpaktfullUiAccordionColorTheme();
}

class ImpaktfullUiAccordionDimensTheme {
  const ImpaktfullUiAccordionDimensTheme();
}

class ImpaktfullUiAccordionTextStyleTheme {
  const ImpaktfullUiAccordionTextStyleTheme();
}
