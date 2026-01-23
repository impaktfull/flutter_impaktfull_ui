import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTableRowTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableRowColorTheme colors;
  final ImpaktfullUiTableRowTextStylesTheme textStyles;
  final ImpaktfullUiTableRowDimensTheme dimens;

  const ImpaktfullUiTableRowTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiTableRowTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tableRow;

  static ImpaktfullUiTableRowTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiTableRowTheme(
        colors: ImpaktfullUiTableRowColorTheme(),
        dimens: ImpaktfullUiTableRowDimensTheme(),
        textStyles: ImpaktfullUiTableRowTextStylesTheme(),
      );
}

class ImpaktfullUiTableRowColorTheme {
  const ImpaktfullUiTableRowColorTheme();
}

class ImpaktfullUiTableRowTextStylesTheme {
  const ImpaktfullUiTableRowTextStylesTheme();
}

class ImpaktfullUiTableRowDimensTheme {
  const ImpaktfullUiTableRowDimensTheme();
}
