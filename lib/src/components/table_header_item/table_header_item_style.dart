import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiTableHeaderItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableHeaderItemColorTheme colors;
  final ImpaktfullUiTableHeaderItemTextStyleTheme textStyles;
  final ImpaktfullUiTableHeaderItemDimensTheme dimens;

  const ImpaktfullUiTableHeaderItemTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiTableHeaderItemTheme copyWith({
    ImpaktfullUiTableHeaderItemColorTheme? colors,
    ImpaktfullUiTableHeaderItemDimensTheme? dimens,
    ImpaktfullUiTableHeaderItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiTableHeaderItemTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiTableHeaderItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tableHeaderItem;

  static ImpaktfullUiTableHeaderItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiTableHeaderItemTheme(
        colors: const ImpaktfullUiTableHeaderItemColorTheme(),
        dimens: const ImpaktfullUiTableHeaderItemDimensTheme(),
        textStyles: ImpaktfullUiTableHeaderItemTextStyleTheme(
          title: textStyles.onCanvas.text.extraSmall.medium,
        ),
      );
}

class ImpaktfullUiTableHeaderItemColorTheme {
  const ImpaktfullUiTableHeaderItemColorTheme();

  ImpaktfullUiTableHeaderItemColorTheme copyWith() =>
      const ImpaktfullUiTableHeaderItemColorTheme();
}

class ImpaktfullUiTableHeaderItemTextStyleTheme {
  final TextStyle title;

  const ImpaktfullUiTableHeaderItemTextStyleTheme({
    required this.title,
  });

  ImpaktfullUiTableHeaderItemTextStyleTheme copyWith({
    TextStyle? title,
  }) =>
      ImpaktfullUiTableHeaderItemTextStyleTheme(
        title: title ?? this.title,
      );
}

class ImpaktfullUiTableHeaderItemDimensTheme {
  const ImpaktfullUiTableHeaderItemDimensTheme();

  ImpaktfullUiTableHeaderItemDimensTheme copyWith() =>
      const ImpaktfullUiTableHeaderItemDimensTheme();
}
