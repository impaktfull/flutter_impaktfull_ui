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
          title: textStyles.onCard.text.small.semiBold,
        ),
      );
}

class ImpaktfullUiTableHeaderItemColorTheme {
  const ImpaktfullUiTableHeaderItemColorTheme();
}

class ImpaktfullUiTableHeaderItemTextStylesTheme {
  final TextStyle title;

  const ImpaktfullUiTableHeaderItemTextStylesTheme({
    required this.title,
  });
}

class ImpaktfullUiTableHeaderItemDimensTheme {
  const ImpaktfullUiTableHeaderItemDimensTheme();
}
