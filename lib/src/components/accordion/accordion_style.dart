import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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
}

class ImpaktfullUiAccordionAssetsTheme {
  final ImpaktfullUiAsset arrow;
  const ImpaktfullUiAccordionAssetsTheme({
    required this.arrow,
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
