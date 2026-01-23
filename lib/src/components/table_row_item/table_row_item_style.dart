import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiTableRowItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableRowItemColorTheme colors;
  final ImpaktfullUiTableRowItemTextStylesTheme textStyles;
  final ImpaktfullUiTableRowItemDimensTheme dimens;

  const ImpaktfullUiTableRowItemTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiTableRowItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tableRowItem;

  static ImpaktfullUiTableRowItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiTableRowItemTheme(
        colors: const ImpaktfullUiTableRowItemColorTheme(),
        dimens: const ImpaktfullUiTableRowItemDimensTheme(),
        textStyles: ImpaktfullUiTableRowItemTextStylesTheme(
          title: textStyles.onCanvas.text.small.medium,
          subtitle: textStyles.onCanvas.text.small,
        ),
      );
}

class ImpaktfullUiTableRowItemColorTheme {
  const ImpaktfullUiTableRowItemColorTheme();
}

class ImpaktfullUiTableRowItemTextStylesTheme {
  final TextStyle title;
  final TextStyle subtitle;

  const ImpaktfullUiTableRowItemTextStylesTheme({
    required this.title,
    required this.subtitle,
  });
}

class ImpaktfullUiTableRowItemDimensTheme {
  const ImpaktfullUiTableRowItemDimensTheme();
}
