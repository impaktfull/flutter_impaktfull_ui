import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTableRowTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableRowColorTheme colors;
  final ImpaktfullUiTableRowTextStyleTheme textStyles;
  final ImpaktfullUiTableRowDimensTheme dimens;

  const ImpaktfullUiTableRowTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiTableRowTheme copyWith({
    ImpaktfullUiTableRowColorTheme? colors,
    ImpaktfullUiTableRowDimensTheme? dimens,
    ImpaktfullUiTableRowTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiTableRowTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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
        textStyles: ImpaktfullUiTableRowTextStyleTheme(),
      );
}

class ImpaktfullUiTableRowColorTheme {
  const ImpaktfullUiTableRowColorTheme();

  ImpaktfullUiTableRowColorTheme copyWith() =>
      const ImpaktfullUiTableRowColorTheme();
}

class ImpaktfullUiTableRowTextStyleTheme {
  const ImpaktfullUiTableRowTextStyleTheme();

  ImpaktfullUiTableRowTextStyleTheme copyWith() =>
      const ImpaktfullUiTableRowTextStyleTheme();
}

class ImpaktfullUiTableRowDimensTheme {
  const ImpaktfullUiTableRowDimensTheme();

  ImpaktfullUiTableRowDimensTheme copyWith() =>
      const ImpaktfullUiTableRowDimensTheme();
}
