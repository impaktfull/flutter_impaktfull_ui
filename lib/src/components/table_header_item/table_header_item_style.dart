import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiTableHeaderItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableHeaderItemColorTheme colors;
  final ImpaktfullUiTableHeaderItemTextStylesTheme textStyles;
  final ImpaktfullUiTableHeaderItemDimensTheme dimens;

  const ImpaktfullUiTableHeaderItemTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiTableHeaderItemTheme copyWith({
    ImpaktfullUiTableHeaderItemColorTheme? colors,
    ImpaktfullUiTableHeaderItemDimensTheme? dimens,
    ImpaktfullUiTableHeaderItemTextStylesTheme? textStyles,
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
        textStyles: ImpaktfullUiTableHeaderItemTextStylesTheme(
          title: textStyles.onCanvas.text.extraSmall.medium,
        ),
      );
}

class ImpaktfullUiTableHeaderItemColorTheme {
  const ImpaktfullUiTableHeaderItemColorTheme();

  ImpaktfullUiTableHeaderItemColorTheme copyWith() =>
      const ImpaktfullUiTableHeaderItemColorTheme();
}

class ImpaktfullUiTableHeaderItemTextStylesTheme {
  final TextStyle title;

  const ImpaktfullUiTableHeaderItemTextStylesTheme({
    required this.title,
  });

  ImpaktfullUiTableHeaderItemTextStylesTheme copyWith({
    TextStyle? title,
  }) =>
      ImpaktfullUiTableHeaderItemTextStylesTheme(
        title: title ?? this.title,
      );
}

class ImpaktfullUiTableHeaderItemDimensTheme {
  const ImpaktfullUiTableHeaderItemDimensTheme();

  ImpaktfullUiTableHeaderItemDimensTheme copyWith() =>
      const ImpaktfullUiTableHeaderItemDimensTheme();
}
